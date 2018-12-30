
/******************************************************************************
 *  File name:  full_test.h
 *  Author:     haule2
 *  Date:       Tue Oct 16 17:15:35 ICT 2018
 *****************************************************************************/

#ifndef FULL_TEST_H_
#define FULL_TEST_H_

#include <stdint.h>

extern uint32_t reg_check(void);
extern uint32_t mstp_check(void);
extern uint32_t srst_check(void);
extern uint32_t pad_check(void);
extern uint32_t interrupt_check(void);
extern uint32_t master_arbitration_lost(void);
extern uint32_t master_general_call(void);
extern uint32_t master_rx(void);
extern uint32_t master_rx_dma(void);
extern uint32_t master_rx_dma_continuous(void);
extern uint32_t master_send_start_byte(void);
extern uint32_t master_tx(void);
extern uint32_t master_tx_100kHz(void);
extern uint32_t master_tx_100kHz_var_duty(void);
extern uint32_t master_tx_1MHz_var_duty(void);
extern uint32_t master_tx_200kHz(void);
extern uint32_t master_tx_200kHz_var_duty(void);
extern uint32_t master_tx_250kHz(void);
extern uint32_t master_tx_250kHz_var_duty(void);
extern uint32_t master_tx_300kHz(void);
extern uint32_t master_tx_300kHz_var_duty(void);
extern uint32_t master_tx_400kHz(void);
extern uint32_t master_tx_400kHz_var_duty(void);
extern uint32_t master_tx_50kHz(void);
extern uint32_t master_tx_50kHz_var_duty(void);
extern uint32_t master_tx_dma(void);
extern uint32_t master_tx_dma_continuous(void);
extern uint32_t master_tx_fsb(void);
extern uint32_t master_tx_rpt_master_rx(void);
extern uint32_t slave_nack_addr(void);
extern uint32_t slave_general_call(void);
extern uint32_t slave_rx(void);
extern uint32_t slave_rx_dma(void);
extern uint32_t slave_rx_fna(void);
extern uint32_t slave_rx_fna_scss(void);
extern uint32_t slave_rx_scss(void);
extern uint32_t slave_tx(void);
extern uint32_t slave_tx_dma(void);
extern uint32_t slave_tx_scss(void);

#endif  /* FULL_TEST_H_ */

