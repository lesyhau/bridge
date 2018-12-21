
    area    VECTORS, code, readonly

    import  Synchronous_Handler
    import  SError_Handler
    import  IRQ_Handler
    import  FIQ_Handler

vectors_start

    b   SYNC_EXC0
    align   0x80
    b   SERR_EXC0
    align   0x80
    b   IRQ_EXC0
    align   0x80
    b   FIQ_EXC0
    align   0x80
    b   SYNC_EXCx
    align   0x80
    b   SERR_EXCx
    align   0x80
    b   IRQ_EXCx
    align   0x80
    b   FIQ_EXCx
    align   0x80

SYNC_EXC0
    bl  Synchronous_Handler
    eret

SERR_EXC0
    bl  SError_Handler
    eret

IRQ_EXC0
    bl  IRQ_Handler
    eret

FIQ_EXC0
    bl  FIQ_Handler
    eret

SYNC_EXCx
    bl  Synchronous_Handler
    eret

SERR_EXCx
    bl  SError_Handler
    eret

IRQ_EXCx
    bl  IRQ_Handler
    eret

FIQ_EXCx
    bl  FIQ_Handler
    eret

vectors_end

;******************************************************************************

    area    STARTUP, code, readonly, align=8
	
	import	__use_no_semihosting_swi
    import  ddr_init_start
    import  ddr_init_end
	
    entry

Reset_Handler

    mov w0, #0x0800
    movk w0, #0xe617, lsl #16
    mov w1, #0x10
    str w1, [x0]
    dsb sy
    isb

    ; Initialize system registers
    mov w0, #0
    MSR ELR_EL1,x0
    MSR ELR_EL2,x0
    MSR ELR_EL3,x0
    MSR SPSR_EL1,x0
    MSR SPSR_EL2,x0
    MSR SPSR_EL3,x0

    ; Vector table
    ldr x0, = vectors_start
    msr VBAR_EL3, x0
    
    ; Architectural Feature Trap EL3
    mov w0, #0
    msr CPTR_EL3, x0

    ; Secure configuration
    mov w0, #0
    orr w0, w0, #(1 << 11)
    orr w0, w0, #(1 << 10)
    orr w0, w0, #(1 << 3)
    orr w0, w0, #(1 << 2)
    orr w0, w0, #(1 << 1)
    msr SCR_EL3, x0

    ; Interrupt mask bits
    mov w0, #0
    msr DAIF, x0

    IF EXECUTE_LOCATION = "DDR"

    ; Copy DDR init code from external memory to SRAM
    mov     w0, #0x0
    movk    w0, #0xe730, lsl #16
    ; sar
    ldr     w1, = ddr_init_start
    str     w1, [x0, #0x0]
    ; dar
    mov     w1, #0x0
    movk    w1, #0xe630, lsl #16
    ldr     w2, = ddr_init_start
    add     w1, w1, w2
    str     w1, [x0, #0x4]
    ; tcr
    ldr     w1, = ddr_init_end
    ldr     w2, = ddr_init_start
    sub     w1, w1, w2
    lsr     w1, w1, #6
    add     w1, w1, #1
    str     w1, [x0, #0x8]
    ; chcr
    mov     w1, #0x5409
    movk    w1, #0x0010, lsl #16
    str     w1, [x0, #0xc]
    ; dmaor
    mov     w0, #0x0
    movk    w0, #0xe735, lsl #16
    mov     w1, #0x1
    str     w1, [x0, #0x60]
    ; wait for TE
    mov     w0, #0
    movk    w0, #0xe730, lsl #16
wait_TE
    ldr     w3, [x0, #0x8]  ; Check TCR for tarmac log debug only
    ldr     w1, [x0, #0xc]
    mov     w2, #0x2
    and     w1, w1, w2
    cmp     w1, w2
    bne     wait_TE
    ; clear TE, DE
    mov     w2, #0x3
    mvn     w2, w2
    and     w1, w1, w2
    str     w1, [x0, #0xc]
    ; clear dmaor
    mov     w0, #0x0
    movk    w0, #0xe735, lsl #16
    mov     w1, #0x0
    str     w1, [x0, #0x60]

    ; Jump to DDR init code in SRAM
    ldr w0, {pc}+8
    br  x0
    dcd 0xe6300000 + ddr_init_start

    ELSE

    ; Jump to C library main function
    b   __main

    ENDIF

    end

