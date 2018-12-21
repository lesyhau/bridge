
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

void CPG_SetBit(__RW uint32_t *reg, uint8_t bitPos)
{
	uint32_t data = *reg | (1 << bitPos);
	*CPGWPR = ~data;
	*reg = data;
}

void CPG_ClearBit(__RW uint32_t *reg, uint8_t bitPos)
{
	uint32_t data = *reg & ~(1 << bitPos);
	*CPGWPR = ~data;
	*reg = data;
}

void CPG_SetMultipleBit(__RW uint32_t *reg, uint32_t data)
{
    uint32_t wd = *reg | data;
    *CPGWPR = ~wd;
    *reg = wd;
}

void CPG_ClearMultipleBit(__RW uint32_t *reg, uint32_t data)
{
    uint32_t wd = *reg & ~data;
    *CPGWPR = ~wd;
    *reg = wd;
}

void CPG_WriteAnd(__RW uint32_t *reg, uint32_t data)
{
    uint32_t wd = *reg | data;
	*CPGWPR = ~data;
	*reg = wd;
}

void CPG_WriteOr(__RW uint32_t *reg, uint32_t data)
{
    uint32_t wd = *reg & data;
	*CPGWPR = ~data;
	*reg = wd;
}
