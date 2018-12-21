
#include    <stdint.h>
#include    "../global.h"
#include    "../v3u.h"
#include    "cpg.h"

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
