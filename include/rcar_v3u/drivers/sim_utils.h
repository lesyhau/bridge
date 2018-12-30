
#ifndef SIM_UTILS_H_
#define SIM_UTILS_H_

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

#define TEST_PASS   0
#define TEST_FAIL   1
#define PASS_CODE   0xebbeebbe
#define FAIL_CODE   0xaddeadde

#define SIM_STOP_ADDR           (uint32_t *)0x07f00000
#define MEM_DUMP_AREA_ADDR      (uint32_t *)0x04000000
#define MEM_DUMP_AREA_LENGTH    256

extern void Sim_Dump(uint32_t data);
extern void Sim_DumpCheck(uint32_t data);
extern void Sim_DumpSkip(uint16_t n);
extern void Sim_Stop(void);
extern void Sim_Delay(uint32_t count);
extern void Sim_Judge(uint32_t result);
extern void Sim_CopyToSRAM(void);
extern void Sim_SetCR52BAR(uint32_t bar);

#endif
