
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

const I2C_MasterConfig_t masterConfig =
{
    MASTER_TX,
    I2C0_SLAVE_ADDR,
    START_BYTE_TRANSMIT_DISABLE,
    OD_BUFFER,
    FIXED_DUTY_CYCLE,
    CLOCK_RATE_400KHZ
};

const I2C_SlaveConfig_t slaveConfig =
{
    I2C0_SLAVE_ADDR,
    CLOCK_STRETCH_AFTER,
    GENERAL_CALL_ACK_DISABLE,
    OD_BUFFER,
    FIXED_DUTY_CYCLE,
    CLOCK_RATE_400KHZ
};

#define DATA_PACKAGE_LENGTH 14
const uint32_t sendDataID = 1;
const uint32_t sendData[DATA_PACKAGE_LENGTH] = { sendDataID, 'H', 'E', 'L', 'L', 'O', ',', ' ', 'W', 'O', 'R', 'L', 'D', '!' };
volatile uint32_t receiveData[DATA_PACKAGE_LENGTH];

I2C_DataPackage_t SendDataPkg =
{
    .ID = sendDataID,
    .BufferPtr = &sendData,
    .BufferSize = DATA_PACKAGE_LENGTH,
    .CRC = 0
};

I2C_DataPackage_t ReceiveDataPkg =
{
    .ID = 0,
    .BufferPtr = &receiveData,
    .BufferSize = DATA_PACKAGE_LENGTH,
    .CRC = 0
};

