
    IF {CONFIG} = 64

    area    STARTUP, code, readonly, align=8
	
	import	__use_no_semihosting_swi
    import  __vectors_start
    import  __main
	
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
    ldr x0, = __vectors_start
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

    IF :DEF: __USE_DDR

    ; Copy DDR init code from external memory to SRAM
    mov     w0, #0x0
    movk    w0, #0xe730, lsl #16
    ; sar
    ldr     w1, = __ddr_init_start
    str     w1, [x0, #0x0]
    ; dar
    mov     w1, #0x0
    movk    w1, #0xe630, lsl #16
    ldr     w2, = __ddr_init_start
    add     w1, w1, w2
    str     w1, [x0, #0x4]
    ; tcr
    ldr     w1, = __ddr_init_end
    ldr     w2, = __ddr_init_start
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
    ldr w0, = 0xe6300000 + __ddr_init_start
    br  x0

__ddr_init_start
    include rel_dbsc4_init_lpddr4_4266_CL40WL18_181002_ca76.s
    ; Give the control to the C library
    ldr w0, = __main
    br  x0
__ddr_init_end

    ELSE

    ; Give the control to the C library
    b   __main

    ENDIF
    ENDIF

    end
