
#include <stdint.h>
#include <sim_utils.h>
#include <global.h>
#include <v3u.h>
#include <i2c.h>
#include <pfc.h>
#include <cpg.h>

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

#define DATA_PACKAGE_LENGTH 2

static const uint32_t sendData[DATA_PACKAGE_LENGTH] = { 0xaa, 0x55 };
static volatile uint32_t receivedData[DATA_PACKAGE_LENGTH];
static volatile uint32_t tempData, m;

uint32_t master_rx(void)
{
	uint8_t	i = 0, j = 0;

    /* Configure I2C0 in master RX mode */
    I2C_masterInit(I2C0, &masterConfig);
    I2C0->MDBS = 0;
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_ALL);
    // Additional setting to increase code coverage
    I2C_masterEnableInterrupt(I2C0, I2C_INT_ALL);
    I2C_masterEnable(I2C0);

    /* Configure I2C1 in slave mode */
    I2C_slaveInit(I2C1, &slaveConfig);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_ALL);
    // Additional setting to increase code coverage
    I2C_slaveEnableInterrupt(I2C1, I2C_INT_ALL);
    I2C_slaveEnable(I2C1);
    I2C_slaveSetData(I2C1, sendData[i++]);

    /**************************************************************************
     * Slave address transmition
     *************************************************************************/

    /* Master send start condition, send slave address */
    I2C_masterReceiveStart(I2C0);

    /* Wait for SAR */
    while (! I2C1->SAR);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SAR);

    /* Wait for MAT */
    /* Note: At this moment, MDR is also set, it is also need to be cleared */
    while (! I2C0->MAT);
    /* Clear ESG */
    I2C0->ESG = 0;
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_MAT | I2C_INT_MDR);

    /**************************************************************************
     * The first data byte transmition
     *************************************************************************/

    /* Wait for SDE */
    while (! I2C1->SDE);
    /* Set the next data byte, send NACK after the next data byte sent */
    I2C_slaveSetData(I2C1, sendData[i++]);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SDE);

    /* Wait for SDT */
    while (! I2C1->SDT);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SDT);

    /* Wait for MDR */
    while (! I2C0->MDR);
    ///* Get the first data byte */
    //receivedData[j++] = I2C_masterReceiveMultipleByteStop(I2C0);
    ///* Simulate the delay on master side */
    //for (m = 0; m < 20; m++) { tempData += m; }
    //I2C_masterClearInterruptStatus(I2C0, I2C_INT_MDR);

    /**************************************************************************
     * The second data byte transmition
     *************************************************************************/

    /* Wait for SDE */
    while (! I2C1->SDE);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SDE);

    /* Wait for SDT */
    while (! I2C1->SDT);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_SDT);

    /* Wait for MDR */
    while (! I2C0->MDR);
    /* Get the first data byte */
    receivedData[j++] = I2C_masterReceiveMultipleByteStop(I2C0);
    /* Simulate the delay on master side */
    for (m = 0; m < 20; m++) { tempData += m; }
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_MDR);

    /* Wait for MDR */
    while (! I2C0->MDR);
    /* Get the second data byte send stop condition after received the 2nd data
     * byte */
    receivedData[j++] = I2C_masterReceiveMultipleByteFinish(I2C0);
    /* Simulate the delay on master side */
    for (m = 0; m < 20; m++) { tempData += m; }
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_MDR);

    /**************************************************************************
     * The end of the current transmition
     *************************************************************************/

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

