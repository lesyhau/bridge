
;******************************************************************************
; ARM cores vectors table.
; 2082 - Hau Sy Le - hau.le.eb@renesas.com
;*****************************************************************************

    area    VECTORS_Vectors, code, readonly
	
    import  Synchronous_Handler
    import  SError_Handler
    import  IRQ_Handler
    import  FIQ_Handler
	import	__use_no_semihosting_swi

    ; The exception vector table
Exception_Vectors_Vectors
    b   SYNC_EXC0_Vectors   ; 0x000
    align   0x80
    b   SERR_EXC0_Vectors   ; 0x080
    align   0x80
    b   IRQ_EXC0_Vectors    ; 0x100
    align   0x80
    b   FIQ_EXC0_Vectors    ; 0x180
    align   0x80
    b   SYNC_EXCx_Vectors   ; 0x200
    align   0x80
    b   SERR_EXCx_Vectors   ; 0x280
    align   0x80
    b   IRQ_EXCx_Vectors    ; 0x300
    align   0x80
    b   FIQ_EXCx_Vectors    ; 0x380
    align   0x80
    
SYNC_EXC0_Vectors
    bl  Synchronous_Handler
    eret

SERR_EXC0_Vectors
    bl  SError_Handler
    eret

IRQ_EXC0_Vectors
    bl  IRQ_Handler
    eret

FIQ_EXC0_Vectors
    bl  FIQ_Handler
    eret

SYNC_EXCx_Vectors
    bl  Synchronous_Handler
    eret

SERR_EXCx_Vectors
    bl  SError_Handler
    eret

IRQ_EXCx_Vectors
    bl  IRQ_Handler
    eret

FIQ_EXCx_Vectors
    bl  FIQ_Handler
    eret

    end

