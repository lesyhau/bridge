
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

/* Common items check */
extern uint32_t reg_check(void);
extern uint32_t mstp_check(void);
extern uint32_t srst_check(void);
extern uint32_t pad_check(void);
extern uint32_t interrupt_check(void);

/* Slave operation check */
extern uint32_t slave_nack_addr(void);
extern uint32_t slave_general_call(void);
extern uint32_t slave_rx(void);
extern uint32_t slave_rx_fna(void);
extern uint32_t slave_tx(void);
extern uint32_t slave_tx_delay(void);
extern uint32_t renesas_slave_rx_sdbs(void);
extern uint32_t renesas_slave_rx_fna_sdbs(void);
extern uint32_t renesas_slave_rx(void);
extern uint32_t renesas_slave_rx_delay(void);
extern uint32_t renesas_slave_rx_fna(void);
extern uint32_t renesas_slave_rx_fna_delay(void);
extern uint32_t renesas_slave_tx(void);
extern uint32_t renesas_slave_tx_delay(void);

/* Auto transfer using DMAC */
// extern uint32_t slave_rx_dma(void);
// extern uint32_t slave_tx_dma(void);

/* Master operation check */
// extern uint32_t master_rx(void);
extern uint32_t master_tx(void);
extern uint32_t master_tx_fsb(void);
// extern uint32_t master_tx_rpt_master_rx(void);
// extern uint32_t master_general_call(void);
// extern uint32_t master_send_start_byte(void);
// extern uint32_t master_arbitration_lost(void);

/* Auto transfer using DMAC */
// extern uint32_t master_rx_dma(void);
// extern uint32_t master_tx_dma(void);
// extern uint32_t master_rx_dma_continuous(void);
// extern uint32_t master_tx_dma_continuous(void);

/* Clock generator operation check */
// extern uint32_t master_tx_50kHz(void);
// extern uint32_t master_tx_50kHz_var_duty(void);
// extern uint32_t master_tx_100kHz(void);
// extern uint32_t master_tx_100kHz_var_duty(void);
// extern uint32_t master_tx_200kHz(void);
// extern uint32_t master_tx_200kHz_var_duty(void);
// extern uint32_t master_tx_250kHz(void);
// extern uint32_t master_tx_250kHz_var_duty(void);
// extern uint32_t master_tx_300kHz(void);
// extern uint32_t master_tx_300kHz_var_duty(void);
// extern uint32_t master_tx_400kHz(void);
// extern uint32_t master_tx_400kHz_var_duty(void);
// extern uint32_t master_tx_1MHz_var_duty(void);

const uint32_t (*pattern[])(void) =
{
	/* Common items check */
	&reg_check,
	&mstp_check,
	&srst_check,
	&pad_check,
	&interrupt_check,

	/* Slave operation check */
	&slave_nack_addr,
	&slave_general_call,
	&slave_rx,
	&slave_rx_fna,
	&slave_tx,
	&slave_tx_delay,
	&renesas_slave_rx_sdbs,
	&renesas_slave_rx_fna_sdbs,
	&renesas_slave_rx,
	&renesas_slave_rx_delay,
	&renesas_slave_rx_fna,
	&renesas_slave_rx_fna_delay,
	&renesas_slave_tx,
	&renesas_slave_tx_delay,

	// /* Auto transfer using DMAC */
	// &renesas_slave_rx_dma,
	// &renesas_slave_tx_dma,

	// /* Master operation check */
	// &master_rx,
	// &master_tx,
	// &master_tx_fsb,
	// &master_tx_rpt_master_rx,
	// &master_general_call,
	// &master_send_start_byte,
	// &master_arbitration_lost,

	// /* Auto transfer using DMAC */
	// &master_rx_dma,
	// &master_tx_dma,
	// &master_rx_dma_continuous,
	// &master_tx_dma_continuous,

	// /* Clock generator operation check */
	// &master_tx_50kHz,
	// &master_tx_50kHz_var_duty,
	// &master_tx_100kHz,
	// &master_tx_100kHz_var_duty,
	// &master_tx_200kHz,
	// &master_tx_200kHz_var_duty,
	// &master_tx_250kHz,
	// &master_tx_250kHz_var_duty,
	// &master_tx_300kHz,
	// &master_tx_300kHz_var_duty,
	// &master_tx_400kHz,
	// &master_tx_400kHz_var_duty,
	// &master_tx_1MHz_var_duty,
};

int main(void)
{
	const uint32_t totalPattern = sizeof(pattern) / sizeof(pattern[0]);
	uint32_t result[totalPattern];

    I2C_configPins();
    I2C_modelConnect(I2C0_MODEL, I2C1_MODEL);

	uint8_t i;
    uint32_t testResult = TEST_PASS;

    for (i = 0; i < totalPattern; i++)
    {
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
	    	Sim_Dump(result[i]);
	    }
    }

    Sim_Judge(testResult);
	Sim_Stop();

    while(1);

    return (0);
}

