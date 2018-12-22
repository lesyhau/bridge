
/******************************************************************************
 * I2C driver.
 * 2082 - Hau Sy Le - hau.le.eb@renesas.com
 ****************************************************************************/

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

/******************************************************************************
 * Subroutines for slave mode
 *****************************************************************************/

void I2C_slaveInit(I2C_t *i2c, const I2C_SlaveConfig_t * slaveConfig)
{
    /* Set slave address */
    i2c->ICSAR = slaveConfig->SlaveAddress;
    
    uint32_t icscr = 0;

    /* Select single buffer mode */
    icscr |= SDBS_MASK;

    /* Configure slave clock stretch mode */
    switch (slaveConfig->ClockStretchMode)
    {
    case CLOCK_STRETCH_BEFORE:
        icscr &= ~SCSS_MASK;
        break;

    case CLOCK_STRETCH_AFTER:
        icscr |= SCSS_MASK;
        break;

    default:
        icscr &= ~SCSS_MASK;
        break;
    }

    /* Configure general call ACK mode */
    switch (slaveConfig->GenCallMode)
    {
    case GENERAL_CALL_ACK_DISABLE:
        icscr &= ~GCAE_MASK;
        break;

    case GENERAL_CALL_ACK_ENABLE:
        icscr |= GCAE_MASK;
        break;

    default:
        icscr &= ~GCAE_MASK;
        break;
    }

    i2c->ICSCR = icscr;

    /* Configure clock rate and clock type */
    switch (slaveConfig->IOBufferType)
    {
    case OD_BUFFER:
        switch (slaveConfig->ClockType)
        {
        case FIXED_DUTY_CYCLE:
            i2c->ICCCR2 &= ~(CDFD_MASK | HLSE_MASK | SME_MASK);
            switch (slaveConfig->ClockRate)
            {
            case CLOCK_RATE_50KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 44;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_100KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 20;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_200KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 9;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_250KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 7;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_300KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 5;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_400KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 3;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_1MHZ:
                i2c->CDF = 6;
                i2c->SCGD = 3;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                i2c->FMPE = 1;
                break;

            default:
                /* Default clock rate is 400kHz */
                i2c->CDF = 6;
                i2c->SCGD = 3;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;
            }
            break;

        case VARIABLE_DUTY_CYCLE:
            i2c->ICCCR2 |= (CDFD_MASK | HLSE_MASK | SME_MASK);
            i2c->FBSC = 15;
            switch (slaveConfig->ClockRate)
            {
            case CLOCK_RATE_50KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 1281;
                i2c->ICLPR = 1300;
                break;

            case CLOCK_RATE_100KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 615;
                i2c->ICLPR = 633;
                break;

            case CLOCK_RATE_200KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 281;
                i2c->ICLPR = 300;
                break;

            case CLOCK_RATE_250KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 215;
                i2c->ICLPR = 233;
                break;

            case CLOCK_RATE_300KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 170;
                i2c->ICLPR = 189;
                break;

            case CLOCK_RATE_400KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 115;
                i2c->ICLPR = 133;
                break;

            case CLOCK_RATE_1MHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 27;
                i2c->ICHPR = 32;
                i2c->ICLPR = 39;
                i2c->FMPE = 1;
                break;

            default:
                /* Default clock rate is 400kHz */
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 115;
                i2c->ICLPR = 133;
                break;
            }
            break;

        default:
            /* Default clock rate is 400kHz and with fixed duty cycle */
            i2c->ICCCR2 &= ~(CDFD_MASK | HLSE_MASK | SME_MASK);
            i2c->CDF = 6;
            i2c->SCGD = 3;
            i2c->ICMPR = 0;
            i2c->ICHPR = 0;
            i2c->ICLPR = 0;
            break;
        }
        break;

    case LVTTL_BUFFER:
        switch (slaveConfig->ClockType)
        {
        case FIXED_DUTY_CYCLE:
            i2c->ICCCR2 &= ~(CDFD_MASK | HLSE_MASK | SME_MASK);
            switch (slaveConfig->ClockRate)
            {
            case CLOCK_RATE_50KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 44;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_100KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 20;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_200KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 9;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_250KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 7;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_300KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 5;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_400KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 3;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_1MHZ:
                i2c->CDF = 6;
                i2c->SCGD = 3;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                i2c->FMPE = 1;
                break;

            default:
                /* Default clock rate is 400kHz */
                i2c->CDF = 6;
                i2c->SCGD = 3;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;
            }
            break;

        case VARIABLE_DUTY_CYCLE:
            i2c->ICCCR2 |= (CDFD_MASK | HLSE_MASK | SME_MASK);
            i2c->FBSC = 15;
            switch (slaveConfig->ClockRate)
            {
            case CLOCK_RATE_50KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 1281;
                i2c->ICLPR = 1300;
                break;

            case CLOCK_RATE_100KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 615;
                i2c->ICLPR = 633;
                break;

            case CLOCK_RATE_200KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 281;
                i2c->ICLPR = 300;
                break;

            case CLOCK_RATE_250KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 215;
                i2c->ICLPR = 233;
                break;

            case CLOCK_RATE_300KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 170;
                i2c->ICLPR = 189;
                break;

            case CLOCK_RATE_400KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 115;
                i2c->ICLPR = 133;
                break;

            case CLOCK_RATE_1MHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 27;
                i2c->ICHPR = 32;
                i2c->ICLPR = 39;
                i2c->FMPE = 1;
                break;

            default:
                /* Default clock rate is 400kHz */
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 115;
                i2c->ICLPR = 133;
                break;
            }
            break;

        default:
            /* Default clock rate is 400kHz and with fixed duty cycle */
            i2c->ICCCR2 &= ~(CDFD_MASK | HLSE_MASK | SME_MASK);
            i2c->CDF = 6;
            i2c->SCGD = 3;
            i2c->ICMPR = 0;
            i2c->ICHPR = 0;
            i2c->ICLPR = 0;
            break;
        }
        break;

    default:
        /* Default clock rate is 400kHz and with fixed duty cycle and use OD buffer */
        i2c->ICCCR2 &= ~(CDFD_MASK | HLSE_MASK | SME_MASK);
        i2c->CDF = 6;
        i2c->SCGD = 3;
        i2c->ICMPR = 0;
        i2c->ICHPR = 0;
        i2c->ICLPR = 0;
        break;
    }
}

