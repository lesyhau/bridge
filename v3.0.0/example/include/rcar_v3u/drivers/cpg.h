
#ifndef CPG_H_
#define CPG_H_

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

#define I2C0_MSTPCR         MSTPCR5
#define I2C1_MSTPCR         MSTPCR5
#define I2C2_MSTPCR         MSTPCR5
#define I2C3_MSTPCR         MSTPCR5
#define I2C4_MSTPCR         MSTPCR5
#define I2C5_MSTPCR         MSTPCR5
#define I2C6_MSTPCR         MSTPCR5
#define I2C0_MSTPSR         MSTPSR5
#define I2C1_MSTPSR         MSTPSR5
#define I2C2_MSTPSR         MSTPSR5
#define I2C3_MSTPSR         MSTPSR5
#define I2C4_MSTPSR         MSTPSR5
#define I2C5_MSTPSR         MSTPSR5
#define I2C6_MSTPSR         MSTPSR5
#define I2C0_SRCR         	SRCR5
#define I2C1_SRCR         	SRCR5
#define I2C2_SRCR         	SRCR5
#define I2C3_SRCR         	SRCR5
#define I2C4_SRCR         	SRCR5
#define I2C5_SRCR         	SRCR5
#define I2C6_SRCR         	SRCR5
#define I2C0_SRSTCLR      	SRSTCLR5
#define I2C1_SRSTCLR      	SRSTCLR5
#define I2C2_SRSTCLR      	SRSTCLR5
#define I2C3_SRSTCLR      	SRSTCLR5
#define I2C4_SRSTCLR      	SRSTCLR5
#define I2C5_SRSTCLR      	SRSTCLR5
#define I2C6_SRSTCLR      	SRSTCLR5
#define I2C0_MSTP_BIT_POS   18
#define I2C1_MSTP_BIT_POS   19
#define I2C2_MSTP_BIT_POS   20
#define I2C3_MSTP_BIT_POS   21
#define I2C4_MSTP_BIT_POS   22
#define I2C5_MSTP_BIT_POS   23
#define I2C6_MSTP_BIT_POS   24
#define I2C0_SRST_BIT_POS   18
#define I2C1_SRST_BIT_POS   19
#define I2C2_SRST_BIT_POS   20
#define I2C3_SRST_BIT_POS   21
#define I2C4_SRST_BIT_POS   22
#define I2C5_SRST_BIT_POS   23
#define I2C6_SRST_BIT_POS   24

extern void CPG_SetBit(__RW uint32_t *reg, uint8_t bitPos);
extern void CPG_ClearBit(__RW uint32_t *reg, uint8_t bitPos);
extern void CPG_SetMultipleBit(__RW uint32_t *reg, uint32_t data);
extern void CPG_ClearMultipleBit(__RW uint32_t *reg, uint32_t data);
extern void CPG_WriteAnd(__RW uint32_t *reg, uint32_t data);
extern void CPG_WriteOr(__RW uint32_t *reg, uint32_t data);

#endif
