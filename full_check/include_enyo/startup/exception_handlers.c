
#include <stdint.h>
#include <sim_utils.h>
#include <global.h>
#include <v3u.h>
#include <gic.h>

void Synchronous_Handler (void)
{
    Sim_Stop();
    while(1);
}

void SError_Handler (void)
{
    Sim_Stop();
    while(1);
}

void IRQ_Handler (void)
{
	uint32_t ackID = GIC_getACKID();
    GIC_executeInterruptHandler(ackID);    
}

void FIQ_Handler (void)
{
    Sim_Stop();
    while(1);
}