void I2C_slaveEnable(I2C_t *i2c)
{
    i2c->SIE = 1;
}

void I2C_slaveDisable(I2C_t *i2c)
{
    i2c->SIE = 0;
}

void I2C_slaveEnableInterrupt(I2C_t *i2c, uint32_t flag)
{
    i2c->ICSIER |= flag;
}

void I2C_slaveDisableInterrupt(I2C_t *i2c, uint32_t flag)
{
    i2c->ICSIER &= ~flag;
}

uint32_t I2C_slaveGetInterruptStatus(I2C_t *i2c)
{
    return (i2c->ICSSR & 0xff);
}

void I2C_slaveClearInterruptStatus(I2C_t *i2c, uint32_t flag)
{
    i2c->ICSSR &= ~flag;
}

void I2C_slaveForceNAK(I2C_t *i2c)
{
    i2c->FNA = 1;
}

uint32_t I2C_slaveReceiveMultipleByteNext(I2C_t *i2c)
{
    return (i2c->ICRXD & 0xff);
}

uint32_t I2C_slaveReceiveMultipleByteStop(I2C_t *i2c)
{
    /* Get the received byte and send NACK on the next received byte */
    i2c->FNA = 1;
    return (i2c->ICRXD & 0xff);
}

uint32_t I2C_slaveReceiveMultipleByteFinish(I2C_t *i2c)
{
    /* Get the last received byte */
    return (i2c->ICRXD & 0xff);
}

void I2C_slaveSetData(I2C_t *i2c, uint8_t data)
{
    i2c->ICTXD = data;
}

void I2C_slaveEnableDMAReceive(I2C_t *i2c)
{
    i2c->RSDMAE = 1;
}

void I2C_slaveDisableDMAReceive(I2C_t *i2c)
{
    i2c->RSDMAE = 0;
}

void I2C_slaveEnableDMATransmit(I2C_t *i2c)
{
    i2c->TSDMAE = 1;
}