uint32_t slave_rx_e2e(void)
{
    /* Disable module stop for CRC */
    CPG_ClearMultipleBit(MSTPCR9, BIT3 | BIT4 | BIT5 | BIT6);
    CPG_ClearMultipleBit(MSTPCR12, BIT25 | BIT26 | BIT27 | BIT28 | BIT31);
    CPG_ClearMultipleBit(MSTPCR13, BIT0 | BIT1 | BIT2);

    /* Configure a KCRC for sending data package */
    KCRC0->POLY = KCRC_32B_ETHERNET;
    KCRC0->DW = KCRC_32B_INPUT;
    KCRC0->CMD2 = KCRC_MODE_M;
    KCRC0->CMD1 = KCRC_MODE_R;
    KCRC0->CMD0 = KCRC_MODE_R;
    KCRC0->PSIZE = KCRC_POLY_32B;
    KCRC0->DOUT = ~0;
    KCRC0->XOR = ~0;

    /* Feed sending data package into KCRC */
    SDMAC1CH0->SAR = SendDataPkg.BufferPtr;
    SDMAC1CH0->DAR = &(KCRC0->DIN);
    SDMAC1CH0->TCR = SendDataPkg.BufferSize;
    SDMAC1CH0->DM = 0;   // Destination address is fixed
    SDMAC1CH0->SM = 1;   // Source address is increasement
    SDMAC1CH0->RS = 4;   // Auto DMA
    SDMAC1CH0->TS2 = 0;  // Transfer size is 4 bytes
    SDMAC1CH0->TS = 2;
    SDMAC1CH0->DE = 1;   // Enable DMA
    SDMAC1->DMAOR = 1;
    while (! SDMAC1CH0->TE);
    SDMAC1CH0->DE = 0;
    SDMAC1CH0->TE = 0;
    SDMAC1->DMAOR = 0;

    /* Get the sending data package CRC code from KCRC */
    SendDataPkg.CRC = KCRC0->DOUT;

    /* Configure a DMA channel for I2C1 */
    SDMAC1CH0->SAR = SendDataPkg.BufferPtr + 1;
    SDMAC1CH0->DAR = &I2C1->ICTXD;
    SDMAC1CH0->TCR = SendDataPkg.BufferSize - 1;
    SDMAC1CH0->DM = 0;   // Destination address is fixed
    SDMAC1CH0->SM = 1;   // Source address is increasement
    SDMAC1CH0->RS = 8;   // DMA trigger source is peripheral
    SDMAC1CH0->TS2 = 0;  // Transfer size is 4 bytes
    SDMAC1CH0->TS = 2;
    SDMAC1CH0->DMARS = DMARS_I2C1_MTX;
    SDMAC1CH0->DE = 1;   // Enable DMA

    /* Configure I2C1 in master TX mode with DMA transfer enabled */
    I2C_masterInit(I2C1, &masterConfig);
    I2C_masterClearInterruptStatus(I2C1, I2C_INT_ALL);
    I2C_masterEnableInterrupt(I2C1, I2C_INT_MDE);
    I2C_masterEnable(I2C1);

    /* Configure a DMA channel for I2C0 */
    SDMAC1CH1->SAR = &I2C0->ICRXD;
    SDMAC1CH1->DAR = ReceiveDataPkg.BufferPtr;
    SDMAC1CH1->TCR = ReceiveDataPkg.BufferSize;
    SDMAC1CH1->DM = 1;   // Destination address is increasement
    SDMAC1CH1->SM = 0;   // Source address is fixed
    SDMAC1CH1->RS = 8;   // DMA trigger source is peripheral
    SDMAC1CH1->TS2 = 0;  // Transfer size is 4 bytes
    SDMAC1CH1->TS = 2;
    SDMAC1CH1->DMARS = DMARS_I2C0_SRX;
    SDMAC1CH1->DE = 1;   // Enable DMA

    /* Configure I2C0 in slave RX mode with DMA transfer enabled */
    I2C_slaveInit(I2C0, &slaveConfig);
    I2C_slaveClearInterruptStatus(I2C0, I2C_INT_ALL);
    I2C_slaveEnableInterrupt(I2C0, I2C_INT_SDR);
    I2C_slaveEnable(I2C0);

    /* Set the first data byte, send start condition, send slave address */
    I2C_masterSendMultipleByteStart(I2C1, SendDataPkg.BufferPtr[0]);

    /* Wait for SAR */
    while (! I2C0->SAR);
    I2C_slaveClearInterruptStatus(I2C0, I2C_INT_SAR);

    /* Wait for MAT */
    /* Note: At this moment, MDE is also set, it is also need to be cleared */
    while (! I2C1->MAT);
    I2C_masterDisableStartGeneration(I2C1);
    I2C_masterClearInterruptStatus(I2C1, I2C_INT_MAT | I2C_INT_MDE);

    /* Wait for MDE */
    while (! I2C1->MDE);
    /* Enable DMA transfer for DMAC and I2C */
    SDMAC1->DMAOR = 1;
    I2C_masterEnableDMATransmit(I2C1);
    I2C_slaveEnableDMAReceive(I2C0);
    I2C_masterClearInterruptStatus(I2C1, I2C_INT_MDE);

    /* Wait for DMA transmition finish */
    while (! SDMAC1CH0->TE);
    SDMAC1CH0->DE = 0;
    SDMAC1CH0->TE = 0;

    /* Wait for DMA reception finish */
    while (! SDMAC1CH1->TE);
    SDMAC1CH1->DE = 0;
    SDMAC1CH1->TE = 0;

    /* Disable DMA */
    SDMAC1->DMAOR = 0;

    /* Wait for MDE */
    while (! I2C1->MDE);
    /* Master send a stop condition after received the last ACK */
    I2C_masterSendMultipleByteStop(I2C1);
    I2C_masterClearInterruptStatus(I2C1, I2C_INT_MDE);

    /* Wait for MDT */
    while (! I2C1->MDT);
    I2C_masterClearInterruptStatus(I2C1, I2C_INT_MDT);

    /* Wait for SSR */
    while (! I2C0->SSR);
    I2C_slaveClearInterruptStatus(I2C0, I2C_INT_SSR);

    /* Wait for MST */
    while (! I2C1->MST);
    I2C_masterClearInterruptStatus(I2C1, I2C_INT_MST);

    /* Mask bits 31:8 for received data */
    uint8_t i;
    for (i = 0; i < DATA_PACKAGE_LENGTH; i++)
    {
        receiveData[i] &= 0xff;
    }

    /* Get received data package ID */
    ReceiveDataPkg.ID = receiveData[0];

    /* Configure a KCRC for received data package */
    KCRC0->POLY = KCRC_32B_ETHERNET;
    KCRC0->DW = KCRC_32B_INPUT;
    KCRC0->CMD2 = KCRC_MODE_M;
    KCRC0->CMD1 = KCRC_MODE_R;
    KCRC0->CMD0 = KCRC_MODE_R;
    KCRC0->PSIZE = KCRC_POLY_32B;
    KCRC0->DOUT = ~0;
    KCRC0->XOR = ~0;

    /* Feed received data package into KCRC */
    SDMAC1CH0->SAR = ReceiveDataPkg.BufferPtr;
    SDMAC1CH0->DAR = &(KCRC0->DIN);
    SDMAC1CH0->TCR = ReceiveDataPkg.BufferSize;
    SDMAC1CH0->DM = 0;   // Destination address is fixed
    SDMAC1CH0->SM = 1;   // Source address is increasement
    SDMAC1CH0->RS = 4;   // Auto DMA
    SDMAC1CH0->TS2 = 0;  // Transfer size is 4 bytes
    SDMAC1CH0->TS = 2;
    SDMAC1CH0->DE = 1;   // Enable DMA
    SDMAC1->DMAOR = 1;
    while (! SDMAC1CH0->TE);
    SDMAC1CH0->DE = 0;
    SDMAC1CH0->TE = 0;
    SDMAC1->DMAOR = 0;

    /* Get the sending data package CRC code from KCRC */
    ReceiveDataPkg.CRC = KCRC0->DOUT;

    /* Judge the result */
    uint32_t testResult = TEST_PASS;
    if (SendDataPkg.CRC != ReceiveDataPkg.CRC)
    {
        return TEST_FAIL;
    }

    return TEST_PASS;
}
