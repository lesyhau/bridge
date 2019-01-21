
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
    #if defined __aarch64__

        __asm(
            "stp    x1, x10, [sp, #-0x10]!\n"
            "mov    w1, #0x1\n"
            "movk   w1, #0xa55a, lsl #16\n"
            "and    w10, w10, w1\n"
            "orr    w10, w10, w1\n"
        );

        Sim_Delay(20);

        __asm(
            "ldp    x1, x10, [sp], #0x10\n"
        );

    #else

        __asm(
            "push   {r1, r10}\n"
            "mov    r1, #0x1\n"
            "movt   r1, #0xa55a\n"
            "and    r10, r10, r1\n"
            "orr    r10, r10, r1\n"
        );

        Sim_Delay(20);

        __asm(
            "pop    {r1, r10}\n"
        );

    #endif
}

void I2C_modelDisable(void)
{
    #if defined __aarch64__

        __asm(
            "str    x10, [sp, #-0x10]!\n"
            "mov    w10, #0x0\n"
            "movk   w10, #0xa55a, lsl #16\n"
        );

        Sim_Delay(20);

        __asm(
            "ldr    x10, [sp], #0x10\n"
        );

    #else
    
        __asm(
            "push   {r10}\n"
            "mov    r10, #0x0\n"
            "movt   r10, #0xa55a\n"
        );

        Sim_Delay(20);

        __asm(
            "pop    {r10}\n"
        );

    #endif
}

void I2C_modelConnect(uint32_t a, uint32_t b)
{
    #if defined __aarch64__

        __asm(
            "str    x10, [sp,#-0x20]!\n"
            "stp    x0, x1, [sp, #0x10]\n"
            "mov    w10, #0\n"
            "lsl    w0, w0, #12\n"
            "lsl    w1, w1, #8\n"
            "orr    w10, w10, w0\n"
            "orr    w10, w10, w1\n"
            "orr    w10, w10, #1\n"
            "movk   w10, #0xa55a, lsl #16\n"
        );

        Sim_Delay(20);

        __asm(
            "ldp    x0, x1, [sp, #0x10]\n"
            "ldr    x10, [sp], #0x20\n"
        );
        
    #else

        __asm(
            "push   {r0, r1, r10}\n"
            "mov    r10, #0\n"
            "lsl    r0, r0, #12\n"
            "lsl    r1, r1, #8\n"
            "orr    r10, r10, r0\n"
            "orr    r10, r10, r1\n"
            "orr    r10, r10, #1\n"
            "movt   r10, #0xa55a\n"
        );

        Sim_Delay(20);

        __asm(
            "pop    {r0, r1, r10}\n"
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

void I2C_reset(void)
{
    CPG_SetMultipleBit(SRCR5, BIT18 | BIT19 | BIT20 | BIT21 | BIT22 | BIT23 | BIT24 | BIT25 | BIT26 | BIT27 | BIT28 | BIT29 | BIT30 | BIT31);
    CPG_SetMultipleBit(SRSTCLR5, BIT18 | BIT19 | BIT20 | BIT21 | BIT22 | BIT23 | BIT24 | BIT25 | BIT26 | BIT27 | BIT28 | BIT29 | BIT30 | BIT31);
}
