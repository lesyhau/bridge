
    IF :DEF: __AARCH64

    area    VECTORS, code, readonly

    import  Synchronous_Handler
    import  SError_Handler
    import  IRQ_Handler
    import  FIQ_Handler
    export  __vectors_start

__vectors_start

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

__vectors_end

    ENDIF

    end
