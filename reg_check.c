
#include <stdint.h>
#include <sim_utils.h>
#include <global.h>
#include <v3u.h>
#include <i2c.h>

#define	TOTAL_REG	16
#define	TOTAL_TEST_PHASE	1

static const uint32_t golden[TOTAL_TEST_PHASE][TOTAL_REG][2] =
{
	{
		{ 0x1f1f1f1f, 0x00000000 },
		{ 0xdfdfdfdf, 0x40404040 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x1f1f1f1f, 0x00000000 },
		{ 0x7f7f7f7f, 0x00000000 },
		{ 0x000001ff, 0x00000000 },
		{ 0x7f7f7f7f, 0x00000000 },
		{ 0xffffffff, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x87878787, 0x00000000 },
		{ 0xffffffff, 0x00000000 },
		{ 0x0000ffff, 0x00000000 },
		{ 0x0000ffff, 0x00000000 },
		{ 0x1f1f001f, 0x00000000 },
		{ 0xffffffff, 0x00000000 }
	}
};

static uint32_t result[TOTAL_TEST_PHASE][TOTAL_REG][2];

static void checkReg(uint32_t phaseIndex, uint32_t regIndex, __RW uint32_t * addr)
{
	uint32_t i = 0;
	
    *addr = 0xffffffff;
    result[phaseIndex][regIndex][i++] = *addr;

    *addr = 0x00000000;
    result[phaseIndex][regIndex][i++] = *addr;
}

uint32_t reg_check(void)
{
	uint32_t i, j, k;
	
    checkReg(0, 0, &I2C0->ICSCR);
    checkReg(0, 1, &I2C0->ICMCR);
    checkReg(0, 2, &I2C0->ICSSR);
    checkReg(0, 3, &I2C0->ICMSR);
    checkReg(0, 4, &I2C0->ICSIER);
    checkReg(0, 5, &I2C0->ICMIER);
    checkReg(0, 6, &I2C0->ICCCR);
    checkReg(0, 7, &I2C0->ICSAR);
    checkReg(0, 8, &I2C0->ICMAR);
    checkReg(0, 9, &I2C0->ICRXD);
    checkReg(0, 10, &I2C0->ICCCR2);
    checkReg(0, 11, &I2C0->ICMPR);
    checkReg(0, 12, &I2C0->ICHPR);
    checkReg(0, 13, &I2C0->ICLPR);
    checkReg(0, 14, &I2C0->ICFBSCR);
    checkReg(0, 15, &I2C0->ICDMAER);

    /* Judge the result */
	uint32_t testResult = TEST_PASS;
	for (i = 0; i < TOTAL_TEST_PHASE; i++)
	{
		for (j = 0; j < TOTAL_REG; j++)
		{
			for (k = 0; k < 2; k++)
			{
				if (result[i][j][k] != golden[i][j][k])
				{
					testResult = TEST_FAIL;
                    goto JUDGEMENT;
				}
			}
		}
	}
	
JUDGEMENT:

	return testResult;
}

