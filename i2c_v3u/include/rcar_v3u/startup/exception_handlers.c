
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

#ifdef __AARCH64
void UndefinedInstruction_Handler(void)
{
    Sim_Stop();
    while(1);
}
#endif

#ifdef __AARCH64
void SupervisorCall_Handler(void)
{
    Sim_Stop();
    while(1);
}
#endif

#ifdef __AARCH64
void PrefetchAbort_Handler(void)
{
    Sim_Stop();
    while(1);
}
#endif

#ifdef __AARCH64
void DataAbort_Handler(void)
{
    Sim_Stop();
    while(1);
}
#endif

#ifdef __TARGET_AARCH64
void Synchronous_Handler (void)
{
    Sim_Stop();
    while(1);
}
#endif

#ifdef __TARGET_AARCH64
void SError_Handler (void)
{
    Sim_Stop();
    while(1);
}
#endif

void IRQ_Handler(void)
{
	uint32_t ackID = GIC_getACKID();
    GIC_executeInterruptHandler(ackID);    
}
