        ARM
        REQUIRE8
        PRESERVE8

        AREA ER00, CODE, READONLY, ALIGN=2

        LDR      pc,|L1.32|
        LDR      pc,|L1.36|
        LDR      pc,|L1.40|
        LDR      pc,|L1.44|
        LDR      pc,|L1.48|
        NOP      
        LDR      pc,|L1.52|
|L1.28|
        B        |L1.28|
|L1.32|
        DCD      0x00000038
|L1.36|
        DCD      0x0000003c
|L1.40|
        DCD      0x00000044
|L1.44|
        DCD      0x0000004c
|L1.48|
        DCD      0x00000054
|L1.52|
        DCD      0x0000005c
RST_EXC                  ; Alternate entry point
        B        |L1.100|
UDF_EXC                  ; Alternate entry point
        BL       |L1.5032|
        ERET     
SVC_EXC                  ; Alternate entry point
        BL       |L1.5040|
        ERET     
PAB_EXC                  ; Alternate entry point
        BL       |L1.5048|
        ERET     
DAB_EXC                  ; Alternate entry point
        BL       |L1.5056|
        ERET     
IRQ_EXC                  ; Alternate entry point
        BL       |L1.5064|
        ERET     
Reset_Handler                  ; Alternate entry point
|L1.100|
        BL       |L1.4564|
        MOV      r0,#0xf00000
        MCR      p15,#0x0,r0,c1,c0,#2
        MOV      r3,#0
        MOVT     r3,#0x4000
        VMSR     FPEXC,r3
        LDR      r0,|L1.300|
        MCR      p15,#0x4,r0,c12,c0,#0
        MCR      p15,#0x0,r0,c12,c0,#0
        MOV      r0,#0
        MOVT     r0,#0xe730
        LDR      r1,|L1.304|
        STR      r1,[r0,#0]
        MOV      r1,#0
        MOVT     r1,#0xe630
        LDR      r2,|L1.304|
        ADD      r1,r1,r2
        STR      r1,[r0,#4]
        LDR      r1,|L1.308|
        LDR      r2,|L1.304|
        SUB      r1,r1,r2
        LSR      r1,r1,#6
        ADD      r1,r1,#1
        STR      r1,[r0,#8]
        MOV      r1,#0x5409
        MOVT     r1,#0x10
        STR      r1,[r0,#0xc]
        MOV      r0,#0
        MOVT     r0,#0xe735
        MOV      r1,#1
        STR      r1,[r0,#0x60]
        MOV      r0,#0
        MOVT     r0,#0xe730
|L1.232|
        LDR      r3,[r0,#8]
        LDR      r1,[r0,#0xc]
        MOV      r2,#2
        AND      r1,r1,r2
        CMP      r1,r2
        BNE      |L1.232|
        MOV      r2,#3
        MVN      r2,r2
        AND      r1,r1,r2
        STR      r1,[r0,#0xc]
        MOV      r0,#0
        MOVT     r0,#0xe735
        MOV      r1,#0
        STR      r1,[r0,#0x60]
        LDR      r0,|L1.296|
        MOV      pc,r0
|L1.296|
        DCD      0xe63001a8
|L1.300|
        DCD      0x40000000
|L1.304|
        DCD      0x000001a8
|L1.308|
        DCD      0x000011d4
__main PROC
        BL       |L1.320|
        BL       |L1.5072|
        ENDP

__scatterload                  ; Alternate entry point
__scatterload_rt2 PROC
|L1.320|
        ADR      r0,|L1.372|
        LDM      r0,{r10,r11}
        ADD      r10,r10,r0
        ADD      r11,r11,r0
        SUB      r7,r10,#1
__scatterload_null                  ; Alternate entry point
|L1.340|
        CMP      r10,r11
        BNE      |L1.352|
        BL       |L1.5072|
|L1.352|
        ADR      lr,|L1.340|
        LDM      r10!,{r0-r3}
        TST      r3,#1
        SUBNE    pc,r7,r3
        BX       r3
        ENDP

|L1.372|
        DCD      0x00001264
        DCD      0x00001274
__scatterload_zeroinit PROC
        MOVS     r3,#0
        MOVS     r4,#0
        MOVS     r5,#0
        MOVS     r6,#0
|L1.396|
        SUBS     r2,r2,#0x10
        STMCS    r1!,{r3-r6}
        BHI      |L1.396|
        LSLS     r2,r2,#29
        STMCS    r1!,{r4,r5}
        STRMI    r3,[r1,#0]
        BX       lr
        ENDP

ddr_init_start                  ; Alternate entry point
        LDR      r0,|L1.3532|
        LDR      r1,[r0,#0]
        BIC      r1,r1,#0x18
        MVN      r2,r1
        LDR      r0,|L1.3536|
        STR      r2,[r0,#0]
        LDR      r0,|L1.3540|
        STR      r1,[r0,#0]
        LDR      r0,|L1.3532|
        LDR      r1,[r0,#0]
        MOV      r0,#0x10
|L1.468|
        SUB      r0,r0,#1
        CMP      r0,#0
        BNE      |L1.468|
        B        |L1.536|
        NOP      
        MOV      r4,#0x3fff
        AND      r1,r1,r4
        STR      r1,[r2,#0]
        STR      r0,[r3,#0]
|L1.504|
        LDR      r0,[r2,#0]
        MOV      r4,#0x8000
        AND      r0,r0,r4
        CMP      r0,r4
        BNE      |L1.504|
        ORR      r1,r1,r4
        STR      r1,[r2,#0]
        BX       lr
|L1.536|
        MOV      r0,#0x1234
        LDR      r1,|L1.3544|
        STR      r0,[r1,#0]
        MOV      r0,#0x1234
        LDR      r1,|L1.3548|
        STR      r0,[r1,#0]
        MOV      r0,#0xa
        LDR      r1,|L1.3552|
        STR      r0,[r1,#0]
        MOV      r0,#0xa
        LDR      r1,|L1.3556|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3564|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3568|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3572|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3576|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3580|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3584|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3588|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3592|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3596|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3600|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3604|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3608|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3612|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3616|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3620|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.3624|
        STR      r0,[r1,#0]
        MOV      r0,#0
        LDR      r1,|L1.3628|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.3632|
        STR      r0,[r1,#0]
        MOV      r0,#0x28
        LDR      r1,|L1.3636|
        STR      r0,[r1,#0]
        MOV      r0,#0x12
        LDR      r1,|L1.3640|
        STR      r0,[r1,#0]
        MOV      r0,#0x27
        LDR      r1,|L1.3644|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3648|
        LDR      r1,|L1.3652|
        STR      r0,[r1,#0]
        MOV      r0,#0x87
        LDR      r1,|L1.3656|
        STR      r0,[r1,#0]
        MOV      r0,#0x5a
        LDR      r1,|L1.3660|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3664|
        LDR      r1,|L1.3668|
        STR      r0,[r1,#0]
        MOV      r0,#0x40
        LDR      r1,|L1.3672|
        STR      r0,[r1,#0]
        MOV      r0,#0x10
        LDR      r1,|L1.3676|
        STR      r0,[r1,#0]
        MOV      r0,#0x29
        LDR      r1,|L1.3680|
        STR      r0,[r1,#0]
        MOV      r0,#0x29
        LDR      r1,|L1.3684|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3688|
        LDR      r1,|L1.3692|
        STR      r0,[r1,#0]
        MOVW     r0,#0x116
        LDR      r1,|L1.3696|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3700|
        LDR      r1,|L1.3704|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3708|
        LDR      r1,|L1.3712|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3716|
        LDR      r1,|L1.3720|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3724|
        LDR      r1,|L1.3728|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3732|
        LDR      r1,|L1.3736|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3740|
        LDR      r1,|L1.3744|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3748|
        LDR      r1,|L1.3752|
        STR      r0,[r1,#0]
        MOV      r0,#3
        LDR      r1,|L1.3756|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.3760|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.3764|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.3768|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.3772|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.3776|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.3780|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3784|
        LDR      r1,|L1.3788|
        STR      r0,[r1,#0]
        MOV      r0,#0x1c4
        LDR      r1,|L1.3792|
        STR      r0,[r1,#0]
        MOV      r0,#3
        LDR      r1,|L1.3796|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3800|
        LDR      r1,|L1.3804|
        STR      r0,[r1,#0]
        MOV      r0,#0x1010
        LDR      r1,|L1.3808|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.3812|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3816|
        LDR      r1,|L1.3820|
        STR      r0,[r1,#0]
        MOV      r0,#0x1834
        LDR      r1,|L1.3824|
        STR      r0,[r1,#0]
        MVN      r0,#0
        LDR      r1,|L1.3828|
        STR      r0,[r1,#0]
        MOV      r0,#0x480
        LDR      r1,|L1.3832|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.3836|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.3840|
        STR      r0,[r1,#0]
        MOV      r0,#0x600
        LDR      r1,|L1.3844|
        STR      r0,[r1,#0]
        MOV      r0,#0x480
        LDR      r1,|L1.3848|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.3852|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.3856|
        STR      r0,[r1,#0]
        MOV      r0,#0x400
        LDR      r1,|L1.3860|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.3864|
        STR      r0,[r1,#0]
        MOV      r0,#0x200
        LDR      r1,|L1.3868|
        STR      r0,[r1,#0]
        MOV      r0,#0x100
        LDR      r1,|L1.3872|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.3876|
        STR      r0,[r1,#0]
        MOV      r0,#0x240
        LDR      r1,|L1.3880|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.3884|
        STR      r0,[r1,#0]
        MOV      r0,#0xc0
        LDR      r1,|L1.3888|
        STR      r0,[r1,#0]
        MOV      r0,#0x200
        LDR      r1,|L1.3892|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.3896|
        STR      r0,[r1,#0]
        MOV      r0,#0x100
        LDR      r1,|L1.3900|
        STR      r0,[r1,#0]
        MOV      r0,#0x80
        LDR      r1,|L1.3904|
        STR      r0,[r1,#0]
        MOV      r0,#0x100
        LDR      r1,|L1.3908|
        STR      r0,[r1,#0]
        MOV      r0,#0xc0
        LDR      r1,|L1.3912|
        STR      r0,[r1,#0]
        MOV      r0,#0x80
        LDR      r1,|L1.3916|
        STR      r0,[r1,#0]
        MOV      r0,#0x40
        LDR      r1,|L1.3920|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3924|
        LDR      r1,|L1.3928|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3932|
        LDR      r1,|L1.3936|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3940|
        LDR      r1,|L1.3944|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.3948|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.3952|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.3956|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.3960|
        STR      r0,[r1,#0]
        MOV      r0,#0x41
        LDR      r1,|L1.3964|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.3968|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.3972|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.3976|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.3980|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.3984|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.3988|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.3992|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.3996|
        STR      r0,[r1,#0]
        MOV      r6,#1
|L1.1704|
        LDR      r0,|L1.4000|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.1704|
        LDR      r0,|L1.4004|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.1704|
        LDR      r0,|L1.4008|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.1704|
        LDR      r0,|L1.4012|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.1704|
        LDR      r0,|L1.3948|
        LDR      r0,|L1.4016|
        LDR      r1,|L1.4020|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4024|
        LDR      r1,|L1.4020|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4028|
        LDR      r1,|L1.4020|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4032|
        LDR      r1,|L1.4020|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4036|
        LDR      r1,|L1.4020|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4040|
        LDR      r1,|L1.4020|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4044|
        LDR      r1,|L1.4020|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4048|
        LDR      r1,|L1.4020|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4052|
        LDR      r1,|L1.4056|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4060|
        LDR      r1,|L1.4064|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4068|
        LDR      r1,|L1.4072|
        STR      r0,[r1,#0]
        MOV      r0,#0x10000
        LDR      r1,|L1.4076|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4080|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.4084|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.4088|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.4092|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.4096|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4100|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4104|
        STR      r0,[r1,#0]
        MOV      r0,#0
        LDR      r1,|L1.4108|
        STR      r0,[r1,#0]
        MOV      r0,#0x1234
        LDR      r1,|L1.4112|
        STR      r0,[r1,#0]
        MOV      r0,#0x1234
        LDR      r1,|L1.4116|
        STR      r0,[r1,#0]
        MOV      r0,#0xa
        LDR      r1,|L1.4120|
        STR      r0,[r1,#0]
        MOV      r0,#0xa
        LDR      r1,|L1.4124|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4128|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4132|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4136|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4140|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4144|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4148|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4152|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4156|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4160|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4164|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4168|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4172|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4176|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4180|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4184|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3560|
        LDR      r1,|L1.4188|
        STR      r0,[r1,#0]
        MOV      r0,#0
        LDR      r1,|L1.4192|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4196|
        STR      r0,[r1,#0]
        MOV      r0,#0x28
        LDR      r1,|L1.4200|
        STR      r0,[r1,#0]
        MOV      r0,#0x12
        LDR      r1,|L1.4204|
        STR      r0,[r1,#0]
        MOV      r0,#0x27
        LDR      r1,|L1.4208|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3648|
        LDR      r1,|L1.4212|
        STR      r0,[r1,#0]
        MOV      r0,#0x87
        LDR      r1,|L1.4216|
        STR      r0,[r1,#0]
        MOV      r0,#0x5a
        LDR      r1,|L1.4220|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3664|
        LDR      r1,|L1.4224|
        STR      r0,[r1,#0]
        MOV      r0,#0x40
        LDR      r1,|L1.4228|
        STR      r0,[r1,#0]
        MOV      r0,#0x10
        LDR      r1,|L1.4232|
        STR      r0,[r1,#0]
        MOV      r0,#0x29
        LDR      r1,|L1.4236|
        STR      r0,[r1,#0]
        MOV      r0,#0x29
        LDR      r1,|L1.4240|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3688|
        LDR      r1,|L1.4244|
        STR      r0,[r1,#0]
        MOVW     r0,#0x116
        LDR      r1,|L1.4248|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3700|
        LDR      r1,|L1.4252|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3708|
        LDR      r1,|L1.4256|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3716|
        LDR      r1,|L1.4260|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3724|
        LDR      r1,|L1.4264|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3732|
        LDR      r1,|L1.4268|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3740|
        LDR      r1,|L1.4272|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3748|
        LDR      r1,|L1.4276|
        STR      r0,[r1,#0]
        MOV      r0,#3
        LDR      r1,|L1.4280|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.4284|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.4288|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.4292|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.4296|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.4300|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.4304|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3784|
        LDR      r1,|L1.4308|
        STR      r0,[r1,#0]
        MOV      r0,#0x1c4
        LDR      r1,|L1.4312|
        STR      r0,[r1,#0]
        MOV      r0,#3
        LDR      r1,|L1.4316|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3800|
        LDR      r1,|L1.4320|
        STR      r0,[r1,#0]
        MOV      r0,#0x1010
        LDR      r1,|L1.4324|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4328|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3816|
        LDR      r1,|L1.4332|
        STR      r0,[r1,#0]
        MOV      r0,#0x1834
        LDR      r1,|L1.4336|
        STR      r0,[r1,#0]
        MVN      r0,#0
        LDR      r1,|L1.4340|
        STR      r0,[r1,#0]
        MOV      r0,#0x480
        LDR      r1,|L1.4344|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.4348|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.4352|
        STR      r0,[r1,#0]
        MOV      r0,#0x600
        LDR      r1,|L1.4356|
        STR      r0,[r1,#0]
        MOV      r0,#0x480
        LDR      r1,|L1.4360|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.4364|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.4368|
        STR      r0,[r1,#0]
        MOV      r0,#0x400
        LDR      r1,|L1.4372|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.4376|
        STR      r0,[r1,#0]
        MOV      r0,#0x200
        LDR      r1,|L1.4380|
        STR      r0,[r1,#0]
        MOV      r0,#0x100
        LDR      r1,|L1.4384|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.4388|
        STR      r0,[r1,#0]
        MOV      r0,#0x240
        LDR      r1,|L1.4392|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.4396|
        STR      r0,[r1,#0]
        MOV      r0,#0xc0
        LDR      r1,|L1.4400|
        STR      r0,[r1,#0]
        MOV      r0,#0x200
        LDR      r1,|L1.4404|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.4408|
        STR      r0,[r1,#0]
        MOV      r0,#0x100
        LDR      r1,|L1.4412|
        STR      r0,[r1,#0]
        MOV      r0,#0x80
        LDR      r1,|L1.4416|
        STR      r0,[r1,#0]
        MOV      r0,#0x100
        LDR      r1,|L1.4420|
        STR      r0,[r1,#0]
        MOV      r0,#0xc0
        LDR      r1,|L1.4424|
        STR      r0,[r1,#0]
        MOV      r0,#0x80
        LDR      r1,|L1.4428|
        STR      r0,[r1,#0]
        MOV      r0,#0x40
        LDR      r1,|L1.4432|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3924|
        LDR      r1,|L1.4436|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3932|
        LDR      r1,|L1.4440|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3940|
        LDR      r1,|L1.4444|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4448|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.4452|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.4456|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4460|
        STR      r0,[r1,#0]
        MOV      r0,#0x41
        LDR      r1,|L1.4464|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.4468|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.4472|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.4476|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.4480|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.4484|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.4488|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.4492|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.4496|
        STR      r0,[r1,#0]
        MOV      r6,#1
|L1.3196|
        LDR      r0,|L1.4500|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.3196|
        LDR      r0,|L1.4504|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.3196|
        LDR      r0,|L1.4508|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.3196|
        LDR      r0,|L1.4512|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.3196|
        LDR      r0,|L1.4448|
        LDR      r0,|L1.4016|
        LDR      r1,|L1.4516|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4024|
        LDR      r1,|L1.4516|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4028|
        LDR      r1,|L1.4516|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4032|
        LDR      r1,|L1.4516|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4036|
        LDR      r1,|L1.4516|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4040|
        LDR      r1,|L1.4516|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4044|
        LDR      r1,|L1.4516|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4048|
        LDR      r1,|L1.4516|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4052|
        LDR      r1,|L1.4520|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4060|
        LDR      r1,|L1.4524|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4068|
        LDR      r1,|L1.4528|
        STR      r0,[r1,#0]
        MOV      r0,#0x10000
        LDR      r1,|L1.4532|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4536|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.4540|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.4544|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.4548|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.4552|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4556|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4104|
        STR      r0,[r1,#0]
        MOV      r0,#0
        LDR      r1,|L1.4108|
        STR      r0,[r1,#0]
        LDR      r0,|L1.4560|
        MOV      pc,r0
        B        |L1.4564|
|L1.3532|
        DCD      0xe6152e10
|L1.3536|
        DCD      0xe6150000
|L1.3540|
        DCD      0xe6152d10
|L1.3544|
        DCD      0xe6790100
|L1.3548|
        DCD      0xe6790108
|L1.3552|
        DCD      0xe6790020
|L1.3556|
        DCD      0xe6790024
|L1.3560|
        DCD      0x0e030a01
|L1.3564|
        DCD      0xe6790030
|L1.3568|
        DCD      0xe6790070
|L1.3572|
        DCD      0xe6790034
|L1.3576|
        DCD      0xe6790074
|L1.3580|
        DCD      0xe6790040
|L1.3584|
        DCD      0xe6790080
|L1.3588|
        DCD      0xe6790044
|L1.3592|
        DCD      0xe6790084
|L1.3596|
        DCD      0xe6790050
|L1.3600|
        DCD      0xe6790090
|L1.3604|
        DCD      0xe6790054
|L1.3608|
        DCD      0xe6790094
|L1.3612|
        DCD      0xe6790060
|L1.3616|
        DCD      0xe67900a0
|L1.3620|
        DCD      0xe6790064
|L1.3624|
        DCD      0xe67900a4
|L1.3628|
        DCD      0xe6790104
|L1.3632|
        DCD      0xe6790010
|L1.3636|
        DCD      0xe6790300
|L1.3640|
        DCD      0xe6790304
|L1.3644|
        DCD      0xe679030c
|L1.3648|
        DCD      0x002d0027
|L1.3652|
        DCD      0xe6790310
|L1.3656|
        DCD      0xe6790314
|L1.3660|
        DCD      0xe6790318
|L1.3664|
        DCD      0x00100010
|L1.3668|
        DCD      0xe679031c
|L1.3672|
        DCD      0xe6790320
|L1.3676|
        DCD      0xe6790324
|L1.3680|
        DCD      0xe6790328
|L1.3684|
        DCD      0xe679032c
|L1.3688|
        DCD      0x00310031
|L1.3692|
        DCD      0xe6790330
|L1.3696|
        DCD      0xe6790334
|L1.3700|
        DCD      0x00130013
|L1.3704|
        DCD      0xe6790338
|L1.3708|
        DCD      0x00200010
|L1.3712|
        DCD      0xe679033c
|L1.3716|
        DCD      0x0d400a0e
|L1.3720|
        DCD      0xe6790340
|L1.3724|
        DCD      0x081e0000
|L1.3728|
        DCD      0xe6790344
|L1.3732|
        DCD      0x01290129
|L1.3736|
        DCD      0xe6790350
|L1.3740|
        DCD      0x00080008
|L1.3744|
        DCD      0xe6790354
|L1.3748|
        DCD      0x08550040
|L1.3752|
        DCD      0xe6790358
|L1.3756|
        DCD      0xe679035c
|L1.3760|
        DCD      0xe6790400
|L1.3764|
        DCD      0xe6790404
|L1.3768|
        DCD      0xe6790438
|L1.3772|
        DCD      0xe679043c
|L1.3776|
        DCD      0xe6790440
|L1.3780|
        DCD      0xe6790444
|L1.3784|
        DCD      0x00104214
|L1.3788|
        DCD      0xe6790904
|L1.3792|
        DCD      0xe6790908
|L1.3796|
        DCD      0xe679090c
|L1.3800|
        DCD      0x000f0037
|L1.3804|
        DCD      0xe6791000
|L1.3808|
        DCD      0xe6791004
|L1.3812|
        DCD      0xe6791010
|L1.3816|
        DCD      0xf7311111
|L1.3820|
        DCD      0xe6791020
|L1.3824|
        DCD      0xe6791024
|L1.3828|
        DCD      0xe6791030
|L1.3832|
        DCD      0xe6791034
|L1.3836|
        DCD      0xe6791038
|L1.3840|
        DCD      0xe679103c
|L1.3844|
        DCD      0xe6791070
|L1.3848|
        DCD      0xe6791074
|L1.3852|
        DCD      0xe6791078
|L1.3856|
        DCD      0xe679107c
|L1.3860|
        DCD      0xe67910c0
|L1.3864|
        DCD      0xe67910c4
|L1.3868|
        DCD      0xe67910c8
|L1.3872|
        DCD      0xe67910cc
|L1.3876|
        DCD      0xe6791100
|L1.3880|
        DCD      0xe6791104
|L1.3884|
        DCD      0xe6791108
|L1.3888|
        DCD      0xe679110c
|L1.3892|
        DCD      0xe6791110
|L1.3896|
        DCD      0xe6791114
|L1.3900|
        DCD      0xe6791118
|L1.3904|
        DCD      0xe679111c
|L1.3908|
        DCD      0xe6791120
|L1.3912|
        DCD      0xe6791124
|L1.3916|
        DCD      0xe6791128
|L1.3920|
        DCD      0xe679112c
|L1.3924|
        DCD      0x220e110a
|L1.3928|
        DCD      0xe6791700
|L1.3932|
        DCD      0x0b0d0a0c
|L1.3936|
        DCD      0xe6791708
|L1.3940|
        DCD      0x111f1fff
|L1.3944|
        DCD      0xe679170c
|L1.3948|
        DCD      0xe6790000
|L1.3952|
        DCD      0xe6790004
|L1.3956|
        DCD      0xe6790008
|L1.3960|
        DCD      0xe679000c
|L1.3964|
        DCD      0xe6790014
|L1.3968|
        DCD      0xe6790604
|L1.3972|
        DCD      0xe6790644
|L1.3976|
        DCD      0xe6790684
|L1.3980|
        DCD      0xe67906c4
|L1.3984|
        DCD      0xe679061c
|L1.3988|
        DCD      0xe679065c
|L1.3992|
        DCD      0xe679069c
|L1.3996|
        DCD      0xe67906dc
|L1.4000|
        DCD      0xe6790600
|L1.4004|
        DCD      0xe6790640
|L1.4008|
        DCD      0xe6790680
|L1.4012|
        DCD      0xe67906c0
|L1.4016|
        DCD      0x08840000
|L1.4020|
        DCD      0xe6790208
|L1.4024|
        DCD      0x08840001
|L1.4028|
        DCD      0x01840001
|L1.4032|
        DCD      0x0e840aff
|L1.4036|
        DCD      0x0e840154
|L1.4040|
        DCD      0x0e84022e
|L1.4044|
        DCD      0x0d84004f
|L1.4048|
        DCD      0x0d840051
|L1.4052|
        DCD      0x70000100
|L1.4056|
        DCD      0xe6790804
|L1.4060|
        DCD      0x18010001
|L1.4064|
        DCD      0xe6790800
|L1.4068|
        DCD      0x00081860
|L1.4072|
        DCD      0xe6790414
|L1.4076|
        DCD      0xe6790418
|L1.4080|
        DCD      0xe6790204
|L1.4084|
        DCD      0xe6790620
|L1.4088|
        DCD      0xe6790660
|L1.4092|
        DCD      0xe67906a0
|L1.4096|
        DCD      0xe67906e0
|L1.4100|
        DCD      0xe6790200
|L1.4104|
        DCD      0xe67f0024
|L1.4108|
        DCD      0xe67f0018
|L1.4112|
        DCD      0xe6798100
|L1.4116|
        DCD      0xe6798108
|L1.4120|
        DCD      0xe6798020
|L1.4124|
        DCD      0xe6798024
|L1.4128|
        DCD      0xe6798030
|L1.4132|
        DCD      0xe6798070
|L1.4136|
        DCD      0xe6798034
|L1.4140|
        DCD      0xe6798074
|L1.4144|
        DCD      0xe6798040
|L1.4148|
        DCD      0xe6798080
|L1.4152|
        DCD      0xe6798044
|L1.4156|
        DCD      0xe6798084
|L1.4160|
        DCD      0xe6798050
|L1.4164|
        DCD      0xe6798090
|L1.4168|
        DCD      0xe6798054
|L1.4172|
        DCD      0xe6798094
|L1.4176|
        DCD      0xe6798060
|L1.4180|
        DCD      0xe67980a0
|L1.4184|
        DCD      0xe6798064
|L1.4188|
        DCD      0xe67980a4
|L1.4192|
        DCD      0xe6798104
|L1.4196|
        DCD      0xe6798010
|L1.4200|
        DCD      0xe6798300
|L1.4204|
        DCD      0xe6798304
|L1.4208|
        DCD      0xe679830c
|L1.4212|
        DCD      0xe6798310
|L1.4216|
        DCD      0xe6798314
|L1.4220|
        DCD      0xe6798318
|L1.4224|
        DCD      0xe679831c
|L1.4228|
        DCD      0xe6798320
|L1.4232|
        DCD      0xe6798324
|L1.4236|
        DCD      0xe6798328
|L1.4240|
        DCD      0xe679832c
|L1.4244|
        DCD      0xe6798330
|L1.4248|
        DCD      0xe6798334
|L1.4252|
        DCD      0xe6798338
|L1.4256|
        DCD      0xe679833c
|L1.4260|
        DCD      0xe6798340
|L1.4264|
        DCD      0xe6798344
|L1.4268|
        DCD      0xe6798350
|L1.4272|
        DCD      0xe6798354
|L1.4276|
        DCD      0xe6798358
|L1.4280|
        DCD      0xe679835c
|L1.4284|
        DCD      0xe6798400
|L1.4288|
        DCD      0xe6798404
|L1.4292|
        DCD      0xe6798438
|L1.4296|
        DCD      0xe679843c
|L1.4300|
        DCD      0xe6798440
|L1.4304|
        DCD      0xe6798444
|L1.4308|
        DCD      0xe6798904
|L1.4312|
        DCD      0xe6798908
|L1.4316|
        DCD      0xe679890c
|L1.4320|
        DCD      0xe6799000
|L1.4324|
        DCD      0xe6799004
|L1.4328|
        DCD      0xe6799010
|L1.4332|
        DCD      0xe6799020
|L1.4336|
        DCD      0xe6799024
|L1.4340|
        DCD      0xe6799030
|L1.4344|
        DCD      0xe6799034
|L1.4348|
        DCD      0xe6799038
|L1.4352|
        DCD      0xe679903c
|L1.4356|
        DCD      0xe6799070
|L1.4360|
        DCD      0xe6799074
|L1.4364|
        DCD      0xe6799078
|L1.4368|
        DCD      0xe679907c
|L1.4372|
        DCD      0xe67990c0
|L1.4376|
        DCD      0xe67990c4
|L1.4380|
        DCD      0xe67990c8
|L1.4384|
        DCD      0xe67990cc
|L1.4388|
        DCD      0xe6799100
|L1.4392|
        DCD      0xe6799104
|L1.4396|
        DCD      0xe6799108
|L1.4400|
        DCD      0xe679910c
|L1.4404|
        DCD      0xe6799110
|L1.4408|
        DCD      0xe6799114
|L1.4412|
        DCD      0xe6799118
|L1.4416|
        DCD      0xe679911c
|L1.4420|
        DCD      0xe6799120
|L1.4424|
        DCD      0xe6799124
|L1.4428|
        DCD      0xe6799128
|L1.4432|
        DCD      0xe679912c
|L1.4436|
        DCD      0xe6799700
|L1.4440|
        DCD      0xe6799708
|L1.4444|
        DCD      0xe679970c
|L1.4448|
        DCD      0xe6798000
|L1.4452|
        DCD      0xe6798004
|L1.4456|
        DCD      0xe6798008
|L1.4460|
        DCD      0xe679800c
|L1.4464|
        DCD      0xe6798014
|L1.4468|
        DCD      0xe6798604
|L1.4472|
        DCD      0xe6798644
|L1.4476|
        DCD      0xe6798684
|L1.4480|
        DCD      0xe67986c4
|L1.4484|
        DCD      0xe679861c
|L1.4488|
        DCD      0xe679865c
|L1.4492|
        DCD      0xe679869c
|L1.4496|
        DCD      0xe67986dc
|L1.4500|
        DCD      0xe6798600
|L1.4504|
        DCD      0xe6798640
|L1.4508|
        DCD      0xe6798680
|L1.4512|
        DCD      0xe67986c0
|L1.4516|
        DCD      0xe6798208
|L1.4520|
        DCD      0xe6798804
|L1.4524|
        DCD      0xe6798800
|L1.4528|
        DCD      0xe6798414
|L1.4532|
        DCD      0xe6798418
|L1.4536|
        DCD      0xe6798204
|L1.4540|
        DCD      0xe6798620
|L1.4544|
        DCD      0xe6798660
|L1.4548|
        DCD      0xe67986a0
|L1.4552|
        DCD      0xe67986e0
|L1.4556|
        DCD      0xe6798200
|L1.4560|
        DCD      0x00000138
__mpu_init                  ; Alternate entry point
ddr_init_end
|L1.4564|
        MOV      r0,#0x4ff
        MOVT     r0,#0x44
        MCR      p15,#0x4,r0,c10,c2,#0
        MOV      r0,#0xbb00
        MOVT     r0,#0xddee
        MCR      p15,#0x4,r0,c10,c2,#1
        MOV      r0,#0
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#2
        MOVT     r0,#0
        MCR      p15,#0x4,r0,c6,c3,#0
        MOV      r0,#0xffc1
        MOVT     r0,#0x7ff
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#1
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#2
        MOVT     r0,#0x800
        MCR      p15,#0x4,r0,c6,c3,#0
        MOV      r0,#0xffc1
        MOVT     r0,#0xfff
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#2
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#2
        MOVT     r0,#0x1000
        MCR      p15,#0x4,r0,c6,c3,#0
        MOV      r0,#0xffc1
        MOVT     r0,#0x1fff
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#3
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#2
        MOVT     r0,#0x2000
        MCR      p15,#0x4,r0,c6,c3,#0
        MOV      r0,#0xffc1
        MOVT     r0,#0x3fff
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#4
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#2
        MOVT     r0,#0x4000
        MCR      p15,#0x4,r0,c6,c3,#0
        MOV      r0,#0xffc1
        MOVT     r0,#0xbfff
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#5
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#2
        MOVT     r0,#0xc000
        MCR      p15,#0x4,r0,c6,c3,#0
        MOV      r0,#0xffc1
        MOVT     r0,#0xdfff
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#6
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#2
        MOVT     r0,#0xe000
        MCR      p15,#0x4,r0,c6,c3,#0
        MOV      r0,#0xffc7
        MOVT     r0,#0xe62f
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#7
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#2
        MOVT     r0,#0xe630
        MCR      p15,#0x4,r0,c6,c3,#0
        MOV      r0,#0xffc1
        MOVT     r0,#0xe63f
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#8
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#2
        MOVT     r0,#0xe640
        MCR      p15,#0x4,r0,c6,c3,#0
        MOV      r0,#0xffc7
        MOVT     r0,#0xeb0f
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#9
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#2
        MOVT     r0,#0xeb10
        MCR      p15,#0x4,r0,c6,c3,#0
        MOV      r0,#0xffc1
        MOVT     r0,#0xeb3f
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#0xa
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#2
        MOVT     r0,#0xeb40
        MCR      p15,#0x4,r0,c6,c3,#0
        MOV      r0,#0xffc7
        MOVT     r0,#0xecff
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#0xb
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#2
        MOVT     r0,#0xed00
        MCR      p15,#0x4,r0,c6,c3,#0
        MOV      r0,#0xffc1
        MOVT     r0,#0xedff
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#0xc
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#2
        MOVT     r0,#0xee00
        MCR      p15,#0x4,r0,c6,c3,#0
        MOV      r0,#0xffc7
        MOVT     r0,#0xffff
        MCR      p15,#0x4,r0,c6,c3,#1
        MRC      p15,#0x4,r0,c1,c0,#0
        ORR      r0,r0,#1
        DSB      
        MCR      p15,#0x4,r0,c1,c0,#0
        ISB      
        BX       lr
__mpu_init_el1                  ; Alternate entry point
        BX       lr
||$Ven$AA$L$$UndefinedInstruction_Handler|| PROC
|L1.5032|
        LDR      pc,|L1.5036|
|L1.5036|
        DCD      0x40000bdc
        ENDP

||$Ven$AA$L$$SupervisorCall_Handler|| PROC
|L1.5040|
        LDR      pc,|L1.5044|
|L1.5044|
        DCD      0x40000bd0
        ENDP

||$Ven$AA$L$$PrefetchAbort_Handler|| PROC
|L1.5048|
        LDR      pc,|L1.5052|
|L1.5052|
        DCD      0x40000b44
        ENDP

||$Ven$AA$L$$DataAbort_Handler|| PROC
|L1.5056|
        LDR      pc,|L1.5060|
|L1.5060|
        DCD      0x400000a8
        ENDP

||$Ven$AA$L$$IRQ_Handler|| PROC
|L1.5064|
        LDR      pc,|L1.5068|
|L1.5068|
        DCD      0x40000b04
        ENDP

||$Ven$AT$L$$__rt_entry|| PROC
|L1.5072|
        LDR      pc,|L1.5076|
|L1.5076|
        DCD      0x40000071
        ENDP

||Region$$Table$$Base||
        DCD      0x400033d0
        DCD      0x400033d0
        DCD      0x0000023c
        DCD      0x0000017c
||Region$$Table$$Limit||

        AREA ER10, CODE, READONLY, ALIGN=2

vectors_start                  ; Alternate entry point
        LDR      pc,|L2.32|
        LDR      pc,|L2.36|
        LDR      pc,|L2.40|
        LDR      pc,|L2.44|
        LDR      pc,|L2.48|
        NOP      
        LDR      pc,|L2.52|
|L2.28|
        B        |L2.28|
|L2.32|
        DCD      0x40000038
|L2.36|
        DCD      0x4000003c
|L2.40|
        DCD      0x40000044
|L2.44|
        DCD      0x4000004c
|L2.48|
        DCD      0x40000054
|L2.52|
        DCD      0x4000005c
RST_EXC_VECTORS                  ; Alternate entry point
        B        |L2.8276|
UDF_EXC_VECTORS                  ; Alternate entry point
        BL       |L2.3036|
        ERET     
SVC_EXC_VECTORS                  ; Alternate entry point
        BL       |L2.3024|
        ERET     
PAB_EXC_VECTORS                  ; Alternate entry point
        BL       |L2.2884|
        ERET     
DAB_EXC_VECTORS                  ; Alternate entry point
        BL       |L2.168|
        ERET     
IRQ_EXC_VECTORS                  ; Alternate entry point
        BL       |L2.2820|
        ERET     
        THUMB
__rt_lib_init                  ; Alternate entry point
|L2.100|
        PUSH     {r0-r4,lr}
__rt_lib_init_fp_1                  ; Alternate entry point
        BLX      |L2.8284|
__rt_lib_init_alloca_1                  ; Alternate entry point
__rt_lib_init_argv_1                  ; Alternate entry point
__rt_lib_init_atexit_1                  ; Alternate entry point
__rt_lib_init_clock_1                  ; Alternate entry point
__rt_lib_init_cpp_1                  ; Alternate entry point
__rt_lib_init_exceptions_1                  ; Alternate entry point
__rt_lib_init_fp_trap_1                  ; Alternate entry point
__rt_lib_init_getenv_1                  ; Alternate entry point
__rt_lib_init_heap_1                  ; Alternate entry point
__rt_lib_init_lc_collate_1                  ; Alternate entry point
__rt_lib_init_lc_ctype_1                  ; Alternate entry point
__rt_lib_init_lc_monetary_1                  ; Alternate entry point
__rt_lib_init_lc_numeric_1                  ; Alternate entry point
__rt_lib_init_lc_time_1                  ; Alternate entry point
__rt_lib_init_preinit_1                  ; Alternate entry point
__rt_lib_init_rand_1                  ; Alternate entry point
__rt_lib_init_return                  ; Alternate entry point
__rt_lib_init_signal_1                  ; Alternate entry point
__rt_lib_init_stdio_1                  ; Alternate entry point
__rt_lib_init_user_alloc_1                  ; Alternate entry point
        POP      {r0-r4,pc}
__rt_lib_shutdown                  ; Alternate entry point
|L2.108|
        PUSH     {r4,lr}
__rt_lib_shutdown_cpp_1                  ; Alternate entry point
__rt_lib_shutdown_fp_trap_1                  ; Alternate entry point
__rt_lib_shutdown_heap_1                  ; Alternate entry point
__rt_lib_shutdown_return                  ; Alternate entry point
__rt_lib_shutdown_signal_1                  ; Alternate entry point
__rt_lib_shutdown_stdio_1                  ; Alternate entry point
__rt_lib_shutdown_user_alloc_1                  ; Alternate entry point
        POP      {r4,pc}
__rt_entry                  ; Alternate entry point
__rt_entry_presh_1                  ; Alternate entry point
__rt_entry_sh                  ; Alternate entry point
        LDR      sp,__lit__00000000
__rt_entry_li                  ; Alternate entry point
__rt_entry_postsh_1                  ; Alternate entry point
        BL       |L2.100|
__rt_entry_main                  ; Alternate entry point
__rt_entry_postli_1                  ; Alternate entry point
        BLX      |L2.3052|
        BL       |L2.148|
__lit__00000000
        DCD      0x70000000
__rt_exit                  ; Alternate entry point
|L2.132|
        PUSH     {r0,r1}
__rt_exit_ls                  ; Alternate entry point
__rt_exit_prels_1                  ; Alternate entry point
        BL       |L2.108|
__rt_exit_exit                  ; Alternate entry point
        POP      {r0,r1}
        BLX      |L2.3048|
        ARM
||__I$use$semihosting||                  ; Alternate entry point
__use_no_semihosting_swi PROC
        BX       lr
        ENDP

        THUMB
exit PROC
|L2.148|
        PUSH     {r4,lr}
        MOV      r4,r0
        NOP.W    
        MOV      r0,r4
        POP      {r4,lr}
        B.W      |L2.132|
        ENDP

        MOVS     r0,r0
        ARM
DataAbort_Handler PROC
|L2.168|
        PUSH     {r11,lr}
        BL       |L2.3008|
|L2.176|
        B        |L2.176|
        ENDP

GIC_defaultHandler PROC
|L2.180|
        B        |L2.180|
        ENDP

GIC_endInterrupt PROC
|L2.184|
        MCR      p15,#0x0,r0,c12,c12,#1
        DSB      
        BX       lr
        ENDP

GIC_executeInterruptHandler PROC
|L2.196|
        MOVW     r1,#0x2480
        MOVT     r1,#0x4000
        LDR      r0,[r1,r0,LSL #2]
        BX       r0
        ENDP

GIC_getACKID PROC
|L2.212|
        PUSH     {r4,lr}
        MRC      p15,#0x0,r4,c12,c12,#0
        DSB      
        MOV      r0,r4
        BL       |L2.184|
        MOV      r0,r4
        POP      {r4,pc}
        ENDP

I2C_configPins PROC
|L2.240|
        MOVW     r0,#0x800
        MOVT     r0,#0xe605
        ADD      r1,r0,#0x100
        MOV      r2,#0xfffc
        B        |L2.2860|
        ENDP

I2C_masterClearInterruptStatus PROC
|L2.260|
        LDR      r2,[r0,#0xc]
        BIC      r1,r2,r1
        STR      r1,[r0,#0xc]
        BX       lr
        ENDP

I2C_masterDisable PROC
|L2.276|
        LDR      r1,[r0,#4]
        BIC      r1,r1,#8
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterEnable PROC
|L2.292|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#8
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterInit PROC
|L2.308|
        LDRB     r2,[r1,#4]
        LDR      r3,[r1,#0]
        ORR      r2,r3,r2,LSL #1
        STR      r2,[r0,#0x20]
        LDR      r2,[r1,#8]
        MOV      r3,#0x80
        CMP      r2,#1
        MOVWEQ   r3,#0x84
        STR      r3,[r0,#4]
        LDR      r2,[r1,#0xc]
        CMP      r2,#1
        BEQ      |L2.448|
        CMP      r2,#0
        BNE      |L2.560|
        LDR      r2,[r1,#0x10]
        CMP      r2,#1
        BEQ      |L2.624|
        CMP      r2,#0
        BNE      |L2.560|
        LDR      r2,[r0,#0x28]
        BIC      r2,r2,#7
        STR      r2,[r0,#0x28]
        LDR      r1,[r1,#0x14]
        CMP      r1,#6
        BHI      |L2.572|
        LSL      r1,r1,#2
        ADR      r2,|L2.420|
        LDR      pc,[r1,r2]
|L2.420|
        DCD      0x40000214
        DCD      0x40000380
        DCD      0x4000039c
        DCD      0x400003b8
        DCD      0x400003d4
        DCD      0x4000023c
        DCD      0x400003f0
|L2.448|
        LDR      r2,[r1,#0x10]
        CMP      r2,#1
        BEQ      |L2.704|
        CMP      r2,#0
        BNE      |L2.560|
        LDR      r2,[r0,#0x28]
        BIC      r2,r2,#7
        STR      r2,[r0,#0x28]
        LDR      r1,[r1,#0x14]
        CMP      r1,#6
        BHI      |L2.572|
        LSL      r1,r1,#2
        ADR      r2,|L2.504|
        LDR      pc,[r1,r2]
|L2.504|
        DCD      0x40000214
        DCD      0x40000380
        DCD      0x4000039c
        DCD      0x400003b8
        DCD      0x400003d4
        DCD      0x4000023c
        DCD      0x400003f0
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        MOV      r2,#0x2c
        B        |L2.596|
|L2.560|
        LDR      r1,[r0,#0x28]
        BIC      r1,r1,#7
        STR      r1,[r0,#0x28]
|L2.572|
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        MOV      r2,#3
|L2.596|
        BFI      r1,r2,#3,#6
        STR      r1,[r0,#0x18]
        MOV      r1,#0
        STR      r1,[r0,#0x2c]
        STR      r1,[r0,#0x30]
        STR      r1,[r0,#0x34]
        BX       lr
|L2.624|
        LDR      r2,[r0,#0x28]
        ORR      r2,r2,#7
        STR      r2,[r0,#0x28]
        LDR      r2,[r0,#0x38]
        MOV      r3,#0xf
        BFI      r2,r3,#0,#5
        STR      r2,[r0,#0x38]
        LDR      r1,[r1,#0x14]
        CMP      r1,#6
        BHI      |L2.840|
        LSL      r1,r1,#2
        ADR      r2,|L2.676|
        LDR      pc,[r1,r2]
|L2.676|
        DCD      0x40000310
        DCD      0x40000420
        DCD      0x40000458
        DCD      0x40000490
        DCD      0x400004c8
        DCD      0x40000348
        DCD      0x40000500
|L2.704|
        LDR      r2,[r0,#0x28]
        ORR      r2,r2,#7
        STR      r2,[r0,#0x28]
        LDR      r2,[r0,#0x38]
        MOV      r3,#0xf
        BFI      r2,r3,#0,#5
        STR      r2,[r0,#0x38]
        LDR      r1,[r1,#0x14]
        CMP      r1,#6
        BHI      |L2.840|
        LSL      r1,r1,#2
        ADR      r2,|L2.756|
        LDR      pc,[r1,r2]
|L2.756|
        DCD      0x40000310
        DCD      0x40000420
        DCD      0x40000458
        DCD      0x40000490
        DCD      0x400004c8
        DCD      0x40000348
        DCD      0x40000500
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        BIC      r1,r1,#0x1f8
        STR      r1,[r0,#0x18]
        MOV      r1,#0x1c
        STR      r1,[r0,#0x2c]
        MOV      r1,#0x501
        STR      r1,[r0,#0x30]
        MOV      r1,#0x514
        STR      r1,[r0,#0x34]
        BX       lr
|L2.840|
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        BIC      r1,r1,#0x1f8
        STR      r1,[r0,#0x18]
        MOV      r1,#0x1c
        STR      r1,[r0,#0x2c]
        MOV      r1,#0x73
        STR      r1,[r0,#0x30]
        MOV      r1,#0x85
        STR      r1,[r0,#0x34]
        BX       lr
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        MOV      r2,#0x14
        B        |L2.596|
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        MOV      r2,#9
        B        |L2.596|
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        MOV      r2,#7
        B        |L2.596|
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        MOV      r2,#5
        B        |L2.596|
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        MOV      r2,#3
        BFI      r1,r2,#3,#6
        STR      r1,[r0,#0x18]
        MOV      r1,#0
        STR      r1,[r0,#0x2c]
        STR      r1,[r0,#0x30]
        B        |L2.1328|
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        BIC      r1,r1,#0x1f8
        STR      r1,[r0,#0x18]
        MOV      r1,#0x1c
        STR      r1,[r0,#0x2c]
        MOV      r1,#0x267
        STR      r1,[r0,#0x30]
        MOV      r1,#0x279
        STR      r1,[r0,#0x34]
        BX       lr
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        BIC      r1,r1,#0x1f8
        STR      r1,[r0,#0x18]
        MOV      r1,#0x1c
        STR      r1,[r0,#0x2c]
        MOV      r1,#0x119
        STR      r1,[r0,#0x30]
        MOV      r1,#0x12c
        STR      r1,[r0,#0x34]
        BX       lr
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        BIC      r1,r1,#0x1f8
        STR      r1,[r0,#0x18]
        MOV      r1,#0x1c
        STR      r1,[r0,#0x2c]
        MOV      r1,#0xd7
        STR      r1,[r0,#0x30]
        MOV      r1,#0xe9
        STR      r1,[r0,#0x34]
        BX       lr
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        BIC      r1,r1,#0x1f8
        STR      r1,[r0,#0x18]
        MOV      r1,#0x1c
        STR      r1,[r0,#0x2c]
        MOV      r1,#0xaa
        STR      r1,[r0,#0x30]
        MOV      r1,#0xbd
        STR      r1,[r0,#0x34]
        BX       lr
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        BIC      r1,r1,#0x1f8
        STR      r1,[r0,#0x18]
        MOV      r1,#0x1b
        STR      r1,[r0,#0x2c]
        MOV      r1,#0x20
        STR      r1,[r0,#0x30]
        MOV      r1,#0x27
|L2.1328|
        STR      r1,[r0,#0x34]
        LDR      r1,[r0,#0x28]
        ORR      r1,r1,#0x80
        STR      r1,[r0,#0x28]
        BX       lr
        ENDP

I2C_masterReceiveMultipleByteFinish PROC
|L2.1348|
        LDR      r0,[r0,#0x24]
        BX       lr
        ENDP

I2C_masterReceiveMultipleByteNext PROC
|L2.1356|
        LDR      r0,[r0,#0x24]
        BX       lr
        ENDP

I2C_masterReceiveMultipleByteStop PROC
|L2.1364|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#2
        STR      r1,[r0,#4]
        LDR      r0,[r0,#0x24]
        BX       lr
        ENDP

I2C_masterReceiveStart PROC
|L2.1384|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterSendMultipleByteNext PROC
|L2.1400|
        STR      r1,[r0,#0x24]
        BX       lr
        ENDP

I2C_masterSendMultipleByteStart PROC
|L2.1408|
        STR      r1,[r0,#0x24]
        LDR      r1,[r0,#4]
        ORR      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterSendMultipleByteStop PROC
|L2.1428|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#2
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_modelConnect PROC
|L2.1444|
        PUSH     {r0,r1,r10}
        MOV      r10,#0
        MOVT     r10,#0
        LSL      r0,r0,#12
        LSL      r1,r1,#8
        ORR      r10,r10,r0
        ORR      r10,r10,r1
        ORR      r10,r10,#1
        MOVT     r10,#0xa55a
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        POP      {r0,r1,r10}
        BX       lr
        ENDP

I2C_modelDisable PROC
|L2.1568|
        PUSH     {r10}
        MOV      r10,#0
        MOVT     r10,#0xa55a
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        NOP      
        POP      {r10}
        BX       lr
        ENDP

I2C_releasePins PROC
|L2.1668|
        MOVW     r0,#0x800
        MOVT     r0,#0xe605
        ADD      r1,r0,#0x100
        MOV      r2,#0xfffc
        B        |L2.2836|
        ENDP

I2C_slaveClearInterruptStatus PROC
|L2.1688|
        LDR      r2,[r0,#8]
        BIC      r1,r2,r1
        STR      r1,[r0,#8]
        BX       lr
        ENDP

I2C_slaveDisable PROC
|L2.1704|
        LDR      r1,[r0,#0]
        BIC      r1,r1,#4
        STR      r1,[r0,#0]
        BX       lr
        ENDP

I2C_slaveEnable PROC
|L2.1720|
        LDR      r1,[r0,#0]
        ORR      r1,r1,#4
        STR      r1,[r0,#0]
        BX       lr
        ENDP

I2C_slaveInit PROC
|L2.1736|
        LDRB     r2,[r1,#0]
        STR      r2,[r0,#0x1c]
        LDMIB    r1,{r2,r12}
        MOV      r3,#8
        CMP      r2,#1
        MOVWEQ   r3,#0x18
        CMP      r12,#1
        ORREQ    r3,r3,#2
        STR      r3,[r0,#0]
        LDR      r2,[r1,#0xc]
        CMP      r2,#1
        BEQ      |L2.1876|
        CMP      r2,#0
        BNE      |L2.1988|
        LDR      r2,[r1,#0x10]
        CMP      r2,#1
        BEQ      |L2.2052|
        CMP      r2,#0
        BNE      |L2.1988|
        LDR      r2,[r0,#0x28]
        BIC      r2,r2,#7
        STR      r2,[r0,#0x28]
        LDR      r1,[r1,#0x14]
        CMP      r1,#6
        BHI      |L2.2000|
        LSL      r1,r1,#2
        ADR      r2,|L2.1848|
        LDR      pc,[r1,r2]
|L2.1848|
        DCD      0x400007a8
        DCD      0x40000914
        DCD      0x40000930
        DCD      0x4000094c
        DCD      0x40000968
        DCD      0x400007d0
        DCD      0x40000984
|L2.1876|
        LDR      r2,[r1,#0x10]
        CMP      r2,#1
        BEQ      |L2.2132|
        CMP      r2,#0
        BNE      |L2.1988|
        LDR      r2,[r0,#0x28]
        BIC      r2,r2,#7
        STR      r2,[r0,#0x28]
        LDR      r1,[r1,#0x14]
        CMP      r1,#6
        BHI      |L2.2000|
        LSL      r1,r1,#2
        ADR      r2,|L2.1932|
        LDR      pc,[r1,r2]
|L2.1932|
        DCD      0x400007a8
        DCD      0x40000914
        DCD      0x40000930
        DCD      0x4000094c
        DCD      0x40000968
        DCD      0x400007d0
        DCD      0x40000984
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        MOV      r2,#0x2c
        B        |L2.2024|
|L2.1988|
        LDR      r1,[r0,#0x28]
        BIC      r1,r1,#7
        STR      r1,[r0,#0x28]
|L2.2000|
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        MOV      r2,#3
|L2.2024|
        BFI      r1,r2,#3,#6
        STR      r1,[r0,#0x18]
        MOV      r1,#0
        STR      r1,[r0,#0x2c]
        STR      r1,[r0,#0x30]
        STR      r1,[r0,#0x34]
        BX       lr
|L2.2052|
        LDR      r2,[r0,#0x28]
        ORR      r2,r2,#7
        STR      r2,[r0,#0x28]
        LDR      r2,[r0,#0x38]
        MOV      r3,#0xf
        BFI      r2,r3,#0,#5
        STR      r2,[r0,#0x38]
        LDR      r1,[r1,#0x14]
        CMP      r1,#6
        BHI      |L2.2268|
        LSL      r1,r1,#2
        ADR      r2,|L2.2104|
        LDR      pc,[r1,r2]
|L2.2104|
        DCD      0x400008a4
        DCD      0x400009b4
        DCD      0x400009ec
        DCD      0x40000a24
        DCD      0x40000a5c
        DCD      0x400008dc
        DCD      0x40000a94
|L2.2132|
        LDR      r2,[r0,#0x28]
        ORR      r2,r2,#7
        STR      r2,[r0,#0x28]
        LDR      r2,[r0,#0x38]
        MOV      r3,#0xf
        BFI      r2,r3,#0,#5
        STR      r2,[r0,#0x38]
        LDR      r1,[r1,#0x14]
        CMP      r1,#6
        BHI      |L2.2268|
        LSL      r1,r1,#2
        ADR      r2,|L2.2184|
        LDR      pc,[r1,r2]
|L2.2184|
        DCD      0x400008a4
        DCD      0x400009b4
        DCD      0x400009ec
        DCD      0x40000a24
        DCD      0x40000a5c
        DCD      0x400008dc
        DCD      0x40000a94
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        BIC      r1,r1,#0x1f8
        STR      r1,[r0,#0x18]
        MOV      r1,#0x1c
        STR      r1,[r0,#0x2c]
        MOV      r1,#0x501
        STR      r1,[r0,#0x30]
        MOV      r1,#0x514
        STR      r1,[r0,#0x34]
        BX       lr
|L2.2268|
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        BIC      r1,r1,#0x1f8
        STR      r1,[r0,#0x18]
        MOV      r1,#0x1c
        STR      r1,[r0,#0x2c]
        MOV      r1,#0x73
        STR      r1,[r0,#0x30]
        MOV      r1,#0x85
        STR      r1,[r0,#0x34]
        BX       lr
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        MOV      r2,#0x14
        B        |L2.2024|
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        MOV      r2,#9
        B        |L2.2024|
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        MOV      r2,#7
        B        |L2.2024|
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        MOV      r2,#5
        B        |L2.2024|
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        MOV      r2,#3
        BFI      r1,r2,#3,#6
        STR      r1,[r0,#0x18]
        MOV      r1,#0
        STR      r1,[r0,#0x2c]
        STR      r1,[r0,#0x30]
        B        |L2.2756|
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        BIC      r1,r1,#0x1f8
        STR      r1,[r0,#0x18]
        MOV      r1,#0x1c
        STR      r1,[r0,#0x2c]
        MOV      r1,#0x267
        STR      r1,[r0,#0x30]
        MOV      r1,#0x279
        STR      r1,[r0,#0x34]
        BX       lr
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        BIC      r1,r1,#0x1f8
        STR      r1,[r0,#0x18]
        MOV      r1,#0x1c
        STR      r1,[r0,#0x2c]
        MOV      r1,#0x119
        STR      r1,[r0,#0x30]
        MOV      r1,#0x12c
        STR      r1,[r0,#0x34]
        BX       lr
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        BIC      r1,r1,#0x1f8
        STR      r1,[r0,#0x18]
        MOV      r1,#0x1c
        STR      r1,[r0,#0x2c]
        MOV      r1,#0xd7
        STR      r1,[r0,#0x30]
        MOV      r1,#0xe9
        STR      r1,[r0,#0x34]
        BX       lr
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        BIC      r1,r1,#0x1f8
        STR      r1,[r0,#0x18]
        MOV      r1,#0x1c
        STR      r1,[r0,#0x2c]
        MOV      r1,#0xaa
        STR      r1,[r0,#0x30]
        MOV      r1,#0xbd
        STR      r1,[r0,#0x34]
        BX       lr
        LDR      r1,[r0,#0x18]
        MOV      r2,#6
        BFI      r1,r2,#0,#3
        STR      r1,[r0,#0x18]
        LDR      r1,[r0,#0x18]
        BIC      r1,r1,#0x1f8
        STR      r1,[r0,#0x18]
        MOV      r1,#0x1b
        STR      r1,[r0,#0x2c]
        MOV      r1,#0x20
        STR      r1,[r0,#0x30]
        MOV      r1,#0x27
|L2.2756|
        STR      r1,[r0,#0x34]
        LDR      r1,[r0,#0x28]
        ORR      r1,r1,#0x80
        STR      r1,[r0,#0x28]
        BX       lr
        ENDP

I2C_slaveReceiveMultipleByteFinish PROC
|L2.2776|
        LDR      r0,[r0,#0x24]
        BX       lr
        ENDP

I2C_slaveReceiveMultipleByteNext PROC
|L2.2784|
        LDR      r0,[r0,#0x24]
        BX       lr
        ENDP

I2C_slaveReceiveMultipleByteStop PROC
|L2.2792|
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r0,[r0,#0x24]
        BX       lr
        ENDP

I2C_slaveSetData PROC
|L2.2812|
        STR      r1,[r0,#0x24]
        BX       lr
        ENDP

IRQ_Handler PROC
|L2.2820|
        PUSH     {r11,lr}
        BL       |L2.212|
        POP      {r11,lr}
        B        |L2.196|
        ENDP

PFC_ClearMultipleBit PROC
|L2.2836|
        LDR      r3,[r1,#0]
        BIC      r2,r3,r2
        MVN      r3,r2
        STR      r3,[r0,#0]
        STR      r2,[r1,#0]
        BX       lr
        ENDP

PFC_SetMultipleBit PROC
|L2.2860|
        LDR      r3,[r1,#0]
        ORR      r2,r3,r2
        MVN      r3,r2
        STR      r3,[r0,#0]
        STR      r2,[r1,#0]
        BX       lr
        ENDP

PrefetchAbort_Handler PROC
|L2.2884|
        PUSH     {r11,lr}
        BL       |L2.3008|
|L2.2892|
        B        |L2.2892|
        ENDP

Sim_Delay PROC
|L2.2896|
        CMP      r0,#0
        BXEQ     lr
        MOV      r1,#0x33d4
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r0,r2,r0
        STR      r0,[r1,#0]
        BX       lr
        ENDP

Sim_Dump PROC
|L2.2928|
        MOV      r1,#0x33d0
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        LSL      r2,r2,#2
        MOV      r3,#0x4000000
        STR      r0,[r2,r3]
        LDR      r0,[r1,#0]
        ADD      r0,r0,#1
        STR      r0,[r1,#0]
        BX       lr
        ENDP

Sim_Judge PROC
|L2.2968|
        CMP      r0,#1
        BEQ      |L2.2996|
        CMP      r0,#0
        BNE      |L2.2996|
        MOV      r0,#0xebbe
        MOVT     r0,#0xebbe
        B        |L2.2928|
|L2.2996|
        MOV      r0,#0xadde
        MOVT     r0,#0xadde
        B        |L2.2928|
        ENDP

Sim_Stop PROC
|L2.3008|
        MOV      r0,#0x7f00000
        MOV      r1,#0
        STR      r1,[r0,#0]
        BX       lr
        ENDP

SupervisorCall_Handler PROC
|L2.3024|
        PUSH     {r11,lr}
        BL       |L2.3008|
|L2.3032|
        B        |L2.3032|
        ENDP

UndefinedInstruction_Handler PROC
|L2.3036|
        PUSH     {r11,lr}
        BL       |L2.3008|
|L2.3044|
        B        |L2.3044|
        ENDP

_sys_exit PROC
|L2.3048|
        B        |L2.3048|
        ENDP

main PROC
|L2.3052|
        PUSH     {r4-r7,r11,lr}
        BL       |L2.240|
        MOV      r6,#0
        MOV      r4,#1
        MOV      r0,#0
        MOV      r1,#1
        BL       |L2.1444|
        MOV      r7,#0x33a4
        MOVT     r7,#0x4000
        MOV      r5,#0x35e0
        MOVT     r5,#0x4000
|L2.3096|
        LDR      r0,[r7,r6,LSL #2]
        BLX      r0
        STR      r0,[r5,r6,LSL #2]
        CMP      r0,#1
        BEQ      |L2.3132|
        ADD      r6,r6,#1
        CMP      r6,#0xa
        BLS      |L2.3096|
        MOV      r4,#0
|L2.3132|
        BL       |L2.1568|
        BL       |L2.1668|
        CMP      r4,#0
        BEQ      |L2.3172|
        MOV      r6,#0
|L2.3152|
        LDR      r0,[r5,r6,LSL #2]
        BL       |L2.2928|
        ADD      r6,r6,#1
        CMP      r6,#0xb
        BNE      |L2.3152|
|L2.3172|
        MOV      r0,r4
        BL       |L2.2968|
        BL       |L2.3008|
|L2.3184|
        B        |L2.3184|
        ENDP

renesas_slave_rx PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#4
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x20b0
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.308|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.292|
        SUB      r10,r4,#0x8000
        MOVW     r1,#0x23c0
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1736|
        MOVW     r0,#0x8000
        MOVT     r0,#0xffff
        LDR      r1,[r4,r0]
        BIC      r1,r1,#8
        STR      r1,[r4,r0]
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1688|
        MOV      r0,r10
        BL       |L2.1720|
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.1408|
        MOV      r6,#0x8008
        MOVT     r6,#0xffff
|L2.3320|
        LDR      r0,[r4,r6]
        TST      r0,#1
        BEQ      |L2.3320|
        MOV      r0,r10
        MOV      r1,#1
        BL       |L2.1688|
        MOV      r7,#0x800c
        MOVT     r7,#0xe650
|L2.3352|
        LDR      r0,[r7,#0]
        TST      r0,#1
        BEQ      |L2.3352|
        LDR      r0,[r7,#-8]
        BIC      r0,r0,#1
        STR      r0,[r7,#-8]
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.260|
        MOV      r5,#1
        MOV      r8,#0x220c
        MOVT     r8,#0x4000
        MOV      r9,#0x3474
        MOVT     r9,#0x4000
|L2.3408|
        LDR      r0,[r7,#0]
        TST      r0,#8
        BEQ      |L2.3408|
        CMP      r5,#0xc
        BHI      |L2.3444|
        LDR      r1,[r8,r5,LSL #2]
        MOV      r0,r4
        BL       |L2.1400|
        B        |L2.3460|
|L2.3444|
        CMP      r5,#0xd
        BNE      |L2.3460|
        MOV      r0,r4
        BL       |L2.1428|
|L2.3460|
        MOV      r0,r4
        MOV      r1,#8
        BL       |L2.260|
|L2.3472|
        LDR      r0,[r7,#0]
        TST      r0,#4
        BEQ      |L2.3472|
        MOV      r0,r4
        MOV      r1,#4
        BL       |L2.260|
|L2.3496|
        LDR      r0,[r4,r6]
        TST      r0,#2
        BEQ      |L2.3496|
        ADD      r11,r9,r5,LSL #2
        MOV      r0,r10
        BL       |L2.2784|
        STR      r0,[r11,#-4]
        MOV      r0,r10
        MOV      r1,#2
        BL       |L2.1688|
        ADD      r5,r5,#1
        CMP      r5,#0xe
        BNE      |L2.3408|
|L2.3548|
        LDR      r0,[r4,r6]
        TST      r0,#0x10
        BEQ      |L2.3548|
        MOV      r0,r10
        MOV      r1,#0x10
        BL       |L2.1688|
|L2.3572|
        LDR      r0,[r7,#0]
        TST      r0,#0x10
        BEQ      |L2.3572|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.276|
        MOV      r0,r10
        BL       |L2.1704|
        MOV      r0,#0
|L2.3616|
        LDR      r1,[r8,r0,LSL #2]
        LDRB     r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.3656|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.3616|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.3656|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

renesas_slave_rx_fna PROC
        PUSH     {r4-r9,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        ADD      r8,r4,#0x8000
        MOVW     r1,#0x2080
        MOVT     r1,#0x4000
        MOV      r0,r8
        BL       |L2.308|
        MOV      r0,r8
        MVN      r1,#0
        BL       |L2.260|
        MOV      r0,r8
        BL       |L2.292|
        MOV      r1,#0x2390
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.1736|
        LDR      r0,[r4,#0]
        BIC      r0,r0,#8
        STR      r0,[r4,#0]
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1688|
        MOV      r0,r4
        BL       |L2.1720|
        MOV      r0,r8
        MOV      r1,#0x48
        BL       |L2.1408|
|L2.3780|
        LDR      r0,[r4,#8]
        TST      r0,#1
        BEQ      |L2.3780|
        MOV      r0,r4
        MOV      r1,#1
        BL       |L2.1688|
        MOV      r5,#0x800c
        MOVT     r5,#0xe650
|L2.3812|
        LDR      r0,[r5,#0]
        TST      r0,#1
        BEQ      |L2.3812|
        LDR      r0,[r5,#-8]
        BIC      r0,r0,#1
        STR      r0,[r5,#-8]
        MOV      r0,r8
        MOV      r1,#9
        BL       |L2.260|
        MOV      r6,#1
        MOV      r9,#0x21a4
        MOVT     r9,#0x4000
        MOV      r7,#0x340c
        MOVT     r7,#0x4000
|L2.3868|
        LDR      r0,[r5,#0]
        TST      r0,#8
        BEQ      |L2.3868|
        CMP      r6,#0xc
        BHI      |L2.3900|
        LDR      r1,[r9,r6,LSL #2]
        MOV      r0,r8
        BL       |L2.1400|
|L2.3900|
        MOV      r0,r8
        MOV      r1,#8
        BL       |L2.260|
|L2.3912|
        LDR      r0,[r5,#0]
        TST      r0,#4
        BEQ      |L2.3912|
        MOV      r0,r8
        MOV      r1,#4
        BL       |L2.260|
|L2.3936|
        LDR      r0,[r4,#8]
        TST      r0,#2
        BEQ      |L2.3936|
        CMP      r6,#0xb
        BHI      |L2.3968|
        MOV      r0,r4
        BL       |L2.2784|
        B        |L2.4008|
|L2.3968|
        UXTB     r0,r6
        CMP      r0,#0xd
        BEQ      |L2.4000|
        CMP      r0,#0xc
        BNE      |L2.4016|
        MOV      r0,r4
        BL       |L2.2792|
        B        |L2.4008|
|L2.4000|
        MOV      r0,r4
        BL       |L2.2776|
|L2.4008|
        ADD      r1,r7,r6,LSL #2
        STR      r0,[r1,#-4]
|L2.4016|
        MOV      r0,r4
        MOV      r1,#2
        BL       |L2.1688|
        ADD      r6,r6,#1
        CMP      r6,#0xe
        BNE      |L2.3868|
|L2.4040|
        LDR      r0,[r5,#0]
        TST      r0,#0x40
        BEQ      |L2.4040|
        MOV      r0,r8
        MOV      r1,#0x40
        BL       |L2.260|
|L2.4064|
        LDR      r0,[r4,#8]
        TST      r0,#0x10
        BEQ      |L2.4064|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.1688|
|L2.4088|
        LDR      r0,[r5,#0]
        TST      r0,#0x10
        BEQ      |L2.4088|
        MOV      r0,r8
        MOV      r1,#0x10
        BL       |L2.260|
        MOV      r0,r8
        BL       |L2.276|
        MOV      r0,r4
        BL       |L2.1704|
        MOV      r0,#0
|L2.4132|
        LDR      r1,[r9,#0]
        LDRB     r2,[r7,#0]
        CMP      r2,r1
        BNE      |L2.4180|
        ADD      r0,r0,#1
        ADD      r9,r9,#4
        ADD      r7,r7,#4
        UXTB     r1,r0
        CMP      r1,#0xc
        BLS      |L2.4132|
        MOV      r0,#0
        POP      {r4-r9,r11,pc}
|L2.4180|
        MOV      r0,#1
        POP      {r4-r9,r11,pc}
        ENDP

renesas_slave_rx_fna_sdbs PROC
        PUSH     {r4-r10,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x20e0
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.308|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.292|
        SUB      r8,r4,#0x8000
        MOV      r1,#0x23f0
        MOVT     r1,#0x4000
        MOV      r0,r8
        BL       |L2.1736|
        MOV      r0,r8
        MVN      r1,#0
        BL       |L2.1688|
        MOV      r0,r8
        BL       |L2.1720|
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.1408|
        MOV      r5,#0x8008
        MOVT     r5,#0xffff
|L2.4296|
        LDR      r0,[r4,r5]
        TST      r0,#1
        BEQ      |L2.4296|
        MOV      r0,r8
        MOV      r1,#1
        BL       |L2.1688|
        MOV      r6,#0x800c
        MOVT     r6,#0xe650
|L2.4328|
        LDR      r0,[r6,#0]
        TST      r0,#1
        BEQ      |L2.4328|
        LDR      r0,[r6,#-8]
        BIC      r0,r0,#1
        STR      r0,[r6,#-8]
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.260|
        MOV      r7,#1
        MOV      r9,#0x2274
        MOVT     r9,#0x4000
        MOV      r10,#0x34dc
        MOVT     r10,#0x4000
|L2.4384|
        LDR      r0,[r6,#0]
        TST      r0,#8
        BEQ      |L2.4384|
        CMP      r7,#0xc
        BHI      |L2.4416|
        LDR      r1,[r9,r7,LSL #2]
        MOV      r0,r4
        BL       |L2.1400|
|L2.4416|
        MOV      r0,r4
        MOV      r1,#8
        BL       |L2.260|
|L2.4428|
        LDR      r0,[r6,#0]
        TST      r0,#4
        BEQ      |L2.4428|
        MOV      r0,r4
        MOV      r1,#4
        BL       |L2.260|
|L2.4452|
        LDR      r0,[r4,r5]
        TST      r0,#2
        BEQ      |L2.4452|
        CMP      r7,#0xb
        BHI      |L2.4484|
        MOV      r0,r8
        BL       |L2.2784|
        B        |L2.4524|
|L2.4484|
        UXTB     r0,r7
        CMP      r0,#0xd
        BEQ      |L2.4516|
        CMP      r0,#0xc
        BNE      |L2.4532|
        MOV      r0,r8
        BL       |L2.2792|
        B        |L2.4524|
|L2.4516|
        MOV      r0,r8
        BL       |L2.2776|
|L2.4524|
        ADD      r1,r10,r7,LSL #2
        STR      r0,[r1,#-4]
|L2.4532|
        MOV      r0,r8
        MOV      r1,#2
        BL       |L2.1688|
        ADD      r7,r7,#1
        CMP      r7,#0xe
        BNE      |L2.4384|
|L2.4556|
        LDR      r0,[r6,#0]
        TST      r0,#0x40
        BEQ      |L2.4556|
        MOV      r0,r4
        MOV      r1,#0x40
        BL       |L2.260|
|L2.4580|
        LDR      r0,[r4,r5]
        TST      r0,#0x10
        BEQ      |L2.4580|
        MOV      r0,r8
        MOV      r1,#0x10
        BL       |L2.1688|
|L2.4604|
        LDR      r0,[r6,#0]
        TST      r0,#0x10
        BEQ      |L2.4604|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.276|
        MOV      r0,r8
        BL       |L2.1704|
        MOV      r0,#0
|L2.4648|
        LDR      r1,[r9,#0]
        LDRB     r2,[r10,#0]
        CMP      r2,r1
        BNE      |L2.4696|
        ADD      r0,r0,#1
        ADD      r9,r9,#4
        ADD      r10,r10,#4
        UXTB     r1,r0
        CMP      r1,#0xc
        BLS      |L2.4648|
        MOV      r0,#0
        POP      {r4-r10,pc}
|L2.4696|
        MOV      r0,#1
        POP      {r4-r10,pc}
        ENDP

renesas_slave_rx_sdbs PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#4
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x2158
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.308|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.292|
        SUB      r10,r4,#0x8000
        MOV      r1,#0x2468
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1736|
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1688|
        MOV      r0,r10
        BL       |L2.1720|
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.1408|
        MOV      r6,#0x8008
        MOVT     r6,#0xffff
|L2.4816|
        LDR      r0,[r4,r6]
        TST      r0,#1
        BEQ      |L2.4816|
        MOV      r0,r10
        MOV      r1,#1
        BL       |L2.1688|
        MOV      r7,#0x800c
        MOVT     r7,#0xe650
|L2.4848|
        LDR      r0,[r7,#0]
        TST      r0,#1
        BEQ      |L2.4848|
        LDR      r0,[r7,#-8]
        BIC      r0,r0,#1
        STR      r0,[r7,#-8]
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.260|
        MOV      r5,#1
        MOV      r8,#0x2344
        MOVT     r8,#0x4000
        MOV      r9,#0x35ac
        MOVT     r9,#0x4000
|L2.4904|
        LDR      r0,[r7,#0]
        TST      r0,#8
        BEQ      |L2.4904|
        CMP      r5,#0xc
        BHI      |L2.4940|
        LDR      r1,[r8,r5,LSL #2]
        MOV      r0,r4
        BL       |L2.1400|
        B        |L2.4956|
|L2.4940|
        CMP      r5,#0xd
        BNE      |L2.4956|
        MOV      r0,r4
        BL       |L2.1428|
|L2.4956|
        MOV      r0,r4
        MOV      r1,#8
        BL       |L2.260|
|L2.4968|
        LDR      r0,[r7,#0]
        TST      r0,#4
        BEQ      |L2.4968|
        MOV      r0,r4
        MOV      r1,#4
        BL       |L2.260|
|L2.4992|
        LDR      r0,[r4,r6]
        TST      r0,#2
        BEQ      |L2.4992|
        ADD      r11,r9,r5,LSL #2
        MOV      r0,r10
        BL       |L2.2784|
        STR      r0,[r11,#-4]
        MOV      r0,r10
        MOV      r1,#2
        BL       |L2.1688|
        ADD      r5,r5,#1
        CMP      r5,#0xe
        BNE      |L2.4904|
|L2.5044|
        LDR      r0,[r4,r6]
        TST      r0,#0x10
        BEQ      |L2.5044|
        MOV      r0,r10
        MOV      r1,#0x10
        BL       |L2.1688|
|L2.5068|
        LDR      r0,[r7,#0]
        TST      r0,#0x10
        BEQ      |L2.5068|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.276|
        MOV      r0,r10
        BL       |L2.1704|
        MOV      r0,#0
|L2.5112|
        LDR      r1,[r8,r0,LSL #2]
        LDRB     r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.5152|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.5112|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.5152|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

renesas_slave_tx PROC
        PUSH     {r4-r10,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x20f8
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.308|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.292|
        SUB      r10,r4,#0x8000
        MOV      r1,#0x2408
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1736|
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1688|
        MOV      r0,r10
        BL       |L2.1720|
        MOV      r0,r10
        MOV      r1,#0x48
        BL       |L2.2812|
        MOV      r0,r4
        BL       |L2.1384|
        MOV      r6,#0x8008
        MOVT     r6,#0xffff
|L2.5280|
        LDR      r0,[r4,r6]
        TST      r0,#1
        BEQ      |L2.5280|
        MOV      r0,r10
        MOV      r1,#1
        BL       |L2.1688|
        MOV      r7,#0x800c
        MOVT     r7,#0xe650
|L2.5312|
        LDR      r0,[r7,#0]
        TST      r0,#1
        BEQ      |L2.5312|
        LDR      r0,[r7,#-8]
        BIC      r0,r0,#1
        STR      r0,[r7,#-8]
        MOV      r0,r4
        MOV      r1,#3
        BL       |L2.260|
        MOV      r5,#1
        MOV      r8,#0x22a8
        MOVT     r8,#0x4000
        MOV      r9,#0x3510
        MOVT     r9,#0x4000
|L2.5368|
        LDR      r0,[r4,r6]
        TST      r0,#8
        BEQ      |L2.5368|
        CMP      r5,#0xc
        BHI      |L2.5400|
        LDRB     r1,[r8,r5,LSL #2]
        MOV      r0,r10
        BL       |L2.2812|
|L2.5400|
        MOV      r0,r10
        MOV      r1,#8
        BL       |L2.1688|
|L2.5412|
        LDR      r0,[r4,r6]
        TST      r0,#4
        BEQ      |L2.5412|
        MOV      r0,r10
        MOV      r1,#4
        BL       |L2.1688|
|L2.5436|
        LDR      r0,[r7,#0]
        TST      r0,#2
        BEQ      |L2.5436|
        CMP      r5,#0xb
        BHI      |L2.5468|
        MOV      r0,r4
        BL       |L2.1356|
        B        |L2.5504|
|L2.5468|
        CMP      r5,#0xd
        BEQ      |L2.5496|
        CMP      r5,#0xc
        BNE      |L2.5512|
        MOV      r0,r4
        BL       |L2.1364|
        B        |L2.5504|
|L2.5496|
        MOV      r0,r4
        BL       |L2.1348|
|L2.5504|
        ADD      r1,r9,r5,LSL #2
        STR      r0,[r1,#-4]
|L2.5512|
        MOV      r0,r4
        MOV      r1,#2
        BL       |L2.260|
        ADD      r5,r5,#1
        CMP      r5,#0xe
        BNE      |L2.5368|
|L2.5536|
        LDR      r0,[r4,r6]
        TST      r0,#0x10
        BEQ      |L2.5536|
        MOV      r0,r10
        MOV      r1,#0x10
        BL       |L2.1688|
|L2.5560|
        LDR      r0,[r7,#0]
        TST      r0,#0x10
        BEQ      |L2.5560|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.276|
        MOV      r0,r10
        BL       |L2.1704|
        MOV      r0,#0
|L2.5604|
        LDR      r1,[r8,r0,LSL #2]
        LDRB     r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.5640|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.5604|
        MOV      r0,#0
        POP      {r4-r10,pc}
|L2.5640|
        MOV      r0,#1
        POP      {r4-r10,pc}
        ENDP

slave_general_call PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#4
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x2068
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.308|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.292|
        SUB      r10,r4,#0x8000
        MOV      r1,#0x2378
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1736|
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1688|
        MOV      r0,r10
        BL       |L2.1720|
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.1408|
        MOV      r6,#0x8008
        MOVT     r6,#0xffff
|L2.5760|
        LDR      r0,[r4,r6]
        TST      r0,#1
        BEQ      |L2.5760|
        MOV      r0,r10
        MOV      r1,#1
        BL       |L2.1688|
        MOV      r7,#0x800c
        MOVT     r7,#0xe650
|L2.5792|
        LDR      r0,[r7,#0]
        TST      r0,#1
        BEQ      |L2.5792|
        LDR      r0,[r7,#-8]
        BIC      r0,r0,#1
        STR      r0,[r7,#-8]
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.260|
        MOV      r5,#1
        MOV      r8,#0x2170
        MOVT     r8,#0x4000
        MOV      r9,#0x33d8
        MOVT     r9,#0x4000
|L2.5848|
        LDR      r0,[r7,#0]
        TST      r0,#8
        BEQ      |L2.5848|
        CMP      r5,#0xc
        BHI      |L2.5884|
        LDR      r1,[r8,r5,LSL #2]
        MOV      r0,r4
        BL       |L2.1400|
        B        |L2.5892|
|L2.5884|
        MOV      r0,r4
        BL       |L2.1428|
|L2.5892|
        MOV      r0,r4
        MOV      r1,#8
        BL       |L2.260|
|L2.5904|
        LDR      r0,[r7,#0]
        TST      r0,#4
        BEQ      |L2.5904|
        MOV      r0,r4
        MOV      r1,#4
        BL       |L2.260|
|L2.5928|
        LDR      r0,[r4,r6]
        TST      r0,#2
        BEQ      |L2.5928|
        ADD      r11,r9,r5,LSL #2
        MOV      r0,r10
        BL       |L2.2784|
        STR      r0,[r11,#-4]
        MOV      r0,r10
        MOV      r1,#2
        BL       |L2.1688|
        ADD      r5,r5,#1
        CMP      r5,#0xe
        BNE      |L2.5848|
|L2.5980|
        LDR      r0,[r4,r6]
        TST      r0,#0x10
        BEQ      |L2.5980|
        MOV      r0,r10
        MOV      r1,#0x10
        BL       |L2.1688|
|L2.6004|
        LDR      r0,[r7,#0]
        TST      r0,#0x10
        BEQ      |L2.6004|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.276|
        MOV      r0,r10
        BL       |L2.1704|
        MOV      r0,#0
|L2.6048|
        LDR      r1,[r8,r0,LSL #2]
        LDRB     r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.6088|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.6048|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.6088|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

slave_nack_addr PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x2110
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.308|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.292|
        SUB      r5,r4,#0x8000
        MOV      r1,#0x2420
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1736|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1688|
        MOV      r0,r5
        BL       |L2.1720|
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.1408|
        MOV      r6,#0x800c
        MOVT     r6,#0xe650
|L2.6208|
        LDR      r0,[r6,#0]
        TST      r0,#1
        BEQ      |L2.6208|
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.260|
        LDR      r0,[r6,#-8]
        BIC      r0,r0,#1
        STR      r0,[r6,#-8]
|L2.6244|
        LDR      r0,[r6,#0]
        TST      r0,#0x40
        BEQ      |L2.6244|
        MOV      r0,r4
        MOV      r1,#0x40
        BL       |L2.260|
        MOV      r0,#0x8008
        MOVT     r0,#0xffff
|L2.6276|
        LDR      r1,[r4,r0]
        TST      r1,#0x10
        BEQ      |L2.6276|
        MOV      r0,r5
        MOV      r1,#0x10
        BL       |L2.1688|
|L2.6300|
        LDR      r0,[r6,#0]
        TST      r0,#0x10
        BEQ      |L2.6300|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.276|
        MOV      r0,r5
        BL       |L2.1704|
        MOV      r0,#0
        POP      {r4-r6,pc}
        ENDP

slave_rx PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#4
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOVW     r1,#0x2140
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.308|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.292|
        SUB      r10,r4,#0x8000
        MOV      r1,#0x2450
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1736|
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1688|
        MOV      r0,r10
        BL       |L2.1720|
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.1408|
        MOV      r6,#0x8008
        MOVT     r6,#0xffff
|L2.6460|
        LDR      r0,[r4,r6]
        TST      r0,#1
        BEQ      |L2.6460|
        MOV      r0,r10
        MOV      r1,#1
        BL       |L2.1688|
        MOV      r7,#0x800c
        MOVT     r7,#0xe650
|L2.6492|
        LDR      r0,[r7,#0]
        TST      r0,#1
        BEQ      |L2.6492|
        LDR      r0,[r7,#-8]
        BIC      r0,r0,#1
        STR      r0,[r7,#-8]
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.260|
        MOV      r5,#1
        MOV      r8,#0x2310
        MOVT     r8,#0x4000
        MOV      r9,#0x3578
        MOVT     r9,#0x4000
|L2.6548|
        LDR      r0,[r7,#0]
        TST      r0,#8
        BEQ      |L2.6548|
        CMP      r5,#0xc
        BHI      |L2.6584|
        LDR      r1,[r8,r5,LSL #2]
        MOV      r0,r4
        BL       |L2.1400|
        B        |L2.6592|
|L2.6584|
        MOV      r0,r4
        BL       |L2.1428|
|L2.6592|
        MOV      r0,r4
        MOV      r1,#8
        BL       |L2.260|
|L2.6604|
        LDR      r0,[r7,#0]
        TST      r0,#4
        BEQ      |L2.6604|
        MOV      r0,r4
        MOV      r1,#4
        BL       |L2.260|
|L2.6628|
        LDR      r0,[r4,r6]
        TST      r0,#2
        BEQ      |L2.6628|
        ADD      r11,r9,r5,LSL #2
        MOV      r0,r10
        BL       |L2.2784|
        STR      r0,[r11,#-4]
        MOV      r0,r10
        MOV      r1,#2
        BL       |L2.1688|
        ADD      r5,r5,#1
        CMP      r5,#0xe
        BNE      |L2.6548|
|L2.6680|
        LDR      r0,[r4,r6]
        TST      r0,#0x10
        BEQ      |L2.6680|
        MOV      r0,r10
        MOV      r1,#0x10
        BL       |L2.1688|
|L2.6704|
        LDR      r0,[r7,#0]
        TST      r0,#0x10
        BEQ      |L2.6704|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.276|
        MOV      r0,r10
        BL       |L2.1704|
        MOV      r0,#0
|L2.6748|
        LDR      r1,[r8,r0,LSL #2]
        LDRB     r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.6788|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.6748|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.6788|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

slave_rx_fna PROC
        PUSH     {r4-r10,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x2128
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.308|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.292|
        SUB      r10,r4,#0x8000
        MOV      r1,#0x2438
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1736|
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1688|
        MOV      r0,r10
        BL       |L2.1720|
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.1408|
        MOV      r6,#0x8008
        MOVT     r6,#0xffff
|L2.6908|
        LDR      r0,[r4,r6]
        TST      r0,#1
        BEQ      |L2.6908|
        MOV      r0,r10
        MOV      r1,#1
        BL       |L2.1688|
        MOV      r7,#0x800c
        MOVT     r7,#0xe650
|L2.6940|
        LDR      r0,[r7,#0]
        TST      r0,#1
        BEQ      |L2.6940|
        LDR      r0,[r7,#-8]
        BIC      r0,r0,#1
        STR      r0,[r7,#-8]
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.260|
        MOV      r5,#1
        MOV      r8,#0x22dc
        MOVT     r8,#0x4000
        MOV      r9,#0x3544
        MOVT     r9,#0x4000
|L2.6996|
        LDR      r0,[r7,#0]
        TST      r0,#8
        BEQ      |L2.6996|
        CMP      r5,#0xc
        BHI      |L2.7028|
        LDR      r1,[r8,r5,LSL #2]
        MOV      r0,r4
        BL       |L2.1400|
|L2.7028|
        MOV      r0,r4
        MOV      r1,#8
        BL       |L2.260|
|L2.7040|
        LDR      r0,[r7,#0]
        TST      r0,#4
        BEQ      |L2.7040|
        MOV      r0,r4
        MOV      r1,#4
        BL       |L2.260|
|L2.7064|
        LDR      r0,[r4,r6]
        TST      r0,#2
        BEQ      |L2.7064|
        CMP      r5,#0xb
        BHI      |L2.7096|
        MOV      r0,r10
        BL       |L2.2784|
        B        |L2.7132|
|L2.7096|
        CMP      r5,#0xd
        BEQ      |L2.7124|
        CMP      r5,#0xc
        BNE      |L2.7140|
        MOV      r0,r10
        BL       |L2.2792|
        B        |L2.7132|
|L2.7124|
        MOV      r0,r10
        BL       |L2.2776|
|L2.7132|
        ADD      r1,r9,r5,LSL #2
        STR      r0,[r1,#-4]
|L2.7140|
        MOV      r0,r10
        MOV      r1,#2
        BL       |L2.1688|
        ADD      r5,r5,#1
        CMP      r5,#0xe
        BNE      |L2.6996|
|L2.7164|
        LDR      r0,[r7,#0]
        TST      r0,#0x40
        BEQ      |L2.7164|
        MOV      r0,r4
        MOV      r1,#0x40
        BL       |L2.260|
|L2.7188|
        LDR      r0,[r4,r6]
        TST      r0,#0x10
        BEQ      |L2.7188|
        MOV      r0,r10
        MOV      r1,#0x10
        BL       |L2.1688|
|L2.7212|
        LDR      r0,[r7,#0]
        TST      r0,#0x10
        BEQ      |L2.7212|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.276|
        MOV      r0,r10
        BL       |L2.1704|
        MOV      r0,#0
|L2.7256|
        LDR      r1,[r8,r0,LSL #2]
        LDRB     r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.7292|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.7256|
        MOV      r0,#0
        POP      {r4-r10,pc}
|L2.7292|
        MOV      r0,#1
        POP      {r4-r10,pc}
        ENDP

slave_tx PROC
        PUSH     {r4-r10,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x2098
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.308|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.292|
        SUB      r10,r4,#0x8000
        MOV      r1,#0x23a8
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1736|
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1688|
        MOV      r0,r10
        BL       |L2.1720|
        MOV      r0,r10
        MOV      r1,#0x48
        BL       |L2.2812|
        MOV      r0,r4
        BL       |L2.1384|
        MOV      r6,#0x8008
        MOVT     r6,#0xffff
|L2.7416|
        LDR      r0,[r4,r6]
        TST      r0,#1
        BEQ      |L2.7416|
        MOV      r0,r10
        MOV      r1,#1
        BL       |L2.1688|
        MOV      r7,#0x800c
        MOVT     r7,#0xe650
|L2.7448|
        LDR      r0,[r7,#0]
        TST      r0,#1
        BEQ      |L2.7448|
        LDR      r0,[r7,#-8]
        BIC      r0,r0,#1
        STR      r0,[r7,#-8]
        MOV      r0,r4
        MOV      r1,#3
        BL       |L2.260|
        MOV      r5,#1
        MOV      r8,#0x21d8
        MOVT     r8,#0x4000
        MOVW     r9,#0x3440
        MOVT     r9,#0x4000
|L2.7504|
        LDR      r0,[r4,r6]
        TST      r0,#8
        BEQ      |L2.7504|
        CMP      r5,#0xc
        BHI      |L2.7536|
        LDRB     r1,[r8,r5,LSL #2]
        MOV      r0,r10
        BL       |L2.2812|
|L2.7536|
        MOV      r0,r10
        MOV      r1,#8
        BL       |L2.1688|
|L2.7548|
        LDR      r0,[r4,r6]
        TST      r0,#4
        BEQ      |L2.7548|
        MOV      r0,r10
        MOV      r1,#4
        BL       |L2.1688|
|L2.7572|
        LDR      r0,[r7,#0]
        TST      r0,#2
        BEQ      |L2.7572|
        CMP      r5,#0xb
        BHI      |L2.7604|
        MOV      r0,r4
        BL       |L2.1356|
        B        |L2.7640|
|L2.7604|
        CMP      r5,#0xd
        BEQ      |L2.7632|
        CMP      r5,#0xc
        BNE      |L2.7648|
        MOV      r0,r4
        BL       |L2.1364|
        B        |L2.7640|
|L2.7632|
        MOV      r0,r4
        BL       |L2.1348|
|L2.7640|
        ADD      r1,r9,r5,LSL #2
        STR      r0,[r1,#-4]
|L2.7648|
        MOV      r0,r4
        MOV      r1,#2
        BL       |L2.260|
        ADD      r5,r5,#1
        CMP      r5,#0xe
        BNE      |L2.7504|
|L2.7672|
        LDR      r0,[r4,r6]
        TST      r0,#0x10
        BEQ      |L2.7672|
        MOV      r0,r10
        MOV      r1,#0x10
        BL       |L2.1688|
|L2.7696|
        LDR      r0,[r7,#0]
        TST      r0,#0x10
        BEQ      |L2.7696|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.276|
        MOV      r0,r10
        BL       |L2.1704|
        MOV      r0,#0
|L2.7740|
        LDR      r1,[r8,r0,LSL #2]
        LDRB     r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.7776|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.7740|
        MOV      r0,#0
        POP      {r4-r10,pc}
|L2.7776|
        MOV      r0,#1
        POP      {r4-r10,pc}
        ENDP

slave_tx_delay PROC
        PUSH     {r4-r10,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x20c8
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.308|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.292|
        SUB      r10,r4,#0x8000
        MOV      r1,#0x23d8
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1736|
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1688|
        MOV      r0,r10
        BL       |L2.1720|
        MOV      r0,r10
        MOV      r1,#0x48
        BL       |L2.2812|
        MOV      r0,r4
        BL       |L2.1384|
        MOV      r6,#0x8008
        MOVT     r6,#0xffff
|L2.7900|
        LDR      r0,[r4,r6]
        TST      r0,#1
        BEQ      |L2.7900|
        MOV      r0,r10
        MOV      r1,#1
        BL       |L2.1688|
        MOV      r7,#0x800c
        MOVT     r7,#0xe650
|L2.7932|
        LDR      r0,[r7,#0]
        TST      r0,#1
        BEQ      |L2.7932|
        LDR      r0,[r7,#-8]
        BIC      r0,r0,#1
        STR      r0,[r7,#-8]
        MOV      r0,r4
        MOV      r1,#3
        BL       |L2.260|
        MOV      r5,#1
        MOVW     r8,#0x2240
        MOVT     r8,#0x4000
        MOV      r9,#0x34a8
        MOVT     r9,#0x4000
|L2.7988|
        LDR      r0,[r4,r6]
        TST      r0,#8
        BEQ      |L2.7988|
        CMP      r5,#0xc
        BHI      |L2.8020|
        LDRB     r1,[r8,r5,LSL #2]
        MOV      r0,r10
        BL       |L2.2812|
|L2.8020|
        MOV      r0,#0x14
        BL       |L2.2896|
        MOV      r0,r10
        MOV      r1,#8
        BL       |L2.1688|
|L2.8040|
        LDR      r0,[r4,r6]
        TST      r0,#4
        BEQ      |L2.8040|
        MOV      r0,r10
        MOV      r1,#4
        BL       |L2.1688|
|L2.8064|
        LDR      r0,[r7,#0]
        TST      r0,#2
        BEQ      |L2.8064|
        CMP      r5,#0xb
        BHI      |L2.8096|
        MOV      r0,r4
        BL       |L2.1356|
        B        |L2.8132|
|L2.8096|
        CMP      r5,#0xd
        BEQ      |L2.8124|
        CMP      r5,#0xc
        BNE      |L2.8140|
        MOV      r0,r4
        BL       |L2.1364|
        B        |L2.8132|
|L2.8124|
        MOV      r0,r4
        BL       |L2.1348|
|L2.8132|
        ADD      r1,r9,r5,LSL #2
        STR      r0,[r1,#-4]
|L2.8140|
        MOV      r0,r4
        MOV      r1,#2
        BL       |L2.260|
        ADD      r5,r5,#1
        CMP      r5,#0xe
        BNE      |L2.7988|
|L2.8164|
        LDR      r0,[r4,r6]
        TST      r0,#0x10
        BEQ      |L2.8164|
        MOV      r0,r10
        MOV      r1,#0x10
        BL       |L2.1688|
|L2.8188|
        LDR      r0,[r7,#0]
        TST      r0,#0x10
        BEQ      |L2.8188|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.260|
        MOV      r0,r4
        BL       |L2.276|
        MOV      r0,r10
        BL       |L2.1704|
        MOV      r0,#0
|L2.8232|
        LDR      r1,[r8,r0,LSL #2]
        LDRB     r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.8268|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.8232|
        MOV      r0,#0
        POP      {r4-r10,pc}
|L2.8268|
        MOV      r0,#1
        POP      {r4-r10,pc}
        ENDP

||$Ven$AA$L$$Reset_Handler|| PROC
|L2.8276|
        LDR      pc,|L2.8280|
|L2.8280|
        DCD      0x00000064
        ENDP

_fp_init PROC
|L2.8284|
        MOV      r0,#0x3000000
        VMSR     FPSCR,r0
__fplib_config_fpu_vfp                  ; Alternate entry point
__fplib_config_pureend_doubles                  ; Alternate entry point
        BX       lr
        ENDP

masterConfig
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.58|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.65|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.70|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.75|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.82|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.87|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.92|
        DCD      0x00000000
        DCD      0x00000052
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.96|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.101|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.108|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
sendData
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.60|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.67|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.72|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.77|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.84|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.89|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.98|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.103|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.110|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
slaveConfig
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.59|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.66|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.71|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.76|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.83|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.88|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.93|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.97|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.102|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.109|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005

        AREA ||area_number.3||, DATA, ALIGN=2

        EXPORTAS ||area_number.3||, ER10
GIC_intHandler
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
        DCD      0x400000b4
pattern
        DCD      0x400017d4
        DCD      0x40001610
        DCD      0x400018cc
        DCD      0x40001a90
        DCD      0x40001c84
        DCD      0x40001e68
        DCD      0x40000c74
        DCD      0x40000e54
        DCD      0x40001260
        DCD      0x4000105c
        DCD      0x4000142c

        AREA ||area_number.4||, DATA, NOINIT, ALIGN=2

        EXPORTAS ||area_number.4||, ER10
DumpOffset
        %        4
delayCount
        %        4
receivedData
        %        52
|symbol_number.61|
        %        52
|symbol_number.68|
        %        52
|symbol_number.73|
        %        52
|symbol_number.78|
        %        52
|symbol_number.85|
        %        52
|symbol_number.90|
        %        52
|symbol_number.99|
        %        52
|symbol_number.104|
        %        52
|symbol_number.111|
        %        52
result
        %        44

        AREA ARM_LIB_STACK, DATA, NOINIT, ALIGN=0

        %        1024

||Image$$ARM_LIB_HEAP$$ZI$$Base|| EQU 1073755660
||Image$$ARM_LIB_HEAP$$ZI$$Limit|| EQU 1073755660
||Image$$ARM_LIB_STACK$$ZI$$Limit|| EQU 1879048192

        EXPORT ||Image$$ARM_LIB_HEAP$$ZI$$Base||
        EXPORT ||Image$$ARM_LIB_HEAP$$ZI$$Limit||
        EXPORT ||Image$$ARM_LIB_STACK$$ZI$$Limit||
        EXPORT Reset_Handler [CODE]
        EXPORT __main [CODE]
        EXPORT __scatterload [CODE]
        EXPORT __scatterload_rt2 [CODE]
        EXPORT __scatterload_null [CODE]
        EXPORT __scatterload_zeroinit [CODE]
        EXPORT ddr_init_start [CODE]
        EXPORT __mpu_init [CODE]
        EXPORT ddr_init_end [DATA]
        EXPORT __mpu_init_el1 [CODE]
        EXPORT ||$Ven$AA$L$$UndefinedInstruction_Handler|| [CODE]
        EXPORT ||$Ven$AA$L$$SupervisorCall_Handler|| [CODE]
        EXPORT ||$Ven$AA$L$$PrefetchAbort_Handler|| [CODE]
        EXPORT ||$Ven$AA$L$$DataAbort_Handler|| [CODE]
        EXPORT ||$Ven$AA$L$$IRQ_Handler|| [CODE]
        EXPORT ||$Ven$AT$L$$__rt_entry|| [CODE]
        EXPORT ||Region$$Table$$Base||
        EXPORT ||Region$$Table$$Limit||
        EXPORT vectors_start [CODE]
        EXPORT __rt_lib_init [CODE,DYNAMIC]
        EXPORT __rt_lib_init_fp_1 [CODE]
        EXPORT __rt_lib_init_alloca_1 [CODE]
        EXPORT __rt_lib_init_argv_1 [CODE]
        EXPORT __rt_lib_init_atexit_1 [CODE]
        EXPORT __rt_lib_init_clock_1 [CODE]
        EXPORT __rt_lib_init_cpp_1 [CODE]
        EXPORT __rt_lib_init_exceptions_1 [CODE]
        EXPORT __rt_lib_init_fp_trap_1 [CODE]
        EXPORT __rt_lib_init_getenv_1 [CODE]
        EXPORT __rt_lib_init_heap_1 [CODE]
        EXPORT __rt_lib_init_lc_collate_1 [CODE]
        EXPORT __rt_lib_init_lc_ctype_1 [CODE]
        EXPORT __rt_lib_init_lc_monetary_1 [CODE]
        EXPORT __rt_lib_init_lc_numeric_1 [CODE]
        EXPORT __rt_lib_init_lc_time_1 [CODE]
        EXPORT __rt_lib_init_preinit_1 [CODE]
        EXPORT __rt_lib_init_rand_1 [CODE]
        EXPORT __rt_lib_init_return [CODE]
        EXPORT __rt_lib_init_signal_1 [CODE]
        EXPORT __rt_lib_init_stdio_1 [CODE]
        EXPORT __rt_lib_init_user_alloc_1 [CODE]
        EXPORT __rt_lib_shutdown [CODE,DYNAMIC]
        EXPORT __rt_lib_shutdown_cpp_1 [CODE]
        EXPORT __rt_lib_shutdown_fp_trap_1 [CODE]
        EXPORT __rt_lib_shutdown_heap_1 [CODE]
        EXPORT __rt_lib_shutdown_return [CODE]
        EXPORT __rt_lib_shutdown_signal_1 [CODE]
        EXPORT __rt_lib_shutdown_stdio_1 [CODE]
        EXPORT __rt_lib_shutdown_user_alloc_1 [CODE]
        EXPORT __rt_entry [CODE]
        EXPORT __rt_entry_presh_1 [CODE]
        EXPORT __rt_entry_sh [CODE]
        EXPORT __rt_entry_li [CODE]
        EXPORT __rt_entry_postsh_1 [CODE]
        EXPORT __rt_entry_main [CODE]
        EXPORT __rt_entry_postli_1 [CODE]
        EXPORT __rt_exit [CODE,DYNAMIC]
        EXPORT __rt_exit_ls [CODE]
        EXPORT __rt_exit_prels_1 [CODE]
        EXPORT __rt_exit_exit [CODE]
        EXPORT ||__I$use$semihosting|| [CODE,DYNAMIC]
        EXPORT __use_no_semihosting_swi [CODE]
        EXPORT exit [CODE,DYNAMIC]
        EXPORT DataAbort_Handler [CODE]
        EXPORT GIC_defaultHandler [CODE]
        EXPORT GIC_endInterrupt [CODE]
        EXPORT GIC_executeInterruptHandler [CODE]
        EXPORT GIC_getACKID [CODE]
        EXPORT I2C_configPins [CODE]
        EXPORT I2C_masterClearInterruptStatus [CODE]
        EXPORT I2C_masterDisable [CODE]
        EXPORT I2C_masterEnable [CODE]
        EXPORT I2C_masterInit [CODE]
        EXPORT I2C_masterReceiveMultipleByteFinish [CODE]
        EXPORT I2C_masterReceiveMultipleByteNext [CODE]
        EXPORT I2C_masterReceiveMultipleByteStop [CODE]
        EXPORT I2C_masterReceiveStart [CODE]
        EXPORT I2C_masterSendMultipleByteNext [CODE]
        EXPORT I2C_masterSendMultipleByteStart [CODE]
        EXPORT I2C_masterSendMultipleByteStop [CODE]
        EXPORT I2C_modelConnect [CODE]
        EXPORT I2C_modelDisable [CODE]
        EXPORT I2C_releasePins [CODE]
        EXPORT I2C_slaveClearInterruptStatus [CODE]
        EXPORT I2C_slaveDisable [CODE]
        EXPORT I2C_slaveEnable [CODE]
        EXPORT I2C_slaveInit [CODE]
        EXPORT I2C_slaveReceiveMultipleByteFinish [CODE]
        EXPORT I2C_slaveReceiveMultipleByteNext [CODE]
        EXPORT I2C_slaveReceiveMultipleByteStop [CODE]
        EXPORT I2C_slaveSetData [CODE]
        EXPORT IRQ_Handler [CODE]
        EXPORT PFC_ClearMultipleBit [CODE]
        EXPORT PFC_SetMultipleBit [CODE]
        EXPORT PrefetchAbort_Handler [CODE]
        EXPORT Sim_Delay [CODE]
        EXPORT Sim_Dump [CODE]
        EXPORT Sim_Judge [CODE]
        EXPORT Sim_Stop [CODE]
        EXPORT SupervisorCall_Handler [CODE]
        EXPORT UndefinedInstruction_Handler [CODE]
        EXPORT _sys_exit [CODE]
        EXPORT main [CODE]
        EXPORT renesas_slave_rx [CODE]
        EXPORT renesas_slave_rx_fna [CODE]
        EXPORT renesas_slave_rx_fna_sdbs [CODE]
        EXPORT renesas_slave_rx_sdbs [CODE]
        EXPORT renesas_slave_tx [CODE]
        EXPORT slave_general_call [CODE]
        EXPORT slave_nack_addr [CODE]
        EXPORT slave_rx [CODE]
        EXPORT slave_rx_fna [CODE]
        EXPORT slave_tx [CODE]
        EXPORT slave_tx_delay [CODE]
        EXPORT ||$Ven$AA$L$$Reset_Handler|| [CODE]
        EXPORT _fp_init [CODE,DYNAMIC]
        EXPORT __fplib_config_fpu_vfp [CODE,DYNAMIC]
        EXPORT __fplib_config_pureend_doubles [CODE,DYNAMIC]
        EXPORT GIC_intHandler [DATA,SIZE=3876]
        EXPORT pattern [DATA,SIZE=44]
        EXPORT DumpOffset [DATA,SIZE=4]
        EXPORT delayCount [DATA,SIZE=4]
        EXPORT result [DATA,SIZE=44]

        KEEP RST_EXC
        KEEP UDF_EXC
        KEEP SVC_EXC
        KEEP PAB_EXC
        KEEP DAB_EXC
        KEEP IRQ_EXC
        KEEP masterConfig
        KEEP slaveConfig
        KEEP sendData
        KEEP |symbol_number.58|
        EXPORTAS |symbol_number.58|, masterConfig
        KEEP |symbol_number.59|
        EXPORTAS |symbol_number.59|, slaveConfig
        KEEP |symbol_number.60|
        EXPORTAS |symbol_number.60|, sendData
        KEEP |symbol_number.65|
        EXPORTAS |symbol_number.65|, masterConfig
        KEEP |symbol_number.66|
        EXPORTAS |symbol_number.66|, slaveConfig
        KEEP |symbol_number.67|
        EXPORTAS |symbol_number.67|, sendData
        KEEP |symbol_number.70|
        EXPORTAS |symbol_number.70|, masterConfig
        KEEP |symbol_number.71|
        EXPORTAS |symbol_number.71|, slaveConfig
        KEEP |symbol_number.72|
        EXPORTAS |symbol_number.72|, sendData
        KEEP |symbol_number.75|
        EXPORTAS |symbol_number.75|, masterConfig
        KEEP |symbol_number.76|
        EXPORTAS |symbol_number.76|, slaveConfig
        KEEP |symbol_number.77|
        EXPORTAS |symbol_number.77|, sendData
        KEEP |symbol_number.82|
        EXPORTAS |symbol_number.82|, masterConfig
        KEEP |symbol_number.83|
        EXPORTAS |symbol_number.83|, slaveConfig
        KEEP |symbol_number.84|
        EXPORTAS |symbol_number.84|, sendData
        KEEP |symbol_number.87|
        EXPORTAS |symbol_number.87|, masterConfig
        KEEP |symbol_number.88|
        EXPORTAS |symbol_number.88|, slaveConfig
        KEEP |symbol_number.89|
        EXPORTAS |symbol_number.89|, sendData
        KEEP |symbol_number.92|
        EXPORTAS |symbol_number.92|, masterConfig
        KEEP |symbol_number.93|
        EXPORTAS |symbol_number.93|, slaveConfig
        KEEP |symbol_number.96|
        EXPORTAS |symbol_number.96|, masterConfig
        KEEP |symbol_number.97|
        EXPORTAS |symbol_number.97|, slaveConfig
        KEEP |symbol_number.98|
        EXPORTAS |symbol_number.98|, sendData
        KEEP |symbol_number.101|
        EXPORTAS |symbol_number.101|, masterConfig
        KEEP |symbol_number.102|
        EXPORTAS |symbol_number.102|, slaveConfig
        KEEP |symbol_number.103|
        EXPORTAS |symbol_number.103|, sendData
        KEEP |symbol_number.108|
        EXPORTAS |symbol_number.108|, masterConfig
        KEEP |symbol_number.109|
        EXPORTAS |symbol_number.109|, slaveConfig
        KEEP |symbol_number.110|
        EXPORTAS |symbol_number.110|, sendData
        KEEP RST_EXC_VECTORS
        KEEP UDF_EXC_VECTORS
        KEEP SVC_EXC_VECTORS
        KEEP PAB_EXC_VECTORS
        KEEP DAB_EXC_VECTORS
        KEEP IRQ_EXC_VECTORS
        KEEP __lit__00000000
        KEEP receivedData
        KEEP |symbol_number.61|
        EXPORTAS |symbol_number.61|, receivedData
        KEEP |symbol_number.68|
        EXPORTAS |symbol_number.68|, receivedData
        KEEP |symbol_number.73|
        EXPORTAS |symbol_number.73|, receivedData
        KEEP |symbol_number.78|
        EXPORTAS |symbol_number.78|, receivedData
        KEEP |symbol_number.85|
        EXPORTAS |symbol_number.85|, receivedData
        KEEP |symbol_number.90|
        EXPORTAS |symbol_number.90|, receivedData
        KEEP |symbol_number.99|
        EXPORTAS |symbol_number.99|, receivedData
        KEEP |symbol_number.104|
        EXPORTAS |symbol_number.104|, receivedData
        KEEP |symbol_number.111|
        EXPORTAS |symbol_number.111|, receivedData

        ATTR FILESCOPE
        ATTR SETVALUE Tag_ABI_PCS_wchar_t,4
        ATTR SETVALUE Tag_ABI_enum_size,2
        ATTR SETVALUE Tag_ABI_optimization_goals,2
        ATTR SETVALUE AV,6,1
        ATTR SETVALUE AV,10,1

        ASSERT {ENDIAN} = "little"
        ASSERT {INTER} = {TRUE}
        ASSERT {ROPI} = {TRUE}
        ASSERT {RWPI} = {FALSE}
        ASSERT {IEEE_FULL} = {FALSE}
        ASSERT {IEEE_PART} = {FALSE}
        ASSERT {IEEE_JAVA} = {FALSE}
        END
