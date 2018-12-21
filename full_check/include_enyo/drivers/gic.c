
#include <stdint.h>
#include <global.h>
#include <v3u.h>
#include "gic.h"

/* Default interrupt handler */
void GIC_defaultHandler(void)
{
    while(1);
}

/* Array of pointers points to IRQ handlers */
void (*GIC_intHandler[969])(void) =
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
    /* Enable IRQ */
    __asm(
        "mov    w0, #0\n"
        "msr    DAIF, x0\n"
        "isb"
    );

    __RW uint32_t *gicdCTLR = (__RW uint32_t *)(GIC_CA76_BASE_ADDR + 0x0000);
    *gicdCTLR = 0x30;
    *gicdCTLR = 0x37;

    __RW uint32_t *gicdFCTLR = (__RW uint32_t *)(GIC_CA76_BASE_ADDR + 0x0020);
    *gicdFCTLR = 0x1ff0;

    __RW uint32_t *gicrBase = (__RW uint32_t *)(GIC_CA76_BASE_ADDR + 0x60000);

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
}

void GIC_configInterrupt(uint32_t id)
{
    //uint32_t regNo, bitPos;

    //regNo = id;
    //__RW uint64_t *gicdIROUTER = (__RW uint64_t *)(GIC_CA76_BASE_ADDR + 0x6000 + 8*regNo);
    //*gicdIROUTER = 0; 

    ///* group status bit = 1 */
    //regNo = id/32;
    //bitPos = id%32;
    //__RW uint32_t *gicdIGROUPR = (__RW uint32_t *)(GIC_CA76_BASE_ADDR + 0x0080 + 4*regNo);
    //*gicdIGROUPR |= 1 << bitPos;

    ///* group modifier bit = 0 */
    //regNo = id/32;
    //bitPos = id%32;
    //__RW uint32_t *gicdIGRPMODR = (__RW uint32_t *)(GIC_CA76_BASE_ADDR + 0x0d00 + 4*regNo);
    //*gicdIGRPMODR &= ~(1 << bitPos);

    ///* priority = 0 */
    //regNo = id/4;
    //bitPos = (id%4)*8;
    //__RW uint32_t *gicdIPRIORITYR = (__RW uint32_t *)(GIC_CA76_BASE_ADDR + 0x0400 + 4*regNo);
    //*gicdIPRIORITYR	&= ~(1 << bitPos);

    ///* edge-triggered */
    //regNo = id/16;
    //bitPos = (id%16)*2;
    //__RW uint32_t *gicdICFGR = (__RW uint32_t *)(GIC_CA76_BASE_ADDR + 0x0c00 + 4*regNo);
    //*gicdICFGR |= 1 << bitPos;
}

void GIC_enableInterrupt(uint32_t id)
{
   uint32_t regNo, bitPos;

    regNo = id;
    __RW uint64_t *gicdIROUTER = (__RW uint64_t *)(GIC_CA76_BASE_ADDR + 0x6000 + 8*regNo);
    *gicdIROUTER = 0; 

    /* group status bit = 1 */
    regNo = id/32;
    bitPos = id%32;
    __RW uint32_t *gicdIGROUPR = (__RW uint32_t *)(GIC_CA76_BASE_ADDR + 0x0080 + 4*regNo);
    *gicdIGROUPR |= 1 << bitPos;

    /* group modifier bit = 0 */
    regNo = id/32;
    bitPos = id%32;
    __RW uint32_t *gicdIGRPMODR = (__RW uint32_t *)(GIC_CA76_BASE_ADDR + 0x0d00 + 4*regNo);
    *gicdIGRPMODR &= ~(1 << bitPos);

    /* priority = 0 */
    regNo = id/4;
    bitPos = (id%4)*8;
    __RW uint32_t *gicdIPRIORITYR = (__RW uint32_t *)(GIC_CA76_BASE_ADDR + 0x0400 + 4*regNo);
    *gicdIPRIORITYR	&= ~(1 << bitPos);

    /* edge-triggered */
    regNo = id/16;
    bitPos = (id%16)*2;
    __RW uint32_t *gicdICFGR = (__RW uint32_t *)(GIC_CA76_BASE_ADDR + 0x0c00 + 4*regNo);
    *gicdICFGR |= 1 << bitPos;

   regNo = id/32;
   bitPos = id%32;
   __RW uint32_t *gicdISENABLER = (__RW uint32_t *)(GIC_CA76_BASE_ADDR + 0x0100 + regNo*4);
   *gicdISENABLER |= 0x1 << bitPos;
}

void GIC_disableInterrupt(uint32_t id)
{
   uint32_t regNo, bitPos;

   regNo = id/32;
   bitPos = id%32;
   __RW uint32_t *gicdICENABLER = (__RW uint32_t *)(GIC_CA76_BASE_ADDR + 0x180 + regNo*4);
   *gicdICENABLER |= 0x1 << bitPos;
}

void GIC_setInterruptHandler(uint32_t id, void (*intHandler)(void))
{
    GIC_intHandler[id] = intHandler;
}

void GIC_executeInterruptHandler(uint32_t id)
{
    (*GIC_intHandler[id])();
}

uint32_t GIC_getACKID(void)
{
    uint32_t ackID;

    __asm(
	    "MRS    %[result], ICC_IAR1_EL1\n"
	    "DSB    SY\n"
        : [result] "=r" (ackID)
    );

    GIC_endInterrupt(ackID);

    return ackID;
}

void GIC_endInterrupt(uint32_t id)
{
    __asm(
	    "MSR    ICC_EOIR1_EL1, %[id]\n"
	    "DSB    SY\n"
        :
        : [id] "r" (id)
    );
}

