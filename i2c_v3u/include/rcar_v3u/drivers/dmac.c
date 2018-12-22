
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

void DMAC_initDescriptorMemory(DMAC_Common_t *dmac, uint8_t stage)
{
	uint8_t i;
	for (i = 0; i < stage; i++)
	{
		dmac->DMADESMEM[i].DPSAR = 0;
		dmac->DMADESMEM[i].DPDAR = 0;
		dmac->DMADESMEM[i].DPTCR = 0;
		dmac->DMADESMEM[i].DPCHCR = 0;
	}
}

void DMAC_checkRegsAddress(DMAC_Channel_t *dmac)
{
	dmac->SAR = 0x5555;
	dmac->DAR = 0x5555;
	dmac->TCR = 0x5555;
	dmac->CHCR = 0x5555;
}

void DMAC_configAutoTransfer(DMAC_Channel_t *dmac, DMAC_AutoTransferConfig_t *config)
{
	/* Reset DMAC channel */
	dmac->CHCR = 0;
	
	dmac->SAR = config->SourceAddress;
	dmac->DAR = config->DestinationAddress;
	dmac->TCR = config->TransferCount;
	dmac->TS = config->TransferSize;
	dmac->TS2 = config->TransferSize >> 2;
	dmac->SM = config->SourceAddressMode;
	dmac->DM = config->DestinationAddressMode;
	dmac->RS = DMAC_AUTO_REQUEST;
	dmac->IE = config->InterruptEnable;
}

void DMAC_enableChannel(DMAC_Channel_t *dmac)
{
	dmac->DE = 1;
}

void DMAC_disableChannel(DMAC_Channel_t *dmac)
{
	dmac->DE = 0;
}

void DMAC_enable(DMAC_Common_t *dmac)
{
	dmac->DMAOR = 1;
}

void DMAC_disable(DMAC_Common_t *dmac)
{
	dmac->DMAOR = 0;
}
