
	INCLUDE	../00_include/i2c0.s
	INCLUDE	../00_include/i2c1.s
	INCLUDE	../00_include/i2c2.s
	INCLUDE	../00_include/i2c3.s
	INCLUDE	../00_include/i2c4.s
	INCLUDE	../00_include/i2c5.s
	INCLUDE	../00_include/i2c6.s
	INCLUDE	../00_include/macro.s
    include ../00_include/cpg.s
    ;include ../00_include/pfc.s

    ; Main
    area    main, code, readonly
    entry

    ; Begining address of dump area
    ldr r7, = 0x00010000

    ; Disable I2C bus
    ldr r10, = 0x5aa55aa5

    ; Configure LSI pins
    include ../00_include/i2c0_PFC_setting_arm.src
    include ../00_include/i2c1_PFC_setting_arm.src

    ; Delay for a while
    delay   2

    ; Enable I2C bus
    ldr r10, = 0

    ; Configure I2C1 as slave device in RX mode
    str32   I2C1_ICSAR, 0x00000001
    str32   I2C1_ICSCR, 0x00000006  ; SCSS, SDBS
    str32   I2C1_ICSSR, 0x00000000
    str32   I2C1_ICCCR, 0x0000001E  ; SCGD = 3, CDF = 6; f = 400kHz

    ; Configure I2C0 as master device in TX mode
    str32   I2C0_ICCCR, 0x0000001E  ; SCGD = 3, CDF = 6
    str32   I2C0_ICMAR, 0x00000002
    str32   I2C0_ICMSR, 0x00000000
    str32   I2C0_ICCCR, 0x0000001E  ; SCGD = 3, CDF = 6; f = 400kHz

    ; Set the 1st data byte to send
    str32   I2C0_ICxXD, 0x000000AA

    ; Master send START condition and slave address
    str32   I2C0_ICMCR, 0x00000089  ; MDBS, MIE, ESG

    ; Wait for SAR
    ; Slave received address so return ACK
    wait32  I2C1_ICSSR, 0x00000001
    clrb    I2C1_ICSSR, #0

    ; Wait for MAT
    ; Master received ACK so slave address has been transmitted
    wait32  I2C0_ICMSR, 0x00000001
    clrb    I2C0_ICMSR, #0

    ; Master send the 1st data byte
    str32   I2C0_ICMCR, 0x00000088  ; MDBS, MIE

    ; Wait for MDE
    ; Master data buffer become empty so set 2nd data byte to send
    wait32  I2C0_ICMSR, 0x00000008
    clrb    I2C0_ICMSR, #3
    str32   I2C0_ICxXD, 0x00000055

    ; Wait for SDR
    ; Slave received the 1st data byte, so return ACK and dump out the 1st received data byte
    wait32  I2C1_ICSSR, 0x00000002
    clrb    I2C1_ICSSR, #1
    dump32  I2C1_ICxXD

    ; Slave will return a NACK after received the next data byte
    str32   I2C1_ICSCR, 0x00000007

    ; Wait for MDT
    ; Master received ACK from slave, so the 1st data byte has been transmitted
    wait32  I2C0_ICMSR, 0x00000004
    clrb    I2C0_ICMSR, #2

    ; Wait for MDE
    ; Master data buffer become empty
    wait32  I2C0_ICMSR, 0x00000008
    clrb    I2C0_ICMSR, #3

    ; Wait for SDR
    ; Slave received the 2nd data byte, so return NACK and dump out the received data byte
    wait32  I2C1_ICSSR, 0x00000002
    clrb    I2C1_ICSSR, #1
    ;dump32  I2C1_ICxXD

    ; Wait for MDT
    ; Master received NACK from slave, so the 2nd data byte has been transmitted
    wait32  I2C0_ICMSR, 0x00000004
    clrb    I2C0_ICMSR, #1

    ; Wait for MDE
    ; Master data buffer become empty
    wait32  I2C0_ICMSR, 0x00000008
    clrb    I2C0_ICMSR, #3

    ; Wait for MNR
    ; Master received NACK then it issues a STOP condition
    wait32  I2C0_ICMSR, 0x00000040
    clrb    I2C0_ICMSR, #6

    ; Wait for SST
    ; Slave received STOP condition
    wait32  I2C1_ICSSR, 0x00000010
    clrb    I2C1_ICSSR, #4
    dump32  I2C1_ICxXD

    ; Delay before stop the simulation
    delay   10

    ; Stop the simulation
    ldr r0, = 0x070003F0
    str r0, [r0]

    ; Infinity loop
inf_loop
    b   inf_loop

    nop
    nop
    nop
    nop
    nop

    end

