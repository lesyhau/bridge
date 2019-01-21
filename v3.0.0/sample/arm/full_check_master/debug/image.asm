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
        DCD      0x400009c0
        ENDP

||$Ven$AA$L$$SupervisorCall_Handler|| PROC
|L1.5060|
        LDR      pc,|L1.5064|
|L1.5064|
        DCD      0x400009b4
        ENDP

||$Ven$AA$L$$PrefetchAbort_Handler|| PROC
|L1.5068|
        LDR      pc,|L1.5072|
|L1.5072|
        DCD      0x4000095c
        ENDP

||$Ven$AA$L$$DataAbort_Handler|| PROC
|L1.5076|
        LDR      pc,|L1.5080|
|L1.5080|
        DCD      0x40000128
        ENDP

||$Ven$AA$L$$IRQ_Handler|| PROC
|L1.5084|
        LDR      pc,|L1.5088|
|L1.5088|
        DCD      0x4000091c
        ENDP

||$Ven$AT$L$$__rt_entry|| PROC
|L1.5092|
        LDR      pc,|L1.5096|
|L1.5096|
        DCD      0x4000007d
        ENDP

||Region$$Table$$Base||
        DCD      0x40006890
        DCD      0x40006890
        DCD      0x000001bc
        DCD      0x000011bc
||Region$$Table$$Limit||

        AREA ER10, CODE, READONLY, ALIGN=2

__vectors_start                  ; Alternate entry point
        B        |L2.20160|
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
        BL       |L2.2496|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.48|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.2484|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.64|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.2396|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.80|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.296|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.96|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.2332|
        POP      {r0-r3,r10-r12,lr}
        ERET     
        THUMB
__rt_lib_init                  ; Alternate entry point
|L2.112|
        PUSH     {r0-r4,lr}
__rt_lib_init_fp_1                  ; Alternate entry point
        BLX      |L2.20168|
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
        BLX      |L2.9520|
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
        BLX      |L2.2508|
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
CPG_SetBit PROC
|L2.180|
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
|L2.216|
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
|L2.248|
        CMP      r1,#0
        BXEQ     lr
        ADD      r0,r0,#0x800
        MOV      r2,#0
