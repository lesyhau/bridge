
#include <stdint.h>
#include <sim_utils.h>
#include <global.h>
#include <v3u.h>
#include <i2c.h>
#include <pfc.h>
#include <cpg.h>

static const I2C_MasterConfig_t masterConfig =
{
    MASTER_TX,
    I2C1_SLAVE_ADDR,
    START_BYTE_TRANSMIT_DISABLE,
    OD_BUFFER,
    VARIABLE_DUTY_CYCLE,
    CLOCK_RATE_50KHZ
};

static const I2C_SlaveConfig_t slaveConfig =
{
    I2C1_SLAVE_ADDR,
    CLOCK_STRETCH_BEFORE,
    GENERAL_CALL_ACK_DISABLE,
    OD_BUFFER,
    VARIABLE_DUTY_CYCLE,
    CLOCK_RATE_50KHZ
};

#define DATA_PACKAGE_LENGTH 2

static const uint32_t sendData[DATA_PACKAGE_LENGTH] = { 0xaa, 0x55 };
static uint32_t receivedData[DATA_PACKAGE_LENGTH];

uint32_t master_tx_50kHz_var_duty(void)
{
	uint8_t	i = 0, j = 0;

    /* Configure I2C0 in master TX mode */
    I2C_masterInit(I2C0, &masterConfig);
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_ALL);
    I2C_masterEnable(I2C0);

    /* Configure I2C1 in slave RX mode */
    I2C_slaveInit(I2C1, &slaveConfig);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_ALL);
    I2C_slaveEnable(I2C1);

    /**************************************************************************
     * Slave address transmition
     *************************************************************************/

    /* Set the first data byte, send start condition, send slave address */
    I2C_masterSendMultipleByteStart(I2C0, sendData[i++]);

    /* Wait for SAR */
    while (! I2C1->SAR);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SAR);

    /* Wait for MAT */
    /* Note: At this moment, MDE is also set, it is also need to be cleared */
    while (! I2C0->MAT);
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_MAT | I2C_INT_MDE);

    /* Clear ESG */
    I2C0->ESG = 0;

    /**************************************************************************
     * The first data byte transmition
     *************************************************************************/

    /* Wait for MDE */
    while (! I2C0->MDE);
    /* Clear ESG end then set the next data byte */
    I2C_masterSendMultipleByteNext(I2C0, sendData[i++]);
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_MDE);

    /* Wait for MDT */
    while (! I2C0->MDT);
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_MDT);

    /* Wait for SDR */
    while (! I2C1->SDR);
    /* Get the first data byte, send NACK after received the next data byte */
    receivedData[j++] = I2C_slaveReceiveMultipleByteStop(I2C1);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SDR);

    /**************************************************************************
     * The second data byte transmition
     *************************************************************************/

    /* Wait for MDE */
    while (! I2C0->MDE);
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_MDE);

    /* Wait for MDT */
    while (! I2C0->MDT);
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_MDT);

    /* Wait for SDR */
    while (! I2C1->SDR);
    /* Get the second data byte */
    receivedData[j++] = I2C_slaveReceiveMultipleByteFinish(I2C1);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SDR);

    /**************************************************************************
     * The end of the current transmition
     *************************************************************************/

    /* Wait for MNR */
    while (! I2C0->MNR);
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_MNR);

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

