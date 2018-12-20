
;******************************************************************************
; Startup code for ARM Cortex R7.
; 2082 - Hau Sy Le - hau.le.eb@renesas.com
;*****************************************************************************

    area    STARTUP, code, readonly
	
	import	__use_no_semihosting_swi
    import  __mpu_init
    import  __main
    import  UndefinedInstruction_Handler
    import  SupervisorCall_Handler
    import  PrefetchAbort_Handler
    import  DataAbort_Handler
    import  IRQ_Handler
	
    entry

    b   Reset_Handler                   ; 0x00
    b   UndefinedInstruction_Handler    ; 0x04
    b   SupervisorCall_Handler          ; 0x08
    b   PrefetchAbort_Handler           ; 0x0c
    b   DataAbort_Handler               ; 0x10
    nop                 			    ; 0x14
    b   IRQ_Handler				        ; 0x18
FIQ_Handler             				    ; 0x1c
    ; If you want to use fast interrupt, place its service code here.
    ; Maximum code size allowed is 4kB
    b   FIQ_Handler
    
Reset_Handler

    ; Initialize MPU
    bl  __mpu_init

    ; 1. Set the CPACR for access to CP10 and CP11 (the FPU coprocessors)
    mov     r0, #((0xf << 20) :and: 0xffff)
    movt    r0, #((0xf << 20) >> 16)
    mcr p15, 0, r0, c1, c0, 2
    
    ; 2. Set the FPEXC EN bit to enable the FPU
    mov r3, #0x40000000
    vmsr FPEXC, r3

    ; Jump to C library main function
    b       __main

    end