void I2C_slaveDisableDMATransmit(I2C_t *i2c)
{
    i2c->TSDMAE = 0;
}

/******************************************************************************
 * Subroutines for master mode
 *****************************************************************************/

void I2C_masterInit(I2C_t *i2c, const I2C_MasterConfig_t *masterConfig)
{
    /* Set slave address and configure transfer mode */
    i2c->ICMAR = (masterConfig->SlaveAddress << 1 | masterConfig->TransferMode);

    uint32_t icmcr = 0;

    /* Select single buffer mode */
    icmcr |= MDBS_MASK;

    /* Configure start byte transmit mode */
    switch (masterConfig->StartByteTransmitMode)
    {
    case START_BYTE_TRANSMIT_DISABLE:
        icmcr &= ~TSBE_MASK;
        break;

    case START_BYTE_TRANSMIT_ENABLE:
        icmcr |= TSBE_MASK;
        break;

    default:
        /* Default is start byte transmit disabled */
        icmcr &= ~TSBE_MASK;
        break;
    }

    i2c->ICMCR = icmcr;

    /* Configure clock rate and clock type */
    switch (masterConfig->IOBufferType)
    {
    case OD_BUFFER:
        switch (masterConfig->ClockType)
        {
        case FIXED_DUTY_CYCLE:
            i2c->ICCCR2 &= ~(CDFD_MASK | HLSE_MASK | SME_MASK);
            switch (masterConfig->ClockRate)
            {
            case CLOCK_RATE_50KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 44;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_100KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 20;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_200KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 9;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_250KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 7;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_300KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 5;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_400KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 3;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_1MHZ:
                i2c->CDF = 6;
                i2c->SCGD = 3;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                i2c->FMPE = 1;
                break;

            default:
                /* Default clock rate is 400kHz */
                i2c->CDF = 6;
                i2c->SCGD = 3;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;
            }
            break;

        case VARIABLE_DUTY_CYCLE:
            i2c->ICCCR2 |= (CDFD_MASK | HLSE_MASK | SME_MASK);
            i2c->FBSC = 15;
            switch (masterConfig->ClockRate)
            {
            case CLOCK_RATE_50KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 1281;
                i2c->ICLPR = 1300;
                break;

            case CLOCK_RATE_100KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 615;
                i2c->ICLPR = 633;
                break;

            case CLOCK_RATE_200KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 281;
                i2c->ICLPR = 300;
                break;

            case CLOCK_RATE_250KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 215;
                i2c->ICLPR = 233;
                break;

            case CLOCK_RATE_300KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 170;
                i2c->ICLPR = 189;
                break;

            case CLOCK_RATE_400KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 115;
                i2c->ICLPR = 133;
                break;

            case CLOCK_RATE_1MHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 27;
                i2c->ICHPR = 32;
                i2c->ICLPR = 39;
                i2c->FMPE = 1;
                break;

            default:
                /* Default clock rate is 400kHz */
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 115;
                i2c->ICLPR = 133;
                break;
            }
            break;

        default:
            /* Default clock rate is 400kHz and with fixed duty cycle */
            i2c->ICCCR2 &= ~(CDFD_MASK | HLSE_MASK | SME_MASK);
            i2c->CDF = 6;
            i2c->SCGD = 3;
            i2c->ICMPR = 0;
            i2c->ICHPR = 0;
            i2c->ICLPR = 0;
            break;
        }
        break;

    case LVTTL_BUFFER:
        switch (masterConfig->ClockType)
        {
        case FIXED_DUTY_CYCLE:
            i2c->ICCCR2 &= ~(CDFD_MASK | HLSE_MASK | SME_MASK);
            switch (masterConfig->ClockRate)
            {
            case CLOCK_RATE_50KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 44;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_100KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 20;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_200KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 9;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_250KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 7;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_300KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 5;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_400KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 3;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;

            case CLOCK_RATE_1MHZ:
                i2c->CDF = 6;
                i2c->SCGD = 3;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                i2c->FMPE = 1;
                break;

            default:
                /* Default clock rate is 400kHz */
                i2c->CDF = 6;
                i2c->SCGD = 3;
                i2c->ICMPR = 0;
                i2c->ICHPR = 0;
                i2c->ICLPR = 0;
                break;
            }
            break;

        case VARIABLE_DUTY_CYCLE:
            i2c->ICCCR2 |= (CDFD_MASK | HLSE_MASK | SME_MASK);
            i2c->FBSC = 15;
            switch (masterConfig->ClockRate)
            {
            case CLOCK_RATE_50KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 1281;
                i2c->ICLPR = 1300;
                break;

            case CLOCK_RATE_100KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 615;
                i2c->ICLPR = 633;
                break;

            case CLOCK_RATE_200KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 281;
                i2c->ICLPR = 300;
                break;

            case CLOCK_RATE_250KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 215;
                i2c->ICLPR = 233;
                break;

            case CLOCK_RATE_300KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 170;
                i2c->ICLPR = 189;
                break;

            case CLOCK_RATE_400KHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 115;
                i2c->ICLPR = 133;
                break;

            case CLOCK_RATE_1MHZ:
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 27;
                i2c->ICHPR = 32;
                i2c->ICLPR = 39;
                i2c->FMPE = 1;
                break;

            default:
                /* Default clock rate is 400kHz */
                i2c->CDF = 6;
                i2c->SCGD = 0;
                i2c->ICMPR = 28;
                i2c->ICHPR = 115;
                i2c->ICLPR = 133;
                break;
            }
            break;

        default:
            /* Default clock rate is 400kHz and with fixed duty cycle */
            i2c->ICCCR2 &= ~(CDFD_MASK | HLSE_MASK | SME_MASK);
            i2c->CDF = 6;
            i2c->SCGD = 3;
            i2c->ICMPR = 0;
            i2c->ICHPR = 0;
            i2c->ICLPR = 0;
            break;
        }
        break;

    default:
        /* Default clock rate is 400kHz and with fixed duty cycle and use OD buffer */
        i2c->ICCCR2 &= ~(CDFD_MASK | HLSE_MASK | SME_MASK);
        i2c->CDF = 6;
        i2c->SCGD = 3;
        i2c->ICMPR = 0;
        i2c->ICHPR = 0;
        i2c->ICLPR = 0;
        break;
    }
}

