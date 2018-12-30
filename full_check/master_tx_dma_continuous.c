
/* Standard C libraries */
#include <stdint.h>
#include <stdbool.h>

/* R-Car V3U drives */
#include <global.h>
#include <rcar_v3u/v3u.h>
#include <rcar_v3u/drivers/sim_utils.h>
#include <rcar_v3u/drivers/i2c.h>
#include <rcar_v3u/drivers/pfc.h>
#include <rcar_v3u/drivers/cpg.h>
#include <rcar_v3u/drivers/gic.h>
#include <rcar_v3u/drivers/dmac.h>
#include <rcar_v3u/drivers/kcrc.h>

static const I2C_MasterConfig_t masterConfig =
{
    MASTER_TX,
    I2C1_SLAVE_ADDR,
    START_BYTE_TRANSMIT_DISABLE,
    OD_BUFFER,
    FIXED_DUTY_CYCLE,
    CLOCK_RATE_400KHZ
};

static const I2C_SlaveConfig_t slaveConfig =
{
    I2C1_SLAVE_ADDR,
    CLOCK_STRETCH_BEFORE,
    GENERAL_CALL_ACK_DISABLE,
    OD_BUFFER,
    FIXED_DUTY_CYCLE,
    CLOCK_RATE_400KHZ
};

#define DATA_PACKAGE_COUNT  2
#define DATA_PACKAGE_LENGTH 13
static const uint32_t sendData[DATA_PACKAGE_COUNT][DATA_PACKAGE_LENGTH] =
{
    { 'H', 'E', 'L', 'L', 'O', ',', ' ', 'W', 'O', 'R', 'L', 'D', '!' },
    { 'R', 'E', 'N', 'E', 'S', 'A', 'S', ' ', 'C', 'O', 'R', 'P', '.' }
};
static uint32_t receivedData[DATA_PACKAGE_COUNT][DATA_PACKAGE_LENGTH];
static volatile bool isTransferComplete = false;
static volatile bool isAutoTransferComplete = false;
static volatile uint32_t currentDataPackageIndex = 0;

static void i2c0InterruptHandler(void);
static void i2c1InterruptHandler(void);
static void sdmac1ch0InterruptHandler(void);
static void sdmac1ch1InterruptHandler(void);

