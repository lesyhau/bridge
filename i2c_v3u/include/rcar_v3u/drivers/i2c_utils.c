
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

void I2C_modelEnable(void)
{
    #ifdef __AARCH32
        __asm(
            "push   {r1, r10}\n"
            "mov    r1, #0x1\n"
            "movt   r1, #0xa55a\n"
            "and    r10, r10, r1\n"
            "orr    r10, r10, r1\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "pop    {r1, r10}\n"
        );
    #endif
}

void I2C_modelDisable(void)
{
    #ifdef __AARCH32
        __asm(
            "push   {r10}\n"
            "mov    r10, #0x0\n"
            "movt   r10, #0xa55a\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "pop    {r10}\n"
        );
    #endif
}

void I2C_modelConnect(uint32_t a, uint32_t b)
{
    #ifdef __AARCH32
        __asm(
            "push   {r0, r1, r10}\n"
            "mov    r10, #0\n"
            "movt   r10, #0\n"
            "lsl    r0, r0, #12\n"
            "lsl    r1, r1, #8\n"
            "orr    r10, r10, r0\n"
            "orr    r10, r10, r1\n"
            "orr    r10, r10, 0x1\n"
            "movt   r10, #0xa55a\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "nop\n"
            "pop    {r0, r1, r10}\n"
            :
            : [a] "r" (a), [b] "r" (b)
        );
    #endif
}

void I2C_configPins(void)
{
    PFC_SetMultipleBit(&PFC0_GP2->PMMR, &PFC0_GP2->MOD_SEL, BIT2 | BIT3 | BIT4 | BIT5 | BIT6 | BIT7 | BIT8 | BIT9 | BIT10 | BIT11 | BIT12 | BIT13 | BIT14 | BIT15);
}

void I2C_releasePins(void)
{
    PFC_ClearMultipleBit(&PFC0_GP2->PMMR, &PFC0_GP2->MOD_SEL, BIT2 | BIT3 | BIT4 | BIT5 | BIT6 | BIT7 | BIT8 | BIT9 | BIT10 | BIT11 | BIT12 | BIT13 | BIT14 | BIT15);
}