void I2C_masterSetSlaveAddress(I2C_t *i2c, uint8_t addr)
{
    i2c->SADD1 = addr;
}

void I2C_masterSetMode(I2C_t *i2c, I2C_MasterTransferMode_t mode)
{
    i2c->STM1 = mode;
}

void I2C_masterEnable(I2C_t *i2c)
{
    i2c->MIE = 1;
}

void I2C_masterDisable(I2C_t *i2c)
{
    i2c->MIE = 0;
}

void I2C_masterEnableInterrupt(I2C_t *i2c, uint32_t flag)
{
    i2c->ICMIER |= flag;
}

void I2C_masterDisableInterrupt(I2C_t *i2c, uint32_t flag)
{
    i2c->ICMIER &= ~flag;
}

uint32_t I2C_masterGetInterruptStatus(I2C_t *i2c)
{
    return (i2c->ICMSR & 0xff);
}

void I2C_masterClearInterruptStatus(I2C_t *i2c, uint32_t flag)
{
    i2c->ICMSR &= ~flag;
}

void I2C_masterSendMultipleByteStart(I2C_t *i2c, uint32_t data)
{
    i2c->ICTXD = data;
    i2c->ESG = 1;
}

void I2C_masterSendMultipleByteNext(I2C_t *i2c, uint32_t data)
{
    i2c->ICTXD = data;
}

void I2C_masterSendMultipleByteStop(I2C_t *i2c)
{
    i2c->FSB = 1;
}

void I2C_masterReceiveStart(I2C_t *i2c)
{
    i2c->ESG = 1;
}

uint32_t I2C_masterReceiveMultipleByteNext(I2C_t *i2c)
{
    return (i2c->ICRXD & 0xff);
}

uint32_t I2C_masterReceiveMultipleByteStop(I2C_t *i2c)
{
    i2c->FSB = 1;
    return (i2c->ICRXD & 0xff);
}

uint32_t I2C_masterReceiveMultipleByteFinish(I2C_t *i2c)
{
    return (i2c->ICRXD & 0xff);
}

