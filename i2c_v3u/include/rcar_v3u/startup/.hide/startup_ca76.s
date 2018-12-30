
    IF :DEF: __AARCH64

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
    ; Initialize DDR
    import  __ddr_init
    bl      __ddr_init
    ENDIF

    ; Give the control to the C library
    b   __main

    ENDIF

    end
