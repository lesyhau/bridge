
#ifndef GIC_H_
#define GIC_H_

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

#ifdef TARGET_AARCH32
#define GIC_BASE_ADDR   GIC_CR52_BASE_ADDR
#endif

#ifdef TARGET_AARCH64
#define GIC_BASE_ADDR   GIC_CA76_BASE_ADDR
#endif

#define GIC_INTID_SDMAC1AE     0x026
#define GIC_INTID_SDMAC2AE     0x027
#define GIC_INTID_RDMAC0AE     0x028
#define GIC_INTID_RDMAC1AE     0x029
#define GIC_INTID_RDMAC2AE     0x02a
#define GIC_INTID_RDMAC3AE     0x02b
#define GIC_INTID_SDMAC1CH0    0x040
#define GIC_INTID_SDMAC1CH1    0x041
#define GIC_INTID_SDMAC1CH2    0x042
#define GIC_INTID_SDMAC1CH3    0x043
#define GIC_INTID_SDMAC1CH4    0x044
#define GIC_INTID_SDMAC1CH5    0x045
#define GIC_INTID_SDMAC1CH6    0x046
#define GIC_INTID_SDMAC1CH7    0x047
#define GIC_INTID_SDMAC1CH8    0x048
#define GIC_INTID_SDMAC1CH9    0x049
#define GIC_INTID_SDMAC1CH10   0x04a
#define GIC_INTID_SDMAC1CH11   0x04b
#define GIC_INTID_SDMAC1CH12   0x04c
#define GIC_INTID_SDMAC1CH13   0x04d
#define GIC_INTID_SDMAC1CH14   0x04e
#define GIC_INTID_SDMAC1CH15   0x04f
#define GIC_INTID_SDMAC2CH0    0x050
#define GIC_INTID_SDMAC2CH1    0x051
#define GIC_INTID_SDMAC2CH2    0x052
#define GIC_INTID_SDMAC2CH3    0x053
#define GIC_INTID_SDMAC2CH4    0x054
#define GIC_INTID_SDMAC2CH5    0x055
#define GIC_INTID_SDMAC2CH6    0x056
#define GIC_INTID_SDMAC2CH7    0x057
#define GIC_INTID_RDMAC0CH0    0x060
#define GIC_INTID_RDMAC0CH1    0x061
#define GIC_INTID_RDMAC0CH2    0x062
#define GIC_INTID_RDMAC0CH3    0x063
#define GIC_INTID_RDMAC0CH4    0x064
#define GIC_INTID_RDMAC0CH5    0x065
#define GIC_INTID_RDMAC0CH6    0x066
#define GIC_INTID_RDMAC0CH7    0x067
#define GIC_INTID_RDMAC0CH8    0x068
#define GIC_INTID_RDMAC0CH9    0x069
#define GIC_INTID_RDMAC0CH10   0x06a
#define GIC_INTID_RDMAC0CH11   0x06b
#define GIC_INTID_RDMAC0CH12   0x06c
#define GIC_INTID_RDMAC0CH13   0x06d
#define GIC_INTID_RDMAC0CH14   0x06e
#define GIC_INTID_RDMAC0CH15   0x06f
#define GIC_INTID_RDMAC1CH0    0x070
#define GIC_INTID_RDMAC1CH1    0x071
#define GIC_INTID_RDMAC1CH2    0x072
#define GIC_INTID_RDMAC1CH3    0x073
#define GIC_INTID_RDMAC1CH4    0x074
#define GIC_INTID_RDMAC1CH5    0x075
#define GIC_INTID_RDMAC1CH6    0x076
#define GIC_INTID_RDMAC1CH7    0x077
#define GIC_INTID_RDMAC1CH8    0x078
#define GIC_INTID_RDMAC1CH9    0x079
#define GIC_INTID_RDMAC1CH10   0x07a
#define GIC_INTID_RDMAC1CH11   0x07b
#define GIC_INTID_RDMAC1CH12   0x07c
#define GIC_INTID_RDMAC1CH13   0x07d
#define GIC_INTID_RDMAC1CH14   0x07e
#define GIC_INTID_RDMAC1CH15   0x07f
#define GIC_INTID_RDMAC2CH0    0x080
#define GIC_INTID_RDMAC2CH1    0x081
#define GIC_INTID_RDMAC2CH2    0x082
#define GIC_INTID_RDMAC2CH3    0x083
#define GIC_INTID_RDMAC2CH4    0x084
#define GIC_INTID_RDMAC2CH5    0x085
#define GIC_INTID_RDMAC2CH6    0x086
#define GIC_INTID_RDMAC2CH7    0x087
#define GIC_INTID_RDMAC2CH8    0x088
#define GIC_INTID_RDMAC2CH9    0x089
#define GIC_INTID_RDMAC2CH10   0x08a
#define GIC_INTID_RDMAC2CH11   0x08b
#define GIC_INTID_RDMAC2CH12   0x08c
#define GIC_INTID_RDMAC2CH13   0x08d
#define GIC_INTID_RDMAC2CH14   0x08e
#define GIC_INTID_RDMAC2CH15   0x08f
#define GIC_INTID_RDMAC3CH0    0x090
#define GIC_INTID_RDMAC3CH1    0x091
#define GIC_INTID_RDMAC3CH2    0x092
#define GIC_INTID_RDMAC3CH3    0x093
#define GIC_INTID_RDMAC3CH4    0x094
#define GIC_INTID_RDMAC3CH5    0x095
#define GIC_INTID_RDMAC3CH6    0x096
#define GIC_INTID_RDMAC3CH7    0x097
#define GIC_INTID_RDMAC3CH8    0x098
#define GIC_INTID_RDMAC3CH9    0x099
#define GIC_INTID_RDMAC3CH10   0x09a
#define GIC_INTID_RDMAC3CH11   0x09b
#define GIC_INTID_RDMAC3CH12   0x09c
#define GIC_INTID_RDMAC3CH13   0x09d
#define GIC_INTID_RDMAC3CH14   0x09e
#define GIC_INTID_RDMAC3CH15   0x09f
#define GIC_INTID_I2C0         0x10e
#define GIC_INTID_I2C1         0x10f
#define GIC_INTID_I2C2         0x110
#define GIC_INTID_I2C3         0x111
#define GIC_INTID_I2C4         0x112
#define GIC_INTID_I2C5         0x113
#define GIC_INTID_I2C6         0x114

extern void GIC_enable(void);
extern void GIC_configInterrupt(uint32_t id);
extern void GIC_enableInterrupt(uint32_t id);
extern void GIC_disableInterrupt(uint32_t id);
extern void GIC_setInterruptHandler(uint32_t id, void (*intHandler)(void));
extern void GIC_executeInterruptHandler(uint32_t id);
extern uint32_t GIC_getACKID(void);
extern void GIC_endInterrupt(uint32_t ackID);

#endif
