
    IF :DEF: __AARCH32

    area    VECTORS, code, readonly
	
    import  Reset_Handler
    import  UndefinedInstruction_Handler
    import  SupervisorCall_Handler
    import  PrefetchAbort_Handler
    import  DataAbort_Handler
    import  IRQ_Handler
	import	__use_no_semihosting_swi
    import  __mpu_init
    import  __main
    export  __vectors_start

    entry

__vectors_start

    b   Reset_Handler   ; 0x00
    b   UDF_EXC_VECTORS ; 0x04
    b   SVC_EXC_VECTORS ; 0x08
    b   PAB_EXC_VECTORS ; 0x0c
    b   DAB_EXC_VECTORS ; 0x10
    nop                 ; 0x14
    b   IRQ_EXC_VECTORS ; 0x18
FIQ_EXC_VECTORS         ; 0x1c
    ; If you want to use fast interrupt, place its service code here.
    ; Maximum code size allowed is 4kB
    b   FIQ_EXC_VECTORS
    
UDF_EXC_VECTORS
    push    {r0-r3,r10-r12,lr}
    bl  UndefinedInstruction_Handler
    pop {r0-r3,r10-r12,lr}
    eret

SVC_EXC_VECTORS
    push    {r0-r3,r10-r12,lr}
    bl  SupervisorCall_Handler
    pop {r0-r3,r10-r12,lr}
    eret

PAB_EXC_VECTORS
    push    {r0-r3,r10-r12,lr}
    bl  PrefetchAbort_Handler
    pop {r0-r3,r10-r12,lr}
    eret

DAB_EXC_VECTORS
    push    {r0-r3,r10-r12,lr}
    bl  DataAbort_Handler
    pop {r0-r3,r10-r12,lr}
    eret

IRQ_EXC_VECTORS
    push    {r0-r3,r10-r12,lr}
    bl  IRQ_Handler
    pop {r0-r3,r10-r12,lr}
    eret

vectors_end

    ENDIF

    end

