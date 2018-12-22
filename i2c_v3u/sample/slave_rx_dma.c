
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
    I2C0_SLAVE_ADDR,
    START_BYTE_TRANSMIT_DISABLE,
    OD_BUFFER,
    FIXED_DUTY_CYCLE,
    CLOCK_RATE_400KHZ
};

static const I2C_SlaveConfig_t slaveConfig =
{
    I2C0_SLAVE_ADDR,
    CLOCK_STRETCH_AFTER,
    GENERAL_CALL_ACK_DISABLE,
    OD_BUFFER,
    FIXED_DUTY_CYCLE,
    CLOCK_RATE_400KHZ
};

#define DATA_PACKAGE_LENGTH 13
static const uint32_t sendData[DATA_PACKAGE_LENGTH] = { 'H', 'E', 'L', 'L', 'O', ',', ' ', 'W', 'O', 'R', 'L', 'D', '!' };
static uint32_t receivedData[DATA_PACKAGE_LENGTH];
static volatile bool isTransferComplete = false;
static volatile bool isAutoTransferComplete = false;

void i2c0InterruptHandler(void);
void i2c1InterruptHandler(void);
void sdmac1ch0InterruptHandler(void);
void sdmac1ch1InterruptHandler(void);

uint32_t slave_rx_dma(void)
{
    uint32_t i = 0;

    /* Reset SDMAC */
    CPG_SetBit(SRCR7, 9);
    CPG_SetBit(SRSTCLR7, 9);

    /* Configure a DMA channel for I2C1 */
    SDMAC1CH0->SAR = &sendData[1];
    SDMAC1CH0->DAR = &I2C1->ICTXD;
    SDMAC1CH0->TCR = DATA_PACKAGE_LENGTH - 1;
    SDMAC1CH0->DM = 0;   // Destination address is fixed
    SDMAC1CH0->SM = 1;   // Source address is increasement
    SDMAC1CH0->RS = 8;   // DMA trigger source is peripheral
    SDMAC1CH0->TS2 = 0;  // Transfer size is 4 bytes
    SDMAC1CH0->TS = 2;
    SDMAC1CH0->DMARS = DMARS_I2C1_MTX;
    SDMAC1CH0->IE = 1;   // Enable DMA interrupt
    SDMAC1CH0->DE = 1;   // Enable DMA

    /* Configure I2C1 in master TX mode with DMA transfer enabled */
    I2C_masterInit(I2C1, &masterConfig);
    I2C_masterClearInterruptStatus(I2C1, I2C_INT_ALL);
    I2C_masterEnableInterrupt(I2C1, I2C_INT_ALL);
    I2C_masterEnable(I2C1);

    /* Configure a DMA channel for I2C0 */
    SDMAC1CH1->SAR = &I2C0->ICRXD;
    SDMAC1CH1->DAR = &receivedData;
    SDMAC1CH1->TCR = DATA_PACKAGE_LENGTH;
    SDMAC1CH1->DM = 1;   // Destination address is increasement
    SDMAC1CH1->SM = 0;   // Source address is fixed
    SDMAC1CH1->RS = 8;   // DMA trigger source is peripheral
    SDMAC1CH1->TS2 = 0;  // Transfer size is 4 bytes
    SDMAC1CH1->TS = 2;
    SDMAC1CH1->DMARS = DMARS_I2C0_SRX;
    SDMAC1CH1->IE = 1;   // Enable DMA interrupt
    SDMAC1CH1->DE = 1;   // Enable DMA

    /* Configure I2C0 in slave RX mode with DMA transfer enabled */
    I2C_slaveInit(I2C0, &slaveConfig);
    I2C_slaveClearInterruptStatus(I2C0, I2C_INT_ALL);
    I2C_slaveEnableInterrupt(I2C0, I2C_INT_ALL);
    I2C_slaveEnable(I2C0);

    GIC_enable();
    GIC_setInterruptHandler(GIC_INTID_I2C0, &i2c0InterruptHandler);
    GIC_setInterruptHandler(GIC_INTID_I2C1, &i2c1InterruptHandler);
    GIC_setInterruptHandler(GIC_INTID_SDMAC1CH0, &sdmac1ch0InterruptHandler);
    GIC_setInterruptHandler(GIC_INTID_SDMAC1CH1, &sdmac1ch1InterruptHandler);
    GIC_enableInterrupt(GIC_INTID_I2C0);
    GIC_enableInterrupt(GIC_INTID_I2C1);
    GIC_enableInterrupt(GIC_INTID_SDMAC1CH0);
    GIC_enableInterrupt(GIC_INTID_SDMAC1CH1);

    /* Set the first data byte, send start condition, send slave address */
    I2C_masterSendMultipleByteStart(I2C1, sendData[0]);

    while (! isTransferComplete);

    /**************************************************************************
     * The end of the simulation
     *************************************************************************/
	
    I2C_masterDisable(I2C1);
    I2C_slaveDisable(I2C0);
	
    /* Judge the result */
	for (i = 0; i < DATA_PACKAGE_LENGTH; i++)
    {
        if (receivedData[i] != sendData[i])
        {
            return TEST_FAIL;
        }
    }

	return TEST_PASS;
}

void i2c0InterruptHandler(void)
{
    uint32_t status = I2C_slaveGetInterruptStatus(I2C0);
    I2C_slaveClearInterruptStatus(I2C0, status);
}

void i2c1InterruptHandler(void)
{
    uint32_t status = I2C_masterGetInterruptStatus(I2C1);

    if (status & I2C_INT_MAT) { I2C1->ESG = 0; }
    else if (status & I2C_INT_MDE)
    {
        if (! isAutoTransferComplete)
        {
            /* Start the automatic transfer */
            SDMAC1->DMAOR = 1;
            I2C_slaveEnableDMAReceive(I2C0);
            I2C_masterEnableDMATransmit(I2C1);
        }
        
        /* Master device send a stop condition after the automatic transfer complete */
        else { I2C_masterSendMultipleByteStop(I2C1); }
    }

    if (status & I2C_INT_MST) { isTransferComplete = true; }

    I2C_masterClearInterruptStatus(I2C1, status);
}

void sdmac1ch0InterruptHandler(void)
{
    if (SDMAC1CH0->TE)
    {
        SDMAC1CH0->DE = 0;
        SDMAC1CH0->TE = 0;
        SDMAC1CH0->IE = 0;
        I2C_masterDisableDMATransmit(I2C1);
    }
}

void sdmac1ch1InterruptHandler(void)
{
    if (SDMAC1CH1->TE)
    {
        SDMAC1CH1->DE = 0;
        SDMAC1CH1->TE = 0;
        SDMAC1CH1->IE = 0;
        SDMAC1->DMAOR = 0;
        I2C_slaveDisableDMAReceive(I2C0);
        isAutoTransferComplete = true;
    }
}
