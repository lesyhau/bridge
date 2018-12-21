
#ifndef SIM_UTILS_H_
#define SIM_UTILS_H_

/* Standard libraries */
#include <stdint.h>

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
