        ARM
        REQUIRE8
        PRESERVE8

        AREA ER00, CODE, READONLY, ALIGN=2

        B        |L1.112|
        B        |L1.32|
        B        |L1.48|
        B        |L1.64|
        B        |L1.80|
        NOP      
        B        |L1.96|
|L1.28|
        B        |L1.28|
|L1.32|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L1.5052|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L1.48|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L1.5060|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L1.64|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L1.5068|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L1.80|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L1.5076|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L1.96|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L1.5084|
        POP      {r0-r3,r10-r12,lr}
        ERET     
Reset_Handler                  ; Alternate entry point
|L1.112|
        BL       |L1.4584|
        MOV      r0,#0xf00000
        MCR      p15,#0x0,r0,c1,c0,#2
        MOV      r3,#0
        MOVT     r3,#0x4000
        VMSR     FPEXC,r3
        LDR      r0,|L1.3408|
        MCR      p15,#0x4,r0,c12,c0,#0
        MCR      p15,#0x0,r0,c12,c0,#0
        MOV      r0,#0
        MOVT     r0,#0xe730
        LDR      r1,|L1.3412|
        STR      r1,[r0,#0]
        MOV      r1,#0
        MOVT     r1,#0xe630
        LDR      r2,|L1.3412|
        ADD      r1,r1,r2
        STR      r1,[r0,#4]
        LDR      r1,|L1.3416|
        LDR      r2,|L1.3412|
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
|L1.244|
        LDR      r3,[r0,#8]
        LDR      r1,[r0,#0xc]
        MOV      r2,#2
        AND      r1,r1,r2
        CMP      r1,r2
        BNE      |L1.244|
        MOV      r2,#3
        MVN      r2,r2
        AND      r1,r1,r2
        STR      r1,[r0,#0xc]
        MOV      r0,#0
        MOVT     r0,#0xe735
        MOV      r1,#0
        STR      r1,[r0,#0x60]
        LDR      r0,|L1.3420|
        MOV      pc,r0
__ddr_init_start                  ; Alternate entry point
        LDR      r0,|L1.3432|
        LDR      r1,[r0,#0]
        BIC      r1,r1,#0x18
        MVN      r2,r1
        LDR      r0,|L1.3436|
        STR      r2,[r0,#0]
        LDR      r0,|L1.3440|
        STR      r1,[r0,#0]
        LDR      r0,|L1.3432|
        LDR      r1,[r0,#0]
        MOV      r0,#0x10
|L1.352|
        SUB      r0,r0,#1
        CMP      r0,#0
        BNE      |L1.352|
        B        |L1.420|
        NOP      
        MOV      r4,#0x3fff
        AND      r1,r1,r4
        STR      r1,[r2,#0]
        STR      r0,[r3,#0]
|L1.388|
        LDR      r0,[r2,#0]
        MOV      r4,#0x8000
        AND      r0,r0,r4
        CMP      r0,r4
        BNE      |L1.388|
        ORR      r1,r1,r4
        STR      r1,[r2,#0]
        BX       lr
|L1.420|
        MOV      r0,#0x1234
        LDR      r1,|L1.3444|
        STR      r0,[r1,#0]
        MOV      r0,#0x1234
        LDR      r1,|L1.3448|
        STR      r0,[r1,#0]
        MOV      r0,#0xa
        LDR      r1,|L1.3452|
        STR      r0,[r1,#0]
        MOV      r0,#0xa
        LDR      r1,|L1.3456|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3464|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3468|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3472|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3476|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3480|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3484|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3488|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3492|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3496|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3500|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3504|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3508|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3512|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3516|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3520|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.3524|
        STR      r0,[r1,#0]
        MOV      r0,#0
        LDR      r1,|L1.3528|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.3532|
        STR      r0,[r1,#0]
        MOV      r0,#0x28
        LDR      r1,|L1.3536|
        STR      r0,[r1,#0]
        MOV      r0,#0x12
        LDR      r1,|L1.3540|
        STR      r0,[r1,#0]
        MOV      r0,#0x27
        LDR      r1,|L1.3544|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3548|
        LDR      r1,|L1.3552|
        STR      r0,[r1,#0]
        MOV      r0,#0x87
        LDR      r1,|L1.3556|
        STR      r0,[r1,#0]
        MOV      r0,#0x5a
        LDR      r1,|L1.3560|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3564|
        LDR      r1,|L1.3568|
        STR      r0,[r1,#0]
        MOV      r0,#0x40
        LDR      r1,|L1.3572|
        STR      r0,[r1,#0]
        MOV      r0,#0x10
        LDR      r1,|L1.3576|
        STR      r0,[r1,#0]
        MOV      r0,#0x29
        LDR      r1,|L1.3580|
        STR      r0,[r1,#0]
        MOV      r0,#0x29
        LDR      r1,|L1.3584|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3588|
        LDR      r1,|L1.3592|
        STR      r0,[r1,#0]
        MOVW     r0,#0x116
        LDR      r1,|L1.3596|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3600|
        LDR      r1,|L1.3604|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3608|
        LDR      r1,|L1.3612|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3616|
        LDR      r1,|L1.3620|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3624|
        LDR      r1,|L1.3628|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3632|
        LDR      r1,|L1.3636|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3640|
        LDR      r1,|L1.3644|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3648|
        LDR      r1,|L1.3652|
        STR      r0,[r1,#0]
        MOV      r0,#3
        LDR      r1,|L1.3656|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.3660|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.3664|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.3668|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.3672|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.3676|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.3680|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3684|
        LDR      r1,|L1.3688|
        STR      r0,[r1,#0]
        MOV      r0,#0x1c4
        LDR      r1,|L1.3692|
        STR      r0,[r1,#0]
        MOV      r0,#3
        LDR      r1,|L1.3696|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3700|
        LDR      r1,|L1.3704|
        STR      r0,[r1,#0]
        MOV      r0,#0x1010
        LDR      r1,|L1.3708|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.3712|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3716|
        LDR      r1,|L1.3720|
        STR      r0,[r1,#0]
        MOV      r0,#0x1834
        LDR      r1,|L1.3724|
        STR      r0,[r1,#0]
        MVN      r0,#0
        LDR      r1,|L1.3728|
        STR      r0,[r1,#0]
        MOV      r0,#0x480
        LDR      r1,|L1.3732|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.3736|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.3740|
        STR      r0,[r1,#0]
        MOV      r0,#0x600
        LDR      r1,|L1.3744|
        STR      r0,[r1,#0]
        MOV      r0,#0x480
        LDR      r1,|L1.3748|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.3752|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.3756|
        STR      r0,[r1,#0]
        MOV      r0,#0x400
        LDR      r1,|L1.3760|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.3764|
        STR      r0,[r1,#0]
        MOV      r0,#0x200
        LDR      r1,|L1.3768|
        STR      r0,[r1,#0]
        MOV      r0,#0x100
        LDR      r1,|L1.3772|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.3776|
        STR      r0,[r1,#0]
        MOV      r0,#0x240
        LDR      r1,|L1.3780|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.3784|
        STR      r0,[r1,#0]
        MOV      r0,#0xc0
        LDR      r1,|L1.3788|
        STR      r0,[r1,#0]
        MOV      r0,#0x200
        LDR      r1,|L1.3792|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.3796|
        STR      r0,[r1,#0]
        MOV      r0,#0x100
        LDR      r1,|L1.3800|
        STR      r0,[r1,#0]
        MOV      r0,#0x80
        LDR      r1,|L1.3804|
        STR      r0,[r1,#0]
        MOV      r0,#0x100
        LDR      r1,|L1.3808|
        STR      r0,[r1,#0]
        MOV      r0,#0xc0
        LDR      r1,|L1.3812|
        STR      r0,[r1,#0]
        MOV      r0,#0x80
        LDR      r1,|L1.3816|
        STR      r0,[r1,#0]
        MOV      r0,#0x40
        LDR      r1,|L1.3820|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3824|
        LDR      r1,|L1.3828|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3832|
        LDR      r1,|L1.3836|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3840|
        LDR      r1,|L1.3844|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.3848|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.3852|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.3856|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.3860|
        STR      r0,[r1,#0]
        MOV      r0,#0x41
        LDR      r1,|L1.3864|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.3868|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.3872|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.3876|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.3880|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.3884|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.3888|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.3892|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.3896|
        STR      r0,[r1,#0]
        MOV      r6,#1
|L1.1588|
        LDR      r0,|L1.3900|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.1588|
        LDR      r0,|L1.3904|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.1588|
        LDR      r0,|L1.3908|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.1588|
        LDR      r0,|L1.3912|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.1588|
        LDR      r0,|L1.3848|
        LDR      r0,|L1.3916|
        LDR      r1,|L1.3920|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3924|
        LDR      r1,|L1.3920|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3928|
        LDR      r1,|L1.3920|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3932|
        LDR      r1,|L1.3920|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3936|
        LDR      r1,|L1.3920|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3940|
        LDR      r1,|L1.3920|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3944|
        LDR      r1,|L1.3920|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3948|
        LDR      r1,|L1.3920|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3952|
        LDR      r1,|L1.3956|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3960|
        LDR      r1,|L1.3964|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3968|
        LDR      r1,|L1.3972|
        STR      r0,[r1,#0]
        MOV      r0,#0x10000
        LDR      r1,|L1.3976|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.3980|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.3984|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.3988|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.3992|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.3996|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4000|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4004|
        STR      r0,[r1,#0]
        MOV      r0,#0
        LDR      r1,|L1.4008|
        STR      r0,[r1,#0]
        MOV      r0,#0x1234
        LDR      r1,|L1.4012|
        STR      r0,[r1,#0]
        MOV      r0,#0x1234
        LDR      r1,|L1.4016|
        STR      r0,[r1,#0]
        MOV      r0,#0xa
        LDR      r1,|L1.4020|
        STR      r0,[r1,#0]
        MOV      r0,#0xa
        LDR      r1,|L1.4024|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4028|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4032|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4036|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4040|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4044|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4048|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4052|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4056|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4060|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4064|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4068|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4072|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4076|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4080|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4084|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3460|
        LDR      r1,|L1.4088|
        STR      r0,[r1,#0]
        MOV      r0,#0
        LDR      r1,|L1.4092|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4096|
        STR      r0,[r1,#0]
        MOV      r0,#0x28
        LDR      r1,|L1.4100|
        STR      r0,[r1,#0]
        MOV      r0,#0x12
        LDR      r1,|L1.4104|
        STR      r0,[r1,#0]
        MOV      r0,#0x27
        LDR      r1,|L1.4108|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3548|
        LDR      r1,|L1.4112|
        STR      r0,[r1,#0]
        MOV      r0,#0x87
        LDR      r1,|L1.4116|
        STR      r0,[r1,#0]
        MOV      r0,#0x5a
        LDR      r1,|L1.4120|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3564|
        LDR      r1,|L1.4124|
        STR      r0,[r1,#0]
        MOV      r0,#0x40
        LDR      r1,|L1.4128|
        STR      r0,[r1,#0]
        MOV      r0,#0x10
        LDR      r1,|L1.4132|
        STR      r0,[r1,#0]
        MOV      r0,#0x29
        LDR      r1,|L1.4136|
        STR      r0,[r1,#0]
        MOV      r0,#0x29
        LDR      r1,|L1.4140|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3588|
        LDR      r1,|L1.4144|
        STR      r0,[r1,#0]
        MOVW     r0,#0x116
        LDR      r1,|L1.4148|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3600|
        LDR      r1,|L1.4152|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3608|
        LDR      r1,|L1.4156|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3616|
        LDR      r1,|L1.4160|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3624|
        LDR      r1,|L1.4164|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3632|
        LDR      r1,|L1.4168|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3640|
        LDR      r1,|L1.4172|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3648|
        LDR      r1,|L1.4176|
        STR      r0,[r1,#0]
        MOV      r0,#3
        LDR      r1,|L1.4180|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.4184|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.4188|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.4192|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.4196|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.4200|
        STR      r0,[r1,#0]
        MOV      r0,#0x4444
        LDR      r1,|L1.4204|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3684|
        LDR      r1,|L1.4208|
        STR      r0,[r1,#0]
        MOV      r0,#0x1c4
        LDR      r1,|L1.4212|
        STR      r0,[r1,#0]
        MOV      r0,#3
        LDR      r1,|L1.4216|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3700|
        LDR      r1,|L1.4220|
        STR      r0,[r1,#0]
        MOV      r0,#0x1010
        LDR      r1,|L1.4224|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4228|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3716|
        LDR      r1,|L1.4232|
        STR      r0,[r1,#0]
        MOV      r0,#0x1834
        LDR      r1,|L1.4236|
        STR      r0,[r1,#0]
        MVN      r0,#0
        LDR      r1,|L1.4240|
        STR      r0,[r1,#0]
        MOV      r0,#0x480
        LDR      r1,|L1.4244|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.4248|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.4252|
        STR      r0,[r1,#0]
        MOV      r0,#0x600
        LDR      r1,|L1.4256|
        STR      r0,[r1,#0]
        MOV      r0,#0x480
        LDR      r1,|L1.4260|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.4264|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.4268|
        STR      r0,[r1,#0]
        MOV      r0,#0x400
        LDR      r1,|L1.4272|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.4276|
        STR      r0,[r1,#0]
        MOV      r0,#0x200
        LDR      r1,|L1.4280|
        STR      r0,[r1,#0]
        MOV      r0,#0x100
        LDR      r1,|L1.4284|
        STR      r0,[r1,#0]
        MOV      r0,#0x300
        LDR      r1,|L1.4288|
        STR      r0,[r1,#0]
        MOV      r0,#0x240
        LDR      r1,|L1.4292|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.4296|
        STR      r0,[r1,#0]
        MOV      r0,#0xc0
        LDR      r1,|L1.4300|
        STR      r0,[r1,#0]
        MOV      r0,#0x200
        LDR      r1,|L1.4304|
        STR      r0,[r1,#0]
        MOV      r0,#0x180
        LDR      r1,|L1.4308|
        STR      r0,[r1,#0]
        MOV      r0,#0x100
        LDR      r1,|L1.4312|
        STR      r0,[r1,#0]
        MOV      r0,#0x80
        LDR      r1,|L1.4316|
        STR      r0,[r1,#0]
        MOV      r0,#0x100
        LDR      r1,|L1.4320|
        STR      r0,[r1,#0]
        MOV      r0,#0xc0
        LDR      r1,|L1.4324|
        STR      r0,[r1,#0]
        MOV      r0,#0x80
        LDR      r1,|L1.4328|
        STR      r0,[r1,#0]
        MOV      r0,#0x40
        LDR      r1,|L1.4332|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3824|
        LDR      r1,|L1.4336|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3832|
        LDR      r1,|L1.4340|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3840|
        LDR      r1,|L1.4344|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4348|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.4352|
        STR      r0,[r1,#0]
        MOV      r0,#2
        LDR      r1,|L1.4356|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4360|
        STR      r0,[r1,#0]
        MOV      r0,#0x41
        LDR      r1,|L1.4364|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.4368|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.4372|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.4376|
        STR      r0,[r1,#0]
        MOV      r0,#0x11
        LDR      r1,|L1.4380|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.4384|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.4388|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.4392|
        STR      r0,[r1,#0]
        MOV      r0,#0xcf01
        LDR      r1,|L1.4396|
        STR      r0,[r1,#0]
        MOV      r6,#1
|L1.3080|
        LDR      r0,|L1.4400|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.3080|
        LDR      r0,|L1.4404|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.3080|
        LDR      r0,|L1.4408|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.3080|
        LDR      r0,|L1.4412|
        LDR      r7,[r0,#0]
        AND      r7,r6,r7
        CMP      r6,r7
        BNE      |L1.3080|
        LDR      r0,|L1.4348|
        LDR      r0,|L1.3916|
        LDR      r1,|L1.4416|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3924|
        LDR      r1,|L1.4416|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3928|
        LDR      r1,|L1.4416|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3932|
        LDR      r1,|L1.4416|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3936|
        LDR      r1,|L1.4416|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3940|
        LDR      r1,|L1.4416|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3944|
        LDR      r1,|L1.4416|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3948|
        LDR      r1,|L1.4416|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3952|
        LDR      r1,|L1.4420|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3960|
        LDR      r1,|L1.4424|
        STR      r0,[r1,#0]
        LDR      r0,|L1.3968|
        LDR      r1,|L1.4428|
        STR      r0,[r1,#0]
        MOV      r0,#0x10000
        LDR      r1,|L1.4432|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4436|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.4440|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.4444|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.4448|
        STR      r0,[r1,#0]
        MOV      r0,#0xa55a
        LDR      r1,|L1.4452|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4456|
        STR      r0,[r1,#0]
        MOV      r0,#1
        LDR      r1,|L1.4004|
        STR      r0,[r1,#0]
        MOV      r0,#0
        LDR      r1,|L1.4008|
        STR      r0,[r1,#0]
        B        |L1.4460|
|L1.3408|
        DCD      0x40000000
|L1.3412|
        DCD      0x00000134
|L1.3416|
        DCD      0x00001174
|L1.3420|
        DCD      0xe6300134
        DCD      0x00000000
        DCD      0x00000000
|L1.3432|
        DCD      0xe6152e10
|L1.3436|
        DCD      0xe6150000
|L1.3440|
        DCD      0xe6152d10
|L1.3444|
        DCD      0xe6790100
|L1.3448|
        DCD      0xe6790108
|L1.3452|
        DCD      0xe6790020
|L1.3456|
        DCD      0xe6790024
|L1.3460|
        DCD      0x0e030a01
|L1.3464|
        DCD      0xe6790030
|L1.3468|
        DCD      0xe6790070
|L1.3472|
        DCD      0xe6790034
|L1.3476|
        DCD      0xe6790074
|L1.3480|
        DCD      0xe6790040
|L1.3484|
        DCD      0xe6790080
|L1.3488|
        DCD      0xe6790044
|L1.3492|
        DCD      0xe6790084
|L1.3496|
        DCD      0xe6790050
|L1.3500|
        DCD      0xe6790090
|L1.3504|
        DCD      0xe6790054
|L1.3508|
        DCD      0xe6790094
|L1.3512|
        DCD      0xe6790060
|L1.3516|
        DCD      0xe67900a0
|L1.3520|
        DCD      0xe6790064
|L1.3524|
        DCD      0xe67900a4
|L1.3528|
        DCD      0xe6790104
|L1.3532|
        DCD      0xe6790010
|L1.3536|
        DCD      0xe6790300
|L1.3540|
        DCD      0xe6790304
|L1.3544|
        DCD      0xe679030c
|L1.3548|
        DCD      0x002d0027
|L1.3552|
        DCD      0xe6790310
|L1.3556|
        DCD      0xe6790314
|L1.3560|
        DCD      0xe6790318
|L1.3564|
        DCD      0x00100010
|L1.3568|
        DCD      0xe679031c
|L1.3572|
        DCD      0xe6790320
|L1.3576|
        DCD      0xe6790324
|L1.3580|
        DCD      0xe6790328
|L1.3584|
        DCD      0xe679032c
|L1.3588|
        DCD      0x00310031
|L1.3592|
        DCD      0xe6790330
|L1.3596|
        DCD      0xe6790334
|L1.3600|
        DCD      0x00130013
|L1.3604|
        DCD      0xe6790338
|L1.3608|
        DCD      0x00200010
|L1.3612|
        DCD      0xe679033c
|L1.3616|
        DCD      0x0d400a0e
|L1.3620|
        DCD      0xe6790340
|L1.3624|
        DCD      0x081e0000
|L1.3628|
        DCD      0xe6790344
|L1.3632|
        DCD      0x01290129
|L1.3636|
        DCD      0xe6790350
|L1.3640|
        DCD      0x00080008
|L1.3644|
        DCD      0xe6790354
|L1.3648|
        DCD      0x08550040
|L1.3652|
        DCD      0xe6790358
|L1.3656|
        DCD      0xe679035c
|L1.3660|
        DCD      0xe6790400
|L1.3664|
        DCD      0xe6790404
|L1.3668|
        DCD      0xe6790438
|L1.3672|
        DCD      0xe679043c
|L1.3676|
        DCD      0xe6790440
|L1.3680|
        DCD      0xe6790444
|L1.3684|
        DCD      0x00104214
|L1.3688|
        DCD      0xe6790904
|L1.3692|
        DCD      0xe6790908
|L1.3696|
        DCD      0xe679090c
|L1.3700|
        DCD      0x000f0037
|L1.3704|
        DCD      0xe6791000
|L1.3708|
        DCD      0xe6791004
|L1.3712|
        DCD      0xe6791010
|L1.3716|
        DCD      0xf7311111
|L1.3720|
        DCD      0xe6791020
|L1.3724|
        DCD      0xe6791024
|L1.3728|
        DCD      0xe6791030
|L1.3732|
        DCD      0xe6791034
|L1.3736|
        DCD      0xe6791038
|L1.3740|
        DCD      0xe679103c
|L1.3744|
        DCD      0xe6791070
|L1.3748|
        DCD      0xe6791074
|L1.3752|
        DCD      0xe6791078
|L1.3756|
        DCD      0xe679107c
|L1.3760|
        DCD      0xe67910c0
|L1.3764|
        DCD      0xe67910c4
|L1.3768|
        DCD      0xe67910c8
|L1.3772|
        DCD      0xe67910cc
|L1.3776|
        DCD      0xe6791100
|L1.3780|
        DCD      0xe6791104
|L1.3784|
        DCD      0xe6791108
|L1.3788|
        DCD      0xe679110c
|L1.3792|
        DCD      0xe6791110
|L1.3796|
        DCD      0xe6791114
|L1.3800|
        DCD      0xe6791118
|L1.3804|
        DCD      0xe679111c
|L1.3808|
        DCD      0xe6791120
|L1.3812|
        DCD      0xe6791124
|L1.3816|
        DCD      0xe6791128
|L1.3820|
        DCD      0xe679112c
|L1.3824|
        DCD      0x220e110a
|L1.3828|
        DCD      0xe6791700
|L1.3832|
        DCD      0x0b0d0a0c
|L1.3836|
        DCD      0xe6791708
|L1.3840|
        DCD      0x111f1fff
|L1.3844|
        DCD      0xe679170c
|L1.3848|
        DCD      0xe6790000
|L1.3852|
        DCD      0xe6790004
|L1.3856|
        DCD      0xe6790008
|L1.3860|
        DCD      0xe679000c
|L1.3864|
        DCD      0xe6790014
|L1.3868|
        DCD      0xe6790604
|L1.3872|
        DCD      0xe6790644
|L1.3876|
        DCD      0xe6790684
|L1.3880|
        DCD      0xe67906c4
|L1.3884|
        DCD      0xe679061c
|L1.3888|
        DCD      0xe679065c
|L1.3892|
        DCD      0xe679069c
|L1.3896|
        DCD      0xe67906dc
|L1.3900|
        DCD      0xe6790600
|L1.3904|
        DCD      0xe6790640
|L1.3908|
        DCD      0xe6790680
|L1.3912|
        DCD      0xe67906c0
|L1.3916|
        DCD      0x08840000
|L1.3920|
        DCD      0xe6790208
|L1.3924|
        DCD      0x08840001
|L1.3928|
        DCD      0x01840001
|L1.3932|
        DCD      0x0e840aff
|L1.3936|
        DCD      0x0e840154
|L1.3940|
        DCD      0x0e84022e
|L1.3944|
        DCD      0x0d84004f
|L1.3948|
        DCD      0x0d840051
|L1.3952|
        DCD      0x70000100
|L1.3956|
        DCD      0xe6790804
|L1.3960|
        DCD      0x18010001
|L1.3964|
        DCD      0xe6790800
|L1.3968|
        DCD      0x00081860
|L1.3972|
        DCD      0xe6790414
|L1.3976|
        DCD      0xe6790418
|L1.3980|
        DCD      0xe6790204
|L1.3984|
        DCD      0xe6790620
|L1.3988|
        DCD      0xe6790660
|L1.3992|
        DCD      0xe67906a0
|L1.3996|
        DCD      0xe67906e0
|L1.4000|
        DCD      0xe6790200
|L1.4004|
        DCD      0xe67f0024
|L1.4008|
        DCD      0xe67f0018
|L1.4012|
        DCD      0xe6798100
|L1.4016|
        DCD      0xe6798108
|L1.4020|
        DCD      0xe6798020
|L1.4024|
        DCD      0xe6798024
|L1.4028|
        DCD      0xe6798030
|L1.4032|
        DCD      0xe6798070
|L1.4036|
        DCD      0xe6798034
|L1.4040|
        DCD      0xe6798074
|L1.4044|
        DCD      0xe6798040
|L1.4048|
        DCD      0xe6798080
|L1.4052|
        DCD      0xe6798044
|L1.4056|
        DCD      0xe6798084
|L1.4060|
        DCD      0xe6798050
|L1.4064|
        DCD      0xe6798090
|L1.4068|
        DCD      0xe6798054
|L1.4072|
        DCD      0xe6798094
|L1.4076|
        DCD      0xe6798060
|L1.4080|
        DCD      0xe67980a0
|L1.4084|
        DCD      0xe6798064
|L1.4088|
        DCD      0xe67980a4
|L1.4092|
        DCD      0xe6798104
|L1.4096|
        DCD      0xe6798010
|L1.4100|
        DCD      0xe6798300
|L1.4104|
        DCD      0xe6798304
|L1.4108|
        DCD      0xe679830c
|L1.4112|
        DCD      0xe6798310
|L1.4116|
        DCD      0xe6798314
|L1.4120|
        DCD      0xe6798318
|L1.4124|
        DCD      0xe679831c
|L1.4128|
        DCD      0xe6798320
|L1.4132|
        DCD      0xe6798324
|L1.4136|
        DCD      0xe6798328
|L1.4140|
        DCD      0xe679832c
|L1.4144|
        DCD      0xe6798330
|L1.4148|
        DCD      0xe6798334
|L1.4152|
        DCD      0xe6798338
|L1.4156|
        DCD      0xe679833c
|L1.4160|
        DCD      0xe6798340
|L1.4164|
        DCD      0xe6798344
|L1.4168|
        DCD      0xe6798350
|L1.4172|
        DCD      0xe6798354
|L1.4176|
        DCD      0xe6798358
|L1.4180|
        DCD      0xe679835c
|L1.4184|
        DCD      0xe6798400
|L1.4188|
        DCD      0xe6798404
|L1.4192|
        DCD      0xe6798438
|L1.4196|
        DCD      0xe679843c
|L1.4200|
        DCD      0xe6798440
|L1.4204|
        DCD      0xe6798444
|L1.4208|
        DCD      0xe6798904
|L1.4212|
        DCD      0xe6798908
|L1.4216|
        DCD      0xe679890c
|L1.4220|
        DCD      0xe6799000
|L1.4224|
        DCD      0xe6799004
|L1.4228|
        DCD      0xe6799010
|L1.4232|
        DCD      0xe6799020
|L1.4236|
        DCD      0xe6799024
|L1.4240|
        DCD      0xe6799030
|L1.4244|
        DCD      0xe6799034
|L1.4248|
        DCD      0xe6799038
|L1.4252|
        DCD      0xe679903c
|L1.4256|
        DCD      0xe6799070
|L1.4260|
        DCD      0xe6799074
|L1.4264|
        DCD      0xe6799078
|L1.4268|
        DCD      0xe679907c
|L1.4272|
        DCD      0xe67990c0
|L1.4276|
        DCD      0xe67990c4
|L1.4280|
        DCD      0xe67990c8
|L1.4284|
        DCD      0xe67990cc
|L1.4288|
        DCD      0xe6799100
|L1.4292|
        DCD      0xe6799104
|L1.4296|
        DCD      0xe6799108
|L1.4300|
        DCD      0xe679910c
|L1.4304|
        DCD      0xe6799110
|L1.4308|
        DCD      0xe6799114
|L1.4312|
        DCD      0xe6799118
|L1.4316|
        DCD      0xe679911c
|L1.4320|
        DCD      0xe6799120
|L1.4324|
        DCD      0xe6799124
|L1.4328|
        DCD      0xe6799128
|L1.4332|
        DCD      0xe679912c
|L1.4336|
        DCD      0xe6799700
|L1.4340|
        DCD      0xe6799708
|L1.4344|
        DCD      0xe679970c
|L1.4348|
        DCD      0xe6798000
|L1.4352|
        DCD      0xe6798004
|L1.4356|
        DCD      0xe6798008
|L1.4360|
        DCD      0xe679800c
|L1.4364|
        DCD      0xe6798014
|L1.4368|
        DCD      0xe6798604
|L1.4372|
        DCD      0xe6798644
|L1.4376|
        DCD      0xe6798684
|L1.4380|
        DCD      0xe67986c4
|L1.4384|
        DCD      0xe679861c
|L1.4388|
        DCD      0xe679865c
|L1.4392|
        DCD      0xe679869c
|L1.4396|
        DCD      0xe67986dc
|L1.4400|
        DCD      0xe6798600
|L1.4404|
        DCD      0xe6798640
|L1.4408|
        DCD      0xe6798680
|L1.4412|
        DCD      0xe67986c0
|L1.4416|
        DCD      0xe6798208
|L1.4420|
        DCD      0xe6798804
|L1.4424|
        DCD      0xe6798800
|L1.4428|
        DCD      0xe6798414
|L1.4432|
        DCD      0xe6798418
|L1.4436|
        DCD      0xe6798204
|L1.4440|
        DCD      0xe6798620
|L1.4444|
        DCD      0xe6798660
|L1.4448|
        DCD      0xe67986a0
|L1.4452|
        DCD      0xe67986e0
|L1.4456|
        DCD      0xe6798200
|L1.4460|
        LDR      r0,__ddr_init_end
        MOV      pc,r0
__ddr_init_end
        DCD      0x00001178
__main PROC
        BL       |L1.4480|
        BL       |L1.5092|
        ENDP

__scatterload                  ; Alternate entry point
__scatterload_rt2 PROC
|L1.4480|
        ADR      r0,|L1.4532|
        LDM      r0,{r10,r11}
        ADD      r10,r10,r0
        ADD      r11,r11,r0
        SUB      r7,r10,#1
__scatterload_null                  ; Alternate entry point
|L1.4500|
        CMP      r10,r11
        BNE      |L1.4512|
        BL       |L1.5092|
|L1.4512|
        ADR      lr,|L1.4500|
        LDM      r10!,{r0-r3}
        TST      r3,#1
        SUBNE    pc,r7,r3
        BX       r3
        ENDP

|L1.4532|
        DCD      0x00000238
        DCD      0x00000248
__scatterload_zeroinit PROC
        MOVS     r3,#0
        MOVS     r4,#0
        MOVS     r5,#0
        MOVS     r6,#0
|L1.4556|
        SUBS     r2,r2,#0x10
        STMCS    r1!,{r3-r6}
        BHI      |L1.4556|
        LSLS     r2,r2,#29
        STMCS    r1!,{r4,r5}
        STRMI    r3,[r1,#0]
        BX       lr
        ENDP

__mpu_init                  ; Alternate entry point
|L1.4584|
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
|L1.5052|
        LDR      pc,|L1.5056|
|L1.5056|
        DCD      0x40000a60
        ENDP

||$Ven$AA$L$$SupervisorCall_Handler|| PROC
|L1.5060|
        LDR      pc,|L1.5064|
|L1.5064|
        DCD      0x40000a54
        ENDP

||$Ven$AA$L$$PrefetchAbort_Handler|| PROC
|L1.5068|
        LDR      pc,|L1.5072|
|L1.5072|
        DCD      0x400009fc
        ENDP

||$Ven$AA$L$$DataAbort_Handler|| PROC
|L1.5076|
        LDR      pc,|L1.5080|
|L1.5080|
        DCD      0x4000014c
        ENDP

||$Ven$AA$L$$IRQ_Handler|| PROC
|L1.5084|
        LDR      pc,|L1.5088|
|L1.5088|
        DCD      0x400009bc
        ENDP

||$Ven$AT$L$$__rt_entry|| PROC
|L1.5092|
        LDR      pc,|L1.5096|
|L1.5096|
        DCD      0x4000007d
        ENDP

||Region$$Table$$Base||
        DCD      0x4000ac4c
        DCD      0x4000ac4c
        DCD      0x00000e74
        DCD      0x000011bc
||Region$$Table$$Limit||

        AREA ER10, CODE, READONLY, ALIGN=2

__vectors_start                  ; Alternate entry point
        B        |L2.33484|
        B        |L2.32|
        B        |L2.48|
        B        |L2.64|
        B        |L2.80|
        NOP      
        B        |L2.96|
|L2.28|
        B        |L2.28|
|L2.32|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.2656|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.48|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.2644|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.64|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.2556|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.80|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.332|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.96|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.2492|
        POP      {r0-r3,r10-r12,lr}
        ERET     
        THUMB
__rt_lib_init                  ; Alternate entry point
|L2.112|
        PUSH     {r0-r4,lr}
__rt_lib_init_fp_1                  ; Alternate entry point
        BLX      |L2.33492|
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
|L2.120|
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
        BL       |L2.112|
__rt_entry_main                  ; Alternate entry point
__rt_entry_postli_1                  ; Alternate entry point
        BLX      |L2.13792|
        BL       |L2.160|
__lit__00000000
        DCD      0x70000000
__rt_exit                  ; Alternate entry point
|L2.144|
        PUSH     {r0,r1}
__rt_exit_ls                  ; Alternate entry point
__rt_exit_prels_1                  ; Alternate entry point
        BL       |L2.120|
__rt_exit_exit                  ; Alternate entry point
        POP      {r0,r1}
        BLX      |L2.2668|
        ARM
||__I$use$semihosting||                  ; Alternate entry point
__use_no_semihosting_swi PROC
        BX       lr
        ENDP

        THUMB
exit PROC
|L2.160|
        PUSH     {r4,lr}
        MOV      r4,r0
        NOP.W    
        MOV      r0,r4
        POP      {r4,lr}
        B.W      |L2.144|
        ENDP

        MOVS     r0,r0
        ARM
CPG_ClearBit PROC
|L2.180|
        LDR      r2,[r0,#0]
        MOV      r3,#1
        BIC      r1,r2,r3,LSL r1
        MVN      r2,r1
        MOVW     r3,#0
        MOVT     r3,#0xe615
        STR      r2,[r3,#0]
        STR      r1,[r0,#0]
        BX       lr
        ENDP

CPG_SetBit PROC
|L2.216|
        LDR      r2,[r0,#0]
        MOV      r3,#1
        ORR      r1,r2,r3,LSL r1
        MVN      r2,r1
        MOVW     r3,#0
        MOVT     r3,#0xe615
        STR      r2,[r3,#0]
        STR      r1,[r0,#0]
        BX       lr
        ENDP

CPG_SetMultipleBit PROC
|L2.252|
        LDR      r2,[r0,#0]
        ORR      r1,r2,r1
        MVN      r2,r1
        MOVW     r3,#0
        MOVT     r3,#0xe615
        STR      r2,[r3,#0]
        STR      r1,[r0,#0]
        BX       lr
        ENDP

DMAC_initDescriptorMemory PROC
|L2.284|
        CMP      r1,#0
        BXEQ     lr
        ADD      r0,r0,#0x800
        MOV      r2,#0
|L2.300|
        STR      r2,[r0,#0]
        STR      r2,[r0,#4]
        STR      r2,[r0,#8]
        STR      r2,[r0,#0xc]
        ADD      r0,r0,#0x10
        SUBS     r1,r1,#1
        BNE      |L2.300|
        BX       lr
        ENDP

DataAbort_Handler PROC
|L2.332|
        PUSH     {r11,lr}
        BL       |L2.2628|
|L2.340|
        B        |L2.340|
        ENDP

GIC_defaultHandler PROC
|L2.344|
        B        |L2.344|
        ENDP

GIC_enable PROC
|L2.348|
        CPSIE    i
        MOVW     r0,#0x14
        MOVT     r0,#0xf010
        MOV      r1,#0
        STR      r1,[r0,#0]
|L2.368|
        LDR      r1,[r0,#0]
        TST      r1,#6
        BNE      |L2.368|
        MOV      r1,#0xf8
        MCR      p15,#0x0,r1,c4,c6,#0
        MOV      r0,#0xf0000000
        MOV      r1,#3
        STR      r1,[r0,#0]
        MRC      p15,#0x0,r1,c12,c12,#7
        MOV      r2,#3
        ORR      r1,r1,r2
        MCR      p15,#0x0,r1,c12,c12,#7
        BX       lr
        ENDP

GIC_enableInterrupt PROC
|L2.420|
        PUSH     {r4,r5,r11,lr}
        MOV      r1,#0x6004
        MOVT     r1,#0xf000
        MOV      r2,#0
        STR      r2,[r1,r0,LSL #3]
        MOVW     r1,#0x6000
        MOVT     r1,#0xf000
        STR      r2,[r1,r0,LSL #3]
        MVN      r1,#0xe0000003
        AND      r1,r1,r0,LSR #3
        MOVW     r12,#0x80
        MOVT     r12,#0xf000
        LDR      r3,[r1,r12]!
        AND      r2,r0,#0x1f
        MOV      lr,#1
        ORR      r3,r3,lr,LSL r2
        STR      r3,[r1,#0]
        LDR      r3,[r1,#0xc80]
        BIC      r3,r3,lr,LSL r2
        STR      r3,[r1,#0xc80]
        MOV      r3,#0x18
        AND      r3,r3,r0,LSL #3
        ADD      r4,r0,r12
        ADD      r4,r4,#0x380
        BIC      r4,r4,#3
        LDR      r5,[r4,#0]
        BIC      r3,r5,lr,LSL r3
        STR      r3,[r4,#0]
        MOV      r3,#0x1e
        AND      r3,r3,r0,LSL #1
        MVN      r4,#0xc0000003
        AND      r0,r4,r0,LSR #2
        ADD      r0,r0,r12
        LDR      r5,[r0,#0xb80]
        ORR      r3,r5,lr,LSL r3
        STR      r3,[r0,#0xb80]
        LDR      r0,[r1,#0x80]
        ORR      r0,r0,lr,LSL r2
        STR      r0,[r1,#0x80]
        POP      {r4,r5,r11,pc}
        ENDP

GIC_endInterrupt PROC
|L2.580|
        MCR      p15,#0x0,r0,c12,c12,#1
        DSB      
        BX       lr
        ENDP

GIC_executeInterruptHandler PROC
|L2.592|
        CMP      r0,#0x3c8
        BXHI     lr
        MOV      r1,#0x9c74
        MOVT     r1,#0x4000
        LDR      r0,[r1,r0,LSL #2]
        BX       r0
        ENDP

GIC_getACKID PROC
|L2.616|
        PUSH     {r4,lr}
        MRC      p15,#0x0,r4,c12,c12,#0
        DSB      
        MOV      r0,r4
        BL       |L2.580|
        MOV      r0,r4
        POP      {r4,pc}
        ENDP

GIC_setInterruptHandler PROC
|L2.644|
        MOV      r2,#0x9c74
        MOVT     r2,#0x4000
        STR      r1,[r2,r0,LSL #2]
        BX       lr
        ENDP

I2C_configPins PROC
|L2.660|
        MOVW     r0,#0x800
        MOVT     r0,#0xe605
        ADD      r1,r0,#0x100
        MOV      r2,#0xfffc
        B        |L2.2532|
        ENDP

I2C_masterClearInterruptStatus PROC
|L2.680|
        LDR      r2,[r0,#0xc]
        BIC      r1,r2,r1
        STR      r1,[r0,#0xc]
        BX       lr
        ENDP

I2C_masterDisable PROC
|L2.696|
        LDR      r1,[r0,#4]
        BIC      r1,r1,#8
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterDisableDMAReceive PROC
|L2.712|
        LDR      r1,[r0,#0x3c]
        BIC      r1,r1,#2
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterDisableDMATransmit PROC
|L2.728|
        LDR      r1,[r0,#0x3c]
        BIC      r1,r1,#1
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterDisableStartByteTransmit PROC
|L2.744|
        LDR      r1,[r0,#4]
        BIC      r1,r1,#4
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterDisableStartGeneration PROC
|L2.760|
        LDR      r1,[r0,#4]
        BIC      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterEnable PROC
|L2.776|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#8
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterEnableDMAContinuousReceive PROC
|L2.792|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#0x40
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterEnableDMAContinuousTransmit PROC
|L2.808|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#0x80
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterEnableDMAReceive PROC
|L2.824|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#2
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterEnableDMATransmit PROC
|L2.840|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#1
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterEnableInterrupt PROC
|L2.856|
        LDR      r2,[r0,#0x14]
        ORR      r1,r2,r1
        STR      r1,[r0,#0x14]
        BX       lr
        ENDP

I2C_masterGetInterruptStatus PROC
|L2.872|
        LDR      r0,[r0,#0xc]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_masterInit PROC
|L2.884|
        PUSH     {r4,r5,r11,lr}
        LDRB     r2,[r1,#4]
        LDR      r3,[r1,#0]
        ORR      r2,r3,r2,LSL #1
        STR      r2,[r0,#0x20]
        LDR      r2,[r0,#4]
        ORR      r2,r2,#0x80
        STR      r2,[r0,#4]
        LDR      r12,[r1,#8]
        LDR      r3,[r0,#4]
        BIC      r2,r3,#4
        CMP      r12,#1
        ORREQ    r2,r3,#4
        STR      r2,[r0,#4]
        ADD      r4,r1,#0xc
        LDM      r4,{r2-r4}
        MOV      r12,#0x82e0
        MOVT     r12,#0x4000
        MOV      lr,#0x230
        MLA      r5,r2,lr,r12
        MOV      r2,#0x118
        MLA      r3,r3,r2,r5
        ADD      r4,r4,r4,LSL #2
        LDR      r3,[r3,r4,LSL #3]
        LDR      r4,[r0,#0x28]
        BFI      r4,r3,#2,#1
        STR      r4,[r0,#0x28]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#4]
        LDR      r4,[r0,#0x28]
        BFI      r4,r3,#1,#1
        STR      r4,[r0,#0x28]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#8]
        LDR      r4,[r0,#0x28]
        BFI      r4,r3,#0,#1
        STR      r4,[r0,#0x28]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#0xc]
        LDR      r4,[r0,#0x38]
        BFI      r4,r3,#0,#5
        STR      r4,[r0,#0x38]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#0x10]
        LDR      r4,[r0,#0x18]
        BFI      r4,r3,#0,#3
        STR      r4,[r0,#0x18]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#0x14]
        LDR      r4,[r0,#0x18]
        BFI      r4,r3,#3,#6
        STR      r4,[r0,#0x18]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#0x18]
        STR      r3,[r0,#0x2c]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#0x1c]
        STR      r3,[r0,#0x30]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#0x20]
        STR      r3,[r0,#0x34]
        LDR      r3,[r1,#0xc]
        LDR      r4,[r1,#0x10]
        LDR      r1,[r1,#0x14]
        MLA      r3,r3,lr,r12
        MLA      r2,r4,r2,r3
        ADD      r1,r1,r1,LSL #2
        ADD      r1,r2,r1,LSL #3
        LDR      r1,[r1,#0x24]
        LDR      r2,[r0,#0x28]
        BFI      r2,r1,#7,#1
        STR      r2,[r0,#0x28]
        POP      {r4,r5,r11,pc}
        ENDP

I2C_masterReceiveMultipleByteFinish PROC
|L2.1336|
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_masterReceiveMultipleByteNext PROC
|L2.1348|
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_masterReceiveMultipleByteStop PROC
|L2.1360|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#2
        STR      r1,[r0,#4]
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_masterReceiveStart PROC
|L2.1384|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterRestart PROC
|L2.1400|
        ORR      r1,r2,r1,LSL #1
        STR      r1,[r0,#0x20]
        LDR      r1,[r0,#4]
        ORR      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterSendMultipleByteNext PROC
|L2.1424|
        STR      r1,[r0,#0x24]
        BX       lr
        ENDP

I2C_masterSendMultipleByteStart PROC
|L2.1432|
        STR      r1,[r0,#0x24]
        LDR      r1,[r0,#4]
        ORR      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterSendMultipleByteStop PROC
|L2.1452|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#2
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterSetDMAContinuousReceiveBlockCount PROC
|L2.1468|
        LDR      r2,[r0,#0x3c]
        BIC      r2,r2,#0xff0000
        ORR      r1,r2,r1,LSL #16
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterSetDMAContinuousTransferCount PROC
|L2.1488|
        LDR      r2,[r0,#0x3c]
        BIC      r2,r2,#0xff000000
        ORR      r1,r2,r1,LSL #24
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterSetDMAContinuousTransmitBlockCount PROC
|L2.1508|
        LDR      r2,[r0,#0x3c]
        BIC      r2,r2,#0xff00
        ORR      r1,r2,r1,LSL #8
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_modelConnect PROC
|L2.1528|
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
|L2.1652|
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
|L2.1752|
        MOVW     r0,#0x800
        MOVT     r0,#0xe605
        ADD      r1,r0,#0x100
        MOV      r2,#0xfffc
        B        |L2.2508|
        ENDP

I2C_reset PROC
|L2.1772|
        PUSH     {r4,r5,r11,lr}
        MOV      r4,#0x2c14
        MOVT     r4,#0xe615
        MOVW     r5,#0
        MOVT     r5,#0xfffc
        MOV      r0,r4
        MOV      r1,r5
        BL       |L2.252|
        ADD      r0,r4,#0x80
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.252|
        ENDP

I2C_slaveClearInterruptStatus PROC
|L2.1820|
        LDR      r2,[r0,#8]
        BIC      r1,r2,r1
        STR      r1,[r0,#8]
        BX       lr
        ENDP

I2C_slaveDisable PROC
|L2.1836|
        LDR      r1,[r0,#0]
        BIC      r1,r1,#4
        STR      r1,[r0,#0]
        BX       lr
        ENDP

I2C_slaveDisableDMAReceive PROC
|L2.1852|
        LDR      r1,[r0,#0x3c]
        BIC      r1,r1,#8
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_slaveDisableDMATransmit PROC
|L2.1868|
        LDR      r1,[r0,#0x3c]
        BIC      r1,r1,#4
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_slaveEnable PROC
|L2.1884|
        LDR      r1,[r0,#0]
        ORR      r1,r1,#4
        STR      r1,[r0,#0]
        BX       lr
        ENDP

I2C_slaveEnableDMAReceive PROC
|L2.1900|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#8
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_slaveEnableDMATransmit PROC
|L2.1916|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#4
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_slaveEnableInterrupt PROC
|L2.1932|
        LDR      r2,[r0,#0x10]
        ORR      r1,r2,r1
        STR      r1,[r0,#0x10]
        BX       lr
        ENDP

I2C_slaveGetInterruptStatus PROC
|L2.1948|
        LDR      r0,[r0,#8]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_slaveInit PROC
|L2.1960|
        PUSH     {r4,r5,r11,lr}
        LDRB     r2,[r1,#0]
        STR      r2,[r0,#0x1c]
        LDR      r2,[r0,#0]
        ORR      r2,r2,#8
        STR      r2,[r0,#0]
        LDR      r12,[r1,#4]
        LDR      r3,[r0,#0]
        BIC      r2,r3,#0x10
        CMP      r12,#1
        ORREQ    r2,r3,#0x10
        STR      r2,[r0,#0]
        LDR      r12,[r1,#8]
        LDR      r3,[r0,#0]
        BIC      r2,r3,#2
        CMP      r12,#1
        ORREQ    r2,r3,#2
        STR      r2,[r0,#0]
        ADD      r4,r1,#0xc
        LDM      r4,{r2-r4}
        MOV      r12,#0x82e0
        MOVT     r12,#0x4000
        MOV      lr,#0x230
        MLA      r5,r2,lr,r12
        MOV      r2,#0x118
        MLA      r3,r3,r2,r5
        ADD      r4,r4,r4,LSL #2
        LDR      r3,[r3,r4,LSL #3]
        LDR      r4,[r0,#0x28]
        BFI      r4,r3,#2,#1
        STR      r4,[r0,#0x28]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#4]
        LDR      r4,[r0,#0x28]
        BFI      r4,r3,#1,#1
        STR      r4,[r0,#0x28]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#8]
        LDR      r4,[r0,#0x28]
        BFI      r4,r3,#0,#1
        STR      r4,[r0,#0x28]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#0xc]
        LDR      r4,[r0,#0x38]
        BFI      r4,r3,#0,#5
        STR      r4,[r0,#0x38]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#0x10]
        LDR      r4,[r0,#0x18]
        BFI      r4,r3,#0,#3
        STR      r4,[r0,#0x18]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#0x14]
        LDR      r4,[r0,#0x18]
        BFI      r4,r3,#3,#6
        STR      r4,[r0,#0x18]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#0x18]
        STR      r3,[r0,#0x2c]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#0x1c]
        STR      r3,[r0,#0x30]
        ADD      r5,r1,#0xc
        LDM      r5,{r3-r5}
        MLA      r3,r3,lr,r12
        MLA      r3,r4,r2,r3
        ADD      r4,r5,r5,LSL #2
        ADD      r3,r3,r4,LSL #3
        LDR      r3,[r3,#0x20]
        STR      r3,[r0,#0x34]
        LDR      r3,[r1,#0xc]
        LDR      r4,[r1,#0x10]
        LDR      r1,[r1,#0x14]
        MLA      r3,r3,lr,r12
        MLA      r2,r4,r2,r3
        ADD      r1,r1,r1,LSL #2
        ADD      r1,r2,r1,LSL #3
        LDR      r1,[r1,#0x24]
        LDR      r2,[r0,#0x28]
        BFI      r2,r1,#7,#1
        STR      r2,[r0,#0x28]
        POP      {r4,r5,r11,pc}
        ENDP

I2C_slaveReceiveMultipleByteFinish PROC
|L2.2428|
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_slaveReceiveMultipleByteNext PROC
|L2.2440|
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_slaveReceiveMultipleByteStop PROC
|L2.2452|
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_slaveSetAddress PROC
|L2.2476|
        STR      r1,[r0,#0x1c]
        BX       lr
        ENDP

I2C_slaveSetData PROC
|L2.2484|
        STR      r1,[r0,#0x24]
        BX       lr
        ENDP

IRQ_Handler PROC
|L2.2492|
        PUSH     {r11,lr}
        BL       |L2.616|
        POP      {r11,lr}
        B        |L2.592|
        ENDP

PFC_ClearMultipleBit PROC
|L2.2508|
        LDR      r3,[r1,#0]
        BIC      r2,r3,r2
        MVN      r3,r2
        STR      r3,[r0,#0]
        STR      r2,[r1,#0]
        BX       lr
        ENDP

PFC_SetMultipleBit PROC
|L2.2532|
        LDR      r3,[r1,#0]
        ORR      r2,r3,r2
        MVN      r3,r2
        STR      r3,[r0,#0]
        STR      r2,[r1,#0]
        BX       lr
        ENDP

PrefetchAbort_Handler PROC
|L2.2556|
        PUSH     {r11,lr}
        BL       |L2.2628|
|L2.2564|
        B        |L2.2564|
        ENDP

Sim_Delay PROC
|L2.2568|
        CMP      r0,#0
        BXEQ     lr
|L2.2576|
        SUBS     r0,r0,#1
        BNE      |L2.2576|
        BX       lr
        ENDP

Sim_Dump PROC
|L2.2588|
        MOV      r1,#0xac4c
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

Sim_Stop PROC
|L2.2628|
        MOV      r0,#0x7f00000
        MOV      r1,#0
        STR      r1,[r0,#0]
        BX       lr
        ENDP

SupervisorCall_Handler PROC
|L2.2644|
        PUSH     {r11,lr}
        BL       |L2.2628|
|L2.2652|
        B        |L2.2652|
        ENDP

UndefinedInstruction_Handler PROC
|L2.2656|
        PUSH     {r11,lr}
        BL       |L2.2628|
|L2.2664|
        B        |L2.2664|
        ENDP

_sys_exit PROC
|L2.2668|
        B        |L2.2668|
        ENDP

checkReg PROC
|L2.2672|
        MVN      r3,#0
        STR      r3,[r2,#0]
        MOV      r3,#0xb5c0
        MOVT     r3,#0x4000
        ADD      r0,r3,r0,LSL #7
        LDR      r3,[r2,#0]
        STR      r3,[r0,r1,LSL #3]!
        MOV      r1,#0
        STR      r1,[r2,#0]
        LDR      r1,[r2,#0]
        STR      r1,[r0,#4]
        BX       lr
        ENDP

|symbol_number.331| PROC
|L2.2720|
        MVN      r2,#0
        STR      r2,[r1,#0]
        LDR      r2,[r1,#0]
        MOV      r3,#0xb7c0
        MOVT     r3,#0x4000
        STR      r2,[r3,r0,LSL #3]!
        MOV      r0,#0
        STR      r0,[r1,#0]
        LDR      r0,[r1,#0]
        STR      r0,[r3,#4]
        BX       lr
        ENDP

|symbol_number.420| PROC
|L2.2764|
        MVN      r3,#0
        STR      r3,[r2,#0]
        MOV      r3,#0xb840
        MOVT     r3,#0x4000
        ADD      r0,r3,r0,LSL #7
        LDR      r3,[r2,#0]
        STR      r3,[r0,r1,LSL #3]!
        MOV      r1,#0
        STR      r1,[r2,#0]
        LDR      r1,[r2,#0]
        STR      r1,[r0,#4]
        BX       lr
        ENDP

i2c0InterruptHandler PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.2904|
        TST      r5,#8
        BEQ      |L2.2912|
        MOV      r0,#0xba40
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x8fc8
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.2920|
        B        |L2.2936|
|L2.2904|
        MOV      r0,r4
        BL       |L2.760|
|L2.2912|
        TST      r5,#0x10
        BEQ      |L2.2936|
|L2.2920|
        MOV      r0,#0xac60
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.2936|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.46| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#8
        BEQ      |L2.3036|
        MOV      r0,#0xba44
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        CMP      r1,#0xc
        BHI      |L2.3036|
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x8ffc
        MOVT     r0,#0x4000
        LDRB     r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.2484|
|L2.3036|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

|symbol_number.57| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.3132|
        TST      r5,#8
        BEQ      |L2.3140|
        MOV      r0,#0xac58
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BEQ      |L2.3180|
        MOV      r0,r4
        BL       |L2.1452|
        TST      r5,#0x10
        BNE      |L2.3148|
        B        |L2.3164|
|L2.3132|
        MOV      r0,r4
        BL       |L2.760|
|L2.3140|
        TST      r5,#0x10
        BEQ      |L2.3164|
|L2.3148|
        MOV      r0,#0xac62
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.3164|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
|L2.3180|
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r1,#1
        STR      r1,[r0,#0]
        MOV      r0,r4
        BL       |L2.840|
        TST      r5,#0x10
        BNE      |L2.3148|
        B        |L2.3164|
        ENDP

|symbol_number.67| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.3308|
        TST      r5,#8
        BEQ      |L2.3316|
        MOV      r0,#0xba48
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x9064
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.3324|
        B        |L2.3340|
|L2.3308|
        MOV      r0,r4
        BL       |L2.760|
|L2.3316|
        TST      r5,#0x10
        BEQ      |L2.3340|
|L2.3324|
        MOV      r0,#0xac63
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.3340|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.83| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.3448|
        TST      r5,#8
        BEQ      |L2.3456|
        MOV      r0,#0xba4c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x9098
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.3464|
        B        |L2.3480|
|L2.3448|
        MOV      r0,r4
        BL       |L2.760|
|L2.3456|
        TST      r5,#0x10
        BEQ      |L2.3480|
|L2.3464|
        MOV      r0,#0xac64
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.3480|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.93| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.3588|
        TST      r5,#8
        BEQ      |L2.3596|
        MOV      r0,#0xba50
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x90cc
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.3604|
        B        |L2.3620|
|L2.3588|
        MOV      r0,r4
        BL       |L2.760|
|L2.3596|
        TST      r5,#0x10
        BEQ      |L2.3620|
|L2.3604|
        MOV      r0,#0xac65
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.3620|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.103| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.3708|
        MOV      r0,r4
        BL       |L2.2440|
        MOV      r1,#0xb558
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r3,r2,#1
        STR      r3,[r1,#0]
        MOV      r1,#0xadc0
        MOVT     r1,#0x4000
        STR      r0,[r1,r2,LSL #2]
|L2.3708|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

|symbol_number.113| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.3856|
        MOV      r6,#0xb55c
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.3788|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.3832|
|L2.3788|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.3812|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.3832|
|L2.3812|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.3856|
        MOV      r0,r4
        BL       |L2.2428|
|L2.3832|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xadf4
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.3856|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.123| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#8
        BEQ      |L2.3956|
        MOV      r0,#0xba5c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        CMP      r1,#0xc
        BHI      |L2.3956|
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x9168
        MOVT     r0,#0x4000
        LDRB     r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.2484|
|L2.3956|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

|symbol_number.133| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.4032|
        MOV      r0,#0xac59
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BNE      |L2.4032|
        MOV      r0,r4
        BL       |L2.1900|
|L2.4032|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

|symbol_number.144| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.4180|
        MOV      r6,#0xb564
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.4112|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.4156|
|L2.4112|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.4136|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.4156|
|L2.4136|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.4180|
        MOV      r0,r4
        BL       |L2.2428|
|L2.4156|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xae90
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.4180|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.155| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4276|
        TST      r5,#2
        BEQ      |L2.4284|
        MOV      r0,#0xac5a
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BEQ      |L2.4324|
        MOV      r0,r4
        BL       |L2.1452|
        TST      r5,#0x10
        BNE      |L2.4292|
        B        |L2.4308|
|L2.4276|
        MOV      r0,r4
        BL       |L2.760|
|L2.4284|
        TST      r5,#0x10
        BEQ      |L2.4308|
|L2.4292|
        MOV      r0,#0xac6b
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.4308|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
|L2.4324|
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r1,#1
        STR      r1,[r0,#0]
        MOV      r0,r4
        BL       |L2.824|
        TST      r5,#0x10
        BNE      |L2.4292|
        B        |L2.4308|
        ENDP

|symbol_number.165| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4480|
        TST      r5,#8
        BEQ      |L2.4440|
        MOV      r0,#0xba64
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x9238
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
|L2.4440|
        TST      r5,#0x10
        BEQ      |L2.4464|
|L2.4448|
        MOV      r0,#0xac6c
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.4464|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.680|
|L2.4480|
        MOV      r6,#0xac5f
        MOVT     r6,#0x4000
        LDRB     r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.4520|
        MOV      r0,r4
        BL       |L2.760|
        TST      r5,#0x10
        BNE      |L2.4448|
        B        |L2.4464|
|L2.4520|
        MOV      r0,r4
        BL       |L2.744|
        MOV      r0,#1
        STRB     r0,[r6,#0]
        TST      r5,#0x10
        BNE      |L2.4448|
        B        |L2.4464|
        ENDP

|symbol_number.176| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4640|
        TST      r5,#8
        BEQ      |L2.4648|
        MOV      r0,#0xba68
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x926c
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.4656|
        B        |L2.4672|
|L2.4640|
        MOV      r0,r4
        BL       |L2.760|
|L2.4648|
        TST      r5,#0x10
        BEQ      |L2.4672|
|L2.4656|
        MOV      r0,#0xac6d
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.4672|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.186| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4780|
        TST      r5,#8
        BEQ      |L2.4788|
        MOV      r0,#0xba6c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x92a0
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.4796|
        B        |L2.4812|
|L2.4780|
        MOV      r0,r4
        BL       |L2.760|
|L2.4788|
        TST      r5,#0x10
        BEQ      |L2.4812|
|L2.4796|
        MOV      r0,#0xac6e
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.4812|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.196| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4920|
        TST      r5,#8
        BEQ      |L2.4928|
        MOV      r0,#0xba70
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x92d4
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.4936|
        B        |L2.4952|
|L2.4920|
        MOV      r0,r4
        BL       |L2.760|
|L2.4928|
        TST      r5,#0x10
        BEQ      |L2.4952|
|L2.4936|
        MOV      r0,#0xac6f
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.4952|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.206| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5060|
        TST      r5,#8
        BEQ      |L2.5068|
        MOV      r0,#0xba74
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x9308
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.5076|
        B        |L2.5092|
|L2.5060|
        MOV      r0,r4
        BL       |L2.760|
|L2.5068|
        TST      r5,#0x10
        BEQ      |L2.5092|
|L2.5076|
        MOV      r0,#0xac70
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.5092|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.216| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5188|
        TST      r5,#8
        BEQ      |L2.5196|
        MOV      r0,#0xac5b
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BEQ      |L2.5244|
        MOV      r0,r4
        BL       |L2.1452|
        TST      r5,#0x10
        BNE      |L2.5204|
        B        |L2.5228|
|L2.5188|
        MOV      r0,r4
        BL       |L2.760|
|L2.5196|
        TST      r5,#0x10
        BEQ      |L2.5228|
|L2.5204|
        MOV      r0,#0xac5b
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        MOV      r1,#0xac71
        MOVT     r1,#0x4000
        STRB     r0,[r1,#0]
|L2.5228|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
|L2.5244|
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r1,#1
        STR      r1,[r0,#0]
        TST      r5,#0x10
        BNE      |L2.5204|
        B        |L2.5228|
        ENDP

|symbol_number.228| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.5344|
        MOV      r0,r4
        BL       |L2.2440|
        MOV      r1,#0xb57c
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r3,r2,#1
        STR      r3,[r1,#0]
        MOV      r1,#0xb064
        MOVT     r1,#0x4000
        STR      r0,[r1,r2,LSL #2]
|L2.5344|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

|symbol_number.244| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5452|
        TST      r5,#8
        BEQ      |L2.5460|
        MOV      r0,#0xba7c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x940c
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.5468|
        B        |L2.5484|
|L2.5452|
        MOV      r0,r4
        BL       |L2.760|
|L2.5460|
        TST      r5,#0x10
        BEQ      |L2.5484|
|L2.5468|
        MOV      r0,#0xac73
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.5484|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.255| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5572|
        TST      r5,#2
        BEQ      |L2.5660|
        MOV      r6,#0xb584
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.5592|
        MOV      r0,r4
        BL       |L2.1348|
        B        |L2.5636|
|L2.5572|
        MOV      r0,r4
        BL       |L2.760|
        TST      r5,#8
        BNE      |L2.5668|
        B        |L2.5684|
|L2.5592|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.5616|
        MOV      r0,r4
        BL       |L2.1360|
        B        |L2.5636|
|L2.5616|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.5660|
        MOV      r0,r4
        BL       |L2.1336|
|L2.5636|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOVW     r2,#0xb100
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.5660|
        TST      r5,#8
        BEQ      |L2.5684|
|L2.5668|
        MOV      r0,r4
        MOV      r1,#0x51
        MOV      r2,#1
        BL       |L2.1400|
|L2.5684|
        TST      r5,#0x10
        BEQ      |L2.5708|
        MOV      r0,#0xac74
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.5708|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.680|
        ENDP

|symbol_number.265| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r1,r0
        TST      r1,#0x20
        BEQ      |L2.5772|
        MOV      r0,#0xac5e
        MOVT     r0,#0x4000
        MOV      r2,#1
        STRB     r2,[r0,#0]
|L2.5772|
        MOV      r0,r4
        BL       |L2.680|
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.5900|
        MOV      r6,#0xb588
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.5832|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.5876|
|L2.5832|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.5856|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.5876|
|L2.5856|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.5900|
        MOV      r0,r4
        BL       |L2.2428|
|L2.5876|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xb134
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.5900|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.277| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.6008|
        TST      r5,#8
        BEQ      |L2.6016|
        MOV      r0,#0xba88
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x94a8
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.6024|
        B        |L2.6040|
|L2.6008|
        MOV      r0,r4
        BL       |L2.760|
|L2.6016|
        TST      r5,#0x10
        BEQ      |L2.6040|
|L2.6024|
        MOV      r0,#0xac76
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.6040|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.287| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.6160|
        TST      r5,#8
        BEQ      |L2.6168|
        MOV      r0,#0xba8c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        CMP      r1,#0xc
        BHI      |L2.6208|
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x94dc
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.6176|
        B        |L2.6192|
|L2.6160|
        MOV      r0,r4
        BL       |L2.760|
|L2.6168|
        TST      r5,#0x10
        BEQ      |L2.6192|
|L2.6176|
        MOV      r0,#0xac77
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.6192|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
|L2.6208|
        MOV      r0,r4
        BL       |L2.1452|
        TST      r5,#0x10
        BNE      |L2.6176|
        B        |L2.6192|
        ENDP

|symbol_number.298| PROC
        PUSH     {r4,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r1,r0
        MOV      r0,r4
        POP      {r4,lr}
        B        |L2.1820|
        ENDP

|symbol_number.305| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.6356|
        TST      r5,#8
        BEQ      |L2.6364|
        MOV      r0,#0xba94
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x9510
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.6372|
        B        |L2.6388|
|L2.6356|
        MOV      r0,r4
        BL       |L2.760|
|L2.6364|
        TST      r5,#0x10
        BEQ      |L2.6388|
|L2.6372|
        MOV      r0,#0xac79
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.6388|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.315| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#8
        BEQ      |L2.6480|
        MOV      r0,#0xac5c
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BNE      |L2.6480|
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r1,#1
        STR      r1,[r0,#0]
        MOV      r0,r4
        BL       |L2.1916|
|L2.6480|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

|symbol_number.336| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.6576|
        TST      r5,#2
        BEQ      |L2.6584|
        MOV      r0,#0xac5d
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BEQ      |L2.6632|
        MOV      r0,r4
        BL       |L2.1452|
        TST      r5,#0x10
        BNE      |L2.6592|
        B        |L2.6616|
|L2.6576|
        MOV      r0,r4
        BL       |L2.760|
|L2.6584|
        TST      r5,#0x10
        BEQ      |L2.6616|
|L2.6592|
        MOV      r0,#0xac5d
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        MOV      r1,#0xac7b
        MOVT     r1,#0x4000
        STRB     r0,[r1,#0]
|L2.6616|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
|L2.6632|
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r1,#1
        STR      r1,[r0,#0]
        TST      r5,#0x10
        BNE      |L2.6592|
        B        |L2.6616|
        ENDP

|symbol_number.348| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.6732|
        MOV      r0,r4
        BL       |L2.2440|
        MOV      r1,#0xb598
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r3,r2,#1
        STR      r3,[r1,#0]
        MOV      r1,#0xb2d4
        MOVT     r1,#0x4000
        STR      r0,[r1,r2,LSL #2]
|L2.6732|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

|symbol_number.358| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.6880|
        MOV      r6,#0xb59c
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.6812|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.6856|
|L2.6812|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.6836|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.6856|
|L2.6836|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.6880|
        MOV      r0,r4
        BL       |L2.2428|
|L2.6856|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xb308
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.6880|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.368| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.6988|
        TST      r5,#8
        BEQ      |L2.6996|
        MOV      r0,#0xbaa0
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x967c
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.7004|
        B        |L2.7020|
|L2.6988|
        MOV      r0,r4
        BL       |L2.760|
|L2.6996|
        TST      r5,#0x10
        BEQ      |L2.7020|
|L2.7004|
        MOV      r0,#0xac7e
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.7020|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.378| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.7128|
        TST      r5,#8
        BEQ      |L2.7136|
        MOV      r0,#0xbaa4
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x96b0
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.7144|
        B        |L2.7160|
|L2.7128|
        MOV      r0,r4
        BL       |L2.760|
|L2.7136|
        TST      r5,#0x10
        BEQ      |L2.7160|
|L2.7144|
        MOV      r0,#0xac7f
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.7160|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.388| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.7268|
        TST      r5,#8
        BEQ      |L2.7276|
        MOV      r0,#0xbaa8
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x96e4
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.7284|
        B        |L2.7300|
|L2.7268|
        MOV      r0,r4
        BL       |L2.760|
|L2.7276|
        TST      r5,#0x10
        BEQ      |L2.7300|
|L2.7284|
        MOV      r0,#0xac80
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.7300|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.405| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.7408|
        TST      r5,#8
        BEQ      |L2.7416|
        MOV      r0,#0xbaac
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x974c
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.7424|
        B        |L2.7440|
|L2.7408|
        MOV      r0,r4
        BL       |L2.760|
|L2.7416|
        TST      r5,#0x10
        BEQ      |L2.7440|
|L2.7424|
        MOV      r0,#0xac81
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.7440|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.424| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.7548|
        TST      r5,#8
        BEQ      |L2.7556|
        MOV      r0,#0xbab0
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x97b4
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.7564|
        B        |L2.7580|
|L2.7548|
        MOV      r0,r4
        BL       |L2.760|
|L2.7556|
        TST      r5,#0x10
        BEQ      |L2.7580|
|L2.7564|
        MOV      r0,#0xac82
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.7580|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.434| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.7668|
        MOV      r0,r4
        BL       |L2.2440|
        MOV      r1,#0xb5b4
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r3,r2,#1
        STR      r3,[r1,#0]
        MOV      r1,#0xb4a8
        MOVT     r1,#0x4000
        STR      r0,[r1,r2,LSL #2]
|L2.7668|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

|symbol_number.445| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.7776|
        TST      r5,#8
        BEQ      |L2.7784|
        MOV      r0,#0xbab8
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x981c
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.7792|
        B        |L2.7808|
|L2.7776|
        MOV      r0,r4
        BL       |L2.760|
|L2.7784|
        TST      r5,#0x10
        BEQ      |L2.7808|
|L2.7792|
        MOV      r0,#0xac84
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.7808|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.457| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.7896|
        TST      r5,#2
        BEQ      |L2.7984|
        MOV      r6,#0xb5bc
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.7916|
        MOV      r0,r4
        BL       |L2.1348|
        B        |L2.7960|
|L2.7896|
        MOV      r0,r4
        BL       |L2.760|
        TST      r5,#0x10
        BNE      |L2.7992|
        B        |L2.8008|
|L2.7916|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.7940|
        MOV      r0,r4
        BL       |L2.1360|
        B        |L2.7960|
|L2.7940|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.7984|
        MOV      r0,r4
        BL       |L2.1336|
|L2.7960|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xb510
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.7984|
        TST      r5,#0x10
        BEQ      |L2.8008|
|L2.7992|
        MOV      r0,#0xac85
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.8008|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.680|
        ENDP

i2c1InterruptHandler PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.8156|
        MOV      r6,#0xb544
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.8088|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.8132|
|L2.8088|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.8112|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.8132|
|L2.8112|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.8156|
        MOV      r0,r4
        BL       |L2.2428|
|L2.8132|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xac88
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.8156|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.47| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.8244|
        TST      r5,#2
        BEQ      |L2.8332|
        MOV      r6,#0xb548
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BHI      |L2.8264|
        MOV      r0,r4
        BL       |L2.1348|
        B        |L2.8308|
|L2.8244|
        MOV      r0,r4
        BL       |L2.760|
        TST      r5,#0x10
        BNE      |L2.8340|
        B        |L2.8356|
|L2.8264|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.8288|
        MOV      r0,r4
        BL       |L2.1360|
        B        |L2.8308|
|L2.8288|
        LDR      r0,[r6,#0]
        CMP      r0,#0xd
        BNE      |L2.8332|
        MOV      r0,r4
        BL       |L2.1336|
|L2.8308|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xacbc
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.8332|
        TST      r5,#0x10
        BEQ      |L2.8356|
|L2.8340|
        MOV      r0,#0xac61
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.8356|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.680|
        ENDP

|symbol_number.56| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.8432|
        MOV      r0,#0xac58
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BNE      |L2.8432|
        MOV      r0,r4
        BL       |L2.1900|
|L2.8432|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

|symbol_number.68| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.8580|
        MOV      r6,#0xb54c
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.8512|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.8556|
|L2.8512|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.8536|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.8556|
|L2.8536|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.8580|
        MOV      r0,r4
        BL       |L2.2428|
|L2.8556|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xad24
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.8580|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.84| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.8728|
        MOV      r6,#0xb550
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.8660|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.8704|
|L2.8660|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.8684|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.8704|
|L2.8684|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.8728|
        MOV      r0,r4
        BL       |L2.2428|
|L2.8704|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xad58
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.8728|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.94| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.8876|
        MOV      r6,#0xb554
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.8808|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.8852|
|L2.8808|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.8832|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.8852|
|L2.8832|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.8876|
        MOV      r0,r4
        BL       |L2.2428|
|L2.8852|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xad8c
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.8876|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.104| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.8996|
        TST      r5,#8
        BEQ      |L2.9004|
        MOV      r1,#0xba54
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        LDR      r0,[r1,#0]
        CMP      r2,#0xc
        BHI      |L2.9044|
        ADD      r2,r0,#1
        STR      r2,[r1,#0]
        MOVW     r1,#0x9100
        MOVT     r1,#0x4000
        LDR      r1,[r1,r0,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.9012|
        B        |L2.9028|
|L2.8996|
        MOV      r0,r4
        BL       |L2.760|
|L2.9004|
        TST      r5,#0x10
        BEQ      |L2.9028|
|L2.9012|
        MOV      r0,#0xac66
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.9028|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
|L2.9044|
        CMP      r0,#0xd
        BNE      |L2.9004|
        MOV      r0,r4
        BL       |L2.1452|
        TST      r5,#0x10
        BNE      |L2.9012|
        B        |L2.9028|
        ENDP

|symbol_number.114| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.9164|
        TST      r5,#8
        BEQ      |L2.9172|
        MOV      r0,#0xba58
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x9134
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.9180|
        B        |L2.9196|
|L2.9164|
        MOV      r0,r4
        BL       |L2.760|
|L2.9172|
        TST      r5,#0x10
        BEQ      |L2.9196|
|L2.9180|
        MOV      r0,#0xac67
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.9196|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.124| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.9284|
        TST      r5,#2
        BEQ      |L2.9372|
        MOV      r6,#0xb560
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BHI      |L2.9304|
        MOV      r0,r4
        BL       |L2.1348|
        B        |L2.9348|
|L2.9284|
        MOV      r0,r4
        BL       |L2.760|
        TST      r5,#0x10
        BNE      |L2.9380|
        B        |L2.9396|
|L2.9304|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.9328|
        MOV      r0,r4
        BL       |L2.1360|
        B        |L2.9348|
|L2.9328|
        LDR      r0,[r6,#0]
        CMP      r0,#0xd
        BNE      |L2.9372|
        MOV      r0,r4
        BL       |L2.1336|
|L2.9348|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xae28
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.9372|
        TST      r5,#0x10
        BEQ      |L2.9396|
|L2.9380|
        MOV      r0,#0xac68
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.9396|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.680|
        ENDP

|symbol_number.134| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.9492|
        TST      r5,#8
        BEQ      |L2.9500|
        MOV      r0,#0xac59
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BEQ      |L2.9540|
        MOV      r0,r4
        BL       |L2.1452|
        TST      r5,#0x10
        BNE      |L2.9508|
        B        |L2.9524|
|L2.9492|
        MOV      r0,r4
        BL       |L2.760|
|L2.9500|
        TST      r5,#0x10
        BEQ      |L2.9524|
|L2.9508|
        MOV      r0,#0xac69
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.9524|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
|L2.9540|
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r1,#1
        STR      r1,[r0,#0]
        MOV      r0,r4
        BL       |L2.840|
        TST      r5,#0x10
        BNE      |L2.9508|
        B        |L2.9524|
        ENDP

|symbol_number.145| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.9668|
        TST      r5,#8
        BEQ      |L2.9676|
        MOV      r0,#0xba60
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x91d0
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.9684|
        B        |L2.9700|
|L2.9668|
        MOV      r0,r4
        BL       |L2.760|
|L2.9676|
        TST      r5,#0x10
        BEQ      |L2.9700|
|L2.9684|
        MOV      r0,#0xac6a
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.9700|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.154| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#8
        BEQ      |L2.9776|
        MOV      r0,#0xac5a
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BNE      |L2.9776|
        MOV      r0,r4
        BL       |L2.1916|
|L2.9776|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

|symbol_number.166| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.9924|
        MOV      r6,#0xb568
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.9856|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.9900|
|L2.9856|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.9880|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.9900|
|L2.9880|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.9924|
        MOV      r0,r4
        BL       |L2.2428|
|L2.9900|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xaef8
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.9924|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.177| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.10072|
        MOV      r6,#0xb56c
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.10004|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.10048|
|L2.10004|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.10028|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.10048|
|L2.10028|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.10072|
        MOV      r0,r4
        BL       |L2.2428|
|L2.10048|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xaf2c
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.10072|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.187| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.10220|
        MOV      r6,#0xb570
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.10152|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.10196|
|L2.10152|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.10176|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.10196|
|L2.10176|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.10220|
        MOV      r0,r4
        BL       |L2.2428|
|L2.10196|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xaf60
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.10220|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.197| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.10368|
        MOV      r6,#0xb574
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.10300|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.10344|
|L2.10300|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.10324|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.10344|
|L2.10324|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.10368|
        MOV      r0,r4
        BL       |L2.2428|
|L2.10344|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xaf94
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.10368|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.207| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.10516|
        MOV      r6,#0xb578
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.10448|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.10492|
|L2.10448|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.10472|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.10492|
|L2.10472|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.10516|
        MOV      r0,r4
        BL       |L2.2428|
|L2.10492|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xafc8
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.10516|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.217| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.10592|
        MOV      r0,#0xac5b
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BNE      |L2.10592|
        MOV      r0,r4
        BL       |L2.1900|
|L2.10592|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

|symbol_number.229| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.10712|
        TST      r5,#8
        BEQ      |L2.10720|
        MOV      r1,#0xba78
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        LDR      r0,[r1,#0]
        CMP      r2,#0xc
        BHI      |L2.10760|
        ADD      r2,r0,#1
        STR      r2,[r1,#0]
        MOV      r1,#0x93a4
        MOVT     r1,#0x4000
        LDR      r1,[r1,r0,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.10728|
        B        |L2.10744|
|L2.10712|
        MOV      r0,r4
        BL       |L2.760|
|L2.10720|
        TST      r5,#0x10
        BEQ      |L2.10744|
|L2.10728|
        MOV      r0,#0xac72
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.10744|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
|L2.10760|
        CMP      r0,#0xd
        BNE      |L2.10720|
        MOV      r0,r4
        BL       |L2.1452|
        TST      r5,#0x10
        BNE      |L2.10728|
        B        |L2.10744|
        ENDP

|symbol_number.245| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.10920|
        MOV      r6,#0xb580
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.10852|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.10896|
|L2.10852|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.10876|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.10896|
|L2.10876|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.10920|
        MOV      r0,r4
        BL       |L2.2428|
|L2.10896|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xb0cc
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.10920|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.256| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.11048|
        MOV      r0,r4
        BL       |L2.2440|
        MOV      r1,#0xb584
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r3,r2,#1
        STR      r3,[r1,#0]
        MOVW     r1,#0xb100
        MOVT     r1,#0x4000
        STR      r0,[r1,r2,LSL #2]
        MOV      r0,#0xba80
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x9440
        MOVT     r0,#0x4000
        LDRB     r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.2484|
|L2.11048|
        TST      r5,#8
        BEQ      |L2.11096|
        MOV      r0,#0xba80
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x9440
        MOVT     r0,#0x4000
        LDRB     r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.2484|
|L2.11096|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

|symbol_number.266| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.11204|
        TST      r5,#8
        BEQ      |L2.11212|
        MOV      r0,#0xba84
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x9474
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.11220|
        B        |L2.11236|
|L2.11204|
        MOV      r0,r4
        BL       |L2.760|
|L2.11212|
        TST      r5,#0x10
        BEQ      |L2.11236|
|L2.11220|
        MOV      r0,#0xac75
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.11236|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.278| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.11384|
        MOV      r6,#0xb58c
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.11316|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.11360|
|L2.11316|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.11340|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.11360|
|L2.11340|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.11384|
        MOV      r0,r4
        BL       |L2.2428|
|L2.11360|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xb168
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.11384|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.288| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.11472|
        MOV      r0,r4
        BL       |L2.2440|
        MOV      r1,#0xb590
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r3,r2,#1
        STR      r3,[r1,#0]
        MOV      r1,#0xb19c
        MOVT     r1,#0x4000
        STR      r0,[r1,r2,LSL #2]
|L2.11472|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

|symbol_number.299| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BEQ      |L2.11528|
        MOV      r0,r4
        BL       |L2.760|
|L2.11528|
        TST      r5,#0x10
        BEQ      |L2.11552|
        MOV      r0,#0xac78
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.11552|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.306| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.11700|
        MOV      r6,#0xb594
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.11632|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.11676|
|L2.11632|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.11656|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.11676|
|L2.11656|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.11700|
        MOV      r0,r4
        BL       |L2.2428|
|L2.11676|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xb1d0
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.11700|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.316| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.11796|
        TST      r5,#2
        BEQ      |L2.11804|
        MOV      r0,#0xac5c
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BEQ      |L2.11844|
        MOV      r0,r4
        BL       |L2.1452|
        TST      r5,#0x10
        BNE      |L2.11812|
        B        |L2.11828|
|L2.11796|
        MOV      r0,r4
        BL       |L2.760|
|L2.11804|
        TST      r5,#0x10
        BEQ      |L2.11828|
|L2.11812|
        MOV      r0,#0xac7a
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.11828|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
|L2.11844|
        MOV      r0,r4
        BL       |L2.824|
        TST      r5,#0x10
        BNE      |L2.11812|
        B        |L2.11828|
        ENDP

|symbol_number.337| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#8
        BEQ      |L2.11916|
        MOV      r0,#0xac5d
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BEQ      |L2.11988|
|L2.11916|
        TST      r5,#0x10
        BEQ      |L2.12020|
|L2.11924|
        MOV      r0,#0xac5d
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BNE      |L2.12020|
        MOV      r0,#0xac54
        MOVT     r0,#0x4000
        LDR      r0,[r0,#0]
        MOV      r1,#0x34
        MUL      r0,r0,r1
        MOV      r1,#0x95ac
        MOVT     r1,#0x4000
        LDRB     r1,[r1,r0]
        MOV      r0,r4
        BL       |L2.2484|
        B        |L2.12020|
|L2.11988|
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r1,#1
        STR      r1,[r0,#0]
        MOV      r0,r4
        BL       |L2.1916|
        TST      r5,#0x10
        BNE      |L2.11924|
|L2.12020|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

|symbol_number.349| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.12140|
        TST      r5,#8
        BEQ      |L2.12148|
        MOV      r1,#0xba98
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        LDR      r0,[r1,#0]
        CMP      r2,#0xc
        BHI      |L2.12188|
        ADD      r2,r0,#1
        STR      r2,[r1,#0]
        MOV      r1,#0x9614
        MOVT     r1,#0x4000
        LDR      r1,[r1,r0,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.12156|
        B        |L2.12172|
|L2.12140|
        MOV      r0,r4
        BL       |L2.760|
|L2.12148|
        TST      r5,#0x10
        BEQ      |L2.12172|
|L2.12156|
        MOV      r0,#0xac7c
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.12172|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
|L2.12188|
        CMP      r0,#0xd
        BNE      |L2.12148|
        MOV      r0,r4
        BL       |L2.1452|
        TST      r5,#0x10
        BNE      |L2.12156|
        B        |L2.12172|
        ENDP

|symbol_number.359| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.12308|
        TST      r5,#8
        BEQ      |L2.12316|
        MOV      r0,#0xba9c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x9648
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.12324|
        B        |L2.12340|
|L2.12308|
        MOV      r0,r4
        BL       |L2.760|
|L2.12316|
        TST      r5,#0x10
        BEQ      |L2.12340|
|L2.12324|
        MOV      r0,#0xac7d
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.12340|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
        ENDP

|symbol_number.369| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.12488|
        MOV      r6,#0xb5a0
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.12420|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.12464|
|L2.12420|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.12444|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.12464|
|L2.12444|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.12488|
        MOV      r0,r4
        BL       |L2.2428|
|L2.12464|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xb33c
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.12488|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.379| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.12636|
        MOV      r6,#0xb5a4
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.12568|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.12612|
|L2.12568|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.12592|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.12612|
|L2.12592|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.12636|
        MOV      r0,r4
        BL       |L2.2428|
|L2.12612|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xb370
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.12636|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.389| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.12784|
        MOV      r6,#0xb5a8
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.12716|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.12760|
|L2.12716|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.12740|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.12760|
|L2.12740|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.12784|
        MOV      r0,r4
        BL       |L2.2428|
|L2.12760|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xb3a4
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.12784|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.406| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.12932|
        MOV      r6,#0xb5ac
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.12864|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.12908|
|L2.12864|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.12888|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.12908|
|L2.12888|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.12932|
        MOV      r0,r4
        BL       |L2.2428|
|L2.12908|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xb40c
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.12932|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.425| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.13080|
        MOV      r6,#0xb5b0
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.13012|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.13056|
|L2.13012|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.13036|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.13056|
|L2.13036|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.13080|
        MOV      r0,r4
        BL       |L2.2428|
|L2.13056|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xb474
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.13080|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.435| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.872|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.13200|
        TST      r5,#8
        BEQ      |L2.13208|
        MOV      r1,#0xbab4
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        LDR      r0,[r1,#0]
        CMP      r2,#0xc
        BHI      |L2.13248|
        ADD      r2,r0,#1
        STR      r2,[r1,#0]
        MOV      r1,#0x97e8
        MOVT     r1,#0x4000
        LDR      r1,[r1,r0,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        TST      r5,#0x10
        BNE      |L2.13216|
        B        |L2.13232|
|L2.13200|
        MOV      r0,r4
        BL       |L2.760|
|L2.13208|
        TST      r5,#0x10
        BEQ      |L2.13232|
|L2.13216|
        MOV      r0,#0xac83
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.13232|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.680|
|L2.13248|
        CMP      r0,#0xd
        BNE      |L2.13208|
        MOV      r0,r4
        BL       |L2.1452|
        TST      r5,#0x10
        BNE      |L2.13216|
        B        |L2.13232|
        ENDP

|symbol_number.446| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.13408|
        MOV      r6,#0xb5b8
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0xa
        BHI      |L2.13340|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.13384|
|L2.13340|
        LDR      r0,[r6,#0]
        CMP      r0,#0xb
        BNE      |L2.13364|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.13384|
|L2.13364|
        LDR      r0,[r6,#0]
        CMP      r0,#0xc
        BNE      |L2.13408|
        MOV      r0,r4
        BL       |L2.2428|
|L2.13384|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0xb4dc
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.13408|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1820|
        ENDP

|symbol_number.458| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1948|
        MOV      r5,r0
        TST      r5,#8
        BEQ      |L2.13496|
        MOV      r0,#0xbabc
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x9850
        MOVT     r0,#0x4000
        LDRB     r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.2484|
|L2.13496|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1820|
        ENDP

interrupt_check PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8d10
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x99d4
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1250
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2768
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba6c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x92a0
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac6e
        MOVT     r0,#0x4000
|L2.13724|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.13724|
        MOV      r0,#0
        MOV      r1,#0xaf60
        MOVT     r1,#0x4000
|L2.13748|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.13784|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.13748|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.13784|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

main PROC
|L2.13792|
        PUSH     {r4-r6,lr}
        SUB      sp,sp,#0xb8
        BL       |L2.660|
        MOV      r5,#0
        MOV      r6,#0xab98
        MOVT     r6,#0x4000
        ADD      r4,sp,#4
|L2.13820|
        BL       |L2.1772|
        MOV      r0,#0x64
        BL       |L2.2568|
        MOV      r0,#0
        MOV      r1,#1
        BL       |L2.1528|
        LDR      r0,[r6,r5,LSL #2]
        BLX      r0
        STR      r0,[r4,r5,LSL #2]
        CMP      r0,#1
        BEQ      |L2.13888|
        ADD      r5,r5,#1
        CMP      r5,#0x2c
        BLS      |L2.13820|
        BL       |L2.1652|
        BL       |L2.1752|
        B        |L2.13932|
|L2.13888|
        BL       |L2.1652|
        BL       |L2.1752|
        MOV      r0,#0
|L2.13900|
        LDR      r1,[r4,r0,LSL #2]
        CMP      r1,#1
        BEQ      |L2.13928|
        ADD      r0,r0,#1
        CMP      r0,#0x2d
        BCC      |L2.13900|
        B        |L2.13932|
|L2.13928|
        BL       |L2.2588|
|L2.13932|
        BL       |L2.2628|
|L2.13936|
        B        |L2.13936|
        ENDP

master_arbitration_lost PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8f98
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        MOV      r1,#0x9c5c
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.1960|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1932|
        MOV      r0,r4
        BL       |L2.1884|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x8fb0
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.884|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.856|
        MOV      r0,r5
        BL       |L2.776|
        BL       |L2.348|
        MOV      r1,#0x165c
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2b68
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,r5
        MOV      r1,#0x48
        BL       |L2.1432|
        MOV      r0,#0xba84
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x9474
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac75
        MOVT     r0,#0x4000
|L2.14212|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.14212|
        MOV      r0,r4
        BL       |L2.696|
        MOV      r0,r4
        BL       |L2.1836|
        MOV      r0,r5
        BL       |L2.696|
        MOV      r0,#0
        MOV      r1,#0xb134
        MOVT     r1,#0x4000
|L2.14260|
        LDR      r2,[r6,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.14296|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.14260|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.14296|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

master_general_call PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8bc0
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x9884
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0xafc
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x1f58
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba40
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x8fc8
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac60
        MOVT     r0,#0x4000
|L2.14516|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.14516|
        MOV      r0,#0
        MOV      r1,#0xac88
        MOVT     r1,#0x4000
|L2.14540|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.14576|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.14540|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.14576|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_rx PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8f80
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x13
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x9c44
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x19
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        MOV      r0,#0xbabc
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x9850
        MOVT     r6,#0x4000
        LDRB     r1,[r6,r1,LSL #2]
        MOV      r0,r5
        BL       |L2.2484|
        BL       |L2.348|
        MOV      r1,#0x1e90
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x3470
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,r4
        BL       |L2.1384|
        MOV      r0,#0xac85
        MOVT     r0,#0x4000
|L2.14804|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.14804|
        MOV      r0,#0
        MOV      r1,#0xb510
        MOVT     r1,#0x4000
|L2.14828|
        LDR      r2,[r6,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.14864|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.14828|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.14864|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

master_rx_dma PROC
        PUSH     {r4-r10,lr}
        MOV      r4,#0x2c1c
        MOVT     r4,#0xe615
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.216|
        ADD      r0,r4,#0x80
        MOV      r1,#9
        BL       |L2.216|
        MOVW     r4,#0
        MOVT     r4,#0xe650
        ADD      r0,r4,#0x24
        MOVW     r5,#0xc
        MOVT     r5,#0xe730
        STR      r0,[r5,#-0xc]
        MOV      r6,#0xaec4
        MOVT     r6,#0x4000
        STR      r6,[r5,#-8]
        LDR      r0,[r5,#-4]
        MOV      r1,#0xd
        BFI      r0,r1,#0,#24
        STR      r0,[r5,#-4]
        LDR      r0,[r5,#0]
        MOV      r8,#1
        BFI      r0,r8,#14,#2
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        BIC      r0,r0,#0x3000
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        MOV      r9,#8
        BFI      r0,r9,#8,#4
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        BIC      r0,r0,#0x300000
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        MOV      r10,#2
        BFI      r0,r10,#3,#2
        STR      r0,[r5,#0]
        MOV      r0,#0x90
        STRH     r0,[r5,#0x34]
        LDR      r0,[r5,#0]
        ORR      r0,r0,#4
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        ORR      r0,r0,#1
        STR      r0,[r5,#0]
        MOV      r1,#0x8cc8
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        MOV      r7,#0x9204
        MOVT     r7,#0x4000
        ADD      r0,r7,#4
        STR      r0,[r5,#0xff4]
        MOV      r0,#0x100c
        MOVT     r0,#0xe730
        MOV      r1,#0x8024
        MOVT     r1,#0xe650
        STR      r1,[r0,#-8]
        LDR      r1,[r0,#-4]
        MOV      r2,#0xc
        BFI      r1,r2,#0,#24
        STR      r1,[r0,#-4]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#0xc000
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BFI      r1,r8,#12,#2
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BFI      r1,r9,#8,#4
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#0x300000
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BFI      r1,r10,#3,#2
        STR      r1,[r0,#0]
        MOV      r1,#0xa3
        STRH     r1,[r0,#0x34]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#4
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        ADD      r5,r4,#0x8000
        MOV      r1,#0x998c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1932|
        MOV      r0,r5
        MOV      r1,#0x48
        BL       |L2.2484|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x25f4
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOV      r1,#0x1064
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x6cf8
        MOVT     r1,#0x4000
        MOV      r0,#0x40
        BL       |L2.644|
        MOV      r1,#0x6f24
        MOVT     r1,#0x4000
        MOV      r0,#0x41
        BL       |L2.644|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x40
        BL       |L2.420|
        MOV      r0,#0x41
        BL       |L2.420|
        MOV      r0,r4
        BL       |L2.1384|
        MOV      r0,#0xac6b
        MOVT     r0,#0x4000
|L2.15436|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.15436|
        MOV      r0,r4
        BL       |L2.696|
        MOV      r0,r5
        BL       |L2.1836|
        MOV      r0,#0
|L2.15468|
        LDR      r1,[r7,r0,LSL #2]
        LDRB     r2,[r6,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.15504|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.15468|
        MOV      r0,#0
        POP      {r4-r10,pc}
|L2.15504|
        MOV      r0,#1
        POP      {r4-r10,pc}
        ENDP

master_rx_dma_continuous PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#4
        MOV      r4,#0x2c1c
        MOVT     r4,#0xe615
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.216|
        ADD      r0,r4,#0x80
        MOV      r1,#9
        BL       |L2.216|
        MOV      r0,#0xeff4
        MOVT     r0,#4
        MOV      r9,#0x100c
        MOVT     r9,#0xe730
        ADD      r0,r9,r0
        MOV      r7,#2
        MOV      r1,#2
        BL       |L2.284|
        MOV      r0,#0
        MOV      r1,#0x80c
        MOVT     r1,#0xe735
        MOVW     r11,#0
        MOVT     r11,#0xe650
        ADD      r2,r11,#0x24
        MOV      r10,#0xb26c
        MOVT     r10,#0x4000
        MOV      r3,#0xd
        MOV      r4,#1
        MOV      r5,#0x90
|L2.15628|
        STR      r2,[r1,#-0xc]
        ADD      r6,r10,r0
        STR      r6,[r1,#-8]
        LDR      r6,[r1,#-4]
        BFI      r6,r3,#0,#24
        STR      r6,[r1,#-4]
        LDR      r6,[r1,#0]
        BFI      r6,r4,#10,#2
        STR      r6,[r1,#0]
        LDR      r6,[r1,#0]
        BIC      r6,r6,#0x300
        STR      r6,[r1,#0]
        LDR      r6,[r1,#0]
        BFI      r6,r7,#6,#2
        STR      r6,[r1,#0]
        LDR      r6,[r1,#0]
        BFI      r6,r7,#0,#4
        STR      r6,[r1,#0]
        LDR      r6,[r1,#0]
        BFI      r6,r5,#16,#8
        STR      r6,[r1,#0]
        ADD      r1,r1,#0x10
        ADD      r0,r0,#0x34
        CMP      r0,#0x68
        BNE      |L2.15628|
        MOVW     r0,#0xc
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        MOV      r8,#1
        BFI      r1,r8,#28,#2
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#0xf000000
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#0x400000
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0x10]
        BFI      r1,r8,#24,#8
        STR      r1,[r0,#0x10]
        LDR      r1,[r0,#0x10]
        ORR      r1,r1,#0x8000
        STR      r1,[r0,#0x10]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#4
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        MOV      r1,#0x8e60
        MOVT     r1,#0x4000
        MOV      r0,r11
        BL       |L2.884|
        MOV      r0,r11
        MOV      r1,#1
        BL       |L2.1488|
        MOV      r5,#0xd
        MOV      r0,r11
        MOV      r1,#0xd
        BL       |L2.1468|
        MOV      r0,r11
        BL       |L2.792|
        MOV      r0,r11
        BL       |L2.824|
        MOV      r0,r11
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r11
        MVN      r1,#0
        BL       |L2.856|
        MOV      r0,r11
        BL       |L2.776|
        MOV      r4,#0xac54
        MOVT     r4,#0x4000
        LDR      r0,[r4,#0]
        MOV      r7,#0x95ac
        MOVT     r7,#0x4000
        MOV      r6,#0x34
        MLA      r0,r0,r6,r7
        ADD      r0,r0,#4
        STR      r0,[r9,#-0xc]
        MOV      r0,#0x8024
        MOVT     r0,#0xe650
        STR      r0,[r9,#-8]
        LDR      r0,[r9,#-4]
        BFI      r0,r5,#0,#24
        STR      r0,[r9,#-4]
        LDR      r0,[r9,#0]
        BIC      r0,r0,#0xc000
        STR      r0,[r9,#0]
        LDR      r0,[r9,#0]
        BFI      r0,r8,#12,#2
        STR      r0,[r9,#0]
        LDR      r0,[r9,#0]
        MOV      r1,#8
        BFI      r0,r1,#8,#4
        STR      r0,[r9,#0]
        LDR      r0,[r9,#0]
        BIC      r0,r0,#0x300000
        STR      r0,[r9,#0]
        LDR      r0,[r9,#0]
        MOV      r1,#2
        BFI      r0,r1,#3,#2
        STR      r0,[r9,#0]
        MOV      r0,#0xa3
        STRH     r0,[r9,#0x34]
        LDR      r0,[r9,#0]
        ORR      r0,r0,#4
        STR      r0,[r9,#0]
        LDR      r0,[r9,#0]
        ORR      r0,r0,#1
        STR      r0,[r9,#0]
        ADD      r5,r11,#0x8000
        MOV      r1,#0x9b24
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MVN      r1,#4
        BL       |L2.1932|
        LDR      r0,[r4,#0]
        MUL      r0,r0,r6
        LDRB     r1,[r7,r0]
        MOV      r0,r5
        BL       |L2.2484|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOVW     r1,#0x1960
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2e58
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOV      r1,#0x6df8
        MOVT     r1,#0x4000
        MOV      r0,#0x40
        BL       |L2.644|
        MOV      r1,#0x7058
        MOVT     r1,#0x4000
        MOV      r0,#0x41
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0x40
        BL       |L2.420|
        MOV      r0,#0x41
        BL       |L2.420|
        MOV      r0,r11
        BL       |L2.1384|
        MOV      r0,#0xac7b
        MOVT     r0,#0x4000
|L2.16264|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.16264|
        MOV      r0,r11
        BL       |L2.696|
        MOV      r0,r5
        BL       |L2.1836|
        MOV      r0,#0
|L2.16296|
        MOV      r1,#0
|L2.16300|
        LDR      r2,[r7,r1,LSL #2]
        LDRB     r3,[r10,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.16360|
        ADD      r1,r1,#1
        CMP      r1,#0xc
        BLS      |L2.16300|
        ADD      r7,r7,#0x34
        ADD      r10,r10,#0x34
        ADD      r0,r0,#1
        CMP      r0,#2
        BCC      |L2.16296|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.16360|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

master_send_start_byte PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8ce0
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        MOV      r0,r4
        MOV      r1,#0x11
        BL       |L2.2476|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x99a4
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1108
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOVW     r1,#0x2640
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba64
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x9238
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac6c
        MOVT     r0,#0x4000
|L2.16596|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.16596|
        MOV      r0,#0
        MOV      r1,#0xaef8
        MOVT     r1,#0x4000
|L2.16620|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.16656|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.16620|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.16656|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8d28
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x99ec
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x12dc
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x27fc
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba70
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x92d4
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac6f
        MOVT     r0,#0x4000
|L2.16876|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.16876|
        MOV      r0,#0
        MOV      r1,#0xaf94
        MOVT     r1,#0x4000
|L2.16900|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.16936|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.16900|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.16936|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_100kHz PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8ed8
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x9b9c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1c08
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x316c
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xbaa8
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x96e4
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac80
        MOVT     r0,#0x4000
|L2.17156|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.17156|
        MOV      r0,#0
        MOV      r1,#0xb3a4
        MOVT     r1,#0x4000
|L2.17180|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.17216|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.17180|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.17216|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_100kHz_var_duty PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8c38
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x98fc
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0xda8
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2228
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba50
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x90cc
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac65
        MOVT     r0,#0x4000
|L2.17436|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.17436|
        MOV      r0,#0
        MOV      r1,#0xad8c
        MOVT     r1,#0x4000
|L2.17460|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.17496|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.17460|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.17496|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_1MHz_var_duty PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8e18
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x9adc
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1878
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2d30
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba94
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x9510
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac79
        MOVT     r0,#0x4000
|L2.17716|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.17716|
        MOV      r0,#0
        MOV      r1,#0xb1d0
        MOVT     r1,#0x4000
|L2.17740|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.17776|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.17740|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.17776|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_200kHz PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8ea8
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x9b6c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1af0
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x3044
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xbaa0
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x967c
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac7e
        MOVT     r0,#0x4000
|L2.17996|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.17996|
        MOV      r0,#0
        MOV      r1,#0xb33c
        MOVT     r1,#0x4000
|L2.18020|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.18056|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.18020|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.18056|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_200kHz_var_duty PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8ec0
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x9b84
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1b7c
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x30d8
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xbaa4
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x96b0
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac7f
        MOVT     r0,#0x4000
|L2.18276|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.18276|
        MOV      r0,#0
        MOV      r1,#0xb370
        MOVT     r1,#0x4000
|L2.18300|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.18336|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.18300|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.18336|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_250kHz PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8c20
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x98e4
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0xd1c
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2194
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba4c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x9098
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac64
        MOVT     r0,#0x4000
|L2.18556|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.18556|
        MOV      r0,#0
        MOV      r1,#0xad58
        MOVT     r1,#0x4000
|L2.18580|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.18616|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.18580|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.18616|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_250kHz_var_duty PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8f08
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x9bcc
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1c94
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOVW     r1,#0x3200
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xbaac
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x974c
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac81
        MOVT     r0,#0x4000
|L2.18836|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.18836|
        MOV      r0,#0
        MOV      r1,#0xb40c
        MOVT     r1,#0x4000
|L2.18860|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.18896|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.18860|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.18896|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_300kHz PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8da0
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x9a64
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x14f0
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2a24
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba7c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x940c
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac73
        MOVT     r0,#0x4000
|L2.19116|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.19116|
        MOV      r0,#0
        MOV      r1,#0xb0cc
        MOVT     r1,#0x4000
|L2.19140|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.19176|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.19140|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.19176|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_300kHz_var_duty PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8dd0
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x9a94
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x171c
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2bf4
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba88
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x94a8
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac76
        MOVT     r0,#0x4000
|L2.19396|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.19396|
        MOV      r0,#0
        MOV      r1,#0xb168
        MOVT     r1,#0x4000
|L2.19420|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.19456|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.19420|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.19456|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_400kHz PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8cf8
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x99bc
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x11c4
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x26d4
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba68
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x926c
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac6d
        MOVT     r0,#0x4000
|L2.19676|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.19676|
        MOV      r0,#0
        MOV      r1,#0xaf2c
        MOVT     r1,#0x4000
|L2.19700|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.19736|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.19700|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.19736|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_400kHz_var_duty PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8f68
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x9c2c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1e04
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x33dc
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xbab8
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x981c
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac84
        MOVT     r0,#0x4000
|L2.19956|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.19956|
        MOV      r0,#0
        MOV      r1,#0xb4dc
        MOVT     r1,#0x4000
|L2.19980|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.20016|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.19980|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.20016|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_50kHz PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8f38
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x9bfc
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOVW     r1,#0x1d20
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x3294
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xbab0
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x97b4
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac82
        MOVT     r0,#0x4000
|L2.20236|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.20236|
        MOV      r0,#0
        MOV      r1,#0xb474
        MOVT     r1,#0x4000
|L2.20260|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.20296|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.20260|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.20296|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_50kHz_var_duty PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8c08
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x98cc
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOVW     r1,#0xc90
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOVW     r1,#0x2100
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba48
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x9064
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac63
        MOVT     r0,#0x4000
|L2.20516|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.20516|
        MOV      r0,#0
        MOV      r1,#0xad24
        MOVT     r1,#0x4000
|L2.20540|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.20576|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.20540|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.20576|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_dma PROC
        PUSH     {r4-r10,lr}
        MOV      r4,#0x2c1c
        MOVT     r4,#0xe615
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.216|
        ADD      r0,r4,#0x80
        MOV      r1,#9
        BL       |L2.216|
        MOV      r6,#0x9030
        MOVT     r6,#0x4000
        ADD      r0,r6,#4
        MOVW     r5,#0xc
        MOVT     r5,#0xe730
        STR      r0,[r5,#-0xc]
        MOVW     r4,#0
        MOVT     r4,#0xe650
        ADD      r0,r4,#0x24
        STR      r0,[r5,#-8]
        LDR      r0,[r5,#-4]
        MOV      r1,#0xc
        BFI      r0,r1,#0,#24
        STR      r0,[r5,#-4]
        LDR      r0,[r5,#0]
        BIC      r0,r0,#0xc000
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        MOV      r10,#1
        BFI      r0,r10,#12,#2
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        MOV      r8,#8
        BFI      r0,r8,#8,#4
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        BIC      r0,r0,#0x300000
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        MOV      r9,#2
        BFI      r0,r9,#3,#2
        STR      r0,[r5,#0]
        MOV      r0,#0x91
        STRH     r0,[r5,#0x34]
        LDR      r0,[r5,#0]
        ORR      r0,r0,#4
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        ORR      r0,r0,#1
        STR      r0,[r5,#0]
        MOV      r1,#0x8bf0
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        MOV      r0,#0x8024
        MOVT     r0,#0xe650
        STR      r0,[r5,#0xff4]
        MOV      r0,#0x100c
        MOVT     r0,#0xe730
        MOV      r7,#0xacf0
        MOVT     r7,#0x4000
        STR      r7,[r0,#-8]
        LDR      r1,[r0,#-4]
        MOV      r2,#0xd
        BFI      r1,r2,#0,#24
        STR      r1,[r0,#-4]
        LDR      r1,[r0,#0]
        BFI      r1,r10,#14,#2
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#0x3000
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BFI      r1,r8,#8,#4
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#0x300000
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BFI      r1,r9,#3,#2
        STR      r1,[r0,#0]
        MOV      r1,#0xa2
        STRH     r1,[r0,#0x34]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#4
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        ADD      r5,r4,#0x8000
        MOV      r1,#0x98b4
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x20b4
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOV      r1,#0xbec
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x6c88
        MOVT     r1,#0x4000
        MOV      r0,#0x40
        BL       |L2.644|
        MOV      r1,#0x6e5c
        MOVT     r1,#0x4000
        MOV      r0,#0x41
        BL       |L2.644|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x40
        BL       |L2.420|
        MOV      r0,#0x41
        BL       |L2.420|
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.1432|
        MOV      r0,#0xac62
        MOVT     r0,#0x4000
|L2.21140|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.21140|
        MOV      r0,r4
        BL       |L2.696|
        MOV      r0,r5
        BL       |L2.1836|
        MOV      r0,#0
|L2.21172|
        LDR      r1,[r6,r0,LSL #2]
        LDRB     r2,[r7,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.21208|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.21172|
        MOV      r0,#0
        POP      {r4-r10,pc}
|L2.21208|
        MOV      r0,#1
        POP      {r4-r10,pc}
        ENDP

master_tx_dma_continuous PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#4
        MOV      r4,#0x2c1c
        MOVT     r4,#0xe615
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.216|
        ADD      r0,r4,#0x80
        MOV      r1,#9
        BL       |L2.216|
        MOV      r0,#0xeff4
        MOVT     r0,#4
        MOV      r8,#0x100c
        MOVT     r8,#0xe730
        ADD      r0,r8,r0
        MOV      r7,#2
        MOV      r1,#2
        BL       |L2.284|
        MOV      r0,#4
        MOV      r1,#0x80c
        MOVT     r1,#0xe735
        MOVW     r11,#0
        MOVT     r11,#0xe650
        MOV      r9,#0x933c
        MOVT     r9,#0x4000
        ADD      r2,r11,#0x24
        MOV      r3,#0xd
        MOV      r4,#1
        MOV      r5,#0x91
|L2.21332|
        ADD      r6,r9,r0
        STR      r6,[r1,#-0xc]
        STR      r2,[r1,#-8]
        LDR      r6,[r1,#-4]
        BFI      r6,r3,#0,#24
        STR      r6,[r1,#-4]
        LDR      r6,[r1,#0]
        BIC      r6,r6,#0xc00
        STR      r6,[r1,#0]
        LDR      r6,[r1,#0]
        BFI      r6,r4,#8,#2
        STR      r6,[r1,#0]
        LDR      r6,[r1,#0]
        BFI      r6,r7,#6,#2
        STR      r6,[r1,#0]
        LDR      r6,[r1,#0]
        BFI      r6,r7,#0,#4
        STR      r6,[r1,#0]
        LDR      r6,[r1,#0]
        BFI      r6,r5,#16,#8
        STR      r6,[r1,#0]
        ADD      r1,r1,#0x10
        ADD      r0,r0,#0x34
        CMP      r0,#0x6c
        BNE      |L2.21332|
        MOVW     r0,#0xc
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        MOV      r10,#1
        BFI      r1,r10,#28,#2
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#0xf000000
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#0x400000
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0x10]
        BFI      r1,r10,#24,#8
        STR      r1,[r0,#0x10]
        LDR      r1,[r0,#0x10]
        ORR      r1,r1,#0x8000
        STR      r1,[r0,#0x10]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#4
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        MOV      r1,#0x8d58
        MOVT     r1,#0x4000
        MOV      r0,r11
        BL       |L2.884|
        MOV      r0,r11
        MOV      r1,#1
        BL       |L2.1488|
        MOV      r5,#0xd
        MOV      r0,r11
        MOV      r1,#0xd
        BL       |L2.1508|
        MOV      r0,r11
        BL       |L2.808|
        MOV      r0,r11
        BL       |L2.840|
        MOV      r0,r11
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r11
        MVN      r1,#0
        BL       |L2.856|
        MOV      r0,r11
        BL       |L2.776|
        MOV      r0,#0x8024
        MOVT     r0,#0xe650
        STR      r0,[r8,#-0xc]
        MOV      r4,#0xac50
        MOVT     r4,#0x4000
        LDR      r0,[r4,#0]
        MOV      r7,#0xaffc
        MOVT     r7,#0x4000
        MOV      r6,#0x34
        MLA      r0,r0,r6,r7
        STR      r0,[r8,#-8]
        LDR      r0,[r8,#-4]
        BFI      r0,r5,#0,#24
        STR      r0,[r8,#-4]
        LDR      r0,[r8,#0]
        BFI      r0,r10,#14,#2
        STR      r0,[r8,#0]
        LDR      r0,[r8,#0]
        BIC      r0,r0,#0x3000
        STR      r0,[r8,#0]
        LDR      r0,[r8,#0]
        MOV      r1,#8
        BFI      r0,r1,#8,#4
        STR      r0,[r8,#0]
        LDR      r0,[r8,#0]
        BIC      r0,r0,#0x300000
        STR      r0,[r8,#0]
        LDR      r0,[r8,#0]
        MOV      r1,#2
        BFI      r0,r1,#3,#2
        STR      r0,[r8,#0]
        MOV      r0,#0xa2
        STRH     r0,[r8,#0x34]
        LDR      r0,[r8,#0]
        ORR      r0,r0,#4
        STR      r0,[r8,#0]
        LDR      r0,[r8,#0]
        ORR      r0,r0,#1
        STR      r0,[r8,#0]
        ADD      r5,r11,#0x8000
        MOV      r1,#0x9a1c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x13f4
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2924
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOV      r1,#0x6d5c
        MOVT     r1,#0x4000
        MOV      r0,#0x40
        BL       |L2.644|
        MOV      r1,#0x6f5c
        MOVT     r1,#0x4000
        MOV      r0,#0x41
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0x40
        BL       |L2.420|
        MOV      r0,#0x41
        BL       |L2.420|
        LDR      r0,[r4,#0]
        MUL      r0,r0,r6
        LDR      r1,[r9,r0]
        MOV      r0,r11
        BL       |L2.1432|
        MOV      r0,#0xac71
        MOVT     r0,#0x4000
|L2.21956|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.21956|
        MOV      r0,r11
        BL       |L2.696|
        MOV      r0,r5
        BL       |L2.1836|
        MOV      r0,#0
|L2.21988|
        MOV      r1,#0
|L2.21992|
        LDR      r2,[r9,r1,LSL #2]
        LDRB     r3,[r7,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.22052|
        ADD      r1,r1,#1
        CMP      r1,#0xc
        BLS      |L2.21992|
        ADD      r9,r9,#0x34
        ADD      r7,r7,#0x34
        ADD      r0,r0,#1
        CMP      r0,#2
        BCC      |L2.21988|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.22052|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

master_tx_fsb PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8de8
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x9aac
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x17a8
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2c88
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba8c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x94dc
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac77
        MOVT     r0,#0x4000
|L2.22276|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.22276|
        MOV      r0,#0
        MOV      r1,#0xb19c
        MOVT     r1,#0x4000
|L2.22300|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.22336|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.22300|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.22336|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_rpt_master_rx PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8db8
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x1b
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x9a7c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x1b
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x157c
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2ab8
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba80
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x9440
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac74
        MOVT     r0,#0x4000
|L2.22556|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.22556|
        MOV      r0,#0
        MOVW     r1,#0xb100
        MOVT     r1,#0x4000
|L2.22580|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.22616|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.22580|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.22616|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

mstp_check PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#0x3c
        MOVW     r6,#0
        MOVT     r6,#0xe650
        MOV      r0,#0
        MOV      r1,#0
        MOV      r2,r6
        BL       |L2.2764|
        ADD      r2,r6,#4
        MOV      r0,#0
        MOV      r1,#1
        STR      r2,[sp,#0x38]
        BL       |L2.2764|
        ADD      r2,r6,#8
        MOV      r0,#0
        MOV      r1,#2
        STR      r2,[sp,#0x34]
        BL       |L2.2764|
        ADD      r2,r6,#0xc
        MOV      r0,#0
        MOV      r1,#3
        STR      r2,[sp,#0x30]
        BL       |L2.2764|
        ADD      r2,r6,#0x10
        MOV      r0,#0
        MOV      r1,#4
        STR      r2,[sp,#0x2c]
        BL       |L2.2764|
        ADD      r2,r6,#0x14
        MOV      r0,#0
        MOV      r1,#5
        STR      r2,[sp,#0x28]
        BL       |L2.2764|
        ADD      r2,r6,#0x18
        MOV      r0,#0
        MOV      r1,#6
        STR      r2,[sp,#0x24]
        BL       |L2.2764|
        ADD      r2,r6,#0x1c
        MOV      r0,#0
        MOV      r1,#7
        STR      r2,[sp,#0x20]
        BL       |L2.2764|
        ADD      r2,r6,#0x20
        MOV      r0,#0
        MOV      r1,#8
        STR      r2,[sp,#0x1c]
        BL       |L2.2764|
        ADD      r2,r6,#0x24
        MOV      r0,#0
        MOV      r1,#9
        STR      r2,[sp,#0x18]
        BL       |L2.2764|
        ADD      r10,r6,#0x28
        MOV      r0,#0
        MOV      r1,#0xa
        MOV      r2,r10
        BL       |L2.2764|
        ADD      r11,r6,#0x2c
        MOV      r0,#0
        MOV      r1,#0xb
        MOV      r2,r11
        BL       |L2.2764|
        ADD      r8,r6,#0x30
        MOV      r0,#0
        MOV      r1,#0xc
        MOV      r2,r8
        BL       |L2.2764|
        ADD      r5,r6,#0x34
        MOV      r0,#0
        MOV      r1,#0xd
        MOV      r2,r5
        BL       |L2.2764|
        ADD      r7,r6,#0x38
        MOV      r0,#0
        MOV      r1,#0xe
        MOV      r2,r7
        BL       |L2.2764|
        ADD      r4,r6,#0x3c
        MOV      r0,#0
        MOV      r1,#0xf
        MOV      r2,r4
        BL       |L2.2764|
        MVN      r0,#0
        STR      r0,[r6,#0]
        STR      r0,[r6,#4]
        STR      r0,[r6,#8]
        STR      r0,[r6,#0xc]
        STR      r0,[r6,#0x10]
        STR      r0,[r6,#0x14]
        STR      r0,[r6,#0x18]
        STR      r0,[r6,#0x1c]
        STR      r0,[r6,#0x20]
        STR      r0,[r6,#0x24]
        STR      r0,[r6,#0x28]
        STR      r0,[r6,#0x2c]
        STR      r0,[r6,#0x30]
        STR      r0,[r6,#0x34]
        STR      r0,[r6,#0x38]
        STR      r0,[r6,#0x3c]
        MOV      r9,#0x2d14
        MOVT     r9,#0xe615
        MOV      r0,r9
        MOV      r1,#0x12
        BL       |L2.216|
|L2.23044|
        LDR      r0,[r9,#0x100]
        TST      r0,#0x40000
        BEQ      |L2.23044|
        MOV      r0,#1
        MOV      r1,#0
        MOV      r2,r6
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#1
        LDR      r2,[sp,#0x38]
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#2
        LDR      r2,[sp,#0x34]
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#3
        LDR      r2,[sp,#0x30]
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#4
        LDR      r2,[sp,#0x2c]
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#5
        LDR      r2,[sp,#0x28]
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#6
        LDR      r2,[sp,#0x24]
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#7
        LDR      r2,[sp,#0x20]
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#8
        LDR      r2,[sp,#0x1c]
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#9
        LDR      r2,[sp,#0x18]
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#0xa
        MOV      r2,r10
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#0xb
        MOV      r2,r11
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#0xc
        MOV      r2,r8
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#0xd
        MOV      r2,r5
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#0xe
        MOV      r2,r7
        BL       |L2.2764|
        MOV      r0,#1
        MOV      r1,#0xf
        MOV      r2,r4
        BL       |L2.2764|
        MOV      r0,r9
        MOV      r1,#0x12
        BL       |L2.180|
|L2.23324|
        LDR      r0,[r9,#0x100]
        TST      r0,#0x40000
        BNE      |L2.23324|
        LDR      r0,[r6,#0]
        MOV      r9,#0xb840
        MOVT     r9,#0x4000
        STR      r0,[r9,#0x100]
        MOV      r5,r6
        LDR      r0,[r5,#4]!
        STR      r0,[r9,#0x108]
        MOV      r7,r6
        LDR      r0,[r7,#8]!
        STR      r0,[r9,#0x110]
        MOV      r1,r6
        LDR      r0,[r1,#0xc]!
        STR      r1,[sp,#0x2c]
        STR      r0,[r9,#0x118]
        MOV      r1,r6
        LDR      r0,[r1,#0x10]!
        MOV      r11,r1
        STR      r11,[sp,#4]
        STR      r0,[r9,#0x120]
        MOV      r1,r6
        LDR      r0,[r1,#0x14]!
        STR      r1,[sp,#0xc]
        STR      r0,[r9,#0x128]
        MOV      r1,r6
        LDR      r0,[r1,#0x18]!
        MOV      r4,r1
        STR      r4,[sp,#8]
        STR      r0,[r9,#0x130]
        MOV      r1,r6
        LDR      r0,[r1,#0x1c]!
        STR      r1,[sp,#0x30]
        STR      r0,[r9,#0x138]
        MOV      r1,r6
        LDR      r0,[r1,#0x20]!
        STR      r1,[sp,#0x28]
        STR      r0,[r9,#0x140]
        MOV      lr,r6
        LDR      r0,[lr,#0x24]!
        STR      r0,[r9,#0x148]
        MOV      r1,r6
        LDR      r0,[r1,#0x28]!
        STR      r1,[sp,#0x34]
        STR      r0,[r9,#0x150]
        MOV      r1,r6
        LDR      r0,[r1,#0x2c]!
        STR      r1,[sp,#0x38]
        STR      r0,[r9,#0x158]
        MOV      r12,r6
        LDR      r0,[r12,#0x30]!
        STR      r0,[r9,#0x160]
        MOV      r1,r6
        LDR      r0,[r1,#0x34]!
        MOV      r3,r1
        STR      r0,[r9,#0x168]
        MOV      r1,r6
        LDR      r0,[r1,#0x38]!
        MOV      r2,r1
        STR      r0,[r9,#0x170]
        MOV      r1,r6
        LDR      r0,[r1,#0x3c]!
        STR      r0,[r9,#0x178]
        MOV      r10,#0
        STR      r10,[r6,#0]
        STR      r5,[sp,#0x10]
        STR      r10,[r5,#0]
        STR      r10,[r7,#0]
        STR      r7,[sp,#0x14]
        LDR      r8,[sp,#0x2c]
        STR      r10,[r8,#0]
        STR      r10,[r11,#0]
        LDR      r11,[sp,#0xc]
        STR      r10,[r11,#0]
        STR      r10,[r4,#0]
        LDR      r4,[sp,#0x30]
        STR      r10,[r4,#0]
        LDR      r0,[sp,#0x28]
        STR      r10,[r0,#0]
        STR      r10,[lr,#0]
        STR      lr,[sp,#0x18]
        LDR      r0,[sp,#0x34]
        STR      r10,[r0,#0]
        LDR      r0,[sp,#0x38]
        STR      r10,[r0,#0]
        STR      r10,[r12,#0]
        STR      r10,[r3,#0]
        STR      r3,[sp,#0x1c]
        STR      r10,[r2,#0]
        STR      r2,[sp,#0x20]
        STR      r10,[r1,#0]
        STR      r1,[sp,#0x24]
        LDR      r0,[r6,#0]
        STR      r0,[r9,#0x104]
        LDR      r0,[r5,#0]
        STR      r0,[r9,#0x10c]
        LDR      r0,[r7,#0]
        STR      r0,[r9,#0x114]
        LDR      r0,[r8,#0]
        STR      r0,[r9,#0x11c]
        LDR      r5,[sp,#4]
        LDR      r0,[r5,#0]
        STR      r0,[r9,#0x124]
        LDR      r0,[r11,#0]
        STR      r0,[r9,#0x12c]
        LDR      r8,[sp,#8]
        LDR      r0,[r8,#0]
        STR      r0,[r9,#0x134]
        LDR      r0,[r4,#0]
        STR      r0,[r9,#0x13c]
        LDR      r4,[sp,#0x28]
        LDR      r0,[r4,#0]
        STR      r0,[r9,#0x144]
        LDR      r0,[lr,#0]
        STR      r0,[r9,#0x14c]
        LDR      r0,[sp,#0x34]
        LDR      r0,[r0,#0]
        STR      r0,[r9,#0x154]
        LDR      r0,[sp,#0x38]
        LDR      r0,[r0,#0]
        STR      r0,[r9,#0x15c]
        LDR      r0,[r12,#0]
        MOV      r7,r12
        STR      r0,[r9,#0x164]
        LDR      r0,[r3,#0]
        STR      r0,[r9,#0x16c]
        LDR      r0,[r2,#0]
        STR      r0,[r9,#0x174]
        LDR      r0,[r1,#0]
        STR      r0,[r9,#0x17c]
        MOV      r0,#3
        MOV      r1,#0
        MOV      r2,r6
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#1
        LDR      r2,[sp,#0x10]
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#2
        LDR      r2,[sp,#0x14]
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#3
        LDR      r2,[sp,#0x2c]
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#4
        MOV      r2,r5
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#5
        MOV      r2,r11
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#6
        MOV      r2,r8
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#7
        LDR      r2,[sp,#0x30]
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#8
        MOV      r2,r4
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#9
        LDR      r2,[sp,#0x18]
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#0xa
        LDR      r2,[sp,#0x34]
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#0xb
        LDR      r2,[sp,#0x38]
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#0xc
        MOV      r2,r7
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#0xd
        LDR      r2,[sp,#0x1c]
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#0xe
        LDR      r2,[sp,#0x20]
        BL       |L2.2764|
        MOV      r0,#3
        MOV      r1,#0xf
        LDR      r2,[sp,#0x24]
        BL       |L2.2764|
        MOV      r0,#0x89c0
        MOVT     r0,#0x4000
|L2.24112|
        MOV      r1,#0
|L2.24116|
        MOV      r2,#0
|L2.24120|
        ADD      r3,r0,r10,LSL #7
        ADD      r3,r3,r1,LSL #3
        LDR      r3,[r3,r2,LSL #2]
        ADD      r7,r9,r10,LSL #7
        ADD      r7,r7,r1,LSL #3
        LDR      r7,[r7,r2,LSL #2]
        CMP      r7,r3
        BNE      |L2.24204|
        ADD      r3,r2,#1
        MOV      r2,#1
        CMP      r3,#1
        BLS      |L2.24120|
        ADD      r1,r1,#1
        CMP      r1,#0x10
        BCC      |L2.24116|
        ADD      r10,r10,#1
        CMP      r10,#4
        BCC      |L2.24112|
        MOV      r0,#0
        ADD      sp,sp,#0x3c
        POP      {r4-r11,pc}
|L2.24204|
        MOV      r0,#1
        ADD      sp,sp,#0x3c
        POP      {r4-r11,pc}
        ENDP

pad_check PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x8d40
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x9a04
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1368
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2890
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba74
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x9308
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac70
        MOVT     r0,#0x4000
|L2.24428|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.24428|
        MOV      r0,#0
        MOV      r1,#0xafc8
        MOVT     r1,#0x4000
|L2.24452|
        LDR      r2,[r5,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.24488|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.24452|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.24488|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

reg_check PROC
        PUSH     {r4,r5,r11,lr}
        MOV      r5,#0
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,#0
        MOV      r1,r4
        BL       |L2.2720|
        ADD      r1,r4,#4
        MOV      r0,#1
        BL       |L2.2720|
        ADD      r1,r4,#8
        MOV      r0,#2
        BL       |L2.2720|
        ADD      r1,r4,#0xc
        MOV      r0,#3
        BL       |L2.2720|
        ADD      r1,r4,#0x10
        MOV      r0,#4
        BL       |L2.2720|
        ADD      r1,r4,#0x14
        MOV      r0,#5
        BL       |L2.2720|
        ADD      r1,r4,#0x18
        MOV      r0,#6
        BL       |L2.2720|
        ADD      r1,r4,#0x1c
        MOV      r0,#7
        BL       |L2.2720|
        ADD      r1,r4,#0x20
        MOV      r0,#8
        BL       |L2.2720|
        ADD      r1,r4,#0x24
        MOV      r0,#9
        BL       |L2.2720|
        ADD      r1,r4,#0x28
        MOV      r0,#0xa
        BL       |L2.2720|
        ADD      r1,r4,#0x2c
        MOV      r0,#0xb
        BL       |L2.2720|
        ADD      r1,r4,#0x30
        MOV      r0,#0xc
        BL       |L2.2720|
        ADD      r1,r4,#0x34
        MOV      r0,#0xd
        BL       |L2.2720|
        ADD      r1,r4,#0x38
        MOV      r0,#0xe
        BL       |L2.2720|
        ADD      r1,r4,#0x3c
        MOV      r0,#0xf
        BL       |L2.2720|
        MOV      r0,#0x8940
        MOVT     r0,#0x4000
        MOV      r1,#0xb7c0
        MOVT     r1,#0x4000
|L2.24720|
        MOV      r2,#0
|L2.24724|
        ADD      r3,r0,r5,LSL #3
        LDR      r3,[r3,r2,LSL #2]
        ADD      r4,r1,r5,LSL #3
        LDR      r4,[r4,r2,LSL #2]
        CMP      r4,r3
        BNE      |L2.24784|
        ADD      r3,r2,#1
        MOV      r2,#1
        CMP      r3,#1
        BLS      |L2.24724|
        ADD      r5,r5,#1
        CMP      r5,#0x10
        BCC      |L2.24720|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.24784|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

renesas_slave_rx PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        ADD      r5,r4,#0x8000
        MOV      r1,#0x8f50
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.884|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r5
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r5
        BL       |L2.776|
        MOV      r1,#0x9c14
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.1960|
        LDR      r0,[r4,#0]
        BIC      r0,r0,#8
        STR      r0,[r4,#0]
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r4
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r4
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1dac
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x3328
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xbab4
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x97e8
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r5
        BL       |L2.1432|
        MOV      r0,#0xac83
        MOVT     r0,#0x4000
|L2.25016|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.25016|
        MOV      r0,r5
        BL       |L2.696|
        MOV      r0,r4
        BL       |L2.1836|
        MOV      r0,#0
        MOV      r1,#0xb4a8
        MOVT     r1,#0x4000
|L2.25056|
        LDR      r2,[r6,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.25092|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.25056|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.25092|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

renesas_slave_rx_delay PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#4
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x8d88
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        BL       |L2.776|
        SUB      r10,r4,#0x8000
        MOV      r1,#0x9a4c
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1960|
        MOVW     r0,#0x8000
        MOVT     r0,#0xffff
        LDR      r1,[r4,r0]
        BIC      r1,r1,#8
        STR      r1,[r4,r0]
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r10
        BL       |L2.1884|
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.1432|
        MOV      r6,#0x8008
        MOVT     r6,#0xffff
|L2.25232|
        LDR      r0,[r4,r6]
        TST      r0,#1
        BEQ      |L2.25232|
        MOV      r0,r10
        MOV      r1,#1
        BL       |L2.1820|
        MOV      r7,#0x800c
        MOVT     r7,#0xe650
|L2.25264|
        LDR      r0,[r7,#0]
        TST      r0,#1
        BEQ      |L2.25264|
        MOV      r0,r4
        BL       |L2.760|
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.680|
        MOV      r5,#1
        MOV      r8,#0x93d8
        MOVT     r8,#0x4000
        MOV      r9,#0xb098
        MOVT     r9,#0x4000
|L2.25316|
        LDR      r0,[r7,#0]
        TST      r0,#8
        BEQ      |L2.25316|
        CMP      r5,#0xc
        BHI      |L2.25352|
        LDR      r1,[r8,r5,LSL #2]
        MOV      r0,r4
        BL       |L2.1424|
        B        |L2.25368|
|L2.25352|
        CMP      r5,#0xd
        BNE      |L2.25368|
        MOV      r0,r4
        BL       |L2.1452|
|L2.25368|
        MOV      r0,r4
        MOV      r1,#8
        BL       |L2.680|
|L2.25380|
        LDR      r0,[r7,#0]
        TST      r0,#4
        BEQ      |L2.25380|
        MOV      r0,r4
        MOV      r1,#4
        BL       |L2.680|
|L2.25404|
        LDR      r0,[r4,r6]
        TST      r0,#2
        BEQ      |L2.25404|
        ADD      r11,r9,r5,LSL #2
        MOV      r0,r10
        BL       |L2.2440|
        STR      r0,[r11,#-4]
        MOV      r0,#0x320
        BL       |L2.2568|
        MOV      r0,r10
        MOV      r1,#2
        BL       |L2.1820|
        ADD      r5,r5,#1
        CMP      r5,#0xe
        BNE      |L2.25316|
|L2.25464|
        LDR      r0,[r4,r6]
        TST      r0,#0x10
        BEQ      |L2.25464|
        MOV      r0,r10
        MOV      r1,#0x10
        BL       |L2.1820|
|L2.25488|
        LDR      r0,[r7,#0]
        TST      r0,#0x10
        BEQ      |L2.25488|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.680|
        MOV      r0,r4
        BL       |L2.696|
        MOV      r0,r10
        BL       |L2.1836|
        MOV      r0,#0
|L2.25532|
        LDR      r1,[r8,r0,LSL #2]
        LDR      r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.25572|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.25532|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.25572|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

renesas_slave_rx_fna PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        ADD      r5,r4,#0x8000
        MOV      r1,#0x8c68
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.884|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r5
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r5
        BL       |L2.776|
        MOV      r1,#0x992c
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.1960|
        LDR      r0,[r4,#0]
        BIC      r0,r0,#8
        STR      r0,[r4,#0]
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r4
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r4
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0xe8c
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2370
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba58
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x9134
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r5
        BL       |L2.1432|
        MOV      r0,#0xac67
        MOVT     r0,#0x4000
|L2.25808|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.25808|
        MOV      r0,r5
        BL       |L2.696|
        MOV      r0,r4
        BL       |L2.1836|
        MOV      r0,#0
        MOV      r1,#0xadf4
        MOVT     r1,#0x4000
|L2.25848|
        LDR      r2,[r6,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.25884|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.25848|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.25884|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

renesas_slave_rx_fna_delay PROC
        PUSH     {r4-r9,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        ADD      r5,r4,#0x8000
        MOV      r1,#0x8f20
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.884|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r5
        BL       |L2.776|
        MOV      r1,#0x9be4
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.1960|
        LDR      r0,[r4,#0]
        BIC      r0,r0,#8
        STR      r0,[r4,#0]
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r4
        BL       |L2.1884|
        MOV      r0,r5
        MOV      r1,#0x48
        BL       |L2.1432|
|L2.26004|
        LDR      r0,[r4,#8]
        TST      r0,#1
        BEQ      |L2.26004|
        MOV      r0,r4
        MOV      r1,#1
        BL       |L2.1820|
        MOV      r6,#0x800c
        MOVT     r6,#0xe650
|L2.26036|
        LDR      r0,[r6,#0]
        TST      r0,#1
        BEQ      |L2.26036|
        MOV      r0,r5
        BL       |L2.760|
        MOV      r0,r5
        MOV      r1,#9
        BL       |L2.680|
        MOV      r7,#1
        MOV      r8,#0x9780
        MOVT     r8,#0x4000
        MOV      r9,#0xb440
        MOVT     r9,#0x4000
|L2.26088|
        LDR      r0,[r6,#0]
        TST      r0,#8
        BEQ      |L2.26088|
        CMP      r7,#0xc
        BHI      |L2.26120|
        LDR      r1,[r8,r7,LSL #2]
        MOV      r0,r5
        BL       |L2.1424|
|L2.26120|
        MOV      r0,r5
        MOV      r1,#8
        BL       |L2.680|
|L2.26132|
        LDR      r0,[r6,#0]
        TST      r0,#4
        BEQ      |L2.26132|
        MOV      r0,r5
        MOV      r1,#4
        BL       |L2.680|
|L2.26156|
        LDR      r0,[r4,#8]
        TST      r0,#2
        BEQ      |L2.26156|
        CMP      r7,#0xb
        BHI      |L2.26188|
        MOV      r0,r4
        BL       |L2.2440|
        B        |L2.26224|
|L2.26188|
        CMP      r7,#0xd
        BEQ      |L2.26216|
        CMP      r7,#0xc
        BNE      |L2.26232|
        MOV      r0,r4
        BL       |L2.2452|
        B        |L2.26224|
|L2.26216|
        MOV      r0,r4
        BL       |L2.2428|
|L2.26224|
        ADD      r1,r9,r7,LSL #2
        STR      r0,[r1,#-4]
|L2.26232|
        MOV      r0,#0x320
        BL       |L2.2568|
        MOV      r0,r4
        MOV      r1,#2
        BL       |L2.1820|
        ADD      r7,r7,#1
        CMP      r7,#0xe
        BNE      |L2.26088|
|L2.26264|
        LDR      r0,[r6,#0]
        TST      r0,#0x40
        BEQ      |L2.26264|
        MOV      r0,r5
        MOV      r1,#0x40
        BL       |L2.680|
|L2.26288|
        LDR      r0,[r4,#8]
        TST      r0,#0x10
        BEQ      |L2.26288|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.1820|
|L2.26312|
        LDR      r0,[r6,#0]
        TST      r0,#0x10
        BEQ      |L2.26312|
        MOV      r0,r5
        MOV      r1,#0x10
        BL       |L2.680|
        MOV      r0,r5
        BL       |L2.696|
        MOV      r0,r4
        BL       |L2.1836|
        MOV      r0,#0
|L2.26356|
        LDR      r1,[r8,r0,LSL #2]
        LDR      r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.26392|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.26356|
        MOV      r0,#0
        POP      {r4-r9,r11,pc}
|L2.26392|
        MOV      r0,#1
        POP      {r4-r9,r11,pc}
        ENDP

renesas_slave_rx_fna_sdbs PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x8cb0
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        SUB      r5,r4,#0x8000
        MOV      r1,#0x9974
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOVW     r1,#0xfd0
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2568
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba60
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x91d0
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac6a
        MOVT     r0,#0x4000
|L2.26612|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.26612|
        MOV      r0,r4
        BL       |L2.696|
        MOV      r0,r5
        BL       |L2.1836|
        MOV      r0,#0
        MOV      r1,#0xae90
        MOVT     r1,#0x4000
|L2.26652|
        LDR      r2,[r6,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.26688|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.26652|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.26688|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

renesas_slave_rx_sdbs PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x8c50
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        SUB      r5,r4,#0x8000
        MOV      r1,#0x9914
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0xe34
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x22bc
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba54
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOVW     r6,#0x9100
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac66
        MOVT     r0,#0x4000
|L2.26908|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.26908|
        MOV      r0,r4
        BL       |L2.696|
        MOV      r0,r5
        BL       |L2.1836|
        MOV      r0,#0
        MOV      r1,#0xadc0
        MOVT     r1,#0x4000
|L2.26948|
        LDR      r2,[r6,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.26984|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.26948|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.26984|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

renesas_slave_tx PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        ADD      r5,r4,#0x8000
        MOV      r1,#0x8c80
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.884|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.856|
        MOV      r0,r5
        BL       |L2.776|
        MOV      r1,#0x9944
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.1960|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.1932|
        MOV      r0,r4
        BL       |L2.1884|
        MOV      r0,#0xba5c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x9168
        MOVT     r6,#0x4000
        LDRB     r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.2484|
        BL       |L2.348|
        MOVW     r1,#0xf20
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x23fc
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,r5
        BL       |L2.1384|
        MOV      r0,#0xac68
        MOVT     r0,#0x4000
|L2.27212|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.27212|
        MOV      r0,r5
        BL       |L2.696|
        MOV      r0,r4
        BL       |L2.1836|
        MOV      r0,#0
        MOV      r1,#0xae28
        MOVT     r1,#0x4000
|L2.27252|
        LDR      r2,[r6,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.27288|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.27252|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.27288|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

renesas_slave_tx_delay PROC
        PUSH     {r4-r10,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x8e48
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        BL       |L2.776|
        SUB      r10,r4,#0x8000
        MOV      r1,#0x9b0c
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1960|
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r10
        BL       |L2.1884|
        MOV      r0,r10
        MOV      r1,#0x48
        BL       |L2.2484|
        MOV      r0,r4
        BL       |L2.1384|
        MOV      r6,#0x8008
        MOVT     r6,#0xffff
|L2.27412|
        LDR      r0,[r4,r6]
        TST      r0,#1
        BEQ      |L2.27412|
        MOV      r0,r10
        MOV      r1,#1
        BL       |L2.1820|
        MOV      r7,#0x800c
        MOVT     r7,#0xe650
|L2.27444|
        LDR      r0,[r7,#0]
        TST      r0,#1
        BEQ      |L2.27444|
        MOV      r0,r4
        BL       |L2.760|
        MOV      r0,r4
        MOV      r1,#3
        BL       |L2.680|
        MOV      r5,#1
        MOV      r8,#0x9578
        MOVT     r8,#0x4000
        MOV      r9,#0xb238
        MOVT     r9,#0x4000
|L2.27496|
        LDR      r0,[r4,r6]
        TST      r0,#8
        BEQ      |L2.27496|
        CMP      r5,#0xc
        BHI      |L2.27528|
        LDRB     r1,[r8,r5,LSL #2]
        MOV      r0,r10
        BL       |L2.2484|
|L2.27528|
        MOV      r0,#0x320
        BL       |L2.2568|
        MOV      r0,r10
        MOV      r1,#8
        BL       |L2.1820|
|L2.27548|
        LDR      r0,[r4,r6]
        TST      r0,#4
        BEQ      |L2.27548|
        MOV      r0,r10
        MOV      r1,#4
        BL       |L2.1820|
|L2.27572|
        LDR      r0,[r7,#0]
        TST      r0,#2
        BEQ      |L2.27572|
        CMP      r5,#0xb
        BHI      |L2.27604|
        MOV      r0,r4
        BL       |L2.1348|
        B        |L2.27640|
|L2.27604|
        CMP      r5,#0xd
        BEQ      |L2.27632|
        CMP      r5,#0xc
        BNE      |L2.27648|
        MOV      r0,r4
        BL       |L2.1360|
        B        |L2.27640|
|L2.27632|
        MOV      r0,r4
        BL       |L2.1336|
|L2.27640|
        ADD      r1,r9,r5,LSL #2
        STR      r0,[r1,#-4]
|L2.27648|
        MOV      r0,r4
        MOV      r1,#2
        BL       |L2.680|
        ADD      r5,r5,#1
        CMP      r5,#0xe
        BNE      |L2.27496|
|L2.27672|
        LDR      r0,[r4,r6]
        TST      r0,#0x10
        BEQ      |L2.27672|
        MOV      r0,r10
        MOV      r1,#0x10
        BL       |L2.1820|
|L2.27696|
        LDR      r0,[r7,#0]
        TST      r0,#0x10
        BEQ      |L2.27696|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.680|
        MOV      r0,r4
        BL       |L2.696|
        MOV      r0,r10
        BL       |L2.1836|
        MOV      r0,#0
|L2.27740|
        LDR      r1,[r8,r0,LSL #2]
        LDR      r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.27776|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.27740|
        MOV      r0,#0
        POP      {r4-r10,pc}
|L2.27776|
        MOV      r0,#1
        POP      {r4-r10,pc}
        ENDP

sdmac1ch0InterruptHandler PROC
        MOVW     r0,#0xc
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        TST      r1,#2
        BXEQ     lr
        LDR      r1,[r0,#0]
        BIC      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        MOVW     r0,#0
        MOVT     r0,#0xe650
        B        |L2.728|
        ENDP

|symbol_number.135| PROC
        MOVW     r0,#0xc
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        TST      r1,#2
        BXEQ     lr
        LDR      r1,[r0,#0]
        BIC      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        MOVW     r0,#0x8000
        MOVT     r0,#0xe650
        B        |L2.728|
        ENDP

|symbol_number.156| PROC
        MOVW     r0,#0xc
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        TST      r1,#2
        BXEQ     lr
        PUSH     {r11,lr}
        LDR      r1,[r0,#0]
        BIC      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r1,#0
        STR      r1,[r0,#0]
        MOVW     r0,#0
        MOVT     r0,#0xe650
        BL       |L2.712|
        MOV      r0,#0xac5a
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

|symbol_number.218| PROC
        MOVW     r0,#0xc
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        TST      r1,#2
        BXEQ     lr
        LDR      r1,[r0,#0]
        BIC      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        MOVW     r0,#0
        MOVT     r0,#0xe650
        B        |L2.728|
        ENDP

|symbol_number.317| PROC
        MOVW     r0,#0xc
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        TST      r1,#2
        BXEQ     lr
        PUSH     {r11,lr}
        LDR      r1,[r0,#0]
        BIC      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r1,#0
        STR      r1,[r0,#0]
        MOVW     r0,#0x8000
        MOVT     r0,#0xe650
        BL       |L2.712|
        MOV      r0,#0xac5c
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

|symbol_number.338| PROC
        MOVW     r0,#0xc
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        TST      r1,#2
        BXEQ     lr
        PUSH     {r11,lr}
        LDR      r1,[r0,#0]
        BIC      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r1,#0
        STR      r1,[r0,#0]
        MOVW     r0,#0
        MOVT     r0,#0xe650
        BL       |L2.712|
        MOV      r0,#0xac5d
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

sdmac1ch1InterruptHandler PROC
        MOV      r0,#0x100c
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        TST      r1,#2
        BXEQ     lr
        PUSH     {r11,lr}
        LDR      r1,[r0,#0]
        BIC      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r1,#0
        STR      r1,[r0,#0]
        MOVW     r0,#0x8000
        MOVT     r0,#0xe650
        BL       |L2.1852|
        MOV      r0,#0xac58
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

|symbol_number.136| PROC
        MOV      r0,#0x100c
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        TST      r1,#2
        BXEQ     lr
        PUSH     {r11,lr}
        LDR      r1,[r0,#0]
        BIC      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r1,#0
        STR      r1,[r0,#0]
        MOVW     r0,#0
        MOVT     r0,#0xe650
        BL       |L2.1852|
        MOV      r0,#0xac59
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

|symbol_number.157| PROC
        MOV      r0,#0x100c
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        TST      r1,#2
        BXEQ     lr
        LDR      r1,[r0,#0]
        BIC      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        MOVW     r0,#0x8000
        MOVT     r0,#0xe650
        B        |L2.1868|
        ENDP

|symbol_number.219| PROC
        MOV      r0,#0x100c
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        TST      r1,#2
        BXEQ     lr
        MOV      r1,#0xac50
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r2,r2,#1
        STR      r2,[r1,#0]
        LDR      r3,[r0,#0]
        BIC      r3,r3,#1
        STR      r3,[r0,#0]
        CMP      r2,#1
        BHI      |L2.28636|
        LDR      r1,[r1,#0]
        MOV      r2,#0xaffc
        MOVT     r2,#0x4000
        MOV      r3,#0x34
        MLA      r1,r1,r3,r2
        STR      r1,[r0,#-8]
        LDR      r1,[r0,#-4]
        MOV      r2,#0xd
        BFI      r1,r2,#0,#24
        STR      r1,[r0,#-4]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        BX       lr
|L2.28636|
        PUSH     {r11,lr}
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r1,#0
        STR      r1,[r0,#0]
        MOVW     r0,#0x8000
        MOVT     r0,#0xe650
        BL       |L2.1852|
        MOV      r0,#0xac5b
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

|symbol_number.318| PROC
        MOV      r0,#0x100c
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        TST      r1,#2
        BXEQ     lr
        LDR      r1,[r0,#0]
        BIC      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        MOVW     r0,#0
        MOVT     r0,#0xe650
        B        |L2.1868|
        ENDP

|symbol_number.339| PROC
        MOV      r0,#0x100c
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        TST      r1,#2
        BXEQ     lr
        MOV      r1,#0xac54
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r2,r2,#1
        STR      r2,[r1,#0]
        LDR      r3,[r0,#0]
        BIC      r3,r3,#1
        STR      r3,[r0,#0]
        CMP      r2,#1
        BHI      |L2.28892|
        LDR      r1,[r1,#0]
        MOV      r2,#0x95ac
        MOVT     r2,#0x4000
        MOV      r3,#0x34
        MLA      r1,r1,r3,r2
        ADD      r1,r1,#4
        STR      r1,[r0,#-0xc]
        LDR      r1,[r0,#-4]
        MOV      r2,#0xd
        BFI      r1,r2,#0,#24
        STR      r1,[r0,#-4]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        BX       lr
|L2.28892|
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        MOVW     r0,#0x8000
        MOVT     r0,#0xe650
        B        |L2.1868|
        ENDP

slave_general_call PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x8e78
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        SUB      r5,r4,#0x8000
        MOV      r1,#0x9b3c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1a04
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2f04
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba98
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x9614
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac7c
        MOVT     r0,#0x4000
|L2.29128|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.29128|
        MOV      r0,r4
        BL       |L2.696|
        MOV      r0,r5
        BL       |L2.1836|
        MOV      r0,#0
        MOV      r1,#0xb2d4
        MOVT     r1,#0x4000
|L2.29168|
        LDR      r2,[r6,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.29204|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.29168|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.29204|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

slave_nack_addr PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOVW     r1,#0x8e00
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        SUB      r5,r4,#0x8000
        MOV      r1,#0x9ac4
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1854
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2ce0
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba90
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        ADR      r0,|symbol_number.297|
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac78
        MOVT     r0,#0x4000
|L2.29420|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.29420|
        MOV      r0,r4
        BL       |L2.696|
        MOV      r0,r5
        BL       |L2.1836|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|symbol_number.297|
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
        ENDP

slave_rx PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x8d70
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        SUB      r5,r4,#0x8000
        MOV      r1,#0x9a34
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1498
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2970
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba78
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x93a4
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac72
        MOVT     r0,#0x4000
|L2.29720|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.29720|
        MOV      r0,r4
        BL       |L2.696|
        MOV      r0,r5
        BL       |L2.1836|
        MOV      r0,#0
        MOV      r1,#0xb064
        MOVT     r1,#0x4000
|L2.29760|
        LDR      r2,[r6,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.29796|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.29760|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.29796|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

slave_rx_dma PROC
        PUSH     {r4-r10,lr}
        MOV      r4,#0x2c1c
        MOVT     r4,#0xe615
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.216|
        ADD      r0,r4,#0x80
        MOV      r1,#9
        BL       |L2.216|
        MOV      r6,#0x919c
        MOVT     r6,#0x4000
        ADD      r0,r6,#4
        MOVW     r5,#0xc
        MOVT     r5,#0xe730
        STR      r0,[r5,#-0xc]
        MOV      r0,#0x8024
        MOVT     r0,#0xe650
        STR      r0,[r5,#-8]
        LDR      r0,[r5,#-4]
        MOV      r1,#0xc
        BFI      r0,r1,#0,#24
        STR      r0,[r5,#-4]
        LDR      r0,[r5,#0]
        BIC      r0,r0,#0xc000
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        MOV      r10,#1
        BFI      r0,r10,#12,#2
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        MOV      r8,#8
        BFI      r0,r8,#8,#4
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        BIC      r0,r0,#0x300000
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        MOV      r9,#2
        BFI      r0,r9,#3,#2
        STR      r0,[r5,#0]
        MOV      r0,#0x93
        STRH     r0,[r5,#0x34]
        LDR      r0,[r5,#0]
        ORR      r0,r0,#4
        STR      r0,[r5,#0]
        LDR      r0,[r5,#0]
        ORR      r0,r0,#1
        STR      r0,[r5,#0]
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x8c98
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        MOV      r0,#0x7fdc
        SUB      r0,r4,r0
        STR      r0,[r5,#0xff4]
        MOV      r0,#0x100c
        MOVT     r0,#0xe730
        MOV      r7,#0xae5c
        MOVT     r7,#0x4000
        STR      r7,[r0,#-8]
        LDR      r1,[r0,#-4]
        MOV      r2,#0xd
        BFI      r1,r2,#0,#24
        STR      r1,[r0,#-4]
        LDR      r1,[r0,#0]
        BFI      r1,r10,#14,#2
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#0x3000
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BFI      r1,r8,#8,#4
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#0x300000
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BFI      r1,r9,#3,#2
        STR      r1,[r0,#0]
        MOV      r1,#0xa0
        STRH     r1,[r0,#0x34]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#4
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        SUB      r5,r4,#0x8000
        MOV      r1,#0x995c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0xf84
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x24c4
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOV      r1,#0x6cc0
        MOVT     r1,#0x4000
        MOV      r0,#0x40
        BL       |L2.644|
        MOV      r1,#0x6ec0
        MOVT     r1,#0x4000
        MOV      r0,#0x41
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0x40
        BL       |L2.420|
        MOV      r0,#0x41
        BL       |L2.420|
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.1432|
        MOV      r0,#0xac69
        MOVT     r0,#0x4000
|L2.30364|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.30364|
        MOV      r0,r4
        BL       |L2.696|
        MOV      r0,r5
        BL       |L2.1836|
        MOV      r0,#0
|L2.30396|
        LDR      r1,[r6,r0,LSL #2]
        LDRB     r2,[r7,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.30432|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.30396|
        MOV      r0,#0
        POP      {r4-r10,pc}
|L2.30432|
        MOV      r0,#1
        POP      {r4-r10,pc}
        ENDP

slave_rx_fna PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x8e90
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.856|
        MOV      r0,r4
        BL       |L2.776|
        SUB      r5,r4,#0x8000
        MOV      r1,#0x9b54
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1960|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1932|
        MOV      r0,r5
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1a5c
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2fb8
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0xba9c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x9648
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1432|
        MOV      r0,#0xac7d
        MOVT     r0,#0x4000
|L2.30652|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.30652|
        MOV      r0,r4
        BL       |L2.696|
        MOV      r0,r5
        BL       |L2.1836|
        MOV      r0,#0
        MOV      r1,#0xb308
        MOVT     r1,#0x4000
|L2.30692|
        LDR      r2,[r6,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.30728|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.30692|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.30728|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

slave_tx PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        ADD      r5,r4,#0x8000
        MOV      r1,#0x8bd8
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.884|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.856|
        MOV      r0,r5
        BL       |L2.776|
        MOV      r1,#0x989c
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.1960|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.1932|
        MOV      r0,r4
        BL       |L2.1884|
        MOV      r0,#0xba44
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x8ffc
        MOVT     r6,#0x4000
        LDRB     r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.2484|
        BL       |L2.348|
        MOV      r1,#0xb88
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x1fec
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,r5
        BL       |L2.1384|
        MOV      r0,#0xac61
        MOVT     r0,#0x4000
|L2.30956|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.30956|
        MOV      r0,r5
        BL       |L2.696|
        MOV      r0,r4
        BL       |L2.1836|
        MOV      r0,#0
        MOV      r1,#0xacbc
        MOVT     r1,#0x4000
|L2.30996|
        LDR      r2,[r6,r0,LSL #2]
        LDR      r3,[r1,r0,LSL #2]
        CMP      r3,r2
        BNE      |L2.31032|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.30996|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.31032|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

slave_tx_delay PROC
        PUSH     {r4-r10,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x8ef0
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.884|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r4
        BL       |L2.776|
        SUB      r10,r4,#0x8000
        MOV      r1,#0x9bb4
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1960|
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r10
        BL       |L2.1884|
        MOV      r0,r10
        MOV      r1,#0x48
        BL       |L2.2484|
        MOV      r0,r4
        BL       |L2.1384|
        MOV      r7,#0x8008
        MOVT     r7,#0xffff
|L2.31156|
        LDR      r0,[r4,r7]
        TST      r0,#1
        BEQ      |L2.31156|
        MOV      r0,r10
        MOV      r1,#1
        BL       |L2.1820|
        MOV      r6,#0x800c
        MOVT     r6,#0xe650
|L2.31188|
        LDR      r0,[r6,#0]
        TST      r0,#1
        BEQ      |L2.31188|
        MOV      r0,r4
        BL       |L2.760|
        MOV      r0,r4
        MOV      r1,#3
        BL       |L2.680|
        MOV      r5,#1
        MOV      r9,#0xb3d8
        MOVT     r9,#0x4000
        MOV      r8,#0x9718
        MOVT     r8,#0x4000
|L2.31240|
        LDR      r0,[r6,#0]
        TST      r0,#2
        BEQ      |L2.31240|
        CMP      r5,#0xb
        BHI      |L2.31272|
        MOV      r0,r4
        BL       |L2.1348|
        B        |L2.31308|
|L2.31272|
        CMP      r5,#0xd
        BEQ      |L2.31300|
        CMP      r5,#0xc
        BNE      |L2.31316|
        MOV      r0,r4
        BL       |L2.1360|
        B        |L2.31308|
|L2.31300|
        MOV      r0,r4
        BL       |L2.1336|
|L2.31308|
        ADD      r1,r9,r5,LSL #2
        STR      r0,[r1,#-4]
|L2.31316|
        MOV      r0,r4
        MOV      r1,#2
        BL       |L2.680|
|L2.31328|
        LDR      r0,[r4,r7]
        TST      r0,#4
        BEQ      |L2.31328|
        MOV      r0,r10
        MOV      r1,#4
        BL       |L2.1820|
|L2.31352|
        LDR      r0,[r4,r7]
        TST      r0,#8
        BEQ      |L2.31352|
        CMP      r5,#0xc
        BHI      |L2.31384|
        LDRB     r1,[r8,r5,LSL #2]
        MOV      r0,r10
        BL       |L2.2484|
|L2.31384|
        MOV      r0,#0xc8
        BL       |L2.2568|
        MOV      r0,r10
        MOV      r1,#8
        BL       |L2.1820|
        ADD      r5,r5,#1
        CMP      r5,#0xe
        BNE      |L2.31240|
|L2.31416|
        LDR      r0,[r4,r7]
        TST      r0,#0x10
        BEQ      |L2.31416|
        MOV      r0,r10
        MOV      r1,#0x10
        BL       |L2.1820|
|L2.31440|
        LDR      r0,[r6,#0]
        TST      r0,#0x10
        BEQ      |L2.31440|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.680|
        MOV      r0,r4
        BL       |L2.696|
        MOV      r0,r10
        BL       |L2.1836|
        MOV      r0,#0
|L2.31484|
        LDR      r1,[r8,r0,LSL #2]
        LDR      r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.31520|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.31484|
        MOV      r0,#0
        POP      {r4-r10,pc}
|L2.31520|
        MOV      r0,#1
        POP      {r4-r10,pc}
        ENDP

slave_tx_dma PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#4
        MOV      r4,#0x2c1c
        MOVT     r4,#0xe615
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.216|
        ADD      r0,r4,#0x80
        MOV      r1,#9
        BL       |L2.216|
        MOVW     r4,#0xc
        MOVT     r4,#0xe730
        MOV      r0,#0x8024
        MOVT     r0,#0xe650
        STR      r0,[r4,#-0xc]
        MOV      r6,#0xb204
        MOVT     r6,#0x4000
        STR      r6,[r4,#-8]
        LDR      r0,[r4,#-4]
        MOV      r1,#0xd
        BFI      r0,r1,#0,#24
        STR      r0,[r4,#-4]
        LDR      r0,[r4,#0]
        MOV      r8,#1
        BFI      r0,r8,#14,#2
        STR      r0,[r4,#0]
        LDR      r0,[r4,#0]
        BIC      r0,r0,#0x3000
        STR      r0,[r4,#0]
        LDR      r0,[r4,#0]
        MOV      r10,#8
        BFI      r0,r10,#8,#4
        STR      r0,[r4,#0]
        LDR      r0,[r4,#0]
        BIC      r0,r0,#0x300000
        STR      r0,[r4,#0]
        LDR      r0,[r4,#0]
        MOV      r11,#2
        BFI      r0,r11,#3,#2
        STR      r0,[r4,#0]
        MOV      r0,#0x92
        STRH     r0,[r4,#0x34]
        LDR      r0,[r4,#0]
        ORR      r0,r0,#4
        STR      r0,[r4,#0]
        LDR      r0,[r4,#0]
        ORR      r0,r0,#1
        STR      r0,[r4,#0]
        MOVW     r9,#0
        MOVT     r9,#0xe650
        ADD      r5,r9,#0x8000
        MOV      r1,#0x8e30
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.884|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.680|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.856|
        MOV      r0,r5
        BL       |L2.776|
        MOV      r7,#0x9544
        MOVT     r7,#0x4000
        ADD      r0,r7,#4
        STR      r0,[r4,#0xff4]
        ADD      r0,r9,#0x24
        MOV      r1,#0x100c
        MOVT     r1,#0xe730
        STR      r0,[r1,#-8]
        LDR      r0,[r1,#-4]
        MOV      r2,#0xc
        BFI      r0,r2,#0,#24
        STR      r0,[r1,#-4]
        LDR      r0,[r1,#0]
        BIC      r0,r0,#0xc000
        STR      r0,[r1,#0]
        LDR      r0,[r1,#0]
        BFI      r0,r8,#12,#2
        STR      r0,[r1,#0]
        LDR      r0,[r1,#0]
        BFI      r0,r10,#8,#4
        STR      r0,[r1,#0]
        LDR      r0,[r1,#0]
        BIC      r0,r0,#0x300000
        STR      r0,[r1,#0]
        LDR      r0,[r1,#0]
        BFI      r0,r11,#3,#2
        STR      r0,[r1,#0]
        MOV      r0,#0xa1
        STRH     r0,[r1,#0x34]
        LDR      r0,[r1,#0]
        ORR      r0,r0,#4
        STR      r0,[r1,#0]
        LDR      r0,[r1,#0]
        ORR      r0,r0,#1
        STR      r0,[r1,#0]
        MOV      r1,#0x9af4
        MOVT     r1,#0x4000
        MOV      r0,r9
        BL       |L2.1960|
        MOV      r0,r9
        MVN      r1,#0
        BL       |L2.1820|
        MOV      r0,r9
        MVN      r1,#0
        BL       |L2.1932|
        MOV      r0,r9
        MOV      r1,#0x48
        BL       |L2.2484|
        MOV      r0,r9
        BL       |L2.1884|
        BL       |L2.348|
        MOV      r1,#0x1904
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.644|
        MOV      r1,#0x2dc4
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.644|
        MOV      r1,#0x6d94
        MOVT     r1,#0x4000
        MOV      r0,#0x40
        BL       |L2.644|
        MOV      r1,#0x7020
        MOVT     r1,#0x4000
        MOV      r0,#0x41
        BL       |L2.644|
        MOVW     r0,#0x10e
        BL       |L2.420|
        MOV      r0,#0x10f
        BL       |L2.420|
        MOV      r0,#0x40
        BL       |L2.420|
        MOV      r0,#0x41
        BL       |L2.420|
        MOV      r0,r5
        BL       |L2.1384|
        MOV      r0,#0xac7a
        MOVT     r0,#0x4000
|L2.32096|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.32096|
        MOV      r0,r5
        BL       |L2.696|
        MOV      r0,r9
        BL       |L2.1836|
        MOV      r0,#0
|L2.32128|
        LDR      r1,[r7,r0,LSL #2]
        LDRB     r2,[r6,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.32168|
        ADD      r0,r0,#1
        CMP      r0,#0xc
        BLS      |L2.32128|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.32168|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

srst_check PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#0x3c
        MOV      r9,#0
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,#0
        MOV      r1,#0
        MOV      r2,r4
        BL       |L2.2672|
        ADD      r2,r4,#4
        STR      r2,[sp,#0x38]
        MOV      r0,#0
        MOV      r1,#1
        BL       |L2.2672|
        ADD      r2,r4,#8
        STR      r2,[sp,#0x34]
        MOV      r0,#0
        MOV      r1,#2
        BL       |L2.2672|
        ADD      r2,r4,#0xc
        STR      r2,[sp,#0x2c]
        MOV      r0,#0
        MOV      r1,#3
        BL       |L2.2672|
        ADD      r11,r4,#0x10
        MOV      r0,#0
        MOV      r1,#4
        MOV      r2,r11
        STR      r11,[sp,#0x24]
        BL       |L2.2672|
        ADD      r2,r4,#0x14
        STR      r2,[sp,#0x28]
        MOV      r0,#0
        MOV      r1,#5
        BL       |L2.2672|
        ADD      r6,r4,#0x18
        MOV      r0,#0
        MOV      r1,#6
        MOV      r2,r6
        STR      r6,[sp,#0x20]
        BL       |L2.2672|
        ADD      r2,r4,#0x1c
        STR      r2,[sp,#0x30]
        MOV      r0,#0
        MOV      r1,#7
        BL       |L2.2672|
        ADD      r2,r4,#0x20
        STR      r2,[sp,#0x10]
        MOV      r0,#0
        MOV      r1,#8
        BL       |L2.2672|
        ADD      r8,r4,#0x24
        MOV      r0,#0
        MOV      r1,#9
        MOV      r2,r8
        BL       |L2.2672|
        ADD      r2,r4,#0x28
        STR      r2,[sp,#0xc]
        MOV      r0,#0
        MOV      r1,#0xa
        BL       |L2.2672|
        ADD      r10,r4,#0x2c
        MOV      r0,#0
        MOV      r1,#0xb
        MOV      r2,r10
        STR      r10,[sp,#0x1c]
        BL       |L2.2672|
        ADD      r7,r4,#0x30
        MOV      r0,#0
        MOV      r1,#0xc
        MOV      r2,r7
        STR      r7,[sp,#0x18]
        BL       |L2.2672|
        ADD      r2,r4,#0x34
        STR      r2,[sp,#8]
        MOV      r0,#0
        MOV      r1,#0xd
        BL       |L2.2672|
        ADD      r5,r4,#0x38
        MOV      r0,#0
        MOV      r1,#0xe
        MOV      r2,r5
        STR      r5,[sp,#0x14]
        BL       |L2.2672|
        ADD      r2,r4,#0x3c
        STR      r2,[sp,#4]
        MOV      r0,#0
        MOV      r1,#0xf
        BL       |L2.2672|
        MVN      r0,#0
        STR      r0,[r4,#0]
        STR      r0,[r4,#4]
        STR      r0,[r4,#8]
        STR      r0,[r4,#0xc]
        STR      r0,[r4,#0x10]
        STR      r0,[r4,#0x14]
        STR      r0,[r4,#0x18]
        STR      r0,[r4,#0x1c]
        STR      r0,[r4,#0x20]
        STR      r0,[r4,#0x24]
        STR      r0,[r4,#0x28]
        STR      r0,[r4,#0x2c]
        STR      r0,[r4,#0x30]
        STR      r0,[r4,#0x34]
        STR      r0,[r4,#0x38]
        STR      r0,[r4,#0x3c]
        MOV      r0,#0x2c14
        MOVT     r0,#0xe615
        MOV      r1,#0x12
        BL       |L2.216|
        MOV      r0,#1
        MOV      r1,#0
        MOV      r2,r4
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#1
        LDR      r2,[sp,#0x38]
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#2
        LDR      r2,[sp,#0x34]
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#3
        LDR      r2,[sp,#0x2c]
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#4
        MOV      r2,r11
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#5
        LDR      r2,[sp,#0x28]
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#6
        MOV      r2,r6
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#7
        LDR      r2,[sp,#0x30]
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#8
        LDR      r11,[sp,#0x10]
        MOV      r2,r11
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#9
        MOV      r2,r8
        MOV      r6,r8
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#0xa
        LDR      r8,[sp,#0xc]
        MOV      r2,r8
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#0xb
        MOV      r2,r10
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#0xc
        MOV      r2,r7
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#0xd
        LDR      r7,[sp,#8]
        MOV      r2,r7
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#0xe
        MOV      r2,r5
        BL       |L2.2672|
        MOV      r0,#1
        MOV      r1,#0xf
        LDR      r5,[sp,#4]
        MOV      r2,r5
        BL       |L2.2672|
        MOV      r0,#0x2c14
        MOVT     r0,#0xe615
        ADD      r0,r0,#0x80
        MOV      r1,#0x12
        BL       |L2.216|
        LDR      r0,[r4,#0]
        MOV      r10,#0xb5c0
        MOVT     r10,#0x4000
        STR      r0,[r10,#0x100]
        LDR      r0,[r4,#4]
        STR      r0,[r10,#0x108]
        LDR      r0,[r4,#8]
        STR      r0,[r10,#0x110]
        LDR      r0,[r4,#0xc]
        STR      r0,[r10,#0x118]
        LDR      r0,[r4,#0x10]
        STR      r0,[r10,#0x120]
        LDR      r0,[r4,#0x14]
        STR      r0,[r10,#0x128]
        LDR      r0,[r4,#0x18]
        STR      r0,[r10,#0x130]
        LDR      r0,[r4,#0x1c]
        STR      r0,[r10,#0x138]
        LDR      r0,[r4,#0x20]
        STR      r0,[r10,#0x140]
        LDR      r0,[r4,#0x24]
        STR      r0,[r10,#0x148]
        LDR      r0,[r4,#0x28]
        STR      r0,[r10,#0x150]
        LDR      r0,[r4,#0x2c]
        STR      r0,[r10,#0x158]
        LDR      r0,[r4,#0x30]
        STR      r0,[r10,#0x160]
        LDR      r0,[r4,#0x34]
        STR      r0,[r10,#0x168]
        LDR      r0,[r4,#0x38]
        STR      r0,[r10,#0x170]
        LDR      r0,[r4,#0x3c]
        STR      r9,[r10,#0x104]
        STR      r9,[r10,#0x10c]
        STR      r9,[r10,#0x114]
        STR      r9,[r10,#0x11c]
        STR      r9,[r10,#0x124]
        STR      r9,[r10,#0x12c]
        STR      r9,[r10,#0x134]
        STR      r9,[r10,#0x13c]
        STR      r9,[r10,#0x144]
        STR      r9,[r10,#0x14c]
        STR      r9,[r10,#0x154]
        STR      r9,[r10,#0x15c]
        STR      r9,[r10,#0x164]
        STR      r9,[r10,#0x16c]
        STR      r9,[r10,#0x174]
        STR      r9,[r10,#0x17c]
        STR      r0,[r10,#0x178]
        MOV      r0,#3
        MOV      r1,#0
        MOV      r2,r4
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#1
        LDR      r2,[sp,#0x38]
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#2
        LDR      r2,[sp,#0x34]
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#3
        LDR      r2,[sp,#0x2c]
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#4
        LDR      r2,[sp,#0x24]
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#5
        LDR      r2,[sp,#0x28]
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#6
        LDR      r2,[sp,#0x20]
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#7
        LDR      r2,[sp,#0x30]
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#8
        MOV      r2,r11
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#9
        MOV      r2,r6
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#0xa
        MOV      r2,r8
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#0xb
        LDR      r2,[sp,#0x1c]
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#0xc
        LDR      r2,[sp,#0x18]
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#0xd
        MOV      r2,r7
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#0xe
        LDR      r2,[sp,#0x14]
        BL       |L2.2672|
        MOV      r0,#3
        MOV      r1,#0xf
        MOV      r2,r5
        BL       |L2.2672|
        MOV      r0,#0x8740
        MOVT     r0,#0x4000
|L2.33380|
        MOV      r1,#0
|L2.33384|
        MOV      r2,#0
|L2.33388|
        ADD      r3,r0,r9,LSL #7
        ADD      r3,r3,r1,LSL #3
        LDR      r3,[r3,r2,LSL #2]
        ADD      r7,r10,r9,LSL #7
        ADD      r7,r7,r1,LSL #3
        LDR      r7,[r7,r2,LSL #2]
        CMP      r7,r3
        BNE      |L2.33472|
        ADD      r3,r2,#1
        MOV      r2,#1
        CMP      r3,#1
        BLS      |L2.33388|
        ADD      r1,r1,#1
        CMP      r1,#0x10
        BCC      |L2.33384|
        ADD      r9,r9,#1
        CMP      r9,#4
        BCC      |L2.33380|
        MOV      r0,#0
        ADD      sp,sp,#0x3c
        POP      {r4-r11,pc}
|L2.33472|
        MOV      r0,#1
        ADD      sp,sp,#0x3c
        POP      {r4-r11,pc}
        ENDP

||$Ven$AA$L$$Reset_Handler|| PROC
|L2.33484|
        LDR      pc,|L2.33488|
|L2.33488|
        DCD      0x00000070
        ENDP

_fp_init PROC
|L2.33492|
        MOV      r0,#0x3000000
        VMSR     FPSCR,r0
__fplib_config_fpu_vfp                  ; Alternate entry point
__fplib_config_pureend_doubles                  ; Alternate entry point
        BX       lr
        ENDP

I2C_CLOCK_SETTINGS
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
        DCD      0x0000002c
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
        DCD      0x00000014
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
        DCD      0x00000009
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
        DCD      0x00000007
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
        DCD      0x00000005
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
        DCD      0x00000003
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
        DCD      0x00000003
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x0000000f
        DCD      0x00000006
        DCD      0x00000000
        DCD      0x0000001c
        DCD      0x00000501
        DCD      0x00000514
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x0000000f
        DCD      0x00000006
        DCD      0x00000000
        DCD      0x0000001c
        DCD      0x00000267
        DCD      0x00000279
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x0000000f
        DCD      0x00000006
        DCD      0x00000000
        DCD      0x0000001c
        DCD      0x00000119
        DCD      0x00000119
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x0000000f
        DCD      0x00000006
        DCD      0x00000000
        DCD      0x0000001c
        DCD      0x000000d7
        DCD      0x000000e9
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x0000000f
        DCD      0x00000006
        DCD      0x00000000
        DCD      0x0000001c
        DCD      0x000000aa
        DCD      0x000000bd
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x0000000f
        DCD      0x00000006
        DCD      0x00000000
        DCD      0x0000001c
        DCD      0x00000073
        DCD      0x00000085
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x0000000f
        DCD      0x00000006
        DCD      0x00000000
        DCD      0x0000001c
        DCD      0x00000020
        DCD      0x00000027
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
        DCD      0x0000002c
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
        DCD      0x00000014
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
        DCD      0x00000009
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
        DCD      0x00000007
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
        DCD      0x00000005
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
        DCD      0x00000003
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
        DCD      0x00000003
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x0000000f
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000006
        DCD      0x00000000
        DCD      0x0000001c
        DCD      0x00000501
        DCD      0x00000514
        DCD      0x00000000
        DCD      0x0000000f
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000006
        DCD      0x00000000
        DCD      0x0000001c
        DCD      0x00000267
        DCD      0x00000279
        DCD      0x00000000
        DCD      0x0000000f
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000006
        DCD      0x00000000
        DCD      0x0000001c
        DCD      0x00000119
        DCD      0x00000119
        DCD      0x00000000
        DCD      0x0000000f
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000006
        DCD      0x00000000
        DCD      0x0000001c
        DCD      0x000000d7
        DCD      0x000000e9
        DCD      0x00000000
        DCD      0x0000000f
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000006
        DCD      0x00000000
        DCD      0x0000001c
        DCD      0x000000aa
        DCD      0x000000bd
        DCD      0x00000000
        DCD      0x0000000f
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000006
        DCD      0x00000000
        DCD      0x0000001c
        DCD      0x00000073
        DCD      0x00000085
        DCD      0x00000000
        DCD      0x0000000f
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000006
        DCD      0x00000000
        DCD      0x0000001c
        DCD      0x00000020
        DCD      0x00000027
        DCD      0x00000001
golden
        DCD      0x1f1f1f1f
        DCD      0x00000000
        DCD      0xdfdfdfdf
        DCD      0x40404040
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x1f1f1f1f
        DCD      0x00000000
        DCD      0x7f7f7f7f
        DCD      0x00000000
        DCD      0x000001ff
        DCD      0x00000000
        DCD      0x7f7f7f7f
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x87878787
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x0000ffff
        DCD      0x00000000
        DCD      0x0000ffff
        DCD      0x00000000
        DCD      0x1f1f001f
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x40404040
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000004
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x1f1f1f1f
        DCD      0x00000000
        DCD      0xdfdfdfdf
        DCD      0x40404040
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x1f1f1f1f
        DCD      0x00000000
        DCD      0x7f7f7f7f
        DCD      0x00000000
        DCD      0x000001ff
        DCD      0x00000000
        DCD      0x7f7f7f7f
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x87878787
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x0000ffff
        DCD      0x00000000
        DCD      0x0000ffff
        DCD      0x00000000
        DCD      0x1f1f001f
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
|symbol_number.333|
        DCD      0x1f1f1f1f
        DCD      0x00000000
        DCD      0xdfdfdfdf
        DCD      0x40404040
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x1f1f1f1f
        DCD      0x00000000
        DCD      0x7f7f7f7f
        DCD      0x00000000
        DCD      0x000001ff
        DCD      0x00000000
        DCD      0x7f7f7f7f
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x87878787
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x0000ffff
        DCD      0x00000000
        DCD      0x0000ffff
        DCD      0x00000000
        DCD      0x1f1f001f
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
|symbol_number.422|
        DCD      0x1f1f1f1f
        DCD      0x00000000
        DCD      0xdfdfdfdf
        DCD      0x40404040
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x1f1f1f1f
        DCD      0x00000000
        DCD      0x7f7f7f7f
        DCD      0x00000000
        DCD      0x000001ff
        DCD      0x00000000
        DCD      0x7f7f7f7f
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x87878787
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x0000ffff
        DCD      0x00000000
        DCD      0x0000ffff
        DCD      0x00000000
        DCD      0x1f1f001f
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x1f1f1f1f
        DCD      0x00000000
        DCD      0xdfdfdfdf
        DCD      0x40404040
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x1f1f1f1f
        DCD      0x00000000
        DCD      0x7f7f7f7f
        DCD      0x00000000
        DCD      0x000001ff
        DCD      0x00000000
        DCD      0x7f7f7f7f
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x87878787
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x0000ffff
        DCD      0x00000000
        DCD      0x0000ffff
        DCD      0x00000000
        DCD      0x1f1f001f
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x1f1f1f1f
        DCD      0x00000000
        DCD      0xdfdfdfdf
        DCD      0x40404040
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x1f1f1f1f
        DCD      0x00000000
        DCD      0x7f7f7f7f
        DCD      0x00000000
        DCD      0x000001ff
        DCD      0x00000000
        DCD      0x7f7f7f7f
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x87878787
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x0000ffff
        DCD      0x00000000
        DCD      0x0000ffff
        DCD      0x00000000
        DCD      0x1f1f001f
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
masterConfig
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.48|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.61|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.69|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|symbol_number.85|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000003
|symbol_number.95|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
|symbol_number.105|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.115|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.125|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.138|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.146|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.159|
        DCD      0x00000001
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.167|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.178|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.188|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.198|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.208|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.221|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.230|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.238|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.246|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000004
|symbol_number.257|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.279|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000004
|symbol_number.289|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.300|
        DCD      0x00000000
        DCD      0x00000052
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.307|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
|symbol_number.320|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.326|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.341|
        DCD      0x00000001
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.350|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.360|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.370|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000002
|symbol_number.380|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000002
|symbol_number.390|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
|symbol_number.400|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.407|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000003
|symbol_number.415|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.426|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|symbol_number.436|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.447|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.459|
        DCD      0x00000001
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
masterConfig0
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
masterConfig1
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
|symbol_number.50|
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
|symbol_number.71|
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
|symbol_number.87|
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
|symbol_number.97|
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
|symbol_number.107|
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
|symbol_number.117|
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
|symbol_number.127|
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
|symbol_number.137|
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
|symbol_number.148|
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
|symbol_number.160|
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
|symbol_number.169|
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
|symbol_number.180|
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
|symbol_number.190|
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
|symbol_number.200|
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
|symbol_number.210|
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
|symbol_number.220|
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
        DCD      0x00000052
        DCD      0x00000045
        DCD      0x0000004e
        DCD      0x00000045
        DCD      0x00000053
        DCD      0x00000041
        DCD      0x00000053
        DCD      0x00000020
        DCD      0x00000043
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x00000050
        DCD      0x0000002e
|symbol_number.232|
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
|symbol_number.240|
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
|symbol_number.248|
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
|symbol_number.259|
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
|symbol_number.270|
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
|symbol_number.281|
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
|symbol_number.291|
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
|symbol_number.309|
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
|symbol_number.321|
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
|symbol_number.328|
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
|symbol_number.342|
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
        DCD      0x00000052
        DCD      0x00000045
        DCD      0x0000004e
        DCD      0x00000045
        DCD      0x00000053
        DCD      0x00000041
        DCD      0x00000053
        DCD      0x00000020
        DCD      0x00000043
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x00000050
        DCD      0x0000002e
|symbol_number.352|
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
|symbol_number.362|
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
|symbol_number.372|
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
|symbol_number.382|
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
|symbol_number.392|
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
|symbol_number.402|
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
|symbol_number.409|
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
|symbol_number.417|
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
|symbol_number.428|
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
|symbol_number.438|
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
|symbol_number.449|
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
|symbol_number.461|
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
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.49|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.63|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.70|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000000
|symbol_number.86|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000003
|symbol_number.96|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000001
|symbol_number.106|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.116|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.126|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.140|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.147|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.161|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.168|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.179|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.189|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.199|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.209|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.224|
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.231|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.239|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.247|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000004
|symbol_number.258|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.280|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000004
|symbol_number.290|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.301|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.308|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000006
|symbol_number.322|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.327|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.344|
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.351|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.361|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.371|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000002
|symbol_number.381|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000002
|symbol_number.391|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
|symbol_number.401|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.408|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000003
|symbol_number.416|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.427|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|symbol_number.437|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.448|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000005
|symbol_number.460|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
slaveConfig0
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005

        AREA ||area_number.3||, DATA, ALIGN=2

        EXPORTAS ||area_number.3||, ER10
GIC_intHandler
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
        DCD      0x40000158
pattern
        DCD      0x40005fb0
        DCD      0x40005860
        DCD      0x40007db4
        DCD      0x40005e98
        DCD      0x400034c8
        DCD      0x4000721c
        DCD      0x400070f4
        DCD      0x40007344
        DCD      0x400076e8
        DCD      0x40007810
        DCD      0x40007940
        DCD      0x40006848
        DCD      0x40006720
        DCD      0x400060d8
        DCD      0x4000620c
        DCD      0x400063f0
        DCD      0x40006524
        DCD      0x40006970
        DCD      0x40006aa0
        DCD      0x4000746c
        DCD      0x40007b28
        DCD      0x400038f8
        DCD      0x40004118
        DCD      0x40005630
        DCD      0x40005748
        DCD      0x400037e0
        DCD      0x40003ff4
        DCD      0x40003674
        DCD      0x40003a18
        DCD      0x40005068
        DCD      0x40003c98
        DCD      0x400052e0
        DCD      0x40004e38
        DCD      0x40004f50
        DCD      0x40004230
        DCD      0x40004348
        DCD      0x40004578
        DCD      0x40004690
        DCD      0x400047a8
        DCD      0x400048c0
        DCD      0x400049d8
        DCD      0x40004af0
        DCD      0x40004c08
        DCD      0x40004d20
        DCD      0x40004460

        AREA ||area_number.4||, DATA, NOINIT, ALIGN=2

        EXPORTAS ||area_number.4||, ER10
DumpOffset
        %        4
currentDataPackageIndex
        %        4
|symbol_number.343|
        %        4
isAutoTransferComplete
        %        1
|symbol_number.142|
        %        1
|symbol_number.163|
        %        1
|symbol_number.226|
        %        1
|symbol_number.324|
        %        1
|symbol_number.346|
        %        1
isMasterLostArbitration
        %        1
isStartByteTransmitted
        %        1
isTransferComplete
        %        1
|symbol_number.52|
        %        1
|symbol_number.64|
        %        1
|symbol_number.73|
        %        1
|symbol_number.89|
        %        1
|symbol_number.99|
        %        1
|symbol_number.109|
        %        1
|symbol_number.119|
        %        1
|symbol_number.129|
        %        1
|symbol_number.141|
        %        1
|symbol_number.150|
        %        1
|symbol_number.162|
        %        1
|symbol_number.171|
        %        1
|symbol_number.182|
        %        1
|symbol_number.192|
        %        1
|symbol_number.202|
        %        1
|symbol_number.212|
        %        1
|symbol_number.225|
        %        1
|symbol_number.234|
        %        1
|symbol_number.250|
        %        1
|symbol_number.261|
        %        1
|symbol_number.272|
        %        1
|symbol_number.283|
        %        1
|symbol_number.293|
        %        1
|symbol_number.303|
        %        1
|symbol_number.311|
        %        1
|symbol_number.323|
        %        1
|symbol_number.345|
        %        1
|symbol_number.354|
        %        1
|symbol_number.364|
        %        1
|symbol_number.374|
        %        1
|symbol_number.384|
        %        1
|symbol_number.394|
        %        1
|symbol_number.411|
        %        1
|symbol_number.430|
        %        1
|symbol_number.440|
        %        1
|symbol_number.451|
        %        1
|symbol_number.463|
        %        3
receivedData
        %        52
|symbol_number.53|
        %        52
|symbol_number.62|
        %        52
|symbol_number.74|
        %        52
|symbol_number.90|
        %        52
|symbol_number.100|
        %        52
|symbol_number.110|
        %        52
|symbol_number.120|
        %        52
|symbol_number.130|
        %        52
|symbol_number.139|
        %        52
|symbol_number.151|
        %        52
|symbol_number.158|
        %        52
|symbol_number.172|
        %        52
|symbol_number.183|
        %        52
|symbol_number.193|
        %        52
|symbol_number.203|
        %        52
|symbol_number.213|
        %        52
|symbol_number.222|
        %        104
|symbol_number.235|
        %        52
|symbol_number.241|
        %        52
|symbol_number.251|
        %        52
|symbol_number.262|
        %        52
|symbol_number.273|
        %        52
|symbol_number.284|
        %        52
|symbol_number.294|
        %        52
|symbol_number.312|
        %        52
|symbol_number.319|
        %        52
|symbol_number.329|
        %        52
|symbol_number.340|
        %        104
|symbol_number.355|
        %        52
|symbol_number.365|
        %        52
|symbol_number.375|
        %        52
|symbol_number.385|
        %        52
|symbol_number.395|
        %        52
|symbol_number.403|
        %        52
|symbol_number.412|
        %        52
|symbol_number.418|
        %        52
|symbol_number.431|
        %        52
|symbol_number.441|
        %        52
|symbol_number.452|
        %        52
|symbol_number.464|
        %        52
receivedDataIndex
        %        4
|symbol_number.54|
        %        4
|symbol_number.75|
        %        4
|symbol_number.91|
        %        4
|symbol_number.101|
        %        4
|symbol_number.111|
        %        4
|symbol_number.121|
        %        4
|symbol_number.131|
        %        4
|symbol_number.152|
        %        4
|symbol_number.174|
        %        4
|symbol_number.184|
        %        4
|symbol_number.194|
        %        4
|symbol_number.204|
        %        4
|symbol_number.214|
        %        4
|symbol_number.236|
        %        4
|symbol_number.252|
        %        4
|symbol_number.263|
        %        4
|symbol_number.275|
        %        4
|symbol_number.285|
        %        4
|symbol_number.295|
        %        4
|symbol_number.313|
        %        4
|symbol_number.356|
        %        4
|symbol_number.366|
        %        4
|symbol_number.376|
        %        4
|symbol_number.386|
        %        4
|symbol_number.396|
        %        4
|symbol_number.413|
        %        4
|symbol_number.432|
        %        4
|symbol_number.442|
        %        4
|symbol_number.453|
        %        4
|symbol_number.465|
        %        4
result
        %        512
|symbol_number.332|
        %        128
|symbol_number.421|
        %        512
sendDataIndex
        %        4
|symbol_number.51|
        %        4
|symbol_number.72|
        %        4
|symbol_number.88|
        %        4
|symbol_number.98|
        %        4
|symbol_number.108|
        %        4
|symbol_number.118|
        %        4
|symbol_number.128|
        %        4
|symbol_number.149|
        %        4
|symbol_number.170|
        %        4
|symbol_number.181|
        %        4
|symbol_number.191|
        %        4
|symbol_number.201|
        %        4
|symbol_number.211|
        %        4
|symbol_number.233|
        %        4
|symbol_number.249|
        %        4
|symbol_number.260|
        %        4
|symbol_number.271|
        %        4
|symbol_number.282|
        %        4
|symbol_number.292|
        %        4
|symbol_number.302|
        %        4
|symbol_number.310|
        %        4
|symbol_number.353|
        %        4
|symbol_number.363|
        %        4
|symbol_number.373|
        %        4
|symbol_number.383|
        %        4
|symbol_number.393|
        %        4
|symbol_number.410|
        %        4
|symbol_number.429|
        %        4
|symbol_number.439|
        %        4
|symbol_number.450|
        %        4
|symbol_number.462|
        %        4

        AREA ARM_LIB_STACK, DATA, NOINIT, ALIGN=0

        %        1024

||Image$$ARM_LIB_HEAP$$ZI$$Base|| EQU 1073789632
||Image$$ARM_LIB_HEAP$$ZI$$Limit|| EQU 1073789632
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
        EXPORT __mpu_init [CODE]
        EXPORT __mpu_init_el1 [CODE]
        EXPORT ||$Ven$AA$L$$UndefinedInstruction_Handler|| [CODE]
        EXPORT ||$Ven$AA$L$$SupervisorCall_Handler|| [CODE]
        EXPORT ||$Ven$AA$L$$PrefetchAbort_Handler|| [CODE]
        EXPORT ||$Ven$AA$L$$DataAbort_Handler|| [CODE]
        EXPORT ||$Ven$AA$L$$IRQ_Handler|| [CODE]
        EXPORT ||$Ven$AT$L$$__rt_entry|| [CODE]
        EXPORT ||Region$$Table$$Base||
        EXPORT ||Region$$Table$$Limit||
        EXPORT __vectors_start [CODE]
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
        EXPORT CPG_ClearBit [CODE]
        EXPORT CPG_SetBit [CODE]
        EXPORT CPG_SetMultipleBit [CODE]
        EXPORT DMAC_initDescriptorMemory [CODE]
        EXPORT DataAbort_Handler [CODE]
        EXPORT GIC_defaultHandler [CODE]
        EXPORT GIC_enable [CODE]
        EXPORT GIC_enableInterrupt [CODE]
        EXPORT GIC_endInterrupt [CODE]
        EXPORT GIC_executeInterruptHandler [CODE]
        EXPORT GIC_getACKID [CODE]
        EXPORT GIC_setInterruptHandler [CODE]
        EXPORT I2C_configPins [CODE]
        EXPORT I2C_masterClearInterruptStatus [CODE]
        EXPORT I2C_masterDisable [CODE]
        EXPORT I2C_masterDisableDMAReceive [CODE]
        EXPORT I2C_masterDisableDMATransmit [CODE]
        EXPORT I2C_masterDisableStartByteTransmit [CODE]
        EXPORT I2C_masterDisableStartGeneration [CODE]
        EXPORT I2C_masterEnable [CODE]
        EXPORT I2C_masterEnableDMAContinuousReceive [CODE]
        EXPORT I2C_masterEnableDMAContinuousTransmit [CODE]
        EXPORT I2C_masterEnableDMAReceive [CODE]
        EXPORT I2C_masterEnableDMATransmit [CODE]
        EXPORT I2C_masterEnableInterrupt [CODE]
        EXPORT I2C_masterGetInterruptStatus [CODE]
        EXPORT I2C_masterInit [CODE]
        EXPORT I2C_masterReceiveMultipleByteFinish [CODE]
        EXPORT I2C_masterReceiveMultipleByteNext [CODE]
        EXPORT I2C_masterReceiveMultipleByteStop [CODE]
        EXPORT I2C_masterReceiveStart [CODE]
        EXPORT I2C_masterRestart [CODE]
        EXPORT I2C_masterSendMultipleByteNext [CODE]
        EXPORT I2C_masterSendMultipleByteStart [CODE]
        EXPORT I2C_masterSendMultipleByteStop [CODE]
        EXPORT I2C_masterSetDMAContinuousReceiveBlockCount [CODE]
        EXPORT I2C_masterSetDMAContinuousTransferCount [CODE]
        EXPORT I2C_masterSetDMAContinuousTransmitBlockCount [CODE]
        EXPORT I2C_modelConnect [CODE]
        EXPORT I2C_modelDisable [CODE]
        EXPORT I2C_releasePins [CODE]
        EXPORT I2C_reset [CODE]
        EXPORT I2C_slaveClearInterruptStatus [CODE]
        EXPORT I2C_slaveDisable [CODE]
        EXPORT I2C_slaveDisableDMAReceive [CODE]
        EXPORT I2C_slaveDisableDMATransmit [CODE]
        EXPORT I2C_slaveEnable [CODE]
        EXPORT I2C_slaveEnableDMAReceive [CODE]
        EXPORT I2C_slaveEnableDMATransmit [CODE]
        EXPORT I2C_slaveEnableInterrupt [CODE]
        EXPORT I2C_slaveGetInterruptStatus [CODE]
        EXPORT I2C_slaveInit [CODE]
        EXPORT I2C_slaveReceiveMultipleByteFinish [CODE]
        EXPORT I2C_slaveReceiveMultipleByteNext [CODE]
        EXPORT I2C_slaveReceiveMultipleByteStop [CODE]
        EXPORT I2C_slaveSetAddress [CODE]
        EXPORT I2C_slaveSetData [CODE]
        EXPORT IRQ_Handler [CODE]
        EXPORT PFC_ClearMultipleBit [CODE]
        EXPORT PFC_SetMultipleBit [CODE]
        EXPORT PrefetchAbort_Handler [CODE]
        EXPORT Sim_Delay [CODE]
        EXPORT Sim_Dump [CODE]
        EXPORT Sim_Stop [CODE]
        EXPORT SupervisorCall_Handler [CODE]
        EXPORT UndefinedInstruction_Handler [CODE]
        EXPORT _sys_exit [CODE]
        EXPORT interrupt_check [CODE]
        EXPORT main [CODE]
        EXPORT master_arbitration_lost [CODE]
        EXPORT master_general_call [CODE]
        EXPORT master_rx [CODE]
        EXPORT master_rx_dma [CODE]
        EXPORT master_rx_dma_continuous [CODE]
        EXPORT master_send_start_byte [CODE]
        EXPORT master_tx [CODE]
        EXPORT master_tx_100kHz [CODE]
        EXPORT master_tx_100kHz_var_duty [CODE]
        EXPORT master_tx_1MHz_var_duty [CODE]
        EXPORT master_tx_200kHz [CODE]
        EXPORT master_tx_200kHz_var_duty [CODE]
        EXPORT master_tx_250kHz [CODE]
        EXPORT master_tx_250kHz_var_duty [CODE]
        EXPORT master_tx_300kHz [CODE]
        EXPORT master_tx_300kHz_var_duty [CODE]
        EXPORT master_tx_400kHz [CODE]
        EXPORT master_tx_400kHz_var_duty [CODE]
        EXPORT master_tx_50kHz [CODE]
        EXPORT master_tx_50kHz_var_duty [CODE]
        EXPORT master_tx_dma [CODE]
        EXPORT master_tx_dma_continuous [CODE]
        EXPORT master_tx_fsb [CODE]
        EXPORT master_tx_rpt_master_rx [CODE]
        EXPORT mstp_check [CODE]
        EXPORT pad_check [CODE]
        EXPORT reg_check [CODE]
        EXPORT renesas_slave_rx [CODE]
        EXPORT renesas_slave_rx_delay [CODE]
        EXPORT renesas_slave_rx_fna [CODE]
        EXPORT renesas_slave_rx_fna_delay [CODE]
        EXPORT renesas_slave_rx_fna_sdbs [CODE]
        EXPORT renesas_slave_rx_sdbs [CODE]
        EXPORT renesas_slave_tx [CODE]
        EXPORT renesas_slave_tx_delay [CODE]
        EXPORT slave_general_call [CODE]
        EXPORT slave_nack_addr [CODE]
        EXPORT slave_rx [CODE]
        EXPORT slave_rx_dma [CODE]
        EXPORT slave_rx_fna [CODE]
        EXPORT slave_tx [CODE]
        EXPORT slave_tx_delay [CODE]
        EXPORT slave_tx_dma [CODE]
        EXPORT srst_check [CODE]
        EXPORT ||$Ven$AA$L$$Reset_Handler|| [CODE]
        EXPORT _fp_init [CODE,DYNAMIC]
        EXPORT __fplib_config_fpu_vfp [CODE,DYNAMIC]
        EXPORT __fplib_config_pureend_doubles [CODE,DYNAMIC]
        EXPORT I2C_CLOCK_SETTINGS [DATA,SIZE=1120]
        EXPORT GIC_intHandler [DATA,SIZE=3876]
        EXPORT pattern [DATA,SIZE=180]
        EXPORT DumpOffset [DATA,SIZE=4]

        KEEP __ddr_init_start
        KEEP __ddr_init_end
        KEEP i2c0InterruptHandler
        KEEP i2c1InterruptHandler
        KEEP masterConfig
        KEEP slaveConfig
        KEEP sendData
        KEEP |symbol_number.46|
        EXPORTAS |symbol_number.46|, i2c0InterruptHandler
        KEEP |symbol_number.47|
        EXPORTAS |symbol_number.47|, i2c1InterruptHandler
        KEEP |symbol_number.48|
        EXPORTAS |symbol_number.48|, masterConfig
        KEEP |symbol_number.49|
        EXPORTAS |symbol_number.49|, slaveConfig
        KEEP |symbol_number.50|
        EXPORTAS |symbol_number.50|, sendData
        KEEP |symbol_number.56|
        EXPORTAS |symbol_number.56|, i2c1InterruptHandler
        KEEP |symbol_number.57|
        EXPORTAS |symbol_number.57|, i2c0InterruptHandler
        KEEP sdmac1ch0InterruptHandler
        KEEP sdmac1ch1InterruptHandler
        KEEP |symbol_number.60|
        EXPORTAS |symbol_number.60|, sendData
        KEEP |symbol_number.61|
        EXPORTAS |symbol_number.61|, masterConfig
        KEEP |symbol_number.63|
        EXPORTAS |symbol_number.63|, slaveConfig
        KEEP |symbol_number.67|
        EXPORTAS |symbol_number.67|, i2c0InterruptHandler
        KEEP |symbol_number.68|
        EXPORTAS |symbol_number.68|, i2c1InterruptHandler
        KEEP |symbol_number.69|
        EXPORTAS |symbol_number.69|, masterConfig
        KEEP |symbol_number.70|
        EXPORTAS |symbol_number.70|, slaveConfig
        KEEP |symbol_number.71|
        EXPORTAS |symbol_number.71|, sendData
        KEEP checkReg
        KEEP golden
        KEEP |symbol_number.83|
        EXPORTAS |symbol_number.83|, i2c0InterruptHandler
        KEEP |symbol_number.84|
        EXPORTAS |symbol_number.84|, i2c1InterruptHandler
        KEEP |symbol_number.85|
        EXPORTAS |symbol_number.85|, masterConfig
        KEEP |symbol_number.86|
        EXPORTAS |symbol_number.86|, slaveConfig
        KEEP |symbol_number.87|
        EXPORTAS |symbol_number.87|, sendData
        KEEP |symbol_number.93|
        EXPORTAS |symbol_number.93|, i2c0InterruptHandler
        KEEP |symbol_number.94|
        EXPORTAS |symbol_number.94|, i2c1InterruptHandler
        KEEP |symbol_number.95|
        EXPORTAS |symbol_number.95|, masterConfig
        KEEP |symbol_number.96|
        EXPORTAS |symbol_number.96|, slaveConfig
        KEEP |symbol_number.97|
        EXPORTAS |symbol_number.97|, sendData
        KEEP |symbol_number.103|
        EXPORTAS |symbol_number.103|, i2c0InterruptHandler
        KEEP |symbol_number.104|
        EXPORTAS |symbol_number.104|, i2c1InterruptHandler
        KEEP |symbol_number.105|
        EXPORTAS |symbol_number.105|, masterConfig
        KEEP |symbol_number.106|
        EXPORTAS |symbol_number.106|, slaveConfig
        KEEP |symbol_number.107|
        EXPORTAS |symbol_number.107|, sendData
        KEEP |symbol_number.113|
        EXPORTAS |symbol_number.113|, i2c0InterruptHandler
        KEEP |symbol_number.114|
        EXPORTAS |symbol_number.114|, i2c1InterruptHandler
        KEEP |symbol_number.115|
        EXPORTAS |symbol_number.115|, masterConfig
        KEEP |symbol_number.116|
        EXPORTAS |symbol_number.116|, slaveConfig
        KEEP |symbol_number.117|
        EXPORTAS |symbol_number.117|, sendData
        KEEP |symbol_number.123|
        EXPORTAS |symbol_number.123|, i2c0InterruptHandler
        KEEP |symbol_number.124|
        EXPORTAS |symbol_number.124|, i2c1InterruptHandler
        KEEP |symbol_number.125|
        EXPORTAS |symbol_number.125|, masterConfig
        KEEP |symbol_number.126|
        EXPORTAS |symbol_number.126|, slaveConfig
        KEEP |symbol_number.127|
        EXPORTAS |symbol_number.127|, sendData
        KEEP |symbol_number.133|
        EXPORTAS |symbol_number.133|, i2c0InterruptHandler
        KEEP |symbol_number.134|
        EXPORTAS |symbol_number.134|, i2c1InterruptHandler
        KEEP |symbol_number.135|
        EXPORTAS |symbol_number.135|, sdmac1ch0InterruptHandler
        KEEP |symbol_number.136|
        EXPORTAS |symbol_number.136|, sdmac1ch1InterruptHandler
        KEEP |symbol_number.137|
        EXPORTAS |symbol_number.137|, sendData
        KEEP |symbol_number.138|
        EXPORTAS |symbol_number.138|, masterConfig
        KEEP |symbol_number.140|
        EXPORTAS |symbol_number.140|, slaveConfig
        KEEP |symbol_number.144|
        EXPORTAS |symbol_number.144|, i2c0InterruptHandler
        KEEP |symbol_number.145|
        EXPORTAS |symbol_number.145|, i2c1InterruptHandler
        KEEP |symbol_number.146|
        EXPORTAS |symbol_number.146|, masterConfig
        KEEP |symbol_number.147|
        EXPORTAS |symbol_number.147|, slaveConfig
        KEEP |symbol_number.148|
        EXPORTAS |symbol_number.148|, sendData
        KEEP |symbol_number.154|
        EXPORTAS |symbol_number.154|, i2c1InterruptHandler
        KEEP |symbol_number.155|
        EXPORTAS |symbol_number.155|, i2c0InterruptHandler
        KEEP |symbol_number.156|
        EXPORTAS |symbol_number.156|, sdmac1ch0InterruptHandler
        KEEP |symbol_number.157|
        EXPORTAS |symbol_number.157|, sdmac1ch1InterruptHandler
        KEEP |symbol_number.159|
        EXPORTAS |symbol_number.159|, masterConfig
        KEEP |symbol_number.160|
        EXPORTAS |symbol_number.160|, sendData
        KEEP |symbol_number.161|
        EXPORTAS |symbol_number.161|, slaveConfig
        KEEP |symbol_number.165|
        EXPORTAS |symbol_number.165|, i2c0InterruptHandler
        KEEP |symbol_number.166|
        EXPORTAS |symbol_number.166|, i2c1InterruptHandler
        KEEP |symbol_number.167|
        EXPORTAS |symbol_number.167|, masterConfig
        KEEP |symbol_number.168|
        EXPORTAS |symbol_number.168|, slaveConfig
        KEEP |symbol_number.169|
        EXPORTAS |symbol_number.169|, sendData
        KEEP |symbol_number.176|
        EXPORTAS |symbol_number.176|, i2c0InterruptHandler
        KEEP |symbol_number.177|
        EXPORTAS |symbol_number.177|, i2c1InterruptHandler
        KEEP |symbol_number.178|
        EXPORTAS |symbol_number.178|, masterConfig
        KEEP |symbol_number.179|
        EXPORTAS |symbol_number.179|, slaveConfig
        KEEP |symbol_number.180|
        EXPORTAS |symbol_number.180|, sendData
        KEEP |symbol_number.186|
        EXPORTAS |symbol_number.186|, i2c0InterruptHandler
        KEEP |symbol_number.187|
        EXPORTAS |symbol_number.187|, i2c1InterruptHandler
        KEEP |symbol_number.188|
        EXPORTAS |symbol_number.188|, masterConfig
        KEEP |symbol_number.189|
        EXPORTAS |symbol_number.189|, slaveConfig
        KEEP |symbol_number.190|
        EXPORTAS |symbol_number.190|, sendData
        KEEP |symbol_number.196|
        EXPORTAS |symbol_number.196|, i2c0InterruptHandler
        KEEP |symbol_number.197|
        EXPORTAS |symbol_number.197|, i2c1InterruptHandler
        KEEP |symbol_number.198|
        EXPORTAS |symbol_number.198|, masterConfig
        KEEP |symbol_number.199|
        EXPORTAS |symbol_number.199|, slaveConfig
        KEEP |symbol_number.200|
        EXPORTAS |symbol_number.200|, sendData
        KEEP |symbol_number.206|
        EXPORTAS |symbol_number.206|, i2c0InterruptHandler
        KEEP |symbol_number.207|
        EXPORTAS |symbol_number.207|, i2c1InterruptHandler
        KEEP |symbol_number.208|
        EXPORTAS |symbol_number.208|, masterConfig
        KEEP |symbol_number.209|
        EXPORTAS |symbol_number.209|, slaveConfig
        KEEP |symbol_number.210|
        EXPORTAS |symbol_number.210|, sendData
        KEEP |symbol_number.216|
        EXPORTAS |symbol_number.216|, i2c0InterruptHandler
        KEEP |symbol_number.217|
        EXPORTAS |symbol_number.217|, i2c1InterruptHandler
        KEEP |symbol_number.218|
        EXPORTAS |symbol_number.218|, sdmac1ch0InterruptHandler
        KEEP |symbol_number.219|
        EXPORTAS |symbol_number.219|, sdmac1ch1InterruptHandler
        KEEP |symbol_number.220|
        EXPORTAS |symbol_number.220|, sendData
        KEEP |symbol_number.221|
        EXPORTAS |symbol_number.221|, masterConfig
        KEEP |symbol_number.224|
        EXPORTAS |symbol_number.224|, slaveConfig
        KEEP |symbol_number.228|
        EXPORTAS |symbol_number.228|, i2c0InterruptHandler
        KEEP |symbol_number.229|
        EXPORTAS |symbol_number.229|, i2c1InterruptHandler
        KEEP |symbol_number.230|
        EXPORTAS |symbol_number.230|, masterConfig
        KEEP |symbol_number.231|
        EXPORTAS |symbol_number.231|, slaveConfig
        KEEP |symbol_number.232|
        EXPORTAS |symbol_number.232|, sendData
        KEEP |symbol_number.238|
        EXPORTAS |symbol_number.238|, masterConfig
        KEEP |symbol_number.239|
        EXPORTAS |symbol_number.239|, slaveConfig
        KEEP |symbol_number.240|
        EXPORTAS |symbol_number.240|, sendData
        KEEP |symbol_number.244|
        EXPORTAS |symbol_number.244|, i2c0InterruptHandler
        KEEP |symbol_number.245|
        EXPORTAS |symbol_number.245|, i2c1InterruptHandler
        KEEP |symbol_number.246|
        EXPORTAS |symbol_number.246|, masterConfig
        KEEP |symbol_number.247|
        EXPORTAS |symbol_number.247|, slaveConfig
        KEEP |symbol_number.248|
        EXPORTAS |symbol_number.248|, sendData
        KEEP |symbol_number.255|
        EXPORTAS |symbol_number.255|, i2c0InterruptHandler
        KEEP |symbol_number.256|
        EXPORTAS |symbol_number.256|, i2c1InterruptHandler
        KEEP |symbol_number.257|
        EXPORTAS |symbol_number.257|, masterConfig
        KEEP |symbol_number.258|
        EXPORTAS |symbol_number.258|, slaveConfig
        KEEP |symbol_number.259|
        EXPORTAS |symbol_number.259|, sendData
        KEEP |symbol_number.265|
        EXPORTAS |symbol_number.265|, i2c0InterruptHandler
        KEEP |symbol_number.266|
        EXPORTAS |symbol_number.266|, i2c1InterruptHandler
        KEEP masterConfig0
        KEEP slaveConfig0
        KEEP masterConfig1
        KEEP |symbol_number.270|
        EXPORTAS |symbol_number.270|, sendData
        KEEP |symbol_number.277|
        EXPORTAS |symbol_number.277|, i2c0InterruptHandler
        KEEP |symbol_number.278|
        EXPORTAS |symbol_number.278|, i2c1InterruptHandler
        KEEP |symbol_number.279|
        EXPORTAS |symbol_number.279|, masterConfig
        KEEP |symbol_number.280|
        EXPORTAS |symbol_number.280|, slaveConfig
        KEEP |symbol_number.281|
        EXPORTAS |symbol_number.281|, sendData
        KEEP |symbol_number.287|
        EXPORTAS |symbol_number.287|, i2c0InterruptHandler
        KEEP |symbol_number.288|
        EXPORTAS |symbol_number.288|, i2c1InterruptHandler
        KEEP |symbol_number.289|
        EXPORTAS |symbol_number.289|, masterConfig
        KEEP |symbol_number.290|
        EXPORTAS |symbol_number.290|, slaveConfig
        KEEP |symbol_number.291|
        EXPORTAS |symbol_number.291|, sendData
        KEEP |symbol_number.297|
        EXPORTAS |symbol_number.297|, sendData
        KEEP |symbol_number.298|
        EXPORTAS |symbol_number.298|, i2c0InterruptHandler
        KEEP |symbol_number.299|
        EXPORTAS |symbol_number.299|, i2c1InterruptHandler
        KEEP |symbol_number.300|
        EXPORTAS |symbol_number.300|, masterConfig
        KEEP |symbol_number.301|
        EXPORTAS |symbol_number.301|, slaveConfig
        KEEP |symbol_number.305|
        EXPORTAS |symbol_number.305|, i2c0InterruptHandler
        KEEP |symbol_number.306|
        EXPORTAS |symbol_number.306|, i2c1InterruptHandler
        KEEP |symbol_number.307|
        EXPORTAS |symbol_number.307|, masterConfig
        KEEP |symbol_number.308|
        EXPORTAS |symbol_number.308|, slaveConfig
        KEEP |symbol_number.309|
        EXPORTAS |symbol_number.309|, sendData
        KEEP |symbol_number.315|
        EXPORTAS |symbol_number.315|, i2c0InterruptHandler
        KEEP |symbol_number.316|
        EXPORTAS |symbol_number.316|, i2c1InterruptHandler
        KEEP |symbol_number.317|
        EXPORTAS |symbol_number.317|, sdmac1ch0InterruptHandler
        KEEP |symbol_number.318|
        EXPORTAS |symbol_number.318|, sdmac1ch1InterruptHandler
        KEEP |symbol_number.320|
        EXPORTAS |symbol_number.320|, masterConfig
        KEEP |symbol_number.321|
        EXPORTAS |symbol_number.321|, sendData
        KEEP |symbol_number.322|
        EXPORTAS |symbol_number.322|, slaveConfig
        KEEP |symbol_number.326|
        EXPORTAS |symbol_number.326|, masterConfig
        KEEP |symbol_number.327|
        EXPORTAS |symbol_number.327|, slaveConfig
        KEEP |symbol_number.328|
        EXPORTAS |symbol_number.328|, sendData
        KEEP |symbol_number.331|
        EXPORTAS |symbol_number.331|, checkReg
        KEEP |symbol_number.333|
        EXPORTAS |symbol_number.333|, golden
        KEEP |symbol_number.336|
        EXPORTAS |symbol_number.336|, i2c0InterruptHandler
        KEEP |symbol_number.337|
        EXPORTAS |symbol_number.337|, i2c1InterruptHandler
        KEEP |symbol_number.338|
        EXPORTAS |symbol_number.338|, sdmac1ch0InterruptHandler
        KEEP |symbol_number.339|
        EXPORTAS |symbol_number.339|, sdmac1ch1InterruptHandler
        KEEP |symbol_number.341|
        EXPORTAS |symbol_number.341|, masterConfig
        KEEP |symbol_number.342|
        EXPORTAS |symbol_number.342|, sendData
        KEEP |symbol_number.344|
        EXPORTAS |symbol_number.344|, slaveConfig
        KEEP |symbol_number.348|
        EXPORTAS |symbol_number.348|, i2c0InterruptHandler
        KEEP |symbol_number.349|
        EXPORTAS |symbol_number.349|, i2c1InterruptHandler
        KEEP |symbol_number.350|
        EXPORTAS |symbol_number.350|, masterConfig
        KEEP |symbol_number.351|
        EXPORTAS |symbol_number.351|, slaveConfig
        KEEP |symbol_number.352|
        EXPORTAS |symbol_number.352|, sendData
        KEEP |symbol_number.358|
        EXPORTAS |symbol_number.358|, i2c0InterruptHandler
        KEEP |symbol_number.359|
        EXPORTAS |symbol_number.359|, i2c1InterruptHandler
        KEEP |symbol_number.360|
        EXPORTAS |symbol_number.360|, masterConfig
        KEEP |symbol_number.361|
        EXPORTAS |symbol_number.361|, slaveConfig
        KEEP |symbol_number.362|
        EXPORTAS |symbol_number.362|, sendData
        KEEP |symbol_number.368|
        EXPORTAS |symbol_number.368|, i2c0InterruptHandler
        KEEP |symbol_number.369|
        EXPORTAS |symbol_number.369|, i2c1InterruptHandler
        KEEP |symbol_number.370|
        EXPORTAS |symbol_number.370|, masterConfig
        KEEP |symbol_number.371|
        EXPORTAS |symbol_number.371|, slaveConfig
        KEEP |symbol_number.372|
        EXPORTAS |symbol_number.372|, sendData
        KEEP |symbol_number.378|
        EXPORTAS |symbol_number.378|, i2c0InterruptHandler
        KEEP |symbol_number.379|
        EXPORTAS |symbol_number.379|, i2c1InterruptHandler
        KEEP |symbol_number.380|
        EXPORTAS |symbol_number.380|, masterConfig
        KEEP |symbol_number.381|
        EXPORTAS |symbol_number.381|, slaveConfig
        KEEP |symbol_number.382|
        EXPORTAS |symbol_number.382|, sendData
        KEEP |symbol_number.388|
        EXPORTAS |symbol_number.388|, i2c0InterruptHandler
        KEEP |symbol_number.389|
        EXPORTAS |symbol_number.389|, i2c1InterruptHandler
        KEEP |symbol_number.390|
        EXPORTAS |symbol_number.390|, masterConfig
        KEEP |symbol_number.391|
        EXPORTAS |symbol_number.391|, slaveConfig
        KEEP |symbol_number.392|
        EXPORTAS |symbol_number.392|, sendData
        KEEP |symbol_number.400|
        EXPORTAS |symbol_number.400|, masterConfig
        KEEP |symbol_number.401|
        EXPORTAS |symbol_number.401|, slaveConfig
        KEEP |symbol_number.402|
        EXPORTAS |symbol_number.402|, sendData
        KEEP |symbol_number.405|
        EXPORTAS |symbol_number.405|, i2c0InterruptHandler
        KEEP |symbol_number.406|
        EXPORTAS |symbol_number.406|, i2c1InterruptHandler
        KEEP |symbol_number.407|
        EXPORTAS |symbol_number.407|, masterConfig
        KEEP |symbol_number.408|
        EXPORTAS |symbol_number.408|, slaveConfig
        KEEP |symbol_number.409|
        EXPORTAS |symbol_number.409|, sendData
        KEEP |symbol_number.415|
        EXPORTAS |symbol_number.415|, masterConfig
        KEEP |symbol_number.416|
        EXPORTAS |symbol_number.416|, slaveConfig
        KEEP |symbol_number.417|
        EXPORTAS |symbol_number.417|, sendData
        KEEP |symbol_number.420|
        EXPORTAS |symbol_number.420|, checkReg
        KEEP |symbol_number.422|
        EXPORTAS |symbol_number.422|, golden
        KEEP |symbol_number.424|
        EXPORTAS |symbol_number.424|, i2c0InterruptHandler
        KEEP |symbol_number.425|
        EXPORTAS |symbol_number.425|, i2c1InterruptHandler
        KEEP |symbol_number.426|
        EXPORTAS |symbol_number.426|, masterConfig
        KEEP |symbol_number.427|
        EXPORTAS |symbol_number.427|, slaveConfig
        KEEP |symbol_number.428|
        EXPORTAS |symbol_number.428|, sendData
        KEEP |symbol_number.434|
        EXPORTAS |symbol_number.434|, i2c0InterruptHandler
        KEEP |symbol_number.435|
        EXPORTAS |symbol_number.435|, i2c1InterruptHandler
        KEEP |symbol_number.436|
        EXPORTAS |symbol_number.436|, masterConfig
        KEEP |symbol_number.437|
        EXPORTAS |symbol_number.437|, slaveConfig
        KEEP |symbol_number.438|
        EXPORTAS |symbol_number.438|, sendData
        KEEP |symbol_number.445|
        EXPORTAS |symbol_number.445|, i2c0InterruptHandler
        KEEP |symbol_number.446|
        EXPORTAS |symbol_number.446|, i2c1InterruptHandler
        KEEP |symbol_number.447|
        EXPORTAS |symbol_number.447|, masterConfig
        KEEP |symbol_number.448|
        EXPORTAS |symbol_number.448|, slaveConfig
        KEEP |symbol_number.449|
        EXPORTAS |symbol_number.449|, sendData
        KEEP |symbol_number.457|
        EXPORTAS |symbol_number.457|, i2c0InterruptHandler
        KEEP |symbol_number.458|
        EXPORTAS |symbol_number.458|, i2c1InterruptHandler
        KEEP |symbol_number.459|
        EXPORTAS |symbol_number.459|, masterConfig
        KEEP |symbol_number.460|
        EXPORTAS |symbol_number.460|, slaveConfig
        KEEP |symbol_number.461|
        EXPORTAS |symbol_number.461|, sendData
        KEEP __lit__00000000
        KEEP sendDataIndex
        KEEP isTransferComplete
        KEEP receivedData
        KEEP receivedDataIndex
        KEEP |symbol_number.51|
        EXPORTAS |symbol_number.51|, sendDataIndex
        KEEP |symbol_number.52|
        EXPORTAS |symbol_number.52|, isTransferComplete
        KEEP |symbol_number.53|
        EXPORTAS |symbol_number.53|, receivedData
        KEEP |symbol_number.54|
        EXPORTAS |symbol_number.54|, receivedDataIndex
        KEEP |symbol_number.62|
        EXPORTAS |symbol_number.62|, receivedData
        KEEP |symbol_number.64|
        EXPORTAS |symbol_number.64|, isTransferComplete
        KEEP isAutoTransferComplete
        KEEP |symbol_number.72|
        EXPORTAS |symbol_number.72|, sendDataIndex
        KEEP |symbol_number.73|
        EXPORTAS |symbol_number.73|, isTransferComplete
        KEEP |symbol_number.74|
        EXPORTAS |symbol_number.74|, receivedData
        KEEP |symbol_number.75|
        EXPORTAS |symbol_number.75|, receivedDataIndex
        KEEP result
        KEEP |symbol_number.88|
        EXPORTAS |symbol_number.88|, sendDataIndex
        KEEP |symbol_number.89|
        EXPORTAS |symbol_number.89|, isTransferComplete
        KEEP |symbol_number.90|
        EXPORTAS |symbol_number.90|, receivedData
        KEEP |symbol_number.91|
        EXPORTAS |symbol_number.91|, receivedDataIndex
        KEEP |symbol_number.98|
        EXPORTAS |symbol_number.98|, sendDataIndex
        KEEP |symbol_number.99|
        EXPORTAS |symbol_number.99|, isTransferComplete
        KEEP |symbol_number.100|
        EXPORTAS |symbol_number.100|, receivedData
        KEEP |symbol_number.101|
        EXPORTAS |symbol_number.101|, receivedDataIndex
        KEEP |symbol_number.108|
        EXPORTAS |symbol_number.108|, sendDataIndex
        KEEP |symbol_number.109|
        EXPORTAS |symbol_number.109|, isTransferComplete
        KEEP |symbol_number.110|
        EXPORTAS |symbol_number.110|, receivedData
        KEEP |symbol_number.111|
        EXPORTAS |symbol_number.111|, receivedDataIndex
        KEEP |symbol_number.118|
        EXPORTAS |symbol_number.118|, sendDataIndex
        KEEP |symbol_number.119|
        EXPORTAS |symbol_number.119|, isTransferComplete
        KEEP |symbol_number.120|
        EXPORTAS |symbol_number.120|, receivedData
        KEEP |symbol_number.121|
        EXPORTAS |symbol_number.121|, receivedDataIndex
        KEEP |symbol_number.128|
        EXPORTAS |symbol_number.128|, sendDataIndex
        KEEP |symbol_number.129|
        EXPORTAS |symbol_number.129|, isTransferComplete
        KEEP |symbol_number.130|
        EXPORTAS |symbol_number.130|, receivedData
        KEEP |symbol_number.131|
        EXPORTAS |symbol_number.131|, receivedDataIndex
        KEEP |symbol_number.139|
        EXPORTAS |symbol_number.139|, receivedData
        KEEP |symbol_number.141|
        EXPORTAS |symbol_number.141|, isTransferComplete
        KEEP |symbol_number.142|
        EXPORTAS |symbol_number.142|, isAutoTransferComplete
        KEEP |symbol_number.149|
        EXPORTAS |symbol_number.149|, sendDataIndex
        KEEP |symbol_number.150|
        EXPORTAS |symbol_number.150|, isTransferComplete
        KEEP |symbol_number.151|
        EXPORTAS |symbol_number.151|, receivedData
        KEEP |symbol_number.152|
        EXPORTAS |symbol_number.152|, receivedDataIndex
        KEEP |symbol_number.158|
        EXPORTAS |symbol_number.158|, receivedData
        KEEP |symbol_number.162|
        EXPORTAS |symbol_number.162|, isTransferComplete
        KEEP |symbol_number.163|
        EXPORTAS |symbol_number.163|, isAutoTransferComplete
        KEEP |symbol_number.170|
        EXPORTAS |symbol_number.170|, sendDataIndex
        KEEP |symbol_number.171|
        EXPORTAS |symbol_number.171|, isTransferComplete
        KEEP |symbol_number.172|
        EXPORTAS |symbol_number.172|, receivedData
        KEEP isStartByteTransmitted
        KEEP |symbol_number.174|
        EXPORTAS |symbol_number.174|, receivedDataIndex
        KEEP |symbol_number.181|
        EXPORTAS |symbol_number.181|, sendDataIndex
        KEEP |symbol_number.182|
        EXPORTAS |symbol_number.182|, isTransferComplete
        KEEP |symbol_number.183|
        EXPORTAS |symbol_number.183|, receivedData
        KEEP |symbol_number.184|
        EXPORTAS |symbol_number.184|, receivedDataIndex
        KEEP |symbol_number.191|
        EXPORTAS |symbol_number.191|, sendDataIndex
        KEEP |symbol_number.192|
        EXPORTAS |symbol_number.192|, isTransferComplete
        KEEP |symbol_number.193|
        EXPORTAS |symbol_number.193|, receivedData
        KEEP |symbol_number.194|
        EXPORTAS |symbol_number.194|, receivedDataIndex
        KEEP |symbol_number.201|
        EXPORTAS |symbol_number.201|, sendDataIndex
        KEEP |symbol_number.202|
        EXPORTAS |symbol_number.202|, isTransferComplete
        KEEP |symbol_number.203|
        EXPORTAS |symbol_number.203|, receivedData
        KEEP |symbol_number.204|
        EXPORTAS |symbol_number.204|, receivedDataIndex
        KEEP |symbol_number.211|
        EXPORTAS |symbol_number.211|, sendDataIndex
        KEEP |symbol_number.212|
        EXPORTAS |symbol_number.212|, isTransferComplete
        KEEP |symbol_number.213|
        EXPORTAS |symbol_number.213|, receivedData
        KEEP |symbol_number.214|
        EXPORTAS |symbol_number.214|, receivedDataIndex
        KEEP |symbol_number.222|
        EXPORTAS |symbol_number.222|, receivedData
        KEEP currentDataPackageIndex
        KEEP |symbol_number.225|
        EXPORTAS |symbol_number.225|, isTransferComplete
        KEEP |symbol_number.226|
        EXPORTAS |symbol_number.226|, isAutoTransferComplete
        KEEP |symbol_number.233|
        EXPORTAS |symbol_number.233|, sendDataIndex
        KEEP |symbol_number.234|
        EXPORTAS |symbol_number.234|, isTransferComplete
        KEEP |symbol_number.235|
        EXPORTAS |symbol_number.235|, receivedData
        KEEP |symbol_number.236|
        EXPORTAS |symbol_number.236|, receivedDataIndex
        KEEP |symbol_number.241|
        EXPORTAS |symbol_number.241|, receivedData
        KEEP |symbol_number.249|
        EXPORTAS |symbol_number.249|, sendDataIndex
        KEEP |symbol_number.250|
        EXPORTAS |symbol_number.250|, isTransferComplete
        KEEP |symbol_number.251|
        EXPORTAS |symbol_number.251|, receivedData
        KEEP |symbol_number.252|
        EXPORTAS |symbol_number.252|, receivedDataIndex
        KEEP |symbol_number.260|
        EXPORTAS |symbol_number.260|, sendDataIndex
        KEEP |symbol_number.261|
        EXPORTAS |symbol_number.261|, isTransferComplete
        KEEP |symbol_number.262|
        EXPORTAS |symbol_number.262|, receivedData
        KEEP |symbol_number.263|
        EXPORTAS |symbol_number.263|, receivedDataIndex
        KEEP |symbol_number.271|
        EXPORTAS |symbol_number.271|, sendDataIndex
        KEEP |symbol_number.272|
        EXPORTAS |symbol_number.272|, isTransferComplete
        KEEP |symbol_number.273|
        EXPORTAS |symbol_number.273|, receivedData
        KEEP isMasterLostArbitration
        KEEP |symbol_number.275|
        EXPORTAS |symbol_number.275|, receivedDataIndex
        KEEP |symbol_number.282|
        EXPORTAS |symbol_number.282|, sendDataIndex
        KEEP |symbol_number.283|
        EXPORTAS |symbol_number.283|, isTransferComplete
        KEEP |symbol_number.284|
        EXPORTAS |symbol_number.284|, receivedData
        KEEP |symbol_number.285|
        EXPORTAS |symbol_number.285|, receivedDataIndex
        KEEP |symbol_number.292|
        EXPORTAS |symbol_number.292|, sendDataIndex
        KEEP |symbol_number.293|
        EXPORTAS |symbol_number.293|, isTransferComplete
        KEEP |symbol_number.294|
        EXPORTAS |symbol_number.294|, receivedData
        KEEP |symbol_number.295|
        EXPORTAS |symbol_number.295|, receivedDataIndex
        KEEP |symbol_number.302|
        EXPORTAS |symbol_number.302|, sendDataIndex
        KEEP |symbol_number.303|
        EXPORTAS |symbol_number.303|, isTransferComplete
        KEEP |symbol_number.310|
        EXPORTAS |symbol_number.310|, sendDataIndex
        KEEP |symbol_number.311|
        EXPORTAS |symbol_number.311|, isTransferComplete
        KEEP |symbol_number.312|
        EXPORTAS |symbol_number.312|, receivedData
        KEEP |symbol_number.313|
        EXPORTAS |symbol_number.313|, receivedDataIndex
        KEEP |symbol_number.319|
        EXPORTAS |symbol_number.319|, receivedData
        KEEP |symbol_number.323|
        EXPORTAS |symbol_number.323|, isTransferComplete
        KEEP |symbol_number.324|
        EXPORTAS |symbol_number.324|, isAutoTransferComplete
        KEEP |symbol_number.329|
        EXPORTAS |symbol_number.329|, receivedData
        KEEP |symbol_number.332|
        EXPORTAS |symbol_number.332|, result
        KEEP |symbol_number.340|
        EXPORTAS |symbol_number.340|, receivedData
        KEEP |symbol_number.343|
        EXPORTAS |symbol_number.343|, currentDataPackageIndex
        KEEP |symbol_number.345|
        EXPORTAS |symbol_number.345|, isTransferComplete
        KEEP |symbol_number.346|
        EXPORTAS |symbol_number.346|, isAutoTransferComplete
        KEEP |symbol_number.353|
        EXPORTAS |symbol_number.353|, sendDataIndex
        KEEP |symbol_number.354|
        EXPORTAS |symbol_number.354|, isTransferComplete
        KEEP |symbol_number.355|
        EXPORTAS |symbol_number.355|, receivedData
        KEEP |symbol_number.356|
        EXPORTAS |symbol_number.356|, receivedDataIndex
        KEEP |symbol_number.363|
        EXPORTAS |symbol_number.363|, sendDataIndex
        KEEP |symbol_number.364|
        EXPORTAS |symbol_number.364|, isTransferComplete
        KEEP |symbol_number.365|
        EXPORTAS |symbol_number.365|, receivedData
        KEEP |symbol_number.366|
        EXPORTAS |symbol_number.366|, receivedDataIndex
        KEEP |symbol_number.373|
        EXPORTAS |symbol_number.373|, sendDataIndex
        KEEP |symbol_number.374|
        EXPORTAS |symbol_number.374|, isTransferComplete
        KEEP |symbol_number.375|
        EXPORTAS |symbol_number.375|, receivedData
        KEEP |symbol_number.376|
        EXPORTAS |symbol_number.376|, receivedDataIndex
        KEEP |symbol_number.383|
        EXPORTAS |symbol_number.383|, sendDataIndex
        KEEP |symbol_number.384|
        EXPORTAS |symbol_number.384|, isTransferComplete
        KEEP |symbol_number.385|
        EXPORTAS |symbol_number.385|, receivedData
        KEEP |symbol_number.386|
        EXPORTAS |symbol_number.386|, receivedDataIndex
        KEEP |symbol_number.393|
        EXPORTAS |symbol_number.393|, sendDataIndex
        KEEP |symbol_number.394|
        EXPORTAS |symbol_number.394|, isTransferComplete
        KEEP |symbol_number.395|
        EXPORTAS |symbol_number.395|, receivedData
        KEEP |symbol_number.396|
        EXPORTAS |symbol_number.396|, receivedDataIndex
        KEEP |symbol_number.403|
        EXPORTAS |symbol_number.403|, receivedData
        KEEP |symbol_number.410|
        EXPORTAS |symbol_number.410|, sendDataIndex
        KEEP |symbol_number.411|
        EXPORTAS |symbol_number.411|, isTransferComplete
        KEEP |symbol_number.412|
        EXPORTAS |symbol_number.412|, receivedData
        KEEP |symbol_number.413|
        EXPORTAS |symbol_number.413|, receivedDataIndex
        KEEP |symbol_number.418|
        EXPORTAS |symbol_number.418|, receivedData
        KEEP |symbol_number.421|
        EXPORTAS |symbol_number.421|, result
        KEEP |symbol_number.429|
        EXPORTAS |symbol_number.429|, sendDataIndex
        KEEP |symbol_number.430|
        EXPORTAS |symbol_number.430|, isTransferComplete
        KEEP |symbol_number.431|
        EXPORTAS |symbol_number.431|, receivedData
        KEEP |symbol_number.432|
        EXPORTAS |symbol_number.432|, receivedDataIndex
        KEEP |symbol_number.439|
        EXPORTAS |symbol_number.439|, sendDataIndex
        KEEP |symbol_number.440|
        EXPORTAS |symbol_number.440|, isTransferComplete
        KEEP |symbol_number.441|
        EXPORTAS |symbol_number.441|, receivedData
        KEEP |symbol_number.442|
        EXPORTAS |symbol_number.442|, receivedDataIndex
        KEEP |symbol_number.450|
        EXPORTAS |symbol_number.450|, sendDataIndex
        KEEP |symbol_number.451|
        EXPORTAS |symbol_number.451|, isTransferComplete
        KEEP |symbol_number.452|
        EXPORTAS |symbol_number.452|, receivedData
        KEEP |symbol_number.453|
        EXPORTAS |symbol_number.453|, receivedDataIndex
        KEEP |symbol_number.462|
        EXPORTAS |symbol_number.462|, sendDataIndex
        KEEP |symbol_number.463|
        EXPORTAS |symbol_number.463|, isTransferComplete
        KEEP |symbol_number.464|
        EXPORTAS |symbol_number.464|, receivedData
        KEEP |symbol_number.465|
        EXPORTAS |symbol_number.465|, receivedDataIndex

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
