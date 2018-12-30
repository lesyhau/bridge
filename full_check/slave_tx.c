
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
static volatile uint32_t sendDataIndex = 0, receivedDataIndex = 0;

uint32_t slave_tx(void)
{
	uint32_t i = 0;

    /* Configure I2C1 in master RX mode */
    I2C_masterInit(I2C1, &masterConfig);
    I2C_masterClearInterruptStatus(I2C1, I2C_INT_ALL);
    I2C_masterEnable(I2C1);

    /* Configure I2C0 in slave mode */
    I2C_slaveInit(I2C0, &slaveConfig);
    I2C_slaveClearInterruptStatus(I2C0, I2C_INT_ALL);
    I2C_slaveEnable(I2C0);
    I2C_slaveSetData(I2C0, sendData[0]);

    /* Master send start condition, send slave address */
    I2C_masterReceiveStart(I2C1);

    /* Wait for SAR */
    while (! I2C0->SAR);
    I2C_slaveClearInterruptStatus(I2C0, I2C_INT_SAR);

    /* Wait for MAT */
    /* Note: At this moment, MDR is also set, it is also need to be cleared */
    while (! I2C1->MAT);
    /* Clear ESG */
    I2C_masterDisableStartGeneration(I2C1);
    I2C_masterClearInterruptStatus(I2C1, I2C_INT_MAT | I2C_INT_MDR);

	for (i = 1; i < (DATA_PACKAGE_LENGTH + 1); i++)
	{
		/* Wait for SDE */
		while (! I2C0->SDE);
		if (i < DATA_PACKAGE_LENGTH) { I2C_slaveSetData(I2C0, sendData[i]); }
		I2C_slaveClearInterruptStatus(I2C0, I2C_INT_SDE);

		/* Wait for SDT */
		while (! I2C0->SDT);
		I2C_slaveClearInterruptStatus(I2C0, I2C_INT_SDT);

		/* Wait for MDR */
		while (! I2C1->MDR);
		if (i < (DATA_PACKAGE_LENGTH - 1)) { receivedData[i-1] = I2C_masterReceiveMultipleByteNext(I2C1); }
		else if (i == (DATA_PACKAGE_LENGTH - 1)) { receivedData[i-1] = I2C_masterReceiveMultipleByteStop(I2C1); }
		else if (i == DATA_PACKAGE_LENGTH) { receivedData[i-1] = I2C_masterReceiveMultipleByteFinish(I2C1); }
		I2C_masterClearInterruptStatus(I2C1, I2C_INT_MDR);
	}
	
    /* Wait for SSR */
    while (! I2C0->SSR);
    I2C_slaveClearInterruptStatus(I2C0, I2C_INT_SSR);

    /* Wait for MST */
    while (! I2C1->MST);
    I2C_masterClearInterruptStatus(I2C1, I2C_INT_MST);

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
