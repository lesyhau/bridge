
#include <stdint.h>
#include <sim_utils.h>
#include <global.h>
#include <v3u.h>
#include <i2c.h>
#include <pfc.h>
#include <cpg.h>

#define	TOTAL_REG	16
#define	TOTAL_TEST_PHASE	4

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
	},              
	{               
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 }
	},              
	{               
		{ 0x00000000, 0x00000000 },
		{ 0x40404040, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000000, 0x00000000 },
		{ 0x00000004, 0x00000000 },
		{ 0x00000000, 0x00000000 }
	},              
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

uint32_t srst_check(void)
{
	uint32_t i, j, k;
	
    /* Registers read/write while software reset off */
    checkReg(0, 0, &I2C0->ICSCR);
    checkReg(0, 1, &I2C0->ICMCR);
    checkReg(0, 2, &I2C0->ICSSR);
    checkReg(0, 3, &I2C0->ICMSR);
    checkReg(0, 4, &I2C0->ICSIER);
    checkReg(0, 5, &I2C0->ICMIER);
    checkReg(0, 6, &I2C0->ICCCR);
    checkReg(0, 7, &I2C0->ICSAR);
    checkReg(0, 8, &I2C0->ICMAR);
    checkReg(0, 9, &I2C0->ICTXD);
    checkReg(0, 10, &I2C0->ICCCR2);
    checkReg(0, 11, &I2C0->ICMPR);
    checkReg(0, 12, &I2C0->ICHPR);
    checkReg(0, 13, &I2C0->ICLPR);
    checkReg(0, 14, &I2C0->ICFBSCR);
    checkReg(0, 15, &I2C0->ICDMAER);

	/* Write 0xffffffff into registers */
    I2C0->ICSCR = 0xffffffff;
    I2C0->ICMCR = 0xffffffff;
    I2C0->ICSSR = 0xffffffff;
    I2C0->ICMSR = 0xffffffff;
    I2C0->ICSIER = 0xffffffff;
    I2C0->ICMIER = 0xffffffff;
    I2C0->ICCCR = 0xffffffff;
    I2C0->ICSAR = 0xffffffff;
    I2C0->ICMAR = 0xffffffff;
    I2C0->ICTXD = 0xffffffff;
    I2C0->ICCCR2 = 0xffffffff;
    I2C0->ICMPR = 0xffffffff;
    I2C0->ICHPR = 0xffffffff;
    I2C0->ICLPR = 0xffffffff;
    I2C0->ICFBSCR = 0xffffffff;
    I2C0->ICDMAER = 0xffffffff;
	
    /* Activate software reset signal */
    CPG_SetBit(I2C0_SRCR, I2C0_SRST_BIT_POS);

    /* Registers read/write while software reset on */
    checkReg(1, 0, &I2C0->ICSCR);
    checkReg(1, 1, &I2C0->ICMCR);
    checkReg(1, 2, &I2C0->ICSSR);
    checkReg(1, 3, &I2C0->ICMSR);
    checkReg(1, 4, &I2C0->ICSIER);
    checkReg(1, 5, &I2C0->ICMIER);
    checkReg(1, 6, &I2C0->ICCCR);
    checkReg(1, 7, &I2C0->ICSAR);
    checkReg(1, 8, &I2C0->ICMAR);
    checkReg(1, 9, &I2C0->ICTXD);
    checkReg(1, 10, &I2C0->ICCCR2);
    checkReg(1, 11, &I2C0->ICMPR);
    checkReg(1, 12, &I2C0->ICHPR);
    checkReg(1, 13, &I2C0->ICLPR);
    checkReg(1, 14, &I2C0->ICFBSCR);
    checkReg(1, 15, &I2C0->ICDMAER);

    /* Deactivate software reset signal */
    CPG_SetBit(I2C0_SRSTCLR, I2C0_SRST_BIT_POS);

	/* Check if registers value is reset */
	result[2][0][0] = I2C0->ICSCR;
    result[2][1][0] = I2C0->ICMCR;
    result[2][2][0] = I2C0->ICSSR;
    result[2][3][0] = I2C0->ICMSR;
    result[2][4][0] = I2C0->ICSIER;
    result[2][5][0] = I2C0->ICMIER;
    result[2][6][0] = I2C0->ICCCR;
    result[2][7][0] = I2C0->ICSAR;
    result[2][8][0] = I2C0->ICMAR;
    result[2][9][0] = I2C0->ICTXD;
    result[2][10][0] = I2C0->ICCCR2;
    result[2][11][0] = I2C0->ICMPR;
    result[2][12][0] = I2C0->ICHPR;
    result[2][13][0] = I2C0->ICLPR;
    result[2][14][0] = I2C0->ICFBSCR;
    result[2][15][0] = I2C0->ICDMAER;
	
	result[2][0][1] = 0;
    result[2][1][1] = 0;
    result[2][2][1] = 0;
    result[2][3][1] = 0;
    result[2][4][1] = 0;
    result[2][5][1] = 0;
    result[2][6][1] = 0;
    result[2][7][1] = 0;
    result[2][8][1] = 0;
    result[2][9][1] = 0;
    result[2][10][1] = 0;
    result[2][11][1] = 0;
    result[2][12][1] = 0;
    result[2][13][1] = 0;
    result[2][14][1] = 0;
    result[2][15][1] = 0;
	
    /* Registers read/write while software reset off */
    checkReg(3, 0, &I2C0->ICSCR);
    checkReg(3, 1, &I2C0->ICMCR);
    checkReg(3, 2, &I2C0->ICSSR);
    checkReg(3, 3, &I2C0->ICMSR);
    checkReg(3, 4, &I2C0->ICSIER);
    checkReg(3, 5, &I2C0->ICMIER);
    checkReg(3, 6, &I2C0->ICCCR);
    checkReg(3, 7, &I2C0->ICSAR);
    checkReg(3, 8, &I2C0->ICMAR);
    checkReg(3, 9, &I2C0->ICTXD);
    checkReg(3, 10, &I2C0->ICCCR2);
    checkReg(3, 11, &I2C0->ICMPR);
    checkReg(3, 12, &I2C0->ICHPR);
    checkReg(3, 13, &I2C0->ICLPR);
    checkReg(3, 14, &I2C0->ICFBSCR);
    checkReg(3, 15, &I2C0->ICDMAER);

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

