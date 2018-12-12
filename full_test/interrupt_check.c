
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
    0x5f,
    START_BYTE_TRANSMIT_DISABLE,
    OD_BUFFER,
    FIXED_DUTY_CYCLE,
    CLOCK_RATE_400KHZ
};

static const I2C_SlaveConfig_t slaveConfig =
{
    I2C1_SLAVE_ADDR,
    CLOCK_STRETCH_AFTER,
    GENERAL_CALL_ACK_DISABLE,
    OD_BUFFER,
    FIXED_DUTY_CYCLE,
    CLOCK_RATE_400KHZ
};

volatile uint32_t ackID = 0;
volatile bool isIRQ;
void i2c0InterruptHandler(void);

uint32_t interrupt_check(void)
{
    /* Configure I2C0 in master TX mode */
    I2C_masterInit(I2C0, &masterConfig);
    I2C_masterClearInterruptStatus(I2C0, I2C_INT_ALL);
	I2C_masterEnableInterrupt(I2C0, I2C_INT_MNR);
    I2C_masterEnable(I2C0);

    /* Configure I2C1 in slave RX mode */
    I2C_slaveInit(I2C1, &slaveConfig);
    I2C_slaveClearInterruptStatus(I2C1, I2C_INT_ALL);
    I2C_slaveEnable(I2C1);

	/* Enable interrupt */
    GIC_enable();
    GIC_configInterrupt(GIC_INTID_I2C0);
    GIC_enableInterrupt(GIC_INTID_I2C0);
    GIC_setInterruptHandler(GIC_INTID_I2C0, &i2c0InterruptHandler);
	
    /* Set the first data byte, send start condition, send slave address */
    I2C_masterSendMultipleByteStart(I2C0, 0xaa);

    /* Wait for IRQ subroutine finish */
    while (! isIRQ);

    /**************************************************************************
     * The end of the simulation
     *************************************************************************/

	/* Judge the result */
	uint32_t testResult = TEST_PASS;
	if (ackID != GIC_INTID_I2C0)
	{
		testResult = TEST_FAIL;
	}

    if (testResult == TEST_FAIL)
    {
        Sim_Dump(ackID);
    }
	
	return testResult;
}

void i2c0InterruptHandler(void)
{
	uint32_t intStatus = I2C_masterGetInterruptStatus(I2C0);
	I2C_masterClearInterruptStatus(I2C0, intStatus);

    ackID = GIC_INTID_I2C0;
    isIRQ = true;
}
