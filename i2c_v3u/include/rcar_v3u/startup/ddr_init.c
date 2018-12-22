
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

#ifdef __USE_DDR

void __ddr_init_bsc(void)
{
    #ifdef __AARCH64
        __asm("include rel_dbsc4_init_lpddr4_4266_CL40WL18_181002_ca76.s");
    #else
        __asm("include rel_dbsc4_init_lpddr4_4266_CL40WL18_181002_cr52.s");
    #endif
}

void (*__ddr_init_sram)(void) = SRAM_BASE_ADDR + __ddr_init_bsc;

void __ddr_init(void)
{
    /* Copy DDR initialize sequence from BSC region into SRAM */
    SDMAC1CH0->SAR = __ddr_init_bsc;
    SDMAC1CH0->DAR = __ddr_init_sram;
    SDMAC1CH0->TCR = (sizeof(__ddr_init_bsc) >> 6) + 1;
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

    /* Call the DDR initialize sequence in the SRAM */
    (*__ddr_init_sram)();
}

#endif