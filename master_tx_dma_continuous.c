
#include <stdint.h>
#include <sim_utils.h>
#include <global.h>
#include <v3u.h>
#include <i2c.h>
#include <pfc.h>
#include <cpg.h>
#include <dmac.h>

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

#define DATA_PACKAGE_LENGTH 13

/* Data package that will be sent. */
static const uint32_t sendData[2][DATA_PACKAGE_LENGTH] =
{
    { 'H', 'E', 'L', 'L', 'O', ',', ' ', 'W', 'O', 'R', 'L', 'D', '!' },
    { 'R', 'E', 'N', 'E', 'S', 'A', 'S', ' ', 'C', 'O', 'R', 'P', '.' }
};
static volatile uint32_t receivedData[2][DATA_PACKAGE_LENGTH];

uint32_t master_tx_dma_continuous(void)
{
    /* Reset SDMAC */
    CPG_SetBit(SRCR7, 9);
    CPG_SetBit(SRSTCLR7, 9);

    /* DMA descriptor for I2C0 */
    DMAC_initDescriptorMemory(SDMAC1, 2);
    SDMAC1->DMADESMEM[0].SAR = &sendData[0][1];
    SDMAC1->DMADESMEM[0].DAR = &I2C0->ICTXD;
    SDMAC1->DMADESMEM[0].TCR = DATA_PACKAGE_LENGTH;
    SDMAC1->DMADESMEM[0].DM = 0;    // Destination address is fixed
    SDMAC1->DMADESMEM[0].SM = 1;    // Source address is increasement
    SDMAC1->DMADESMEM[0].RS = 8;    // DMA trigger source is peripheral
    SDMAC1->DMADESMEM[0].TS = 2;    // Transfer size is 4 bytes
    SDMAC1->DMADESMEM[0].DRS = DMARS_I2C0_MTX;
    SDMAC1->DMADESMEM[1].SAR = &sendData[1][1];
    SDMAC1->DMADESMEM[1].DAR = &I2C0->ICTXD;
    SDMAC1->DMADESMEM[1].TCR = DATA_PACKAGE_LENGTH;
    SDMAC1->DMADESMEM[1].DM = 0;    // Destination address is fixed
    SDMAC1->DMADESMEM[1].SM = 1;    // Source address is increasement
    SDMAC1->DMADESMEM[1].RS = 8;    // DMA trigger source is peripheral
    SDMAC1->DMADESMEM[1].TS = 2;    // Transfer size is 4 bytes
    SDMAC1->DMADESMEM[1].DRS = DMARS_I2C0_MTX;

    /* Configure a DMA channel for I2C0 */
    //SDMAC1CH0->SAR = &sendData[1];
    //SDMAC1CH0->DAR = &I2C0->ICTXD;
    //SDMAC1CH0->TCR = DATA_PACKAGE_LENGTH - 1;
    SDMAC1CH0->DM = 0;   // Destination address is fixed
    SDMAC1CH0->SM = 1;   // Source address is increasement
    SDMAC1CH0->RS = 8;   // DMA trigger source is peripheral
    SDMAC1CH0->TS2 = 0;  // Transfer size is 4 bytes
    SDMAC1CH0->TS = 2;
    SDMAC1CH0->DMARS = DMARS_I2C0_MTX;
    SDMAC1CH0->DPM = 1;     // Enable descriotor memory mode
    SDMAC1CH0->RPT = 7;     // Allow to update descriptor parameters
    SDMAC1CH0->DPB = 1;     // Load configuration from the 1st set of descriptor
    SDMAC1CH0->DCNT = 1;    // Number of descriptor is 1 + 1 = 2
    SDMAC1CH0->DRST = 1;    // Reset the descriptor pointer
    SDMAC1CH0->DE = 1;      // Enable DMA

    /* Configure I2C0 in master TX mode with DMA transfer enabled */
    I2C_masterInit(I2C0, &masterConfig);
    I2C_masterSetDMAContinuousTransferCount(I2C0, 1);
    I2C_masterSetDMAContinuousTransmitBlockCount(I2C0, DATA_PACKAGE_LENGTH);
    I2C_masterEnableDMAContinuousTransmit(I2C0);
    I2C_masterEnableDMATransmit(I2C0);
    I2C_masterEnableInterrupt(I2C0, I2C_INT_MAT | I2C_INT_MDE);
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_ALL);
    I2C_masterEnable(I2C0);

    /* Configure a DMA channel for I2C1 */
    SDMAC1CH1->SAR = &I2C1->ICRXD;
    SDMAC1CH1->DAR = &receivedData[0];
    SDMAC1CH1->TCR = DATA_PACKAGE_LENGTH;
    SDMAC1CH1->DM = 1;   // Destination address is increasement
    SDMAC1CH1->SM = 0;   // Source address is fixed
    SDMAC1CH1->RS = 8;   // DMA trigger source is peripheral
    SDMAC1CH1->TS2 = 0;  // Transfer size is 4 bytes
    SDMAC1CH1->TS = 2;
    SDMAC1CH1->DMARS = DMARS_I2C1_SRX;
    SDMAC1CH1->DE = 1;   // Enable DMA

    /* Configure I2C1 in slave RX mode with DMA transfer enabled */
    I2C_slaveInit(I2C1, &slaveConfig);
    I2C_slaveEnableInterrupt(I2C1, I2C_INT_SDR);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_ALL);
    I2C_slaveEnable(I2C1);

    /**************************************************************************
     * Slave address transmition
     *************************************************************************/

    /* Set the first data byte, send start condition, send slave address */
    I2C_masterSendMultipleByteStart(I2C0, sendData[0][0]);

    /* Wait for first round SAR */
    while (! I2C1->SAR);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SAR);

    ///* Wait for first round MAT */
    //while (! I2C0->MAT);
    //I2C_masterClearInterruptStatus(I2C0, I2C_INT_MAT | I2C_INT_MDE);

    /**************************************************************************
     * DMA data transmition
     *************************************************************************/

    /* Wait for MDE */
    while (! I2C0->MDE);
    /* Enable DMA transfer for DMAC and I2C */
    SDMAC1->DMAOR = 1;
    I2C_slaveEnableDMAReceive(I2C1);

    /* Wait for first round SSR */
    while (! I2C1->SSR);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SSR);

    /* Update DMA channel configuration for I2C1 */
    SDMAC1CH1->DE = 0;   // Disable DMA
    SDMAC1CH1->TE = 0;   // Clear transfer end flag
    //SDMAC1CH1->SAR = &I2C1->ICRXD;
    SDMAC1CH1->DAR = &receivedData[1];
    SDMAC1CH1->TCR = DATA_PACKAGE_LENGTH;
    //SDMAC1CH1->DM = 1;   // Destination address is increasement
    //SDMAC1CH1->SM = 0;   // Source address is fixed
    //SDMAC1CH1->RS = 8;   // DMA trigger source is peripheral
    //SDMAC1CH1->TS2 = 0;  // Transfer size is 4 bytes
    //SDMAC1CH1->TS = 2;
    //SDMAC1CH1->DMARS = DMARS_I2C1_SRX;
    SDMAC1CH1->DE = 1;   // Enable DMA

    /* Wait for second round SAR */
    while (! I2C1->SAR);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SAR);

    ///* Wait for DMA transmition finish */
    while (I2C0->TMDMACE);
    SDMAC1CH0->DE = 0;
    SDMAC1CH0->TE = 0;
    SDMAC1CH1->DE = 0;
    SDMAC1CH1->TE = 0;

    /* Disable DMA */
    SDMAC1->DMAOR = 0;

    /**************************************************************************
     * The end of the current transmition
     *************************************************************************/

    /* Wait for sencond round SSR */
    while (! I2C1->SSR);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SSR);

    /* Wait for sencond round MST */
    while (! I2C0->MST);
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_MST);

    /**************************************************************************
     * The end of the simulation
     *************************************************************************/
    
    I2C_masterDisable(I2C0);
    I2C_slaveDisable(I2C1);

    /* Judge the result */
    uint32_t i, j;
    uint32_t testResult = TEST_PASS;
    for (j = 0; j < 2; j++)
    {
        for (i = 0; i < DATA_PACKAGE_LENGTH; i++)
        {
            if ((receivedData[j][i] & 0xff) != sendData[j][i])
            {
                testResult = TEST_FAIL;
                break;
            }
        }
    }

	return testResult;
}

