
	INCLUDE	../00_include/i2c0.s
	INCLUDE	../00_include/i2c1.s
	INCLUDE	../00_include/i2c2.s
	INCLUDE	../00_include/i2c3.s
	INCLUDE	../00_include/i2c4.s
	INCLUDE	../00_include/i2c5.s
	INCLUDE	../00_include/i2c6.s
	INCLUDE	../00_include/macro.s
    include gic.s

INTID   equ 0x10e
;INTID   equ 0x10f
;INTID   equ 0x110
;INTID   equ 0x111
;INTID   equ 0x112
;INTID   equ 0x113
;INTID   equ 0x114

I2C_MODEL_CTRL  equ 0xa55a0101

    area    VECTORS, code, readonly
    entry

;******************************************************************************

vector_start

    ldr pc, Reset_Addr				; 0x00
    ldr pc, Undefined_Addr			; 0x04
    ldr pc, SupervisorCall_Addr		; 0x08
    ldr pc, PrefetchAbort_Addr		; 0x0c
    ldr pc, DataAbort_Addr			; 0x10
    nop                 			; 0x14
    ldr pc, IRQ_Addr				; 0x18
FIQ_Addr             				; 0x1c
    b   FIQ_Addr

Reset_Addr			dcd Reset_Handler               
Undefined_Addr		dcd UndefinedInstruction_Handler
SupervisorCall_Addr	dcd SupervisorCall_Handler      
PrefetchAbort_Addr	dcd PrefetchAbort_Handler        
DataAbort_Addr		dcd DataAbort_Handler           
IRQ_Addr			dcd IRQ_Handler                 

vector_end

;******************************************************************************

Reset_Handler               

    ; Initialize MPU
    include mpu_init.s

    ; Only for DN3
    include dbsc_init.s

    ; Copy vector table from external memory into SRAM
    ldr r0, = vector_start  ; Start
    ldr r1, = vector_end    ; End
    sub r1, r1, r0          ; Length
    ldr r2, = 0xe6300000    ; Destination = 0xe6300000
vector_copy
    ldmia   r0!, {r4-r7}
    stmia   r2!, {r4-r7}
    subs    r1, r1, #0x10
    bhi     vector_copy

    ; Copy exception handler from external memory into SRAM
    ldr r0, = exc_start     ; Start
    ldr r1, = exc_end       ; End
    sub r1, r1, r0          ; Length
    ldr r2, = 0xe6300000
    add r2, r2, r0          ; Destination = 0xe6300000 + exc_start
exc_copy
    ldmia   r0!, {r4-r7}
    stmia   r2!, {r4-r7}
    subs    r1, r1, #0x10
    bhi     exc_copy

    ; Copy main from external memory into SRAM
    ldr r0, = main_start    ; Start
    ldr r1, = main_end      ; End
    sub r1, r1, r0          ; Length
    ldr r2, = 0xe6300000
    add r2, r2, r0          ; Destination = 0xe6300000 + main_start
    mov r3, r2
main_copy
    ldmia   r0!, {r4-r7}
    stmia   r2!, {r4-r7}
    subs    r1, r1, #0x10
    bhi     main_copy

    ; Jump to main in SRAM
    mov     pc, r3  ; current r3 = 0xe6300000 + main_start

;******************************************************************************

main_start

    b   start_ltorg
    ltorg
start_ltorg

    ; Enable CR52_BAREN
    ;ldr r10, = 0xcafecafe
    mov     r0, #0x0334
    movt    r0, #0xe617
    mov     r1, #0
    movt    r1, #0xe630
    str r1, [r0]
    orr r1, r1, #0x10
    str r1, [r0]

    CPSIE   i
    GIC_SETTING_CR52 INTID
;    GIC_SETTING_CR52 0x10f
;    GIC_SETTING_CR52 0x110
;    GIC_SETTING_CR52 0x111
;    GIC_SETTING_CR52 0x112
;    GIC_SETTING_CR52 0x113
;    GIC_SETTING_CR52 0x114

    ; Begining address of dump area
    ldr r7, = 0x04000000

    ; Configure LSI pins
    ldr r1, = 0x0000fffc
    mvn r2, r1
    ldr r0, = 0xe6050800    ; PMMR_GP2
    str r2, [r0]
    ldr r0, = 0xe6050900    ; MOD_SEL_GP2
    str r1, [r0]
    ldr r10, = I2C_MODEL_CTRL

    ; Configure I2C0 as master device in TX mode
    str32   I2C0_ICCCR, 0x0000001E  ; SCGD = 3, CDF = 6
    str32   I2C0_ICMAR, 0x00000012  ; Slave address = 0x11
    str32   I2C0_ICMSR, 0x00000000
    str32   I2C0_ICCCR, 0x0000001E  ; SCGD = 3, CDF = 6; f = 400kHz
    str32   I2C0_ICMIER, (0x1 << 6) ; MNRE

    ; Configure I2C1 as slave device in RX mode
    str32   I2C1_ICSAR, 0x00000001  ; Slave address = 0x01
    str32   I2C1_ICSCR, 0x00000006  ; SCSS, SDBS
    str32   I2C1_ICSSR, 0x00000000
    str32   I2C1_ICCCR, 0x0000001E  ; SCGD = 3, CDF = 6; f = 400kHz

    ; Master send START condition and slave address
    str32   I2C0_ICMCR, 0x00000089  ; MDBS, MIE, ESG

    ; Wait for MNR
    ; Master received ACK so slave address has been transmitted
    ; wait32  I2C0_ICMSR, 0x00000040
    ; clrb    I2C0_ICMSR, #0

    mov r8, #0
    mov r9, #1
wait_int
    cmp r8, r9
    bne wait_int

    ; Configure LSI pins
    ldr r10, = 0xa55a0000
    ldr r1, = 0x0000fffc
    mvn r1, r1
    mvn r2, r1
    ldr r0, = 0xe6050800    ; PMMR_GP2
    str r2, [r0]
    ldr r0, = 0xe6050900    ; MOD_SEL_GP2
    str r1, [r0]

    delay   10

    ; Dump interrupt ACK ID
    str r4, [r7]
    add r7, r7, #4

    ldr r4, = 0x12345678
    str r4, [r7]
    add r7, r7, #4

    delay   10

    ; Stop the simulation
    ldr r0, = 0x070003F0
    str r0, [r0]

    ; Infinity loop
inf_loop
    b   inf_loop

    b   main_ltorg
    ltorg
main_ltorg

main_end

;******************************************************************************

exc_start

UndefinedInstruction_Handler
    b   UndefinedInstruction_Handler
    eret

SupervisorCall_Handler      
    b   SupervisorCall_Handler
    eret

PrefetchAbort_Handler        
    b   PrefetchAbort_Handler
    eret

DataAbort_Handler           
    b   DataAbort_Handler
    eret

IRQ_Handler                 
    
	; Read ACK ID
	MRC p15,0,r0,c12,c12,0

    ; Check if it's I2C interrupt
    ldr r1, = INTID
    cmp r1, r0
    bne end_irq

    ; Copy ACK ID into r4
    mov r4, r0

end_irq
    
    ; Store ACK ID into EOIR
	MCR p15,0,r0,c12,c12,1

    mov r8, #1

    eret

    b   exc_ltorg
    ltorg
exc_ltorg

    nop

exc_end

;******************************************************************************

    end

