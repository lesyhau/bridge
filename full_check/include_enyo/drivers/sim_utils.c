
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>
#include "sim_utils.h"
#include "v3u.h"
#include "drivers/dmac.h"

extern uint32_t Region$$Table$$Base;
volatile uint32_t DumpOffset = 0;

/* Write 4-bytes data out to BSC */
void Sim_Dump(uint32_t data)
{
    *(DumpOffset + MEM_DUMP_AREA_ADDR) = data;
    DumpOffset += 1;
}

/* Write 4-bytes data out to BSC and wait until the data is written */
void Sim_DumpCheck(uint32_t data)
{
    Sim_Dump(data);
    while(*(DumpOffset + MEM_DUMP_AREA_ADDR - 1) != data);
}

/* Skip for n 4-bytes element */
void Sim_DumpSkip(uint16_t n)
{
    DumpOffset += n;
}

/* Stop the simulation */
void Sim_Stop(void)
{
    *SIM_STOP_ADDR = 0;
}

/* Simple delay loop */
void Sim_Delay(uint32_t count)
{
    while(count--);
}

/* Judge simulation result */
void Sim_Judge(uint32_t result)
{
    switch (result)
    {
        case TEST_PASS:
            Sim_Dump(PASS_CODE);
            break;

        case TEST_FAIL:
            Sim_Dump(FAIL_CODE);
            break;

        default:
            Sim_Dump(FAIL_CODE);
            break;
    }
}

/* Copy code and data from external memory to SRAM */
void Sim_CopyToSRAM(void)
{
    SDMAC1CH0->SAR = BSC0_BASE_ADDR;
    SDMAC1CH0->DAR = SRAM_BASE_ADDR;
    SDMAC1CH0->TCR = Region$$Table$$Base/64 + 1;
    SDMAC1CH0->DM = 1;
    SDMAC1CH0->SM = 1;
    SDMAC1CH0->RS = 4;
    SDMAC1CH0->TS = 1;
    SDMAC1CH0->TS2 = 1;
    SDMAC1CH0->DE = 1;
    SDMAC1->DMAOR = 1;
    while (! SDMAC1CH0->TE);
    SDMAC1CH0->DE = 0;
    SDMAC1CH0->TE = 0;
    SDMAC1->DMAOR = 0;
}

void Sim_SetCR52BAR(uint32_t bar)
{
    *CR52BAR = 0;
    *CR52BAR = bar;
    *CR52BAR |= 0x10;
}

