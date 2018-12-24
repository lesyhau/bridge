
/* Standard C libraries */
#include <stdint.h>
#include <stdbool.h>

#ifdef __AARCH32
#include <arm_compat.h>
#endif

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

/* Default interrupt handler */
void GIC_defaultHandler(void)
{
    while(1);
}

#define MAX_INTID   968

/* Array of pointers points to IRQ handlers */
void (*GIC_intHandler[MAX_INTID+1])(void) =
{
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, 
    &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler, &GIC_defaultHandler
};

void GIC_enable(void)
{
    #ifdef __AARCH64

        /* Enable IRQ */
        __asm(
            "mov    w0, #0\n"
            "msr    DAIF, x0\n"
            "isb"
        );

        __RW uint32_t *gicdCTLR = (__RW uint32_t *)(GIC_BASE_ADDR + 0x0000);
        *gicdCTLR = 0x30;
        *gicdCTLR = 0x37;

        __RW uint32_t *gicdFCTLR = (__RW uint32_t *)(GIC_BASE_ADDR + 0x0020);
        *gicdFCTLR = 0x1ff0;

        __RW uint32_t *gicrBase = (__RW uint32_t *)(GIC_BASE_ADDR + 0x60000);

        __RW uint32_t *gicrCTLR = (__RW uint32_t *)((uint32_t)gicrBase + 0x0000);
        *gicrCTLR = 0x07000001;

        __RW uint32_t *gicrPWRR = (__RW uint32_t *)((uint32_t)gicrBase + 0x0024);
        *gicrPWRR = 0x2;
        while(*gicrPWRR & 0x1);

        __RW uint32_t *gicrWAKER = (__RW uint32_t *)((uint32_t)gicrBase + 0x0014);
        *gicrWAKER &= 0xfffffffd;
        while(*gicrWAKER & 0x4);

        __asm(
            "mov    x0, #0xf\n"
            "msr    ICC_SRE_EL3, x0\n"
            "isb\n"
            "msr    ICC_SRE_EL1, x0\n"
            "isb\n"
            "mov    w0, #1\n"
            "msr    ICC_IGRPEN0_EL1, x0\n"
            "isb\n"
            "mrs    x0, ICC_IGRPEN1_EL3\n"
            "orr    w0, w0, #1\n"
            "msr    ICC_IGRPEN1_EL3, x0\n"
            "isb\n"
            "mov    x0, #0xff\n"
            "msr    ICC_PMR_EL1, x0"
        );

    #else

        /* Enable IRQ */
        __enable_irq();

        __RW uint32_t *gicrBase = (__RW uint32_t *)(GIC_BASE_ADDR + 0x100000);
        __RW uint32_t *gicrWAKER = (__RW uint32_t *)((uint32_t)gicrBase + 0x14);

        /* Wake GICR up */
        *gicrWAKER = 0;
        while (*gicrWAKER & 0x6);

        /* Set priority mask */
        __asm(
            "mov    r1, #(0x1f << 3)\n"
            "mcr    p15, 0, r1, c4, c6, 0"
        );

        /* Enable GICD */
        __RW uint32_t *gicdCTRL = (__RW uint32_t *)(GIC_BASE_ADDR);
        *gicdCTRL = 0x3;

        /* Enable GICC */
        __asm(
            "mrc p15, 0, r1, c12, c12, 7\n"
            "mov r2, #3\n"
            "orr r1, r1, r2\n"
            "mcr p15, 0, r1, c12, c12, 7"
        );
        
    #endif
}

void GIC_configInterrupt(uint32_t id)
{
}

void GIC_enableInterrupt(uint32_t id)
{
   uint32_t regNo, bitPos;

    regNo = id;
    __RW uint64_t *gicdIROUTER = (__RW uint64_t *)(GIC_BASE_ADDR + 0x6000 + 8*regNo);
    *gicdIROUTER = 0; 

    /* group status bit = 1 */
   regNo = id/32;
   bitPos = id%32;
   __RW uint32_t *gicdIGROUPR = (__RW uint32_t *)(GIC_BASE_ADDR + 0x0080 + regNo*4);
   *gicdIGROUPR |= 1 << bitPos;

    /* group modifier bit = 0 */
    regNo = id/32;
    bitPos = id%32;
    __RW uint32_t *gicdIGRPMODR = (__RW uint32_t *)(GIC_BASE_ADDR + 0x0d00 + 4*regNo);
    *gicdIGRPMODR &= ~(1 << bitPos);

    /* priority = 0 */
   regNo = id/4;
   bitPos = (id%4)*8;
   __RW uint32_t *gicdIPRIORITYR = (__RW uint32_t *)(GIC_BASE_ADDR + 0x0400 + regNo*4);
   *gicdIPRIORITYR &= ~(1 << bitPos);

    /* edge-triggered */
   regNo = id/16;
   bitPos = (id%16)*2;
   __RW uint32_t *gicdICFGR = (__RW uint32_t *)(GIC_BASE_ADDR + 0x0c00 + regNo*4);
   *gicdICFGR |= 1 << bitPos;

   regNo = id/32;
   bitPos = id%32;
   __RW uint32_t *gicdISENABLER = (__RW uint32_t *)(GIC_BASE_ADDR + 0x0100 + regNo*4);
   *gicdISENABLER |= 1 << bitPos;
}

void GIC_disableInterrupt(uint32_t id)
{
   uint32_t regNo, bitPos;

   /* Disable interrupt */
   regNo = id/32;
   bitPos = id%32;
   __RW uint32_t *gicdICENABLER = (__RW uint32_t *)(GIC_BASE_ADDR + 0x180 + regNo*4);
   *gicdICENABLER |= 1 << bitPos;
}

uint32_t GIC_getACKID(void)
{
    uint32_t id;

    #ifdef __AARCH64
        __asm(
            "MRS    %[result], ICC_IAR1_EL1\n"
            "DSB    SY\n"
            : [result] "=r" (id)
        );
    #else
        __asm(
            "mrc    p15, 0, %[result], c12, c12, 0\n"
            "dsb"
            : [result] "=r" (id)
        );
    #endif

    GIC_endInterrupt(id);

    return id;
}

void GIC_endInterrupt(uint32_t id)
{
    #ifdef __AARCH64
        __asm(
            "MSR    ICC_EOIR1_EL1, %[id]\n"
            "DSB    SY\n"
            :
            : [id] "r" (id)
        );
    #else
        __asm(
            "mcr	p15, 0, %[id], c12, c12, 1\n"
            "dsb"
            :
            : [id] "r" (id)
        );
    #endif
}

void GIC_setInterruptHandler(uint32_t id, void (*intHandler)(void))
{
    GIC_intHandler[id] = intHandler;
}

void GIC_executeInterruptHandler(uint32_t id)
{
    if (id > MAX_INTID) { return; }
    
    (*GIC_intHandler[id])();
}
