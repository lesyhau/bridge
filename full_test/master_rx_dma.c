
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
    MASTER_RX,
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

#define DATA_PACKAGE_LENGTH 13
static const uint32_t sendData[DATA_PACKAGE_LENGTH] = { 'H', 'E', 'L', 'L', 'O', ',', ' ', 'W', 'O', 'R', 'L', 'D', '!' };
static uint32_t receivedData[DATA_PACKAGE_LENGTH];

uint32_t master_rx_dma(void)
{
    /* Reset SDMAC */
    CPG_SetBit(SRCR7, 9);
    CPG_SetBit(SRSTCLR7, 9);

    /* Configure a DMA channel for I2C0 */
    SDMAC1CH0->SAR = &I2C0->ICRXD;
    SDMAC1CH0->DAR = &receivedData;
    SDMAC1CH0->TCR = DATA_PACKAGE_LENGTH;
    SDMAC1CH0->DM = 1;   // Destination address is increasement
    SDMAC1CH0->SM = 0;   // Source address is fixed
    SDMAC1CH0->RS = 8;   // DMA trigger source is peripheral
    SDMAC1CH0->TS2 = 0;  // Transfer size is 4 bytes
    SDMAC1CH0->TS = 2;
    SDMAC1CH0->DMARS = DMARS_I2C0_MRX;
    SDMAC1CH0->DE = 1;   // Enable DMA

    /* Configure I2C0 in master RX mode with DMA transfer enabled */
    I2C_masterInit(I2C0, &masterConfig);
    I2C_masterEnableInterrupt(I2C0, I2C_INT_MDR);
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_ALL);
    I2C_masterEnable(I2C0);

    /* Configure a DMA channel for I2C1 */
    SDMAC1CH1->SAR = &sendData[1];
    SDMAC1CH1->DAR = &I2C1->ICTXD;
    SDMAC1CH1->TCR = DATA_PACKAGE_LENGTH - 1;
    SDMAC1CH1->DM = 0;   // Destination address is fixed
    SDMAC1CH1->SM = 1;   // Source address is increasement
    SDMAC1CH1->RS = 8;   // DMA trigger source is peripheral
    SDMAC1CH1->TS2 = 0;  // Transfer size is 4 bytes
    SDMAC1CH1->TS = 2;
    SDMAC1CH1->DMARS = DMARS_I2C1_STX;
    SDMAC1CH1->DE = 1;   // Enable DMA

    /* Configure I2C1 in slave TX mode with DMA transfer enabled */
    I2C_slaveInit(I2C1, &slaveConfig);
    I2C_slaveEnableInterrupt(I2C1, I2C_INT_SDE);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_ALL);
    I2C_slaveSetData(I2C1, sendData[0]);
    I2C_slaveEnable(I2C1);

    /* Send start condition, send slave address */
    I2C_masterReceiveStart(I2C0);

    /* Wait for SAR */
    while (! I2C1->SAR);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SAR);

    /* Wait for MAT */
    /* Note: At this moment, MDR is also set, it is also need to be cleared */
    while (! I2C0->MAT);
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_MAT | I2C_INT_MDR);

    /* Clear ESG */
    I2C0->ESG = 0;

    /**************************************************************************
     * DMA data transmition
     *************************************************************************/

    /* Wait for SDE */
    while (! I2C1->SDE);

    /* Enable DMA transfer for DMAC and I2C */
    SDMAC1->DMAOR = 1;
    I2C_masterEnableDMAReceive(I2C0);
    I2C_slaveEnableDMATransmit(I2C1);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SDE);

    /* Wait for DMA transmition finish */
    while (! SDMAC1CH1->TE);
    SDMAC1CH1->DE = 0;
    SDMAC1CH1->TE = 0;
    I2C_slaveDisableDMATransmit(I2C1);

    /* Wait for SDE */
    while (! I2C1->SDE);
    /* Master send a stop condition after received the last ACK */
    I2C_masterReceiveMultipleByteStop(I2C0);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SDE);

    /* Wait for DMA reception finish */
    while (! SDMAC1CH0->TE);
    SDMAC1CH0->DE = 0;
    SDMAC1CH0->TE = 0;
    I2C_masterDisableDMAReceive(I2C0);

    /* Disable DMA */
    SDMAC1->DMAOR = 0;

    /* Wait for SSR */
    while (! I2C1->SSR);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SSR);

    /* Wait for MST */
    while (! I2C0->MST);
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_MST);

    /**************************************************************************
     * The end of the simulation
     *************************************************************************/
	
    I2C_masterDisable(I2C0);
    I2C_slaveDisable(I2C1);

    /* Judge the result */
	uint32_t i;
    uint32_t testResult = TEST_PASS;
	for (i = 0; i < DATA_PACKAGE_LENGTH; i++)
    {
        if ((receivedData[i] & 0xff) != sendData[i])
        {
            testResult = TEST_FAIL;
            break;
        }
    }
	
	return testResult;
}

