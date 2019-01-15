
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

extern uint32_t master_rx(void);
extern uint32_t master_rx_delay(void);
extern uint32_t master_tx(void);
extern uint32_t master_tx_fsb(void);
extern uint32_t master_tx_rpt_master_rx(void);
extern uint32_t master_general_call(void);
extern uint32_t master_send_start_byte(void);
extern uint32_t master_arbitration_lost(void);
extern uint32_t master_rx_dma(void);
extern uint32_t master_tx_dma(void);
extern uint32_t master_rx_dma_continuous(void);
extern uint32_t master_tx_dma_continuous(void);
extern uint32_t master_tx_fbsc_check(void);
extern uint32_t master_tx_50kHz(void);
extern uint32_t master_tx_100kHz(void);
extern uint32_t master_tx_200kHz(void);
extern uint32_t master_tx_250kHz(void);
extern uint32_t master_tx_300kHz(void);
extern uint32_t master_tx_400kHz(void);
extern uint32_t master_tx_50kHz_var_duty(void);
extern uint32_t master_tx_100kHz_var_duty(void);
extern uint32_t master_tx_200kHz_var_duty(void);
extern uint32_t master_tx_250kHz_var_duty(void);
extern uint32_t master_tx_300kHz_var_duty(void);
extern uint32_t master_tx_400kHz_var_duty(void);
extern uint32_t master_tx_1MHz_var_duty(void);

const uint32_t (*pattern[])(void) =
{
	&master_rx,
	&master_rx_delay,
	&master_tx,
	&master_tx_fsb,
	&master_tx_rpt_master_rx,
	&master_general_call,
	&master_send_start_byte,
	&master_arbitration_lost,
	&master_rx_dma,
	&master_tx_dma,
	&master_rx_dma_continuous,
	&master_tx_dma_continuous,
	&master_tx_50kHz,
	&master_tx_100kHz,
	&master_tx_200kHz,
	&master_tx_250kHz,
	&master_tx_300kHz,
	&master_tx_400kHz,
	&master_tx_50kHz_var_duty,
	&master_tx_100kHz_var_duty,
	&master_tx_200kHz_var_duty,
	&master_tx_250kHz_var_duty,
	&master_tx_300kHz_var_duty,
	&master_tx_400kHz_var_duty,
	&master_tx_1MHz_var_duty,
	&master_tx_fbsc_check,
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

