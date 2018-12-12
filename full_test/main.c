
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

#include "full_test.h"

const uint32_t (*pattern[])(void) =
{
    &reg_check,
    &mstp_check,
    &srst_check,
    &pad_check,
    &interrupt_check,
    &master_arbitration_lost,
    &master_general_call,
    &master_rx,
    &master_rx_dma,
    &master_rx_dma_continuous,
    &master_send_start_byte,
    &master_tx,
    &master_tx_100kHz,
    &master_tx_100kHz_var_duty,
    &master_tx_1MHz_var_duty,
    &master_tx_200kHz,
    &master_tx_200kHz_var_duty,
    &master_tx_250kHz,
    &master_tx_250kHz_var_duty,
    &master_tx_300kHz,
    &master_tx_300kHz_var_duty,
    &master_tx_400kHz,
    &master_tx_400kHz_var_duty,
    &master_tx_50kHz,
    &master_tx_50kHz_var_duty,
    &master_tx_dma,
    &master_tx_dma_continuous,
    &master_tx_fsb,
    &master_tx_rpt_master_rx,
    &slave_nack_addr,
    &slave_general_call,
    &slave_rx,
    &slave_rx_dma,
    &slave_rx_fna,
    &slave_rx_fna_scss,
    &slave_rx_scss,
    &slave_tx,
    &slave_tx_dma,
    &slave_tx_scss
};

const uint32_t totalPattern = sizeof(pattern) / sizeof(pattern[0]);
uint32_t result[totalPattern];

int main(void)
{
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

