
#include    <stdint.h>
#include    "../global.h"
#include    "pfc.h"

void PFC_SetBit(__RW uint32_t *pmmr, __RW uint32_t *reg, uint8_t bitPos)
{
	uint32_t data = *reg | (1 << bitPos);
	*pmmr = ~data;
	*reg = data;
}

void PFC_ClearBit(__RW uint32_t *pmmr, __RW uint32_t *reg, uint8_t bitPos)
{
	uint32_t data = *reg & ~(1 << bitPos);
	*pmmr = ~data;
	*reg &= data;
}

void PFC_SetMultipleBit(__RW uint32_t *pmmr, __RW uint32_t *reg, uint32_t data)
{
    uint32_t wd = *reg | data;
    *pmmr = ~wd;
    *reg = wd;
}

void PFC_ClearMultipleBit(__RW uint32_t *pmmr, __RW uint32_t *reg, uint32_t data)
{
    uint32_t wd = *reg & ~data;
    *pmmr = ~wd;
    *reg = wd;
}

void PFC_WriteOr(__RW uint32_t *pmmr, __RW uint32_t *reg, uint32_t data)
{
    uint32_t wd = *reg | data;
	*pmmr = ~wd;
	*reg = wd;
}

void PFC_WriteAnd(__RW uint32_t *pmmr, __RW uint32_t *reg, uint32_t data)
{
    uint32_t wd = *reg & data;
	*pmmr = ~wd;
	*reg = wd;
}