void I2C_masterSetDMAContinuousTransferCount(I2C_t *i2c, uint8_t transferCount)
{
	i2c->MDMACTSZ = transferCount;
}

void I2C_masterSetDMAContinuousReceiveBlockCount(I2C_t *i2c, uint8_t blockCount)
{
	i2c->RMDMATSZ = blockCount;
}

void I2C_masterSetDMAContinuousTransmitBlockCount(I2C_t *i2c, uint8_t blockCount)
{
	i2c->TMDMATSZ = blockCount;
}

void I2C_masterEnableDMAContinuousReceive(I2C_t *i2c)
{
	i2c->RMDMACE = 1;
}

void I2C_masterDisableDMAContinuousReceive(I2C_t *i2c)
{
	i2c->RMDMACE = 0;
}

void I2C_masterEnableDMAContinuousTransmit(I2C_t *i2c)
{
	i2c->TMDMACE = 1;
}

void I2C_masterDisableDMAContinuousTransmit(I2C_t *i2c)
{
	i2c->TMDMACE = 0;
}

void I2C_masterEnableDMAReceive(I2C_t *i2c)
{
	i2c->RMDMAE = 1;
}

void I2C_masterDisableDMAReceive(I2C_t *i2c)
{
	i2c->RMDMAE = 0;
}

void I2C_masterEnableDMATransmit(I2C_t *i2c)
{
	i2c->TMDMAE = 1;
}

void I2C_masterDisableDMATransmit(I2C_t *i2c)
{
	i2c->TMDMAE = 0;
}

void I2C_masterRestart(I2C_t *i2c, uint8_t slaveAddress, I2C_MasterTransferMode_t masterTransferMode)
{
    i2c->ICMAR = (slaveAddress << 1 | masterTransferMode);
    i2c->ESG = 1;
}

bool I2C_slaveIsGeneralCall(I2C_t *i2c)
{
    return (i2c->GCAR ? true : false);
}

bool I2C_masterIsArbitrationLost(I2C_t *i2c)
{
    return (i2c->MAL ? true : false);
}

void I2C_masterDisableStartGeneration(I2C_t *i2c)
{
    i2c->ESG = 0;
}

void I2C_masterEnableStartByteTransmit(I2C_t *i2c)
{
    i2c->TSBE = 1;
}

void I2C_masterDisableStartByteTransmit(I2C_t *i2c)
{
    i2c->TSBE = 0;
}

void I2C_modelEnable(void)
{
    __asm(
        "push   {r1, r10}\n"
        "mov    r1, #0x1\n"
        "movt   r1, #0xa55a\n"
        "and    r10, r10, r1\n"
        "orr    r10, r10, r1\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "pop    {r1, r10}\n"
    );
}

void I2C_modelDisable(void)
{
    __asm(
        "push   {r10}\n"
        "mov    r10, #0x0\n"
        "movt   r10, #0xa55a\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "pop    {r10}\n"
    );
}

void I2C_modelConnect(uint32_t a, uint32_t b)
{
    __asm(
        "push   {r0, r1, r10}\n"
        "mov    r10, #0\n"
        "movt   r10, #0\n"
        "lsl    r0, r0, #12\n"
        "lsl    r1, r1, #8\n"
        "orr    r10, r10, r0\n"
        "orr    r10, r10, r1\n"
        "orr    r10, r10, 0x1\n"
        "movt   r10, #0xa55a\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "nop\n"
        "pop    {r0, r1, r10}\n"
        :
        : [a] "r" (a), [b] "r" (b)
    );
}

void I2C_configPins(void)
{
    PFC_SetMultipleBit(&PFC0_GP2->PMMR, &PFC0_GP2->MOD_SEL, BIT2 | BIT3 | BIT4 | BIT5 | BIT6 | BIT7 | BIT8 | BIT9 | BIT10 | BIT11 | BIT12 | BIT13 | BIT14 | BIT15);
}

void I2C_releasePins(void)
{
    PFC_ClearMultipleBit(&PFC0_GP2->PMMR, &PFC0_GP2->MOD_SEL, BIT2 | BIT3 | BIT4 | BIT5 | BIT6 | BIT7 | BIT8 | BIT9 | BIT10 | BIT11 | BIT12 | BIT13 | BIT14 | BIT15);
}