|L2.264|
        STR      r2,[r0,#0]
        STR      r2,[r0,#4]
        STR      r2,[r0,#8]
        STR      r2,[r0,#0xc]
        ADD      r0,r0,#0x10
        SUBS     r1,r1,#1
        BNE      |L2.264|
        BX       lr
        ENDP

DataAbort_Handler PROC
|L2.296|
        PUSH     {r11,lr}
        BL       |L2.2468|
|L2.304|
        B        |L2.304|
        ENDP

GIC_defaultHandler PROC
|L2.308|
        B        |L2.308|
        ENDP

GIC_enable PROC
|L2.312|
        CPSIE    i
        MOVW     r0,#0x14
        MOVT     r0,#0xf010
        MOV      r1,#0
        STR      r1,[r0,#0]
|L2.332|
        LDR      r1,[r0,#0]
        TST      r1,#6
        BNE      |L2.332|
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
|L2.384|
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
|L2.544|
        CMP      r0,#0x3c8
        BXHI     lr
        MCR      p15,#0x0,r0,c12,c12,#1
        DSB      
        BX       lr
        ENDP

GIC_executeInterruptHandler PROC
|L2.564|
        CMP      r0,#0x3c8
        BXHI     lr
        MOV      r1,#0x5904
        MOVT     r1,#0x4000
        LDR      r0,[r1,r0,LSL #2]
        BX       r0
        ENDP

GIC_getACKID PROC
|L2.588|
        PUSH     {r4,lr}
        MRC      p15,#0x0,r4,c12,c12,#0
        DSB      
        MOV      r0,r4
        BL       |L2.544|
        MOV      r0,r4
        POP      {r4,pc}
        ENDP

GIC_setInterruptHandler PROC
|L2.616|
        CMP      r0,#0x3c8
        BXHI     lr
        MOV      r2,#0x5904
        MOVT     r2,#0x4000
        STR      r1,[r2,r0,LSL #2]
        BX       lr
        ENDP

I2C_configPins PROC
|L2.640|
        MOVW     r0,#0x800
        MOVT     r0,#0xe605
        ADD      r1,r0,#0x100
        MOV      r2,#0xfffc
        B        |L2.2372|
        ENDP

I2C_masterClearInterruptStatus PROC
|L2.660|
        LDR      r2,[r0,#0xc]
        BIC      r1,r2,r1
        STR      r1,[r0,#0xc]
        BX       lr
        ENDP

I2C_masterDisable PROC
|L2.676|
        LDR      r1,[r0,#4]
        BIC      r1,r1,#8
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterDisableDMAReceive PROC
|L2.692|
        LDR      r1,[r0,#0x3c]
        BIC      r1,r1,#2
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterDisableDMATransmit PROC
|L2.708|
        LDR      r1,[r0,#0x3c]
        BIC      r1,r1,#1
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterDisableStartByteTransmit PROC
|L2.724|
        LDR      r1,[r0,#4]
        BIC      r1,r1,#4
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterDisableStartGeneration PROC
|L2.740|
        LDR      r1,[r0,#4]
        BIC      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterEnable PROC
|L2.756|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#8
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterEnableDMAContinuousReceive PROC
|L2.772|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#0x40
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterEnableDMAContinuousTransmit PROC
|L2.788|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#0x80
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterEnableDMAReceive PROC
|L2.804|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#2
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterEnableDMATransmit PROC
|L2.820|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#1
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterEnableInterrupt PROC
|L2.836|
        LDR      r2,[r0,#0x14]
        ORR      r1,r2,r1
        STR      r1,[r0,#0x14]
        BX       lr
        ENDP

I2C_masterGetInterruptStatus PROC
|L2.852|
        LDR      r0,[r0,#0xc]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_masterInit PROC
|L2.864|
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
        MOV      r12,#0x4ed4
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
|L2.1316|
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_masterReceiveMultipleByteNext PROC
|L2.1328|
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_masterReceiveMultipleByteStop PROC
|L2.1340|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#2
        STR      r1,[r0,#4]
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_masterReceiveStart PROC
|L2.1364|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterRestart PROC
|L2.1380|
        ORR      r1,r2,r1,LSL #1
        STR      r1,[r0,#0x20]
        LDR      r1,[r0,#4]
        ORR      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterSendMultipleByteNext PROC
|L2.1404|
        STR      r1,[r0,#0x24]
        BX       lr
        ENDP

I2C_masterSendMultipleByteStart PROC
|L2.1412|
        STR      r1,[r0,#0x24]
        LDR      r1,[r0,#4]
        ORR      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterSendMultipleByteStop PROC
|L2.1432|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#2
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterSetDMAContinuousReceiveBlockCount PROC
|L2.1448|
        LDR      r2,[r0,#0x3c]
        BIC      r2,r2,#0xff0000
        ORR      r1,r2,r1,LSL #16
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterSetDMAContinuousTransferCount PROC
|L2.1468|
        LDR      r2,[r0,#0x3c]
        BIC      r2,r2,#0xff000000
        ORR      r1,r2,r1,LSL #24
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterSetDMAContinuousTransmitBlockCount PROC
|L2.1488|
        LDR      r2,[r0,#0x3c]
        BIC      r2,r2,#0xff00
        ORR      r1,r2,r1,LSL #8
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_modelConnect PROC
|L2.1508|
        PUSH     {r11,lr}
        PUSH     {r0,r1,r10}
        MOV      r10,#0
        LSL      r0,r0,#12
        LSL      r1,r1,#8
        ORR      r10,r10,r0
        ORR      r10,r10,r1
        ORR      r10,r10,#1
        MOVT     r10,#0xa55a
        MOV      r0,#0x14
        BL       |L2.2408|
        POP      {r0,r1,r10}
        POP      {r11,pc}
        ENDP

I2C_modelDisable PROC
|L2.1560|
        PUSH     {r11,lr}
        PUSH     {r10}
        MOV      r10,#0
        MOVT     r10,#0xa55a
        MOV      r0,#0x14
        BL       |L2.2408|
        POP      {r10}
        POP      {r11,pc}
        ENDP

I2C_releasePins PROC
|L2.1592|
        MOVW     r0,#0x800
        MOVT     r0,#0xe605
        ADD      r1,r0,#0x100
        MOV      r2,#0xfffc
        B        |L2.2348|
        ENDP

I2C_reset PROC
|L2.1612|
        PUSH     {r4,r5,r11,lr}
        MOV      r4,#0x2c14
        MOVT     r4,#0xe615
        MOVW     r5,#0
        MOVT     r5,#0xfffc
        MOV      r0,r4
        MOV      r1,r5
        BL       |L2.216|
        ADD      r0,r4,#0x80
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.216|
        ENDP

I2C_slaveClearInterruptStatus PROC
|L2.1660|
        LDR      r2,[r0,#8]
        BIC      r1,r2,r1
        STR      r1,[r0,#8]
        BX       lr
        ENDP

I2C_slaveDisable PROC
|L2.1676|
        LDR      r1,[r0,#0]
        BIC      r1,r1,#4
        STR      r1,[r0,#0]
        BX       lr
        ENDP

I2C_slaveDisableDMAReceive PROC
|L2.1692|
        LDR      r1,[r0,#0x3c]
        BIC      r1,r1,#8
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_slaveDisableDMATransmit PROC
|L2.1708|
        LDR      r1,[r0,#0x3c]
        BIC      r1,r1,#4
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_slaveEnable PROC
|L2.1724|
        LDR      r1,[r0,#0]
        ORR      r1,r1,#4
        STR      r1,[r0,#0]
        BX       lr
        ENDP

I2C_slaveEnableDMAReceive PROC
|L2.1740|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#8
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_slaveEnableDMATransmit PROC
|L2.1756|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#4
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_slaveEnableInterrupt PROC
|L2.1772|
        LDR      r2,[r0,#0x10]
        ORR      r1,r2,r1
        STR      r1,[r0,#0x10]
        BX       lr
        ENDP

I2C_slaveGetInterruptStatus PROC
|L2.1788|
        LDR      r0,[r0,#8]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_slaveInit PROC
|L2.1800|
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
        MOV      r12,#0x4ed4
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
|L2.2268|
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_slaveReceiveMultipleByteNext PROC
|L2.2280|
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_slaveReceiveMultipleByteStop PROC
|L2.2292|
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_slaveSetAddress PROC
|L2.2316|
        STR      r1,[r0,#0x1c]
        BX       lr
        ENDP

I2C_slaveSetData PROC
|L2.2324|
        STR      r1,[r0,#0x24]
        BX       lr
        ENDP

IRQ_Handler PROC
|L2.2332|
        PUSH     {r11,lr}
        BL       |L2.588|
        POP      {r11,lr}
        B        |L2.564|
        ENDP

PFC_ClearMultipleBit PROC
|L2.2348|
        LDR      r3,[r1,#0]
        BIC      r2,r3,r2
        MVN      r3,r2
        STR      r3,[r0,#0]
        STR      r2,[r1,#0]
        BX       lr
        ENDP

PFC_SetMultipleBit PROC
|L2.2372|
        LDR      r3,[r1,#0]
        ORR      r2,r3,r2
        MVN      r3,r2
        STR      r3,[r0,#0]
        STR      r2,[r1,#0]
        BX       lr
        ENDP

PrefetchAbort_Handler PROC
|L2.2396|
        PUSH     {r11,lr}
        BL       |L2.2468|
|L2.2404|
        B        |L2.2404|
        ENDP

Sim_Delay PROC
|L2.2408|
        CMP      r0,#0
        BXEQ     lr
|L2.2416|
        SUBS     r0,r0,#1
        BNE      |L2.2416|
        BX       lr
        ENDP

Sim_Dump PROC
|L2.2428|
        MOV      r1,#0x6890
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
|L2.2468|
        MOV      r0,#0x7f00000
        MOV      r1,#0
        STR      r1,[r0,#0]
        BX       lr
        ENDP

SupervisorCall_Handler PROC
|L2.2484|
        PUSH     {r11,lr}
        BL       |L2.2468|
|L2.2492|
        B        |L2.2492|
        ENDP

UndefinedInstruction_Handler PROC
|L2.2496|
        PUSH     {r11,lr}
        BL       |L2.2468|
|L2.2504|
        B        |L2.2504|
        ENDP

_sys_exit PROC
|L2.2508|
        B        |L2.2508|
        ENDP

i2c0InterruptHandler PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.2596|
        TST      r5,#8
        BEQ      |L2.2604|
        MOV      r0,#0x69f8
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r1,r1,#1
        STR      r1,[r0,#0]
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.2612|
        B        |L2.2628|
|L2.2596|
        MOV      r0,r4
        BL       |L2.740|
|L2.2604|
        TST      r5,#0x10
        BEQ      |L2.2628|
|L2.2612|
        MOV      r0,#0x68ae
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.2628|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.43| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.2724|
        TST      r5,#8
        BEQ      |L2.2732|
        MOV      r0,#0x68a8
        MOVT     r0,#0x4000
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.2796|
        MOV      r0,r4
        BL       |L2.1432|
        TST      r5,#0x10
        BNE      |L2.2740|
        B        |L2.2780|
|L2.2724|
        MOV      r0,r4
        BL       |L2.740|
|L2.2732|
        TST      r5,#0x10
        BEQ      |L2.2780|
|L2.2740|
        MOV      r0,#0x68a4
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        MOV      r1,#0x689c
        MOVT     r1,#0x4000
        LDRB     r1,[r1,#0]
        AND      r0,r1,r0
        MOV      r1,#0x68af
        MOVT     r1,#0x4000
        STRB     r0,[r1,#0]
|L2.2780|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
|L2.2796|
        MOVW     r1,#0x60
        MOVT     r1,#0xe735
        MOV      r2,#1
        STR      r2,[r1,#0]
        STRB     r2,[r0,#0]
        TST      r5,#0x10
        BNE      |L2.2740|
        B        |L2.2780|
        ENDP

|symbol_number.58| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.2920|
        TST      r5,#8
        BEQ      |L2.2928|
        MOV      r0,#0x69fc
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x5334
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.2936|
        B        |L2.2952|
|L2.2920|
        MOV      r0,r4
        BL       |L2.740|
|L2.2928|
        TST      r5,#0x10
        BEQ      |L2.2952|
|L2.2936|
        MOV      r0,#0x68b0
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.2952|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.69| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.3060|
        TST      r5,#8
        BEQ      |L2.3068|
        MOVW     r0,#0x6a00
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x533c
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.3076|
        B        |L2.3092|
|L2.3060|
        MOV      r0,r4
        BL       |L2.740|
|L2.3068|
        TST      r5,#0x10
        BEQ      |L2.3092|
|L2.3076|
        MOV      r0,#0x68b1
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.3092|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.80| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.3200|
        TST      r5,#8
        BEQ      |L2.3208|
        MOV      r0,#0x6a04
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x5344
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.3216|
        B        |L2.3232|
|L2.3200|
        MOV      r0,r4
        BL       |L2.740|
|L2.3208|
        TST      r5,#0x10
        BEQ      |L2.3232|
|L2.3216|
        MOV      r0,#0x68b2
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.3232|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.90| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.3340|
        TST      r5,#8
        BEQ      |L2.3348|
        MOV      r0,#0x6a08
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x534c
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.3356|
        B        |L2.3372|
|L2.3340|
        MOV      r0,r4
        BL       |L2.740|
|L2.3348|
        TST      r5,#0x10
        BEQ      |L2.3372|
|L2.3356|
        MOV      r0,#0x68b3
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.3372|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.101| PROC
        PUSH     {r4-r7,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.3468|
        TST      r5,#2
        BEQ      |L2.3476|
        MOV      r6,#0x68a1
        MOVT     r6,#0x4000
        LDRB     r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.3540|
        MOV      r0,r4
        BL       |L2.1432|
        TST      r5,#0x10
        BNE      |L2.3484|
        B        |L2.3524|
|L2.3468|
        MOV      r0,r4
        BL       |L2.740|
|L2.3476|
        TST      r5,#0x10
        BEQ      |L2.3524|
|L2.3484|
        MOV      r0,#0x68a5
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        MOV      r1,#0x689d
        MOVT     r1,#0x4000
        LDRB     r1,[r1,#0]
        AND      r0,r1,r0
        MOV      r1,#0x68b4
        MOVT     r1,#0x4000
        STRB     r0,[r1,#0]
|L2.3524|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r7,r11,lr}
        B        |L2.660|
|L2.3540|
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r7,#1
        STR      r7,[r0,#0]
        MOV      r0,r4
        BL       |L2.804|
        STRB     r7,[r6,#0]
        TST      r5,#0x10
        BNE      |L2.3484|
        B        |L2.3524|
        ENDP

|symbol_number.114| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.3668|
        TST      r5,#2
        BEQ      |L2.3676|
        MOV      r6,#0x69b8
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.3740|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.3676|
        MOV      r0,r4
        BL       |L2.1316|
        B        |L2.3748|
|L2.3668|
        MOV      r0,r4
        BL       |L2.740|
|L2.3676|
        TST      r5,#8
        BEQ      |L2.3700|
|L2.3684|
        MOV      r0,r4
        MOV      r1,#0x51
        MOV      r2,#1
        BL       |L2.1380|
|L2.3700|
        TST      r5,#0x10
        BEQ      |L2.3724|
        MOV      r0,#0x68b5
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.3724|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.660|
|L2.3740|
        MOV      r0,r4
        BL       |L2.1340|
|L2.3748|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x6904
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
        TST      r5,#8
        BNE      |L2.3684|
        B        |L2.3700|
        ENDP

|symbol_number.125| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.3876|
        TST      r5,#8
        BEQ      |L2.3884|
        MOV      r0,#0x6a10
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x535c
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.3892|
        B        |L2.3908|
|L2.3876|
        MOV      r0,r4
        BL       |L2.740|
|L2.3884|
        TST      r5,#0x10
        BEQ      |L2.3908|
|L2.3892|
        MOV      r0,#0x68b6
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.3908|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.135| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4004|
        TST      r5,#2
        BEQ      |L2.4012|
        MOV      r0,#0x68a2
        MOVT     r0,#0x4000
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.4076|
        MOV      r0,r4
        BL       |L2.1432|
        TST      r5,#0x10
        BNE      |L2.4020|
        B        |L2.4060|
|L2.4004|
        MOV      r0,r4
        BL       |L2.740|
|L2.4012|
        TST      r5,#0x10
        BEQ      |L2.4060|
|L2.4020|
        MOV      r0,#0x68a6
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        MOV      r1,#0x689e
        MOVT     r1,#0x4000
        LDRB     r1,[r1,#0]
        AND      r0,r1,r0
        MOV      r1,#0x68b7
        MOVT     r1,#0x4000
        STRB     r0,[r1,#0]
|L2.4060|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
|L2.4076|
        MOVW     r1,#0x60
        MOVT     r1,#0xe735
        MOV      r2,#1
        STR      r2,[r1,#0]
        STRB     r2,[r0,#0]
        TST      r5,#0x10
        BNE      |L2.4020|
        B        |L2.4060|
        ENDP

|symbol_number.150| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4200|
        TST      r5,#8
        BEQ      |L2.4208|
        MOV      r0,#0x6a14
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x5364
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.4216|
        B        |L2.4232|
|L2.4200|
        MOV      r0,r4
        BL       |L2.740|
|L2.4208|
        TST      r5,#0x10
        BEQ      |L2.4232|
|L2.4216|
        MOV      r0,#0x68b8
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.4232|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.165| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4340|
        TST      r5,#8
        BEQ      |L2.4348|
        MOV      r0,#0x6a18
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x5374
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.4356|
        B        |L2.4372|
|L2.4340|
        MOV      r0,r4
        BL       |L2.740|
|L2.4348|
        TST      r5,#0x10
        BEQ      |L2.4372|
|L2.4356|
        MOV      r0,#0x68b9
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.4372|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.175| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4476|
        TST      r5,#2
        BEQ      |L2.4484|
        MOV      r6,#0x69c8
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.4524|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.4484|
        MOV      r0,r4
        BL       |L2.1316|
        B        |L2.4532|
|L2.4476|
        MOV      r0,r4
        BL       |L2.740|
|L2.4484|
        TST      r5,#0x10
        BEQ      |L2.4508|
|L2.4492|
        MOV      r0,#0x68ba
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.4508|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.660|
|L2.4524|
        MOV      r0,r4
        BL       |L2.1340|
|L2.4532|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x693c
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
        TST      r5,#0x10
        BNE      |L2.4492|
        B        |L2.4508|
        ENDP

|symbol_number.186| PROC
        PUSH     {r4-r7,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4648|
        TST      r5,#8
        BEQ      |L2.4656|
        MOV      r6,#0x68ab
        MOVT     r6,#0x4000
        LDRB     r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.4720|
        MOV      r0,r4
        BL       |L2.1432|
        TST      r5,#0x10
        BNE      |L2.4664|
        B        |L2.4704|
|L2.4648|
        MOV      r0,r4
        BL       |L2.740|
|L2.4656|
        TST      r5,#0x10
        BEQ      |L2.4704|
|L2.4664|
        MOV      r0,#0x68a7
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        MOV      r1,#0x689f
        MOVT     r1,#0x4000
        LDRB     r1,[r1,#0]
        AND      r0,r1,r0
        MOV      r1,#0x68bb
        MOVT     r1,#0x4000
        STRB     r0,[r1,#0]
|L2.4704|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r7,r11,lr}
        B        |L2.660|
|L2.4720|
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r7,#1
        STR      r7,[r0,#0]
        MOV      r0,r4
        BL       |L2.820|
        STRB     r7,[r6,#0]
        TST      r5,#0x10
        BNE      |L2.4664|
        B        |L2.4704|
        ENDP

|symbol_number.199| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4852|
        TST      r5,#8
        BEQ      |L2.4860|
        MOV      r0,#0x6a20
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x5384
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.4868|
        B        |L2.4884|
|L2.4852|
        MOV      r0,r4
        BL       |L2.740|
|L2.4860|
        TST      r5,#0x10
        BEQ      |L2.4884|
|L2.4868|
        MOV      r0,#0x68bc
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.4884|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.209| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4992|
        TST      r5,#8
        BEQ      |L2.5000|
        MOV      r0,#0x6a24
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x538c
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.5008|
        B        |L2.5024|
|L2.4992|
        MOV      r0,r4
        BL       |L2.740|
|L2.5000|
        TST      r5,#0x10
        BEQ      |L2.5024|
|L2.5008|
        MOV      r0,#0x68bd
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.5024|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.220| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5132|
        TST      r5,#8
        BEQ      |L2.5140|
        MOV      r0,#0x6a28
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x5394
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.5148|
        B        |L2.5164|
|L2.5132|
        MOV      r0,r4
        BL       |L2.740|
|L2.5140|
        TST      r5,#0x10
        BEQ      |L2.5164|
|L2.5148|
        MOV      r0,#0x68be
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.5164|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.230| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5272|
        TST      r5,#8
        BEQ      |L2.5280|
        MOV      r0,#0x6a2c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x539c
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.5288|
        B        |L2.5304|
|L2.5272|
        MOV      r0,r4
        BL       |L2.740|
|L2.5280|
        TST      r5,#0x10
        BEQ      |L2.5304|
|L2.5288|
        MOV      r0,#0x68bf
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.5304|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.240| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5412|
        TST      r5,#8
        BEQ      |L2.5420|
        MOV      r0,#0x6a30
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x53a4
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.5428|
        B        |L2.5444|
|L2.5412|
        MOV      r0,r4
        BL       |L2.740|
|L2.5420|
        TST      r5,#0x10
        BEQ      |L2.5444|
|L2.5428|
        MOV      r0,#0x68c0
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.5444|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.250| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r1,r0
        TST      r1,#0x20
        BEQ      |L2.5508|
        MOV      r0,#0x68ac
        MOVT     r0,#0x4000
        MOV      r2,#1
        STRB     r2,[r0,#0]
|L2.5508|
        MOV      r0,r4
        BL       |L2.660|
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.5616|
        MOV      r6,#0x69e0
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.5584|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.5616|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.5592|
|L2.5584|
        MOV      r0,r4
        BL       |L2.2292|
|L2.5592|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x6974
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.5616|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.264| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5736|
        TST      r5,#8
        BEQ      |L2.5744|
        MOV      r0,#0x6a38
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        CMP      r1,#1
        BHI      |L2.5784|
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x53b4
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.5752|
        B        |L2.5768|
|L2.5736|
        MOV      r0,r4
        BL       |L2.740|
|L2.5744|
        TST      r5,#0x10
        BEQ      |L2.5768|
|L2.5752|
        MOV      r0,#0x68c2
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.5768|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
|L2.5784|
        MOV      r0,r4
        BL       |L2.1432|
        TST      r5,#0x10
        BNE      |L2.5752|
        B        |L2.5768|
        ENDP

|symbol_number.274| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5896|
        TST      r5,#8
        BEQ      |L2.5904|
        MOV      r0,#0x6a3c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x53bc
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.5912|
        B        |L2.5928|
|L2.5896|
        MOV      r0,r4
        BL       |L2.740|
|L2.5904|
        TST      r5,#0x10
        BEQ      |L2.5928|
|L2.5912|
        MOV      r0,#0x68c3
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.5928|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.284| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.6036|
        TST      r5,#8
        BEQ      |L2.6044|
        MOV      r0,#0x6a40
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x53c4
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.6052|
        B        |L2.6068|
|L2.6036|
        MOV      r0,r4
        BL       |L2.740|
|L2.6044|
        TST      r5,#0x10
        BEQ      |L2.6068|
|L2.6052|
        MOV      r0,#0x68c4
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.6068|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.295| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.6176|
        TST      r5,#8
        BEQ      |L2.6184|
        MOV      r0,#0x6a44
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x53cc
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.6192|
        B        |L2.6208|
|L2.6176|
        MOV      r0,r4
        BL       |L2.740|
|L2.6184|
        TST      r5,#0x10
        BEQ      |L2.6208|
|L2.6192|
        MOV      r0,#0x68c5
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.6208|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.305| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.6344|
        TST      r5,#8
        BEQ      |L2.6304|
        MOV      r0,#0x6a48
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x53d4
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
|L2.6304|
        TST      r5,#0x10
        BEQ      |L2.6328|
|L2.6312|
        MOV      r0,#0x68c6
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.6328|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.660|
|L2.6344|
        MOV      r6,#0x68ad
        MOVT     r6,#0x4000
        LDRB     r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.6384|
        MOV      r0,r4
        BL       |L2.740|
        TST      r5,#0x10
        BNE      |L2.6312|
        B        |L2.6328|
|L2.6384|
        MOV      r0,r4
        BL       |L2.724|
        MOV      r0,#1
        STRB     r0,[r6,#0]
        TST      r5,#0x10
        BNE      |L2.6312|
        B        |L2.6328|
        ENDP

i2c1InterruptHandler PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.6496|
        MOV      r6,#0x69a4
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMN      r0,#1
        BEQ      |L2.6512|
        MOV      r0,r4
        BL       |L2.2280|
|L2.6472|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x68c8
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.6496|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
|L2.6512|
        LDR      r0,[r6,#0]
        CMN      r0,#1
        BEQ      |L2.6548|
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BNE      |L2.6496|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.6472|
|L2.6548|
        MOV      r0,r4
        BL       |L2.2292|
        B        |L2.6472|
        ENDP

|symbol_number.44| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.6628|
        MOV      r6,#0x68a0
        MOVT     r6,#0x4000
        LDRB     r0,[r6,#0]
        CMP      r0,#0
        BNE      |L2.6628|
        MOV      r0,r4
        BL       |L2.1740|
        MOV      r0,#1
        STRB     r0,[r6,#0]
|L2.6628|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.59| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.6756|
        MOV      r6,#0x69a8
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.6724|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.6756|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.6732|
|L2.6724|
        MOV      r0,r4
        BL       |L2.2292|
|L2.6732|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x68dc
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.6756|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.70| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.6884|
        MOV      r6,#0x69ac
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.6852|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.6884|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.6860|
|L2.6852|
        MOV      r0,r4
        BL       |L2.2292|
|L2.6860|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x68e4
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.6884|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.81| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.7012|
        MOV      r6,#0x69b0
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.6980|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.7012|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.6988|
|L2.6980|
        MOV      r0,r4
        BL       |L2.2292|
|L2.6988|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x68ec
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.7012|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.91| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.7140|
        MOV      r6,#0x69b4
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.7108|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.7140|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.7116|
|L2.7108|
        MOV      r0,r4
        BL       |L2.2292|
|L2.7116|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x68f4
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.7140|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.100| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#8
        BEQ      |L2.7224|
        MOV      r6,#0x68a9
        MOVT     r6,#0x4000
        LDRB     r0,[r6,#0]
        CMP      r0,#0
        BNE      |L2.7224|
        MOV      r0,r4
        BL       |L2.1756|
        MOV      r0,#1
        STRB     r0,[r6,#0]
|L2.7224|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.115| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.7352|
        MOV      r0,r4
        BL       |L2.2280|
        MOV      r1,#0x69b8
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r3,r2,#1
        STR      r3,[r1,#0]
        MOV      r1,#0x6904
        MOVT     r1,#0x4000
        STR      r0,[r1,r2,LSL #2]
        MOV      r0,#0x6a0c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x5354
        MOVT     r0,#0x4000
        LDRB     r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.2324|
|L2.7352|
        TST      r5,#8
        BEQ      |L2.7400|
        MOV      r0,#0x6a0c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x5354
        MOVT     r0,#0x4000
        LDRB     r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.2324|
|L2.7400|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1660|
        ENDP

|symbol_number.126| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.7528|
        MOV      r6,#0x69bc
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.7496|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.7528|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.7504|
|L2.7496|
        MOV      r0,r4
        BL       |L2.2292|
|L2.7504|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x690c
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.7528|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.136| PROC
        PUSH     {r4-r7,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#8
        BEQ      |L2.7596|
        MOV      r6,#0x68aa
        MOVT     r6,#0x4000
        LDRB     r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.7660|
|L2.7596|
        TST      r5,#0x10
        BEQ      |L2.7696|
|L2.7604|
        MOV      r0,#0x68a6
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        CMP      r0,#0
        BNE      |L2.7696|
        MOV      r0,#0x6898
        MOVT     r0,#0x4000
        LDR      r0,[r0,#0]
        MOV      r1,#0x567c
        MOVT     r1,#0x4000
        LDRB     r1,[r1,r0,LSL #3]
        MOV      r0,r4
        BL       |L2.2324|
        B        |L2.7696|
|L2.7660|
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r7,#1
        STR      r7,[r0,#0]
        MOV      r0,r4
        BL       |L2.1756|
        STRB     r7,[r6,#0]
        TST      r5,#0x10
        BNE      |L2.7604|
|L2.7696|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r7,r11,lr}
        B        |L2.1660|
        ENDP

|symbol_number.151| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.7824|
        MOV      r6,#0x69c0
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.7792|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.7824|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.7800|
|L2.7792|
        MOV      r0,r4
        BL       |L2.2292|
|L2.7800|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x6924
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.7824|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.166| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.7952|
        MOV      r6,#0x69c4
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.7920|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.7952|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.7928|
|L2.7920|
        MOV      r0,r4
        BL       |L2.2292|
|L2.7928|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x6934
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.7952|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.176| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#8
        BEQ      |L2.8040|
        MOV      r0,#0x6a1c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x537c
        MOVT     r0,#0x4000
        LDRB     r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.2324|
|L2.8040|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1660|
        ENDP

|symbol_number.185| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.8124|
        MOV      r6,#0x68a3
        MOVT     r6,#0x4000
        LDRB     r0,[r6,#0]
        CMP      r0,#0
        BNE      |L2.8124|
        MOV      r0,r4
        BL       |L2.1740|
        MOV      r0,#1
        STRB     r0,[r6,#0]
|L2.8124|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.200| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.8252|
        MOV      r6,#0x69cc
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.8220|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.8252|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.8228|
|L2.8220|
        MOV      r0,r4
        BL       |L2.2292|
|L2.8228|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x694c
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.8252|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.210| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.8380|
        MOV      r6,#0x69d0
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.8348|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.8380|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.8356|
|L2.8348|
        MOV      r0,r4
        BL       |L2.2292|
|L2.8356|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x6954
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.8380|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.221| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.8508|
        MOV      r6,#0x69d4
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.8476|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.8508|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.8484|
|L2.8476|
        MOV      r0,r4
        BL       |L2.2292|
|L2.8484|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x695c
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.8508|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.231| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.8636|
        MOV      r6,#0x69d8
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.8604|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.8636|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.8612|
|L2.8604|
        MOV      r0,r4
        BL       |L2.2292|
|L2.8612|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x6964
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.8636|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.241| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.8764|
        MOV      r6,#0x69dc
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.8732|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.8764|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.8740|
|L2.8732|
        MOV      r0,r4
        BL       |L2.2292|
|L2.8740|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x696c
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.8764|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.251| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.852|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.8872|
        TST      r5,#8
        BEQ      |L2.8880|
        MOV      r0,#0x6a34
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x53ac
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1404|
        TST      r5,#0x10
        BNE      |L2.8888|
        B        |L2.8904|
|L2.8872|
        MOV      r0,r4
        BL       |L2.740|
|L2.8880|
        TST      r5,#0x10
        BEQ      |L2.8904|
|L2.8888|
        MOV      r0,#0x68c1
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.8904|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.660|
        ENDP

|symbol_number.265| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.8992|
        MOV      r0,r4
        BL       |L2.2280|
        MOV      r1,#0x69e4
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r3,r2,#1
        STR      r3,[r1,#0]
        MOV      r1,#0x697c
        MOVT     r1,#0x4000
        STR      r0,[r1,r2,LSL #2]
|L2.8992|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1660|
        ENDP

|symbol_number.275| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.9120|
        MOV      r6,#0x69e8
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.9088|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.9120|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.9096|
|L2.9088|
        MOV      r0,r4
        BL       |L2.2292|
|L2.9096|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x6984
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.9120|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.285| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.9248|
        MOV      r6,#0x69ec
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.9216|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.9248|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.9224|
|L2.9216|
        MOV      r0,r4
        BL       |L2.2292|
|L2.9224|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x698c
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.9248|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.296| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.9376|
        MOV      r6,#0x69f0
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.9344|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.9376|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.9352|
|L2.9344|
        MOV      r0,r4
        BL       |L2.2292|
|L2.9352|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x6994
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.9376|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

|symbol_number.306| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1788|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.9504|
        MOV      r6,#0x69f4
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.9472|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.9504|
        MOV      r0,r4
        BL       |L2.2268|
        B        |L2.9480|
|L2.9472|
        MOV      r0,r4
        BL       |L2.2292|
|L2.9480|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x699c
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.9504|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1660|
        ENDP

main PROC
|L2.9520|
        PUSH     {r4-r6,lr}
        SUB      sp,sp,#0x68
        BL       |L2.640|
        MOV      r5,#0
        MOV      r6,#0x6828
        MOVT     r6,#0x4000
        MOV      r4,sp
|L2.9548|
        BL       |L2.1612|
        MOV      r0,#0x64
        BL       |L2.2408|
        MOV      r0,#0
        MOV      r1,#1
        BL       |L2.1508|
        LDR      r0,[r6,r5,LSL #2]
        BLX      r0
        STR      r0,[r4,r5,LSL #2]
        CMP      r0,#1
        BEQ      |L2.9616|
        ADD      r5,r5,#1
        CMP      r5,#0x19
        BLS      |L2.9548|
        BL       |L2.1560|
        BL       |L2.1592|
        B        |L2.9660|
|L2.9616|
        BL       |L2.1560|
        BL       |L2.1592|
        MOV      r0,#0
|L2.9628|
        LDR      r1,[r4,r0,LSL #2]
        CMP      r1,#1
        BEQ      |L2.9656|
        ADD      r0,r0,#1
        CMP      r0,#0x1a
        BCC      |L2.9628|
        B        |L2.9660|
|L2.9656|
        BL       |L2.2428|
|L2.9660|
        BL       |L2.2468|
|L2.9664|
        B        |L2.9664|
        ENDP

master_arbitration_lost PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x5634
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        MOV      r1,#0x58ec
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.1800|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1772|
        MOV      r0,r4
        BL       |L2.1724|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x564c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.864|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.836|
        MOV      r0,r5
        BL       |L2.756|
        BL       |L2.312|
        MOV      r1,#0x1554
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x224c
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,r5
        MOV      r1,#0xaa
        BL       |L2.1412|
        MOV      r0,#0x6a34
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x53ac
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68c1
        MOVT     r0,#0x4000
|L2.9940|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.9940|
        MOV      r0,r4
        BL       |L2.676|
        MOV      r0,r4
        BL       |L2.1676|
        MOV      r0,r5
        BL       |L2.676|
        MOV      r1,#0
        MOV      r0,#0x6974
        MOVT     r0,#0x4000
|L2.9988|
        LDR      r2,[r6,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.10028|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.9988|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.10028|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

master_general_call PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x5544
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x57fc
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0x1298
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x1fcc
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a20
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x5384
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68bc
        MOVT     r0,#0x4000
|L2.10248|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.10248|
        MOV      r1,#0
        MOV      r0,#0x694c
        MOVT     r0,#0x4000
|L2.10272|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.10312|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.10272|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.10312|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_rx PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x5514
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x13
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x57cc
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x19
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        MOV      r0,#0x6a1c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x537c
        MOVT     r6,#0x4000
        LDRB     r1,[r6,r1,LSL #2]
        MOV      r0,r5
        BL       |L2.2324|
        BL       |L2.312|
        MOV      r1,#0x1124
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOVW     r1,#0x1f20
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,r4
        BL       |L2.1364|
        MOV      r0,#0x68ba
        MOVT     r0,#0x4000
|L2.10540|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.10540|
        MOV      r1,#0
        MOV      r0,#0x693c
        MOVT     r0,#0x4000
|L2.10564|
        LDR      r2,[r6,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.10604|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.10564|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.10604|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

master_rx_delay PROC
        PUSH     {r4-r9,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x54e4
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x579c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        BL       |L2.1724|
        MOV      r0,r5
        MOV      r1,#0xaa
        BL       |L2.2324|
        MOV      r0,r4
        BL       |L2.1364|
        MOV      r7,#0x8008
        MOVT     r7,#0xe650
|L2.10728|
        LDR      r0,[r7,#0]
        TST      r0,#1
        BEQ      |L2.10728|
        MOV      r0,r5
        MOV      r1,#1
        BL       |L2.1660|
|L2.10752|
        LDR      r0,[r4,#0xc]
        TST      r0,#1
        BEQ      |L2.10752|
        MOV      r0,r4
        BL       |L2.740|
        MOV      r0,r4
        MOV      r1,#3
        BL       |L2.660|
        MOV      r6,#1
        MOV      r9,#0x692c
        MOVT     r9,#0x4000
        MOV      r8,#0x536c
        MOVT     r8,#0x4000
|L2.10804|
        LDR      r0,[r4,#0xc]
        TST      r0,#2
        BEQ      |L2.10804|
        CMP      r6,#2
        BEQ      |L2.10852|
        CMP      r6,#1
        BEQ      |L2.10864|
        CMP      r6,#0
        BNE      |L2.10880|
        MOV      r0,r4
        BL       |L2.1328|
        B        |L2.10872|
|L2.10852|
        MOV      r0,r4
        BL       |L2.1316|
        B        |L2.10872|
|L2.10864|
        MOV      r0,r4
        BL       |L2.1340|
|L2.10872|
        ADD      r1,r9,r6,LSL #2
        STR      r0,[r1,#-4]
|L2.10880|
        MOV      r0,#0x320
        BL       |L2.2408|
        MOV      r0,r4
        MOV      r1,#2
        BL       |L2.660|
|L2.10900|
        LDR      r0,[r7,#0]
        TST      r0,#4
        BEQ      |L2.10900|
        MOV      r0,r5
        MOV      r1,#4
        BL       |L2.1660|
|L2.10924|
        LDR      r0,[r7,#0]
        TST      r0,#8
        BEQ      |L2.10924|
        CMP      r6,#1
        BHI      |L2.10956|
        LDRB     r1,[r8,r6,LSL #2]
        MOV      r0,r5
        BL       |L2.2324|
|L2.10956|
        MOV      r0,r5
        MOV      r1,#8
        BL       |L2.1660|
        ADD      r6,r6,#1
        CMP      r6,#3
        BNE      |L2.10804|
|L2.10980|
        LDR      r0,[r7,#0]
        TST      r0,#0x10
        BEQ      |L2.10980|
        MOV      r0,r5
        MOV      r1,#0x10
        BL       |L2.1660|
|L2.11004|
        LDR      r0,[r4,#0xc]
        TST      r0,#0x10
        BEQ      |L2.11004|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.660|
        MOV      r0,r4
        BL       |L2.676|
        MOV      r0,r5
        BL       |L2.1676|
        MOV      r0,#0
|L2.11048|
        LDR      r1,[r8,r0,LSL #2]
        LDR      r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.11088|
        ADD      r1,r0,#1
        MOV      r0,#1
        CMP      r1,#1
        BLS      |L2.11048|
        MOV      r0,#0
        POP      {r4-r9,r11,pc}
|L2.11088|
        MOV      r0,#1
        POP      {r4-r9,r11,pc}
        ENDP

master_rx_dma PROC
        PUSH     {r4-r10,lr}
        MOV      r4,#0x2c1c
        MOVT     r4,#0xe615
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.180|
        ADD      r0,r4,#0x80
        MOV      r1,#9
        BL       |L2.180|
        MOVW     r9,#0
        MOVT     r9,#0xe650
        ADD      r0,r9,#0x24
        MOVW     r4,#0xc
        MOVT     r4,#0xe730
        STR      r0,[r4,#-0xc]
        MOV      r6,#0x68fc
        MOVT     r6,#0x4000
        STR      r6,[r4,#-8]
        LDR      r0,[r4,#-4]
        MOV      r8,#2
        BFI      r0,r8,#0,#24
        STR      r0,[r4,#-4]
        LDR      r0,[r4,#0]
        MOV      r5,#1
        BFI      r0,r5,#14,#2
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
        BFI      r0,r8,#3,#2
        STR      r0,[r4,#0]
        MOV      r0,#0x90
        STRH     r0,[r4,#0x34]
        LDR      r0,[r4,#0]
        ORR      r0,r0,#4
        STR      r0,[r4,#0]
        LDR      r0,[r4,#0]
        ORR      r0,r0,#1
        STR      r0,[r4,#0]
        MOV      r1,#0x546c
        MOVT     r1,#0x4000
        MOV      r0,r9
        BL       |L2.864|
        MOV      r0,r9
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r9
        MVN      r1,#0
        BL       |L2.836|
        MOV      r0,r9
        BL       |L2.756|
        MOV      r7,#0x5674
        MOVT     r7,#0x4000
        ADD      r0,r7,#4
        STR      r0,[r4,#0xff4]
        MOV      r0,#0x100c
        MOVT     r0,#0xe730
        MOV      r1,#0x8024
        MOVT     r1,#0xe650
        STR      r1,[r0,#-8]
        LDR      r1,[r0,#-4]
        BFI      r1,r5,#0,#24
        STR      r1,[r0,#-4]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#0xc000
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BFI      r1,r5,#12,#2
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BFI      r1,r10,#8,#4
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#0x300000
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        BFI      r1,r8,#3,#2
        STR      r1,[r0,#0]
        MOV      r1,#0xa3
        STRH     r1,[r0,#0x34]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#4
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        ADD      r5,r9,#0x8000
        MOV      r1,#0x5724
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1772|
        MOV      r0,r5
        MOV      r1,#0xaa
        BL       |L2.2324|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0x1bf4
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOV      r1,#0xd3c
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x4b78
        MOVT     r1,#0x4000
        MOV      r0,#0x40
        BL       |L2.616|
        MOV      r1,#0x4d54
        MOVT     r1,#0x4000
        MOV      r0,#0x41
        BL       |L2.616|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x40
        BL       |L2.384|
        MOV      r0,#0x41
        BL       |L2.384|
        MOV      r0,r9
        BL       |L2.1364|
        MOV      r0,#0x68b4
        MOVT     r0,#0x4000
|L2.11652|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.11652|
        MOV      r0,r9
        BL       |L2.676|
        MOV      r0,r5
        BL       |L2.1676|
        MOV      r0,#0
|L2.11684|
        LDR      r1,[r7,r0,LSL #2]
        LDRB     r2,[r6,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.11724|
        ADD      r1,r0,#1
        MOV      r0,#1
        CMP      r1,#1
        BLS      |L2.11684|
        MOV      r0,#0
        POP      {r4-r10,pc}
|L2.11724|
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
        BL       |L2.180|
        ADD      r0,r4,#0x80
        MOV      r1,#9
        BL       |L2.180|
        MOV      r0,#0xeff4
        MOVT     r0,#4
        MOV      r9,#0x100c
        MOVT     r9,#0xe730
        ADD      r0,r9,r0
        MOV      r7,#2
        MOV      r1,#2
        BL       |L2.248|
        MOV      r0,#0
        MOV      r1,#0xc
        MOVW     r11,#0
        MOVT     r11,#0xe650
        MOVW     r2,#0x800
        MOVT     r2,#0xe735
        ADD      r3,r11,#0x24
        MOV      r10,#0x6914
        MOVT     r10,#0x4000
        MOV      r12,#1
        MOV      r5,#0x90
|L2.11848|
        ADD      r6,r2,r1
        STR      r3,[r6,#-0xc]
        ADD      r6,r2,r0,LSL #1
        ADD      r4,r10,r0
        STR      r4,[r6,#4]
        LDR      r4,[r6,#8]
        BFI      r4,r7,#0,#24
        STR      r4,[r6,#8]
        LDR      r6,[r2,r1]
        BFI      r6,r12,#10,#2
        STR      r6,[r2,r1]
        LDR      r6,[r2,r1]
        BIC      r6,r6,#0x300
        STR      r6,[r2,r1]
        LDR      r6,[r2,r1]
        BFI      r6,r7,#6,#2
        STR      r6,[r2,r1]
        LDR      r6,[r2,r1]
        BFI      r6,r7,#0,#4
        STR      r6,[r2,r1]
        LDR      r6,[r2,r1]
        BFI      r6,r5,#16,#8
        STR      r6,[r2,r1]
        ADD      r1,r1,#0x10
        ADD      r0,r0,#8
        CMP      r0,#0x10
        BNE      |L2.11848|
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
        MOV      r1,#0x54b4
        MOVT     r1,#0x4000
        MOV      r0,r11
        BL       |L2.864|
        MOV      r0,r11
        MOV      r1,#1
        BL       |L2.1468|
        MOV      r4,#2
        MOV      r0,r11
        MOV      r1,#2
        BL       |L2.1448|
        MOV      r0,r11
        BL       |L2.772|
        MOV      r0,r11
        BL       |L2.804|
        MOV      r0,r11
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r11
        MVN      r1,#0
        BL       |L2.836|
        MOV      r0,r11
        BL       |L2.756|
        MOV      r6,#0x6898
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        MOV      r7,#0x567c
        MOVT     r7,#0x4000
        ADD      r0,r7,r0,LSL #3
        ADD      r0,r0,#4
        STR      r0,[r9,#-0xc]
        MOV      r0,#0x8024
        MOVT     r0,#0xe650
        STR      r0,[r9,#-8]
        LDR      r0,[r9,#-4]
        BFI      r0,r4,#0,#24
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
        BFI      r0,r4,#3,#2
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
        MOV      r1,#0x576c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MVN      r1,#4
        BL       |L2.1772|
        LDR      r0,[r6,#0]
        LDRB     r1,[r7,r0,LSL #3]
        MOV      r0,r5
        BL       |L2.2324|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0xf54
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x1d78
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOV      r1,#0x4bdc
        MOVT     r1,#0x4000
        MOV      r0,#0x40
        BL       |L2.616|
        MOV      r1,#0x4da8
        MOVT     r1,#0x4000
        MOV      r0,#0x41
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x40
        BL       |L2.384|
        MOV      r0,#0x41
        BL       |L2.384|
        MOV      r0,r11
        BL       |L2.1364|
        MOV      r0,#0x68b7
        MOVT     r0,#0x4000
|L2.12480|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.12480|
        MOV      r0,r11
        BL       |L2.676|
        MOV      r0,r5
        BL       |L2.1676|
        MOV      r0,#0
|L2.12512|
        MOV      r1,#0
|L2.12516|
        ADD      r2,r7,r0,LSL #3
        LDR      r2,[r2,r1,LSL #2]
        ADD      r3,r10,r0,LSL #3
        LDRB     r3,[r3,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.12580|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.12516|
        ADD      r0,r0,#1
        CMP      r0,#2
        BCC      |L2.12512|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.12580|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

master_send_start_byte PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x561c
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        MOV      r0,r4
        MOV      r1,#0x11
        BL       |L2.2316|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x58d4
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0x1850
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x24b0
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a48
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x53d4
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68c6
        MOVT     r0,#0x4000
|L2.12816|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.12816|
        MOV      r1,#0
        MOV      r0,#0x699c
        MOVT     r0,#0x4000
|L2.12840|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.12880|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.12840|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.12880|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x543c
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x56f4
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0xc24
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x1af4
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a04
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x5344
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68b2
        MOVT     r0,#0x4000
|L2.13100|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.13100|
        MOV      r1,#0
        MOV      r0,#0x68ec
        MOVT     r0,#0x4000
|L2.13124|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.13164|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.13124|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.13164|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_100kHz PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x5424
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x56dc
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0xb98
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x1a74
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOVW     r0,#0x6a00
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x533c
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68b1
        MOVT     r0,#0x4000
|L2.13384|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.13384|
        MOV      r1,#0
        MOV      r0,#0x68e4
        MOVT     r0,#0x4000
|L2.13408|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.13448|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.13408|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.13448|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_100kHz_var_duty PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x5574
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x582c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0x13b0
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x20cc
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a28
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x5394
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68be
        MOVT     r0,#0x4000
|L2.13668|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.13668|
        MOV      r1,#0
        MOV      r0,#0x695c
        MOVT     r0,#0x4000
|L2.13692|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.13732|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.13692|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.13732|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_1MHz_var_duty PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x555c
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x5814
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0x1324
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x204c
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a24
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x538c
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68bd
        MOVT     r0,#0x4000
|L2.13952|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.13952|
        MOV      r1,#0
        MOV      r0,#0x6954
        MOVT     r0,#0x4000
|L2.13976|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.14016|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.13976|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.14016|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_200kHz PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x558c
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x5844
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0x143c
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x214c
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a2c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x539c
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68bf
        MOVT     r0,#0x4000
|L2.14236|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.14236|
        MOV      r1,#0
        MOV      r0,#0x6964
        MOVT     r0,#0x4000
|L2.14260|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.14300|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.14260|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.14300|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_200kHz_var_duty PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x5454
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x570c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOVW     r1,#0xcb0
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x1b74
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a08
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x534c
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68b3
        MOVT     r0,#0x4000
|L2.14520|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.14520|
        MOV      r1,#0
        MOV      r0,#0x68f4
        MOVT     r0,#0x4000
|L2.14544|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.14584|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.14544|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.14584|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_250kHz PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x55a4
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x585c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0x14c8
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x21cc
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a30
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x53a4
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68c0
        MOVT     r0,#0x4000
|L2.14804|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.14804|
        MOV      r1,#0
        MOV      r0,#0x696c
        MOVT     r0,#0x4000
|L2.14828|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.14868|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.14828|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.14868|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_250kHz_var_duty PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x54fc
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x57b4
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0x1098
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOVW     r1,#0x1ea0
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a18
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x5374
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68b9
        MOVT     r0,#0x4000
|L2.15088|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.15088|
        MOV      r1,#0
        MOV      r0,#0x6934
        MOVT     r0,#0x4000
|L2.15112|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.15152|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.15112|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.15152|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_300kHz PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x55d4
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x588c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0x16ac
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x2330
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a3c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x53bc
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68c3
        MOVT     r0,#0x4000
|L2.15372|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.15372|
        MOV      r1,#0
        MOV      r0,#0x6984
        MOVT     r0,#0x4000
|L2.15396|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.15436|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.15396|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.15436|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_300kHz_var_duty PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x54cc
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x5784
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0x100c
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOVW     r1,#0x1e20
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a14
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x5364
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68b8
        MOVT     r0,#0x4000
|L2.15656|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.15656|
        MOV      r1,#0
        MOV      r0,#0x6924
        MOVT     r0,#0x4000
|L2.15680|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.15720|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.15680|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.15720|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_400kHz PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x540c
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x56c4
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0xb0c
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x19f4
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x69fc
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x5334
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68b0
        MOVT     r0,#0x4000
|L2.15940|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.15940|
        MOV      r1,#0
        MOV      r0,#0x68dc
        MOVT     r0,#0x4000
|L2.15964|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.16004|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.15964|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.16004|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_400kHz_var_duty PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x55ec
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x58a4
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0x1738
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x23b0
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a40
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x53c4
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68c4
        MOVT     r0,#0x4000
|L2.16224|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.16224|
        MOV      r1,#0
        MOV      r0,#0x698c
        MOVT     r0,#0x4000
|L2.16248|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.16288|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.16248|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.16288|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_50kHz PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x549c
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x5754
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0xec8
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x1cf8
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a10
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x535c
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68b6
        MOVT     r0,#0x4000
|L2.16508|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.16508|
        MOV      r1,#0
        MOV      r0,#0x690c
        MOVT     r0,#0x4000
|L2.16532|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.16572|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.16532|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.16572|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_50kHz_var_duty PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x5604
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x58bc
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0x17c4
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x2430
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a44
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x53cc
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68c5
        MOVT     r0,#0x4000
|L2.16792|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.16792|
        MOV      r1,#0
        MOV      r0,#0x6994
        MOVT     r0,#0x4000
|L2.16816|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.16856|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.16816|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.16856|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_dma PROC
        PUSH     {r4-r9,r11,lr}
        MOV      r4,#0x2c1c
        MOVT     r4,#0xe615
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.180|
        ADD      r0,r4,#0x80
        MOV      r1,#9
        BL       |L2.180|
        MOV      r6,#0x568c
        MOVT     r6,#0x4000
        ADD      r0,r6,#4
        MOVW     r7,#0xc
        MOVT     r7,#0xe730
        STR      r0,[r7,#-0xc]
        MOVW     r4,#0
        MOVT     r4,#0xe650
        ADD      r0,r4,#0x24
        STR      r0,[r7,#-8]
        LDR      r0,[r7,#-4]
        MOV      r9,#1
        BFI      r0,r9,#0,#24
        STR      r0,[r7,#-4]
        LDR      r0,[r7,#0]
        BIC      r0,r0,#0xc000
        STR      r0,[r7,#0]
        LDR      r0,[r7,#0]
        BFI      r0,r9,#12,#2
        STR      r0,[r7,#0]
        LDR      r0,[r7,#0]
        MOV      r8,#8
        BFI      r0,r8,#8,#4
        STR      r0,[r7,#0]
        LDR      r0,[r7,#0]
        BIC      r0,r0,#0x300000
        STR      r0,[r7,#0]
        LDR      r0,[r7,#0]
        MOV      r5,#2
        BFI      r0,r5,#3,#2
        STR      r0,[r7,#0]
        MOV      r0,#0x91
        STRH     r0,[r7,#0x34]
        LDR      r0,[r7,#0]
        ORR      r0,r0,#4
        STR      r0,[r7,#0]
        LDR      r0,[r7,#0]
        ORR      r0,r0,#1
        STR      r0,[r7,#0]
        MOV      r1,#0x552c
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        MOV      r0,#0x8024
        MOVT     r0,#0xe650
        STR      r0,[r7,#0xff4]
        MOV      r0,#0x100c
        MOVT     r0,#0xe730
        MOV      r7,#0x6944
        MOVT     r7,#0x4000
        STR      r7,[r0,#-8]
        LDR      r1,[r0,#-4]
        BFI      r1,r5,#0,#24
        STR      r1,[r0,#-4]
        LDR      r1,[r0,#0]
        BFI      r1,r9,#14,#2
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
        BFI      r1,r5,#3,#2
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
        MOV      r1,#0x57e4
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0x1f78
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOV      r1,#0x11d8
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x4c40
        MOVT     r1,#0x4000
        MOV      r0,#0x40
        BL       |L2.616|
        MOV      r1,#0x4e5c
        MOVT     r1,#0x4000
        MOV      r0,#0x41
        BL       |L2.616|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x40
        BL       |L2.384|
        MOV      r0,#0x41
        BL       |L2.384|
        MOV      r0,r4
        MOV      r1,#0xaa
        BL       |L2.1412|
        MOV      r0,#0x68bb
        MOVT     r0,#0x4000
|L2.17412|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.17412|
        MOV      r0,r4
        BL       |L2.676|
        MOV      r0,r5
        BL       |L2.1676|
        MOV      r0,#0
|L2.17444|
        LDR      r1,[r6,r0,LSL #2]
        LDRB     r2,[r7,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.17484|
        ADD      r1,r0,#1
        MOV      r0,#1
        CMP      r1,#1
        BLS      |L2.17444|
        MOV      r0,#0
        POP      {r4-r9,r11,pc}
|L2.17484|
        MOV      r0,#1
        POP      {r4-r9,r11,pc}
        ENDP

master_tx_dma_continuous PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#4
        MOV      r4,#0x2c1c
        MOVT     r4,#0xe615
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.180|
        ADD      r0,r4,#0x80
        MOV      r1,#9
        BL       |L2.180|
        MOV      r0,#0xeff4
        MOVT     r0,#4
        MOV      r8,#0x100c
        MOVT     r8,#0xe730
        ADD      r0,r8,r0
        MOV      r7,#2
        MOV      r1,#2
        BL       |L2.248|
        MOV      r0,#0
        MOV      r1,#0xc
        MOVW     r11,#0
        MOVT     r11,#0xe650
        MOVW     r2,#0x800
        MOVT     r2,#0xe735
        MOV      r10,#0x5664
        MOVT     r10,#0x4000
        ADD      r3,r11,#0x24
        MOV      r12,#1
        MOV      r5,#0x91
|L2.17608|
        ADD      r6,r2,r1
        ADD      r4,r10,r0
        ADD      r4,r4,#4
        STR      r4,[r6,#-0xc]
        ADD      r6,r2,r0,LSL #1
        STR      r3,[r6,#4]
        LDR      r4,[r6,#8]
        BFI      r4,r7,#0,#24
        STR      r4,[r6,#8]
        LDR      r6,[r2,r1]
        BIC      r6,r6,#0xc00
        STR      r6,[r2,r1]
        LDR      r6,[r2,r1]
        BFI      r6,r12,#8,#2
        STR      r6,[r2,r1]
        LDR      r6,[r2,r1]
        BFI      r6,r7,#6,#2
        STR      r6,[r2,r1]
        LDR      r6,[r2,r1]
        BFI      r6,r7,#0,#4
        STR      r6,[r2,r1]
        LDR      r6,[r2,r1]
        BFI      r6,r5,#16,#8
        STR      r6,[r2,r1]
        ADD      r1,r1,#0x10
        ADD      r0,r0,#8
        CMP      r0,#0x10
        BNE      |L2.17608|
        MOVW     r0,#0xc
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        MOV      r9,#1
        BFI      r1,r9,#28,#2
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#0xf000000
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#0x400000
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0x10]
        BFI      r1,r9,#24,#8
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
        MOV      r1,#0x53f4
        MOVT     r1,#0x4000
        MOV      r0,r11
        BL       |L2.864|
        MOV      r0,r11
        MOV      r1,#1
        BL       |L2.1468|
        MOV      r5,#2
        MOV      r0,r11
        MOV      r1,#2
        BL       |L2.1488|
        MOV      r0,r11
        BL       |L2.788|
        MOV      r0,r11
        BL       |L2.820|
        MOV      r0,r11
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r11
        MVN      r1,#0
        BL       |L2.836|
        MOV      r0,r11
        BL       |L2.756|
        MOV      r0,#0x8024
        MOVT     r0,#0xe650
        STR      r0,[r8,#-0xc]
        MOV      r4,#0x6894
        MOVT     r4,#0x4000
        LDR      r0,[r4,#0]
        MOV      r7,#0x68cc
        MOVT     r7,#0x4000
        ADD      r0,r7,r0,LSL #3
        STR      r0,[r8,#-8]
        LDR      r0,[r8,#-4]
        BFI      r0,r5,#0,#24
        STR      r0,[r8,#-4]
        LDR      r0,[r8,#0]
        BFI      r0,r9,#14,#2
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
        BFI      r0,r5,#3,#2
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
        MOV      r1,#0x56ac
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0xa54
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOVW     r1,#0x19a0
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOV      r1,#0x4b24
        MOVT     r1,#0x4000
        MOV      r0,#0x40
        BL       |L2.616|
        MOV      r1,#0x4c94
        MOVT     r1,#0x4000
        MOV      r0,#0x41
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x40
        BL       |L2.384|
        MOV      r0,#0x41
        BL       |L2.384|
        LDR      r0,[r4,#0]
        LDR      r1,[r10,r0,LSL #3]
        MOV      r0,r11
        BL       |L2.1412|
        MOV      r0,#0x68af
        MOVT     r0,#0x4000
|L2.18232|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.18232|
        MOV      r0,r11
        BL       |L2.676|
        MOV      r0,r5
        BL       |L2.1676|
        MOV      r0,#0
|L2.18264|
        MOV      r1,#0
|L2.18268|
        ADD      r2,r10,r0,LSL #3
        LDR      r2,[r2,r1,LSL #2]
        ADD      r3,r7,r0,LSL #3
        LDRB     r3,[r3,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.18332|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.18268|
        ADD      r0,r0,#1
        CMP      r0,#2
        BCC      |L2.18264|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.18332|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

master_tx_fbsc_check PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#4
        BL       |L2.312|
        MOVW     r1,#0x9d0
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x190c
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r11,#0
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r7,#0x69f8
        MOVT     r7,#0x4000
        MOV      r5,#0x68ae
        MOVT     r5,#0x4000
        ADD      r6,r4,#0x8000
        MOV      r9,#0x5694
        MOVT     r9,#0x4000
        MOV      r10,#0x68c8
        MOVT     r10,#0x4000
        MOV      r8,#0
|L2.18456|
        STR      r11,[r7,#0]
        MOV      r0,#0x69a4
        MOVT     r0,#0x4000
        STR      r11,[r0,#0]
        STRB     r11,[r5,#0]
        MOV      r0,r4
        MOV      r1,#0x53dc
        MOVT     r1,#0x4000
        BL       |L2.864|
        LDR      r0,[r4,#0x38]
        BIC      r0,r0,#0x1f
        ORR      r0,r0,r8
        STR      r0,[r4,#0x38]
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        MOV      r0,r6
        MOV      r1,r9
        BL       |L2.1800|
        MOV      r0,r6
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r6
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r6
        BL       |L2.1724|
        LDR      r0,[r7,#0]
        ADD      r0,r0,#1
        STR      r0,[r7,#0]
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.1412|
|L2.18608|
        LDRB     r0,[r5,#0]
        CMP      r0,#0
        BEQ      |L2.18608|
        LDR      r0,[r10,#0]
        CMP      r0,#0x48
        BNE      |L2.18656|
        ADD      r8,r8,#1
        CMP      r8,#0x20
        BCC      |L2.18456|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.18656|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

master_tx_fsb PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x55bc
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x5874
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOVW     r1,#0x1600
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x22d8
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a38
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x53b4
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68c2
        MOVT     r0,#0x4000
|L2.18880|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.18880|
        MOV      r1,#0
        MOV      r0,#0x697c
        MOVT     r0,#0x4000
|L2.18904|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.18944|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.18904|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.18944|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

master_tx_rpt_master_rx PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x5484
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.864|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.660|
        MOV      r0,r4
        MOV      r1,#0x1b
        BL       |L2.836|
        MOV      r0,r4
        BL       |L2.756|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x573c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1800|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1660|
        MOV      r0,r5
        MOV      r1,#0x1b
        BL       |L2.1772|
        MOV      r0,r5
        BL       |L2.1724|
        BL       |L2.312|
        MOV      r1,#0xdfc
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.616|
        MOV      r1,#0x1c48
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.616|
        MOVW     r0,#0x10e
        BL       |L2.384|
        MOV      r0,#0x10f
        BL       |L2.384|
        MOV      r0,#0x6a0c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x5354
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1412|
        MOV      r0,#0x68b5
        MOVT     r0,#0x4000
|L2.19164|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.19164|
        MOV      r1,#0
        MOV      r0,#0x6904
        MOVT     r0,#0x4000
|L2.19188|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.19228|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.19188|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.19228|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

sdmac1ch0InterruptHandler PROC
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
        MOVW     r0,#0
        MOVT     r0,#0xe650
        BL       |L2.708|
        MOV      r0,#0x68a4
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

|symbol_number.102| PROC
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
        BL       |L2.692|
        MOV      r0,#0x689d
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

|symbol_number.137| PROC
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
        BL       |L2.692|
        MOV      r0,#0x689e
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

|symbol_number.187| PROC
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
        MOVW     r0,#0
        MOVT     r0,#0xe650
        BL       |L2.708|
        MOV      r0,#0x68a7
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
        MOV      r1,#0x6894
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r2,r2,#1
        STR      r2,[r1,#0]
        LDR      r3,[r0,#0]
        BIC      r3,r3,#1
        STR      r3,[r0,#0]
        CMP      r2,#1
        BHI      |L2.19728|
        LDR      r1,[r1,#0]
        MOV      r2,#0x68cc
        MOVT     r2,#0x4000
        ADD      r1,r2,r1,LSL #3
        STR      r1,[r0,#-8]
        LDR      r1,[r0,#-4]
        MOV      r2,#2
        BFI      r1,r2,#0,#24
        STR      r1,[r0,#-4]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        BX       lr
|L2.19728|
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
        BL       |L2.1692|
        MOV      r0,#0x689c
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

|symbol_number.103| PROC
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
        MOVW     r0,#0x8000
        MOVT     r0,#0xe650
        BL       |L2.1708|
        MOV      r0,#0x68a5
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

|symbol_number.138| PROC
        MOV      r0,#0x100c
        MOVT     r0,#0xe730
        LDR      r1,[r0,#0]
        TST      r1,#2
        BXEQ     lr
        MOV      r1,#0x6898
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r2,r2,#1
        STR      r2,[r1,#0]
        LDR      r3,[r0,#0]
        BIC      r3,r3,#1
        STR      r3,[r0,#0]
        CMP      r2,#1
        BHI      |L2.20008|
        LDR      r1,[r1,#0]
        MOV      r2,#0x567c
        MOVT     r2,#0x4000
        ADD      r1,r2,r1,LSL #3
        ADD      r1,r1,#4
        STR      r1,[r0,#-0xc]
        LDR      r1,[r0,#-4]
        MOV      r2,#2
        BFI      r1,r2,#0,#24
        STR      r1,[r0,#-4]
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        BX       lr
|L2.20008|
        PUSH     {r11,lr}
        LDR      r1,[r0,#0]
        BIC      r1,r1,#2
        STR      r1,[r0,#0]
        MOVW     r0,#0x8000
        MOVT     r0,#0xe650
        BL       |L2.1708|
        MOV      r0,#0x68a6
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

|symbol_number.188| PROC
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
        BL       |L2.1692|
        MOV      r0,#0x689f
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

||$Ven$AA$L$$Reset_Handler|| PROC
|L2.20160|
        LDR      pc,|L2.20164|
|L2.20164|
        DCD      0x00000070
        ENDP

_fp_init PROC
|L2.20168|
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
|symbol_number.62|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.73|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.84|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.94|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.118|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.129|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.154|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.162|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.169|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.179|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.203|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.213|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.224|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.234|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.244|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.255|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.268|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.278|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.288|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.299|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.309|
        DCD      0x000000aa
        DCD      0x00000055
masterConfig
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.48|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.60|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.71|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
|symbol_number.82|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.92|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000002
|symbol_number.105|
        DCD      0x00000001
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.116|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.127|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|symbol_number.140|
        DCD      0x00000001
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.152|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000004
|symbol_number.160|
        DCD      0x00000001
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.167|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000003
|symbol_number.177|
        DCD      0x00000001
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.190|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.201|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.211|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000006
|symbol_number.222|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
|symbol_number.232|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000002
|symbol_number.242|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000003
|symbol_number.266|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.276|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000004
|symbol_number.286|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.297|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|symbol_number.307|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000001
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
        DCD      0x000000aa
        DCD      0x00000055
        DCD      0x00000055
        DCD      0x000000aa
|symbol_number.106|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.141|
        DCD      0x000000aa
        DCD      0x00000055
        DCD      0x00000055
        DCD      0x000000aa
|symbol_number.189|
        DCD      0x000000aa
        DCD      0x00000055
slaveConfig
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.51|
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.61|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.72|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
|symbol_number.83|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.93|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000002
|symbol_number.107|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.117|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.128|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|symbol_number.143|
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.153|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000004
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
        DCD      0x00000001
        DCD      0x00000003
|symbol_number.178|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.192|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.202|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.212|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000006
|symbol_number.223|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000001
|symbol_number.233|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000002
|symbol_number.243|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000003
|symbol_number.267|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.277|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000004
|symbol_number.287|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000005
|symbol_number.298|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000000
|symbol_number.308|
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
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
        DCD      0x40000134
pattern
        DCD      0x40002850
        DCD      0x40002974
        DCD      0x40003258
        DCD      0x400048ec
        DCD      0x40004a08
        DCD      0x40002734
        DCD      0x40003130
        DCD      0x400025c4
        DCD      0x40002b58
        DCD      0x400041e0
        DCD      0x40002dd4
        DCD      0x40004454
        DCD      0x40003fa8
        DCD      0x40003374
        DCD      0x400036c8
        DCD      0x40003900
        DCD      0x40003b38
        DCD      0x40003d70
        DCD      0x400040c4
        DCD      0x40003490
        DCD      0x400037e4
        DCD      0x40003a1c
        DCD      0x40003c54
        DCD      0x40003e8c
        DCD      0x400035ac
        DCD      0x400047a8

        AREA ||area_number.4||, DATA, NOINIT, ALIGN=2

        EXPORTAS ||area_number.4||, ER10
DumpOffset
        %        4
currentDataPackageIndex
        %        4
|symbol_number.142|
        %        4
isAutoRXComplete
        %        1
|symbol_number.111|
        %        1
|symbol_number.147|
        %        1
|symbol_number.196|
        %        1
isAutoRXStarted
        %        1
|symbol_number.109|
        %        1
|symbol_number.145|
        %        1
|symbol_number.197|
        %        1
isAutoTXComplete
        %        1
|symbol_number.110|
        %        1
|symbol_number.146|
        %        1
|symbol_number.195|
        %        1
isAutoTXStarted
        %        1
|symbol_number.112|
        %        1
|symbol_number.148|
        %        1
|symbol_number.194|
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
|symbol_number.75|
        %        1
|symbol_number.86|
        %        1
|symbol_number.96|
        %        1
|symbol_number.108|
        %        1
|symbol_number.120|
        %        1
|symbol_number.131|
        %        1
|symbol_number.144|
        %        1
|symbol_number.156|
        %        1
|symbol_number.171|
        %        1
|symbol_number.181|
        %        1
|symbol_number.193|
        %        1
|symbol_number.205|
        %        1
|symbol_number.215|
        %        1
|symbol_number.226|
        %        1
|symbol_number.236|
        %        1
|symbol_number.246|
        %        1
|symbol_number.257|
        %        1
|symbol_number.270|
        %        1
|symbol_number.280|
        %        1
|symbol_number.290|
        %        1
|symbol_number.301|
        %        1
|symbol_number.311|
        %        2
receivedData
        %        4
|symbol_number.49|
        %        16
|symbol_number.65|
        %        8
|symbol_number.76|
        %        8
|symbol_number.87|
        %        8
|symbol_number.97|
        %        8
|symbol_number.104|
        %        8
|symbol_number.121|
        %        8
|symbol_number.132|
        %        8
|symbol_number.139|
        %        16
|symbol_number.157|
        %        8
|symbol_number.163|
        %        8
|symbol_number.172|
        %        8
|symbol_number.182|
        %        8
|symbol_number.191|
        %        8
|symbol_number.206|
        %        8
|symbol_number.216|
        %        8
|symbol_number.227|
        %        8
|symbol_number.237|
        %        8
|symbol_number.247|
        %        8
|symbol_number.258|
        %        8
|symbol_number.271|
        %        8
|symbol_number.281|
        %        8
|symbol_number.291|
        %        8
|symbol_number.302|
        %        8
|symbol_number.312|
        %        8
receivedDataIndex
        %        4
|symbol_number.66|
        %        4
|symbol_number.77|
        %        4
|symbol_number.88|
        %        4
|symbol_number.98|
        %        4
|symbol_number.122|
        %        4
|symbol_number.133|
        %        4
|symbol_number.158|
        %        4
|symbol_number.173|
        %        4
|symbol_number.183|
        %        4
|symbol_number.207|
        %        4
|symbol_number.217|
        %        4
|symbol_number.228|
        %        4
|symbol_number.238|
        %        4
|symbol_number.248|
        %        4
|symbol_number.260|
        %        4
|symbol_number.272|
        %        4
|symbol_number.282|
        %        4
|symbol_number.292|
        %        4
|symbol_number.303|
        %        4
|symbol_number.314|
        %        4
sendDataIndex
        %        4
|symbol_number.63|
        %        4
|symbol_number.74|
        %        4
|symbol_number.85|
        %        4
|symbol_number.95|
        %        4
|symbol_number.119|
        %        4
|symbol_number.130|
        %        4
|symbol_number.155|
        %        4
|symbol_number.170|
        %        4
|symbol_number.180|
        %        4
|symbol_number.204|
        %        4
|symbol_number.214|
        %        4
|symbol_number.225|
        %        4
|symbol_number.235|
        %        4
|symbol_number.245|
        %        4
|symbol_number.256|
        %        4
|symbol_number.269|
        %        4
|symbol_number.279|
        %        4
|symbol_number.289|
        %        4
|symbol_number.300|
        %        4
|symbol_number.310|
        %        4

        AREA ARM_LIB_STACK, DATA, NOINIT, ALIGN=0

        %        1024

||Image$$ARM_LIB_HEAP$$ZI$$Base|| EQU 1073769036
||Image$$ARM_LIB_HEAP$$ZI$$Limit|| EQU 1073769036
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
        EXPORT main [CODE]
        EXPORT master_arbitration_lost [CODE]
        EXPORT master_general_call [CODE]
        EXPORT master_rx [CODE]
        EXPORT master_rx_delay [CODE]
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
        EXPORT master_tx_fbsc_check [CODE]
        EXPORT master_tx_fsb [CODE]
        EXPORT master_tx_rpt_master_rx [CODE]
        EXPORT ||$Ven$AA$L$$Reset_Handler|| [CODE]
        EXPORT _fp_init [CODE,DYNAMIC]
        EXPORT __fplib_config_fpu_vfp [CODE,DYNAMIC]
        EXPORT __fplib_config_pureend_doubles [CODE,DYNAMIC]
        EXPORT I2C_CLOCK_SETTINGS [DATA,SIZE=1120]
        EXPORT GIC_intHandler [DATA,SIZE=3876]
        EXPORT pattern [DATA,SIZE=104]
        EXPORT DumpOffset [DATA,SIZE=4]

        KEEP __ddr_init_start
        KEEP __ddr_init_end
        KEEP i2c0InterruptHandler
        KEEP i2c1InterruptHandler
        KEEP masterConfig
        KEEP slaveConfig
        KEEP |symbol_number.43|
        EXPORTAS |symbol_number.43|, i2c0InterruptHandler
        KEEP |symbol_number.44|
        EXPORTAS |symbol_number.44|, i2c1InterruptHandler
        KEEP sdmac1ch0InterruptHandler
        KEEP sdmac1ch1InterruptHandler
        KEEP sendData
        KEEP |symbol_number.48|
        EXPORTAS |symbol_number.48|, masterConfig
        KEEP |symbol_number.51|
        EXPORTAS |symbol_number.51|, slaveConfig
        KEEP |symbol_number.58|
        EXPORTAS |symbol_number.58|, i2c0InterruptHandler
        KEEP |symbol_number.59|
        EXPORTAS |symbol_number.59|, i2c1InterruptHandler
        KEEP |symbol_number.60|
        EXPORTAS |symbol_number.60|, masterConfig
        KEEP |symbol_number.61|
        EXPORTAS |symbol_number.61|, slaveConfig
        KEEP |symbol_number.62|
        EXPORTAS |symbol_number.62|, sendData
        KEEP |symbol_number.69|
        EXPORTAS |symbol_number.69|, i2c0InterruptHandler
        KEEP |symbol_number.70|
        EXPORTAS |symbol_number.70|, i2c1InterruptHandler
        KEEP |symbol_number.71|
        EXPORTAS |symbol_number.71|, masterConfig
        KEEP |symbol_number.72|
        EXPORTAS |symbol_number.72|, slaveConfig
        KEEP |symbol_number.73|
        EXPORTAS |symbol_number.73|, sendData
        KEEP |symbol_number.80|
        EXPORTAS |symbol_number.80|, i2c0InterruptHandler
        KEEP |symbol_number.81|
        EXPORTAS |symbol_number.81|, i2c1InterruptHandler
        KEEP |symbol_number.82|
        EXPORTAS |symbol_number.82|, masterConfig
        KEEP |symbol_number.83|
        EXPORTAS |symbol_number.83|, slaveConfig
        KEEP |symbol_number.84|
        EXPORTAS |symbol_number.84|, sendData
        KEEP |symbol_number.90|
        EXPORTAS |symbol_number.90|, i2c0InterruptHandler
        KEEP |symbol_number.91|
        EXPORTAS |symbol_number.91|, i2c1InterruptHandler
        KEEP |symbol_number.92|
        EXPORTAS |symbol_number.92|, masterConfig
        KEEP |symbol_number.93|
        EXPORTAS |symbol_number.93|, slaveConfig
        KEEP |symbol_number.94|
        EXPORTAS |symbol_number.94|, sendData
        KEEP |symbol_number.100|
        EXPORTAS |symbol_number.100|, i2c1InterruptHandler
        KEEP |symbol_number.101|
        EXPORTAS |symbol_number.101|, i2c0InterruptHandler
        KEEP |symbol_number.102|
        EXPORTAS |symbol_number.102|, sdmac1ch0InterruptHandler
        KEEP |symbol_number.103|
        EXPORTAS |symbol_number.103|, sdmac1ch1InterruptHandler
        KEEP |symbol_number.105|
        EXPORTAS |symbol_number.105|, masterConfig
        KEEP |symbol_number.106|
        EXPORTAS |symbol_number.106|, sendData
        KEEP |symbol_number.107|
        EXPORTAS |symbol_number.107|, slaveConfig
        KEEP |symbol_number.114|
        EXPORTAS |symbol_number.114|, i2c0InterruptHandler
        KEEP |symbol_number.115|
        EXPORTAS |symbol_number.115|, i2c1InterruptHandler
        KEEP |symbol_number.116|
        EXPORTAS |symbol_number.116|, masterConfig
        KEEP |symbol_number.117|
        EXPORTAS |symbol_number.117|, slaveConfig
        KEEP |symbol_number.118|
        EXPORTAS |symbol_number.118|, sendData
        KEEP |symbol_number.125|
        EXPORTAS |symbol_number.125|, i2c0InterruptHandler
        KEEP |symbol_number.126|
        EXPORTAS |symbol_number.126|, i2c1InterruptHandler
        KEEP |symbol_number.127|
        EXPORTAS |symbol_number.127|, masterConfig
        KEEP |symbol_number.128|
        EXPORTAS |symbol_number.128|, slaveConfig
        KEEP |symbol_number.129|
        EXPORTAS |symbol_number.129|, sendData
        KEEP |symbol_number.135|
        EXPORTAS |symbol_number.135|, i2c0InterruptHandler
        KEEP |symbol_number.136|
        EXPORTAS |symbol_number.136|, i2c1InterruptHandler
        KEEP |symbol_number.137|
        EXPORTAS |symbol_number.137|, sdmac1ch0InterruptHandler
        KEEP |symbol_number.138|
        EXPORTAS |symbol_number.138|, sdmac1ch1InterruptHandler
        KEEP |symbol_number.140|
        EXPORTAS |symbol_number.140|, masterConfig
        KEEP |symbol_number.141|
        EXPORTAS |symbol_number.141|, sendData
        KEEP |symbol_number.143|
        EXPORTAS |symbol_number.143|, slaveConfig
        KEEP |symbol_number.150|
        EXPORTAS |symbol_number.150|, i2c0InterruptHandler
        KEEP |symbol_number.151|
        EXPORTAS |symbol_number.151|, i2c1InterruptHandler
        KEEP |symbol_number.152|
        EXPORTAS |symbol_number.152|, masterConfig
        KEEP |symbol_number.153|
        EXPORTAS |symbol_number.153|, slaveConfig
        KEEP |symbol_number.154|
        EXPORTAS |symbol_number.154|, sendData
        KEEP |symbol_number.160|
        EXPORTAS |symbol_number.160|, masterConfig
        KEEP |symbol_number.161|
        EXPORTAS |symbol_number.161|, slaveConfig
        KEEP |symbol_number.162|
        EXPORTAS |symbol_number.162|, sendData
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
        KEEP |symbol_number.175|
        EXPORTAS |symbol_number.175|, i2c0InterruptHandler
        KEEP |symbol_number.176|
        EXPORTAS |symbol_number.176|, i2c1InterruptHandler
        KEEP |symbol_number.177|
        EXPORTAS |symbol_number.177|, masterConfig
        KEEP |symbol_number.178|
        EXPORTAS |symbol_number.178|, slaveConfig
        KEEP |symbol_number.179|
        EXPORTAS |symbol_number.179|, sendData
        KEEP |symbol_number.185|
        EXPORTAS |symbol_number.185|, i2c1InterruptHandler
        KEEP |symbol_number.186|
        EXPORTAS |symbol_number.186|, i2c0InterruptHandler
        KEEP |symbol_number.187|
        EXPORTAS |symbol_number.187|, sdmac1ch0InterruptHandler
        KEEP |symbol_number.188|
        EXPORTAS |symbol_number.188|, sdmac1ch1InterruptHandler
        KEEP |symbol_number.189|
        EXPORTAS |symbol_number.189|, sendData
        KEEP |symbol_number.190|
        EXPORTAS |symbol_number.190|, masterConfig
        KEEP |symbol_number.192|
        EXPORTAS |symbol_number.192|, slaveConfig
        KEEP |symbol_number.199|
        EXPORTAS |symbol_number.199|, i2c0InterruptHandler
        KEEP |symbol_number.200|
        EXPORTAS |symbol_number.200|, i2c1InterruptHandler
        KEEP |symbol_number.201|
        EXPORTAS |symbol_number.201|, masterConfig
        KEEP |symbol_number.202|
        EXPORTAS |symbol_number.202|, slaveConfig
        KEEP |symbol_number.203|
        EXPORTAS |symbol_number.203|, sendData
        KEEP |symbol_number.209|
        EXPORTAS |symbol_number.209|, i2c0InterruptHandler
        KEEP |symbol_number.210|
        EXPORTAS |symbol_number.210|, i2c1InterruptHandler
        KEEP |symbol_number.211|
        EXPORTAS |symbol_number.211|, masterConfig
        KEEP |symbol_number.212|
        EXPORTAS |symbol_number.212|, slaveConfig
        KEEP |symbol_number.213|
        EXPORTAS |symbol_number.213|, sendData
        KEEP |symbol_number.220|
        EXPORTAS |symbol_number.220|, i2c0InterruptHandler
        KEEP |symbol_number.221|
        EXPORTAS |symbol_number.221|, i2c1InterruptHandler
        KEEP |symbol_number.222|
        EXPORTAS |symbol_number.222|, masterConfig
        KEEP |symbol_number.223|
        EXPORTAS |symbol_number.223|, slaveConfig
        KEEP |symbol_number.224|
        EXPORTAS |symbol_number.224|, sendData
        KEEP |symbol_number.230|
        EXPORTAS |symbol_number.230|, i2c0InterruptHandler
        KEEP |symbol_number.231|
        EXPORTAS |symbol_number.231|, i2c1InterruptHandler
        KEEP |symbol_number.232|
        EXPORTAS |symbol_number.232|, masterConfig
        KEEP |symbol_number.233|
        EXPORTAS |symbol_number.233|, slaveConfig
        KEEP |symbol_number.234|
        EXPORTAS |symbol_number.234|, sendData
        KEEP |symbol_number.240|
        EXPORTAS |symbol_number.240|, i2c0InterruptHandler
        KEEP |symbol_number.241|
        EXPORTAS |symbol_number.241|, i2c1InterruptHandler
        KEEP |symbol_number.242|
        EXPORTAS |symbol_number.242|, masterConfig
        KEEP |symbol_number.243|
        EXPORTAS |symbol_number.243|, slaveConfig
        KEEP |symbol_number.244|
        EXPORTAS |symbol_number.244|, sendData
        KEEP |symbol_number.250|
        EXPORTAS |symbol_number.250|, i2c0InterruptHandler
        KEEP |symbol_number.251|
        EXPORTAS |symbol_number.251|, i2c1InterruptHandler
        KEEP masterConfig0
        KEEP slaveConfig0
        KEEP masterConfig1
        KEEP |symbol_number.255|
        EXPORTAS |symbol_number.255|, sendData
        KEEP |symbol_number.264|
        EXPORTAS |symbol_number.264|, i2c0InterruptHandler
        KEEP |symbol_number.265|
        EXPORTAS |symbol_number.265|, i2c1InterruptHandler
        KEEP |symbol_number.266|
        EXPORTAS |symbol_number.266|, masterConfig
        KEEP |symbol_number.267|
        EXPORTAS |symbol_number.267|, slaveConfig
        KEEP |symbol_number.268|
        EXPORTAS |symbol_number.268|, sendData
        KEEP |symbol_number.274|
        EXPORTAS |symbol_number.274|, i2c0InterruptHandler
        KEEP |symbol_number.275|
        EXPORTAS |symbol_number.275|, i2c1InterruptHandler
        KEEP |symbol_number.276|
        EXPORTAS |symbol_number.276|, masterConfig
        KEEP |symbol_number.277|
        EXPORTAS |symbol_number.277|, slaveConfig
        KEEP |symbol_number.278|
        EXPORTAS |symbol_number.278|, sendData
        KEEP |symbol_number.284|
        EXPORTAS |symbol_number.284|, i2c0InterruptHandler
        KEEP |symbol_number.285|
        EXPORTAS |symbol_number.285|, i2c1InterruptHandler
        KEEP |symbol_number.286|
        EXPORTAS |symbol_number.286|, masterConfig
        KEEP |symbol_number.287|
        EXPORTAS |symbol_number.287|, slaveConfig
        KEEP |symbol_number.288|
        EXPORTAS |symbol_number.288|, sendData
        KEEP |symbol_number.295|
        EXPORTAS |symbol_number.295|, i2c0InterruptHandler
        KEEP |symbol_number.296|
        EXPORTAS |symbol_number.296|, i2c1InterruptHandler
        KEEP |symbol_number.297|
        EXPORTAS |symbol_number.297|, masterConfig
        KEEP |symbol_number.298|
        EXPORTAS |symbol_number.298|, slaveConfig
        KEEP |symbol_number.299|
        EXPORTAS |symbol_number.299|, sendData
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
        KEEP __lit__00000000
        KEEP sendDataIndex
        KEEP receivedDataIndex
        KEEP isTransferComplete
        KEEP receivedData
        KEEP |symbol_number.49|
        EXPORTAS |symbol_number.49|, receivedData
        KEEP currentDataPackageIndex
        KEEP |symbol_number.52|
        EXPORTAS |symbol_number.52|, isTransferComplete
        KEEP isAutoTXStarted
        KEEP isAutoTXComplete
        KEEP isAutoRXComplete
        KEEP isAutoRXStarted
        KEEP |symbol_number.63|
        EXPORTAS |symbol_number.63|, sendDataIndex
        KEEP |symbol_number.64|
        EXPORTAS |symbol_number.64|, isTransferComplete
        KEEP |symbol_number.65|
        EXPORTAS |symbol_number.65|, receivedData
        KEEP |symbol_number.66|
        EXPORTAS |symbol_number.66|, receivedDataIndex
        KEEP |symbol_number.74|
        EXPORTAS |symbol_number.74|, sendDataIndex
        KEEP |symbol_number.75|
        EXPORTAS |symbol_number.75|, isTransferComplete
        KEEP |symbol_number.76|
        EXPORTAS |symbol_number.76|, receivedData
        KEEP |symbol_number.77|
        EXPORTAS |symbol_number.77|, receivedDataIndex
        KEEP |symbol_number.85|
        EXPORTAS |symbol_number.85|, sendDataIndex
        KEEP |symbol_number.86|
        EXPORTAS |symbol_number.86|, isTransferComplete
        KEEP |symbol_number.87|
        EXPORTAS |symbol_number.87|, receivedData
        KEEP |symbol_number.88|
        EXPORTAS |symbol_number.88|, receivedDataIndex
        KEEP |symbol_number.95|
        EXPORTAS |symbol_number.95|, sendDataIndex
        KEEP |symbol_number.96|
        EXPORTAS |symbol_number.96|, isTransferComplete
        KEEP |symbol_number.97|
        EXPORTAS |symbol_number.97|, receivedData
        KEEP |symbol_number.98|
        EXPORTAS |symbol_number.98|, receivedDataIndex
        KEEP |symbol_number.104|
        EXPORTAS |symbol_number.104|, receivedData
        KEEP |symbol_number.108|
        EXPORTAS |symbol_number.108|, isTransferComplete
        KEEP |symbol_number.109|
        EXPORTAS |symbol_number.109|, isAutoRXStarted
        KEEP |symbol_number.110|
        EXPORTAS |symbol_number.110|, isAutoTXComplete
        KEEP |symbol_number.111|
        EXPORTAS |symbol_number.111|, isAutoRXComplete
        KEEP |symbol_number.112|
        EXPORTAS |symbol_number.112|, isAutoTXStarted
        KEEP |symbol_number.119|
        EXPORTAS |symbol_number.119|, sendDataIndex
        KEEP |symbol_number.120|
        EXPORTAS |symbol_number.120|, isTransferComplete
        KEEP |symbol_number.121|
        EXPORTAS |symbol_number.121|, receivedData
        KEEP |symbol_number.122|
        EXPORTAS |symbol_number.122|, receivedDataIndex
        KEEP |symbol_number.130|
        EXPORTAS |symbol_number.130|, sendDataIndex
        KEEP |symbol_number.131|
        EXPORTAS |symbol_number.131|, isTransferComplete
        KEEP |symbol_number.132|
        EXPORTAS |symbol_number.132|, receivedData
        KEEP |symbol_number.133|
        EXPORTAS |symbol_number.133|, receivedDataIndex
        KEEP |symbol_number.139|
        EXPORTAS |symbol_number.139|, receivedData
        KEEP |symbol_number.142|
        EXPORTAS |symbol_number.142|, currentDataPackageIndex
        KEEP |symbol_number.144|
        EXPORTAS |symbol_number.144|, isTransferComplete
        KEEP |symbol_number.145|
        EXPORTAS |symbol_number.145|, isAutoRXStarted
        KEEP |symbol_number.146|
        EXPORTAS |symbol_number.146|, isAutoTXComplete
        KEEP |symbol_number.147|
        EXPORTAS |symbol_number.147|, isAutoRXComplete
        KEEP |symbol_number.148|
        EXPORTAS |symbol_number.148|, isAutoTXStarted
        KEEP |symbol_number.155|
        EXPORTAS |symbol_number.155|, sendDataIndex
        KEEP |symbol_number.156|
        EXPORTAS |symbol_number.156|, isTransferComplete
        KEEP |symbol_number.157|
        EXPORTAS |symbol_number.157|, receivedData
        KEEP |symbol_number.158|
        EXPORTAS |symbol_number.158|, receivedDataIndex
        KEEP |symbol_number.163|
        EXPORTAS |symbol_number.163|, receivedData
        KEEP |symbol_number.170|
        EXPORTAS |symbol_number.170|, sendDataIndex
        KEEP |symbol_number.171|
        EXPORTAS |symbol_number.171|, isTransferComplete
        KEEP |symbol_number.172|
        EXPORTAS |symbol_number.172|, receivedData
        KEEP |symbol_number.173|
        EXPORTAS |symbol_number.173|, receivedDataIndex
        KEEP |symbol_number.180|
        EXPORTAS |symbol_number.180|, sendDataIndex
        KEEP |symbol_number.181|
        EXPORTAS |symbol_number.181|, isTransferComplete
        KEEP |symbol_number.182|
        EXPORTAS |symbol_number.182|, receivedData
        KEEP |symbol_number.183|
        EXPORTAS |symbol_number.183|, receivedDataIndex
        KEEP |symbol_number.191|
        EXPORTAS |symbol_number.191|, receivedData
        KEEP |symbol_number.193|
        EXPORTAS |symbol_number.193|, isTransferComplete
        KEEP |symbol_number.194|
        EXPORTAS |symbol_number.194|, isAutoTXStarted
        KEEP |symbol_number.195|
        EXPORTAS |symbol_number.195|, isAutoTXComplete
        KEEP |symbol_number.196|
        EXPORTAS |symbol_number.196|, isAutoRXComplete
        KEEP |symbol_number.197|
        EXPORTAS |symbol_number.197|, isAutoRXStarted
        KEEP |symbol_number.204|
        EXPORTAS |symbol_number.204|, sendDataIndex
        KEEP |symbol_number.205|
        EXPORTAS |symbol_number.205|, isTransferComplete
        KEEP |symbol_number.206|
        EXPORTAS |symbol_number.206|, receivedData
        KEEP |symbol_number.207|
        EXPORTAS |symbol_number.207|, receivedDataIndex
        KEEP |symbol_number.214|
        EXPORTAS |symbol_number.214|, sendDataIndex
        KEEP |symbol_number.215|
        EXPORTAS |symbol_number.215|, isTransferComplete
        KEEP |symbol_number.216|
        EXPORTAS |symbol_number.216|, receivedData
        KEEP |symbol_number.217|
        EXPORTAS |symbol_number.217|, receivedDataIndex
        KEEP |symbol_number.225|
        EXPORTAS |symbol_number.225|, sendDataIndex
        KEEP |symbol_number.226|
        EXPORTAS |symbol_number.226|, isTransferComplete
        KEEP |symbol_number.227|
        EXPORTAS |symbol_number.227|, receivedData
        KEEP |symbol_number.228|
        EXPORTAS |symbol_number.228|, receivedDataIndex
        KEEP |symbol_number.235|
        EXPORTAS |symbol_number.235|, sendDataIndex
        KEEP |symbol_number.236|
        EXPORTAS |symbol_number.236|, isTransferComplete
        KEEP |symbol_number.237|
        EXPORTAS |symbol_number.237|, receivedData
        KEEP |symbol_number.238|
        EXPORTAS |symbol_number.238|, receivedDataIndex
        KEEP |symbol_number.245|
        EXPORTAS |symbol_number.245|, sendDataIndex
        KEEP |symbol_number.246|
        EXPORTAS |symbol_number.246|, isTransferComplete
        KEEP |symbol_number.247|
        EXPORTAS |symbol_number.247|, receivedData
        KEEP |symbol_number.248|
        EXPORTAS |symbol_number.248|, receivedDataIndex
        KEEP |symbol_number.256|
        EXPORTAS |symbol_number.256|, sendDataIndex
        KEEP |symbol_number.257|
        EXPORTAS |symbol_number.257|, isTransferComplete
        KEEP |symbol_number.258|
        EXPORTAS |symbol_number.258|, receivedData
        KEEP isMasterLostArbitration
        KEEP |symbol_number.260|
        EXPORTAS |symbol_number.260|, receivedDataIndex
        KEEP |symbol_number.269|
        EXPORTAS |symbol_number.269|, sendDataIndex
        KEEP |symbol_number.270|
        EXPORTAS |symbol_number.270|, isTransferComplete
        KEEP |symbol_number.271|
        EXPORTAS |symbol_number.271|, receivedData
        KEEP |symbol_number.272|
        EXPORTAS |symbol_number.272|, receivedDataIndex
        KEEP |symbol_number.279|
        EXPORTAS |symbol_number.279|, sendDataIndex
        KEEP |symbol_number.280|
        EXPORTAS |symbol_number.280|, isTransferComplete
        KEEP |symbol_number.281|
        EXPORTAS |symbol_number.281|, receivedData
        KEEP |symbol_number.282|
        EXPORTAS |symbol_number.282|, receivedDataIndex
        KEEP |symbol_number.289|
        EXPORTAS |symbol_number.289|, sendDataIndex
        KEEP |symbol_number.290|
        EXPORTAS |symbol_number.290|, isTransferComplete
        KEEP |symbol_number.291|
        EXPORTAS |symbol_number.291|, receivedData
        KEEP |symbol_number.292|
        EXPORTAS |symbol_number.292|, receivedDataIndex
        KEEP |symbol_number.300|
        EXPORTAS |symbol_number.300|, sendDataIndex
        KEEP |symbol_number.301|
        EXPORTAS |symbol_number.301|, isTransferComplete
        KEEP |symbol_number.302|
        EXPORTAS |symbol_number.302|, receivedData
        KEEP |symbol_number.303|
        EXPORTAS |symbol_number.303|, receivedDataIndex
        KEEP |symbol_number.310|
        EXPORTAS |symbol_number.310|, sendDataIndex
        KEEP |symbol_number.311|
        EXPORTAS |symbol_number.311|, isTransferComplete
        KEEP |symbol_number.312|
        EXPORTAS |symbol_number.312|, receivedData
        KEEP isStartByteTransmitted
        KEEP |symbol_number.314|
        EXPORTAS |symbol_number.314|, receivedDataIndex

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