uint32_t master_tx_dma_continuous(void)
{
    uint32_t i, j;

    /* Reset SDMAC */
    CPG_SetBit(SRCR7, 9);
    CPG_SetBit(SRSTCLR7, 9);
    DMAC_initDescriptorMemory(SDMAC1, 2);

    /* Configure DMA descriptor for I2C0 */
    for (i = 0; i < DATA_PACKAGE_COUNT; i++)
    {
        SDMAC1->DMADESMEM[i].SAR = &sendData[currentDataPackageIndex][1];
        SDMAC1->DMADESMEM[i].DAR = &I2C0->ICTXD;
        SDMAC1->DMADESMEM[i].TCR = DATA_PACKAGE_LENGTH;
        SDMAC1->DMADESMEM[i].DM = 0;    // Destination address is fixed
        SDMAC1->DMADESMEM[i].SM = 1;    // Source address is increasement
        SDMAC1->DMADESMEM[i].RS = 8;    // DMA trigger source is peripheral
        SDMAC1->DMADESMEM[i].TS = 2;    // Transfer size is 4 bytes
        SDMAC1->DMADESMEM[i].DRS = DMARS_I2C0_MTX;
    }

    /* Configure a DMA channel for I2C0 */
    SDMAC1CH0->DPM = 1;     // Enable descriotor memory mode
    SDMAC1CH0->RPT = 0xf;   // Allow to update descriptor parameters
    SDMAC1CH0->DPB = 1;     // Load configuration from the 1st set of descriptor
    SDMAC1CH0->DCNT = 1;    // Number of descriptor is 1 + 1 = 2
    SDMAC1CH0->DRST = 1;    // Reset the descriptor pointer
    SDMAC1CH0->IE = 1;      // Enable DMA interrupt
    SDMAC1CH0->DE = 1;      // Enable DMA

    /* Configure I2C0 in master TX mode with DMA transfer enabled */
    I2C_masterInit(I2C0, &masterConfig);
    I2C_masterSetDMAContinuousTransferCount(I2C0, DATA_PACKAGE_COUNT - 1);
    I2C_masterSetDMAContinuousTransmitBlockCount(I2C0, DATA_PACKAGE_LENGTH);
    I2C_masterEnableDMAContinuousTransmit(I2C0);
    I2C_masterEnableDMATransmit(I2C0);
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_ALL);
    I2C_masterEnableInterrupt(I2C0, I2C_INT_ALL);
    I2C_masterEnable(I2C0);

    /* Configure a DMA channel for I2C1 */
    SDMAC1CH1->SAR = &I2C1->ICRXD;
    SDMAC1CH1->DAR = &receivedData[currentDataPackageIndex];
    SDMAC1CH1->TCR = DATA_PACKAGE_LENGTH;
    SDMAC1CH1->DM = 1;   // Destination address is increasement
    SDMAC1CH1->SM = 0;   // Source address is fixed
    SDMAC1CH1->RS = 8;   // DMA trigger source is peripheral
    SDMAC1CH1->TS2 = 0;  // Transfer size is 4 bytes
    SDMAC1CH1->TS = 2;
    SDMAC1CH1->DMARS = DMARS_I2C1_SRX;
    SDMAC1CH1->IE = 1;   // Enable DMA interrupt
    SDMAC1CH1->DE = 1;   // Enable DMA

    /* Configure I2C1 in slave RX mode with DMA transfer enabled */
    I2C_slaveInit(I2C1, &slaveConfig);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_ALL);
    I2C_slaveEnableInterrupt(I2C1, I2C_INT_ALL);
    I2C_slaveEnable(I2C1);

    GIC_enable();
    GIC_setInterruptHandler(GIC_INTID_I2C0, &i2c0InterruptHandler);
    GIC_setInterruptHandler(GIC_INTID_I2C1, &i2c1InterruptHandler);
    GIC_setInterruptHandler(GIC_INTID_SDMAC1CH0, &sdmac1ch0InterruptHandler);
    GIC_setInterruptHandler(GIC_INTID_SDMAC1CH1, &sdmac1ch1InterruptHandler);
    GIC_enableInterrupt(GIC_INTID_I2C0);
    GIC_enableInterrupt(GIC_INTID_I2C1);
    GIC_enableInterrupt(GIC_INTID_SDMAC1CH0);
    GIC_enableInterrupt(GIC_INTID_SDMAC1CH1);

    /* Master send start condition, send slave address */
    I2C_masterSendMultipleByteStart(I2C0, sendData[currentDataPackageIndex][0]);

    while (! isTransferComplete);

    /**************************************************************************
     * The end of the simulation
     *************************************************************************/
    
    I2C_masterDisable(I2C0);
    I2C_slaveDisable(I2C1);

    /* Judge the result */
    for (j = 0; j < DATA_PACKAGE_COUNT; j++)
    {
        for (i = 0; i < DATA_PACKAGE_LENGTH; i++)
        {
            if ((receivedData[j][i] & 0xff) != sendData[j][i])
            {
                return TEST_FAIL;
            }
        }
    }

	return TEST_PASS;
}

void i2c0InterruptHandler(void)
{
    uint32_t status = I2C_masterGetInterruptStatus(I2C0);

    if (status & I2C_INT_MAT) { I2C_masterDisableStartGeneration(I2C0); }
    else if (status & I2C_INT_MDE)
    {
        if (! isAutoTransferComplete) { SDMAC1->DMAOR = 1; }
        else { I2C_masterSendMultipleByteStop(I2C0); }
    }

    if (status & I2C_INT_MST) { isTransferComplete = isAutoTransferComplete; }

    I2C_masterClearInterruptStatus(I2C0, status);
}

void i2c1InterruptHandler(void)
{
    uint32_t status = I2C_slaveGetInterruptStatus(I2C1);

    if (status & I2C_INT_SDR) { if (! isAutoTransferComplete) { I2C_slaveEnableDMAReceive(I2C1); } }

    I2C_slaveClearInterruptStatus(I2C1, status);
}

void sdmac1ch0InterruptHandler(void)
{
    if (SDMAC1CH0->TE)
    {
        SDMAC1CH0->DE = 0;
        SDMAC1CH0->TE = 0;
        I2C_masterDisableDMATransmit(I2C0);
    }
}

void sdmac1ch1InterruptHandler(void)
{
    if (SDMAC1CH1->TE)
    {
        if (++currentDataPackageIndex < DATA_PACKAGE_COUNT)
        {
            SDMAC1CH1->DE = 0;
            SDMAC1CH1->DAR = &receivedData[currentDataPackageIndex];
            SDMAC1CH1->TCR = DATA_PACKAGE_LENGTH;
            SDMAC1CH1->TE = 0;
            SDMAC1CH1->DE = 1;
        }
        else
        {
            SDMAC1CH1->DE = 0;
            SDMAC1CH1->TE = 0;
            SDMAC1->DMAOR = 0;
            I2C_slaveDisableDMAReceive(I2C1);
            isAutoTransferComplete = true;
        }
    }
}
