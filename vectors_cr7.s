
;******************************************************************************
; Startup code for ARM Cortex R7.
; 2082 - Hau Sy Le - hau.le.eb@renesas.com
;*****************************************************************************

    area    VECTORS, code, readonly
	
    import  Reset_Handler
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
FIQ_Handler_VECTORS             		; 0x1c
    ; If you want to use fast interrupt, place its service code here.
    ; Maximum code size allowed is 4kB
    b   FIQ_Handler_VECTORS
    
    end

