
    area    STARTUP, code, readonly
	
    export  Reset_Handler
    import  UndefinedInstruction_Handler
    import  SupervisorCall_Handler
    import  PrefetchAbort_Handler
    import  DataAbort_Handler
    import  IRQ_Handler
	import	__use_no_semihosting_swi
    import  __mpu_init
    import  __main
    import  ddr_init_start
    import  ddr_init_end
    import  vectors_start
	
    entry

    b   Reset_Handler   ; 0x00
    b   UDF_EXC     ; 0x04
    b   SVC_EXC     ; 0x08
    b   PAB_EXC     ; 0x0c
    b   DAB_EXC     ; 0x10
    nop             ; 0x14
    b   IRQ_EXC	    ; 0x18
FIQ_EXC             ; 0x1c
    ; If you want to use fast interrupt, place its service code here.
    ; Maximum code size allowed is 4kB
    b   FIQ_EXC
    
UDF_EXC
    push    {r0-r3,r10-r12,lr}
    bl  UndefinedInstruction_Handler
    pop {r0-r3,r10-r12,lr}
    eret

SVC_EXC
    push    {r0-r3,r10-r12,lr}
    bl  SupervisorCall_Handler
    pop {r0-r3,r10-r12,lr}
    eret

PAB_EXC
    push    {r0-r3,r10-r12,lr}
    bl  PrefetchAbort_Handler
    pop {r0-r3,r10-r12,lr}
    eret

DAB_EXC
    push    {r0-r3,r10-r12,lr}
    bl  DataAbort_Handler
    pop {r0-r3,r10-r12,lr}
    eret

IRQ_EXC
    push    {r0-r3,r10-r12,lr}
    bl  IRQ_Handler
    pop {r0-r3,r10-r12,lr}
    eret

Reset_Handler

    ; Initialize MPU
    bl  __mpu_init

    ; Set the CPACR for access to CP10 and CP11 (the FPU coprocessors)
    ldr r0, = (0xF << 20)
    mcr p15, 0, r0, c1, c0, 2
    ; Set the FPEXC EN bit to enable the FPU
    mov  r3, #0x0
    movt r3, #0x4000
    vmsr FPEXC, r3

    ; Change vector base address
    ldr r0, = vectors_start
    mcr p15, 4, r0, c12, c0, 0
    mcr p15, 0, r0, c12, c0, 0

    IF EXECUTE_LOCATION = "DDR"

    ; Copy DDR init code from external memory to SRAM
    mov     r0, #0x0
    movt    r0, #0xe730
    ; sar
    ldr     r1, = ddr_init_start
    str     r1, [r0, #0x0]
    ; dar
    mov     r1, #0x0
    movt    r1, #0xe630
    ldr     r2, = ddr_init_start
    add     r1, r1, r2
    str     r1, [r0, #0x4]
    ; tcr
    ldr     r1, = ddr_init_end
    ldr     r2, = ddr_init_start
    sub     r1, r1, r2
    lsr     r1, r1, #6
    add     r1, r1, #1
    str     r1, [r0, #0x8]
    ; chcr
    mov     r1, #0x5409
    movt    r1, #0x0010
    str     r1, [r0, #0xc]
    ; dmaor
    mov     r0, #0x0
    movt    r0, #0xe735
    mov     r1, #0x1
    str     r1, [r0, #0x60]
    ; wait for TE
    mov     r0, #0
    movt    r0, #0xe730
wait_TE
    ldr     r3, [r0, #0x8]  ; Check TCR for tarmac log debug only
    ldr     r1, [r0, #0xc]
    mov     r2, #0x2
    and     r1, r1, r2
    cmp     r1, r2
    bne     wait_TE
    ; clear TE, DE
    mov     r2, #0x3
    mvn     r2, r2
    and     r1, r1, r2
    str     r1, [r0, #0xc]
    ; clear dmaor
    mov     r0, #0x0
    movt    r0, #0xe735
    mov     r1, #0x0
    str     r1, [r0, #0x60]

    ; Jump to DDR init code in SRAM
    ldr r0, {pc}+8
    mov pc, r0
    dcd 0xe6300000 + ddr_init_start

    ELSE

    ; Jump to C library main function
    b   __main

    ENDIF

    end

