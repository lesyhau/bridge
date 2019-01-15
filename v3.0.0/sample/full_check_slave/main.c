
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

extern uint32_t renesas_slave_rx_fna_sdbs(void);
extern uint32_t renesas_slave_rx_sdbs(void);
extern uint32_t renesas_slave_rx(void);
extern uint32_t renesas_slave_rx_delay(void);
extern uint32_t renesas_slave_rx_fna(void);
extern uint32_t renesas_slave_rx_fna_delay(void);
extern uint32_t renesas_slave_tx(void);
extern uint32_t renesas_slave_tx_delay(void);
extern uint32_t slave_general_call(void);
extern uint32_t slave_nack_addr(void);
extern uint32_t slave_rx(void);
extern uint32_t slave_rx_fna(void);
extern uint32_t slave_tx(void);
extern uint32_t slave_tx_delay(void);
extern uint32_t slave_rx_dma(void);
extern uint32_t slave_tx_dma(void);
extern uint32_t slave_rx_fbsc_check(void);
extern uint32_t slave_tx_fbsc_check(void);

const uint32_t (*pattern[])(void) =
{
	&renesas_slave_rx_fna_sdbs,
	&renesas_slave_rx_sdbs,
	&renesas_slave_rx,
	&renesas_slave_rx_delay,
	&renesas_slave_rx_fna,
	&renesas_slave_rx_fna_delay,
	&renesas_slave_tx,
	&renesas_slave_tx_delay,
	&slave_general_call,
	&slave_nack_addr,
	&slave_rx,
	&slave_rx_fna,
	&slave_tx,
	&slave_tx_delay,
	&slave_rx_dma,
	&slave_tx_dma,
	&slave_rx_fbsc_check,
	&slave_tx_fbsc_check,
};

int main(void)
{
	const uint32_t totalPattern = sizeof(pattern) / sizeof(pattern[0]);
	uint32_t result[totalPattern];
    uint32_t testResult = TEST_PASS;

    I2C_configPins();

	uint32_t i;

    for (i = 0; i < totalPattern; i++)
    {
		/* Reset all I2C channels */
		I2C_reset();
		Sim_Delay(100);

        I2C_modelConnect(I2C0_MODEL, I2C1_MODEL);
        result[i] = (*pattern[i])();

        /* Only continue if the current pattern result is pass */
        if (result[i] == TEST_FAIL)
        {
            testResult = TEST_FAIL;
			break;
        }
    }

    I2C_modelDisable();
    I2C_releasePins();

    if (testResult == TEST_FAIL)
	{
        for (i = 0; i < totalPattern; i++)
	    {
	    	if (result[i] == TEST_FAIL)
            {
                Sim_Dump(i);
                break;
            };
	    }
    }

	Sim_Stop();

    while(1);
    return (0);
}

