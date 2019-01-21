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
        DCD      0x40000904
        ENDP

||$Ven$AA$L$$SupervisorCall_Handler|| PROC
|L1.5060|
        LDR      pc,|L1.5064|
|L1.5064|
        DCD      0x400008f8
        ENDP

||$Ven$AA$L$$PrefetchAbort_Handler|| PROC
|L1.5068|
        LDR      pc,|L1.5072|
|L1.5072|
        DCD      0x400008a0
        ENDP

||$Ven$AA$L$$DataAbort_Handler|| PROC
|L1.5076|
        LDR      pc,|L1.5080|
|L1.5080|
        DCD      0x400000f8
        ENDP

||$Ven$AA$L$$IRQ_Handler|| PROC
|L1.5084|
        LDR      pc,|L1.5088|
|L1.5088|
        DCD      0x40000860
        ENDP

||$Ven$AT$L$$__rt_entry|| PROC
|L1.5092|
        LDR      pc,|L1.5096|
|L1.5096|
        DCD      0x4000007d
        ENDP

||Region$$Table$$Base||
        DCD      0x40004c58
        DCD      0x40004c58
        DCD      0x000000f8
        DCD      0x000011bc
||Region$$Table$$Limit||

        AREA ER10, CODE, READONLY, ALIGN=2

__vectors_start                  ; Alternate entry point
        B        |L2.13472|
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
        BL       |L2.2308|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.48|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.2296|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.64|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.2208|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.80|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.248|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.96|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.2144|
        POP      {r0-r3,r10-r12,lr}
        ERET     
        THUMB
__rt_lib_init                  ; Alternate entry point
|L2.112|
        PUSH     {r0-r4,lr}
__rt_lib_init_fp_1                  ; Alternate entry point
        BLX      |L2.13480|
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
        BLX      |L2.6000|
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
        BLX      |L2.2320|
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

DataAbort_Handler PROC
|L2.248|
        PUSH     {r11,lr}
        BL       |L2.2280|
|L2.256|
        B        |L2.256|
        ENDP

GIC_defaultHandler PROC
|L2.260|
        B        |L2.260|
        ENDP

GIC_enable PROC
|L2.264|
        CPSIE    i
        MOVW     r0,#0x14
        MOVT     r0,#0xf010
        MOV      r1,#0
        STR      r1,[r0,#0]
|L2.284|
        LDR      r1,[r0,#0]
        TST      r1,#6
        BNE      |L2.284|
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
|L2.336|
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
|L2.496|
        CMP      r0,#0x3c8
        BXHI     lr
        MCR      p15,#0x0,r0,c12,c12,#1
        DSB      
        BX       lr
        ENDP

GIC_executeInterruptHandler PROC
|L2.516|
        CMP      r0,#0x3c8
        BXHI     lr
        MOV      r1,#0x3cec
        MOVT     r1,#0x4000
        LDR      r0,[r1,r0,LSL #2]
        BX       r0
        ENDP

GIC_getACKID PROC
|L2.540|
        PUSH     {r4,lr}
        MRC      p15,#0x0,r4,c12,c12,#0
        DSB      
        MOV      r0,r4
        BL       |L2.496|
        MOV      r0,r4
        POP      {r4,pc}
        ENDP

GIC_setInterruptHandler PROC
|L2.568|
        CMP      r0,#0x3c8
        BXHI     lr
        MOV      r2,#0x3cec
        MOVT     r2,#0x4000
        STR      r1,[r2,r0,LSL #2]
        BX       lr
        ENDP

I2C_configPins PROC
|L2.592|
        MOVW     r0,#0x800
        MOVT     r0,#0xe605
        ADD      r1,r0,#0x100
        MOV      r2,#0xfffc
        B        |L2.2184|
        ENDP

I2C_masterClearInterruptStatus PROC
|L2.612|
        LDR      r2,[r0,#0xc]
        BIC      r1,r2,r1
        STR      r1,[r0,#0xc]
        BX       lr
        ENDP

I2C_masterDisable PROC
|L2.628|
        LDR      r1,[r0,#4]
        BIC      r1,r1,#8
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterDisableDMAReceive PROC
|L2.644|
        LDR      r1,[r0,#0x3c]
        BIC      r1,r1,#2
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterDisableDMATransmit PROC
|L2.660|
        LDR      r1,[r0,#0x3c]
        BIC      r1,r1,#1
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterDisableStartGeneration PROC
|L2.676|
        LDR      r1,[r0,#4]
        BIC      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterEnable PROC
|L2.692|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#8
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterEnableDMAReceive PROC
|L2.708|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#2
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterEnableDMATransmit PROC
|L2.724|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#1
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_masterEnableInterrupt PROC
|L2.740|
        LDR      r2,[r0,#0x14]
        ORR      r1,r2,r1
        STR      r1,[r0,#0x14]
        BX       lr
        ENDP

I2C_masterGetInterruptStatus PROC
|L2.756|
        LDR      r0,[r0,#0xc]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_masterInit PROC
|L2.768|
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
        MOV      r12,#0x34b4
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
|L2.1220|
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_masterReceiveMultipleByteNext PROC
|L2.1232|
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_masterReceiveMultipleByteStop PROC
|L2.1244|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#2
        STR      r1,[r0,#4]
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_masterReceiveStart PROC
|L2.1268|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterSendMultipleByteNext PROC
|L2.1284|
        STR      r1,[r0,#0x24]
        BX       lr
        ENDP

I2C_masterSendMultipleByteStart PROC
|L2.1292|
        STR      r1,[r0,#0x24]
        LDR      r1,[r0,#4]
        ORR      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterSendMultipleByteStop PROC
|L2.1312|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#2
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_modelConnect PROC
|L2.1328|
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
        BL       |L2.2220|
        POP      {r0,r1,r10}
        POP      {r11,pc}
        ENDP

I2C_modelDisable PROC
|L2.1380|
        PUSH     {r11,lr}
        PUSH     {r10}
        MOV      r10,#0
        MOVT     r10,#0xa55a
        MOV      r0,#0x14
        BL       |L2.2220|
        POP      {r10}
        POP      {r11,pc}
        ENDP

I2C_releasePins PROC
|L2.1412|
        MOVW     r0,#0x800
        MOVT     r0,#0xe605
        ADD      r1,r0,#0x100
        MOV      r2,#0xfffc
        B        |L2.2160|
        ENDP

I2C_reset PROC
|L2.1432|
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
|L2.1480|
        LDR      r2,[r0,#8]
        BIC      r1,r2,r1
        STR      r1,[r0,#8]
        BX       lr
        ENDP

I2C_slaveDisable PROC
|L2.1496|
        LDR      r1,[r0,#0]
        BIC      r1,r1,#4
        STR      r1,[r0,#0]
        BX       lr
        ENDP

I2C_slaveDisableDMAReceive PROC
|L2.1512|
        LDR      r1,[r0,#0x3c]
        BIC      r1,r1,#8
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_slaveDisableDMATransmit PROC
|L2.1528|
        LDR      r1,[r0,#0x3c]
        BIC      r1,r1,#4
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_slaveEnable PROC
|L2.1544|
        LDR      r1,[r0,#0]
        ORR      r1,r1,#4
        STR      r1,[r0,#0]
        BX       lr
        ENDP

I2C_slaveEnableDMAReceive PROC
|L2.1560|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#8
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_slaveEnableDMATransmit PROC
|L2.1576|
        LDR      r1,[r0,#0x3c]
        ORR      r1,r1,#4
        STR      r1,[r0,#0x3c]
        BX       lr
        ENDP

I2C_slaveEnableInterrupt PROC
|L2.1592|
        LDR      r2,[r0,#0x10]
        ORR      r1,r2,r1
        STR      r1,[r0,#0x10]
        BX       lr
        ENDP

I2C_slaveGetInterruptStatus PROC
|L2.1608|
        LDR      r0,[r0,#8]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_slaveInit PROC
|L2.1620|
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
        MOV      r12,#0x34b4
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
|L2.2088|
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_slaveReceiveMultipleByteNext PROC
|L2.2100|
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_slaveReceiveMultipleByteStop PROC
|L2.2112|
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_slaveSetData PROC
|L2.2136|
        STR      r1,[r0,#0x24]
        BX       lr
        ENDP

IRQ_Handler PROC
|L2.2144|
        PUSH     {r11,lr}
        BL       |L2.540|
        POP      {r11,lr}
        B        |L2.516|
        ENDP

PFC_ClearMultipleBit PROC
|L2.2160|
        LDR      r3,[r1,#0]
        BIC      r2,r3,r2
        MVN      r3,r2
        STR      r3,[r0,#0]
        STR      r2,[r1,#0]
        BX       lr
        ENDP

PFC_SetMultipleBit PROC
|L2.2184|
        LDR      r3,[r1,#0]
        ORR      r2,r3,r2
        MVN      r3,r2
        STR      r3,[r0,#0]
        STR      r2,[r1,#0]
        BX       lr
        ENDP

PrefetchAbort_Handler PROC
|L2.2208|
        PUSH     {r11,lr}
        BL       |L2.2280|
|L2.2216|
        B        |L2.2216|
        ENDP

Sim_Delay PROC
|L2.2220|
        CMP      r0,#0
        BXEQ     lr
|L2.2228|
        SUBS     r0,r0,#1
        BNE      |L2.2228|
        BX       lr
        ENDP

Sim_Dump PROC
|L2.2240|
        MOV      r1,#0x4c58
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
|L2.2280|
        MOV      r0,#0x7f00000
        MOV      r1,#0
        STR      r1,[r0,#0]
        BX       lr
        ENDP

SupervisorCall_Handler PROC
|L2.2296|
        PUSH     {r11,lr}
        BL       |L2.2280|
|L2.2304|
        B        |L2.2304|
        ENDP

UndefinedInstruction_Handler PROC
|L2.2308|
        PUSH     {r11,lr}
        BL       |L2.2280|
|L2.2316|
        B        |L2.2316|
        ENDP

_sys_exit PROC
|L2.2320|
        B        |L2.2320|
        ENDP

i2c0InterruptHandler PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1608|
        MOV      r5,r0
        TST      r5,#8
        BEQ      |L2.2408|
        MOV      r0,#0x4d20
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        CMP      r1,#1
        BHI      |L2.2408|
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x3914
        MOVT     r0,#0x4000
        LDRB     r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.2136|
|L2.2408|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1480|
        ENDP

|symbol_number.52| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1608|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.2496|
        MOV      r0,r4
        BL       |L2.2100|
        MOV      r1,#0x4cf8
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r3,r2,#1
        STR      r3,[r1,#0]
        MOV      r1,#0x4c84
        MOVT     r1,#0x4000
        STR      r0,[r1,r2,LSL #2]
|L2.2496|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1480|
        ENDP

|symbol_number.67| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1608|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.2624|
        MOV      r6,#0x4cfc
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.2592|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.2624|
        MOV      r0,r4
        BL       |L2.2088|
        B        |L2.2600|
|L2.2592|
        MOV      r0,r4
        BL       |L2.2112|
|L2.2600|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x4c94
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.2624|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1480|
        ENDP

|symbol_number.78| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1608|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.2712|
        MOV      r0,r4
        BL       |L2.2100|
        MOVW     r1,#0x4d00
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r3,r2,#1
        STR      r3,[r1,#0]
        MOV      r1,#0x4c9c
        MOVT     r1,#0x4000
        STR      r0,[r1,r2,LSL #2]
|L2.2712|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1480|
        ENDP

|symbol_number.95| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1608|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.2800|
        MOV      r0,r4
        BL       |L2.2100|
        MOV      r1,#0x4d04
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r3,r2,#1
        STR      r3,[r1,#0]
        MOV      r1,#0x4cac
        MOVT     r1,#0x4000
        STR      r0,[r1,r2,LSL #2]
|L2.2800|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1480|
        ENDP

|symbol_number.104| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1608|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.2928|
        MOV      r6,#0x4d08
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.2896|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.2928|
        MOV      r0,r4
        BL       |L2.2088|
        B        |L2.2904|
|L2.2896|
        MOV      r0,r4
        BL       |L2.2112|
|L2.2904|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x4cb0
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.2928|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1480|
        ENDP

|symbol_number.117| PROC
        PUSH     {r4,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1608|
        MOV      r1,r0
        MOV      r0,r4
        POP      {r4,lr}
        B        |L2.1480|
        ENDP

|symbol_number.124| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1608|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.3048|
        MOV      r6,#0x4c5e
        MOVT     r6,#0x4000
        LDRB     r0,[r6,#0]
        CMP      r0,#0
        BNE      |L2.3048|
        MOV      r0,r4
        BL       |L2.1560|
        MOV      r0,#1
        STRB     r0,[r6,#0]
|L2.3048|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1480|
        ENDP

|symbol_number.143| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1608|
        MOV      r5,r0
        TST      r5,#8
        BEQ      |L2.3148|
        MOV      r0,#0x4d3c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        CMP      r1,#1
        BHI      |L2.3148|
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x395c
        MOVT     r0,#0x4000
        LDRB     r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.2136|
|L2.3148|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1480|
        ENDP

|symbol_number.153| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1608|
        MOV      r5,r0
        TST      r5,#8
        BEQ      |L2.3240|
        MOV      r0,#0x4d40
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        CMP      r1,#0
        BNE      |L2.3240|
        LDR      r1,[r0,#0]
        ADD      r1,r1,#1
        STR      r1,[r0,#0]
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.2136|
|L2.3240|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1480|
        ENDP

|symbol_number.162| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1608|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.3328|
        MOV      r0,r4
        BL       |L2.2100|
        MOV      r1,#0x4d14
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r3,r2,#1
        STR      r3,[r1,#0]
        MOV      r1,#0x4cd4
        MOVT     r1,#0x4000
        STR      r0,[r1,r2,LSL #2]
|L2.3328|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1480|
        ENDP

|symbol_number.172| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1608|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.3456|
        MOV      r6,#0x4d18
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.3424|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.3456|
        MOV      r0,r4
        BL       |L2.2088|
        B        |L2.3432|
|L2.3424|
        MOV      r0,r4
        BL       |L2.2112|
|L2.3432|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x4cdc
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.3456|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1480|
        ENDP

|symbol_number.184| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1608|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.3544|
        MOV      r0,r4
        BL       |L2.2100|
        MOV      r1,#0x4d1c
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        ADD      r3,r2,#1
        STR      r3,[r1,#0]
        MOV      r1,#0x4ce4
        MOVT     r1,#0x4000
        STR      r0,[r1,r2,LSL #2]
|L2.3544|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.1480|
        ENDP

|symbol_number.196| PROC
        PUSH     {r4-r7,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1608|
        MOV      r5,r0
        TST      r5,#8
        BEQ      |L2.3640|
        MOV      r6,#0x4c63
        MOVT     r6,#0x4000
        LDRB     r0,[r6,#0]
        CMP      r0,#0
        BNE      |L2.3640|
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r7,#1
        STR      r7,[r0,#0]
        MOV      r0,r4
        BL       |L2.1576|
        STRB     r7,[r6,#0]
|L2.3640|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r7,r11,lr}
        B        |L2.1480|
        ENDP

i2c1InterruptHandler PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.756|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.3740|
        TST      r5,#2
        BEQ      |L2.3816|
        MOV      r6,#0x4cf4
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.3760|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.3772|
        MOV      r0,r4
        BL       |L2.1244|
        B        |L2.3792|
|L2.3740|
        MOV      r0,r4
        BL       |L2.676|
        TST      r5,#0x10
        BNE      |L2.3824|
        B        |L2.3840|
|L2.3760|
        MOV      r0,r4
        BL       |L2.1232|
        B        |L2.3792|
|L2.3772|
        LDR      r0,[r6,#0]
        CMP      r0,#2
        BNE      |L2.3816|
        MOV      r0,r4
        BL       |L2.1220|
|L2.3792|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x4c74
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.3816|
        TST      r5,#0x10
        BEQ      |L2.3840|
|L2.3824|
        MOV      r0,#0x4c64
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.3840|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.612|
        ENDP

|symbol_number.53| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.756|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.3960|
        TST      r5,#8
        BEQ      |L2.3968|
        MOV      r1,#0x4d24
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        LDR      r0,[r1,#0]
        CMP      r2,#1
        BHI      |L2.4008|
        ADD      r2,r0,#1
        STR      r2,[r1,#0]
        MOV      r1,#0x3924
        MOVT     r1,#0x4000
        LDR      r1,[r1,r0,LSL #2]
        MOV      r0,r4
        BL       |L2.1284|
        TST      r5,#0x10
        BNE      |L2.3976|
        B        |L2.3992|
|L2.3960|
        MOV      r0,r4
        BL       |L2.676|
|L2.3968|
        TST      r5,#0x10
        BEQ      |L2.3992|
|L2.3976|
        MOV      r0,#0x4c65
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.3992|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.612|
|L2.4008|
        CMP      r0,#2
        BNE      |L2.3968|
        MOV      r0,r4
        BL       |L2.1312|
        TST      r5,#0x10
        BNE      |L2.3976|
        B        |L2.3992|
        ENDP

|symbol_number.68| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.756|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4128|
        TST      r5,#8
        BEQ      |L2.4136|
        MOV      r0,#0x4d28
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x3934
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1284|
        TST      r5,#0x10
        BNE      |L2.4144|
        B        |L2.4160|
|L2.4128|
        MOV      r0,r4
        BL       |L2.676|
|L2.4136|
        TST      r5,#0x10
        BEQ      |L2.4160|
|L2.4144|
        MOV      r0,#0x4c66
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.4160|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.612|
        ENDP

|symbol_number.79| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.756|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4280|
        TST      r5,#8
        BEQ      |L2.4288|
        MOV      r1,#0x4d2c
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        LDR      r0,[r1,#0]
        CMP      r2,#1
        BHI      |L2.4328|
        ADD      r2,r0,#1
        STR      r2,[r1,#0]
        MOV      r1,#0x393c
        MOVT     r1,#0x4000
        LDR      r1,[r1,r0,LSL #2]
        MOV      r0,r4
        BL       |L2.1284|
        TST      r5,#0x10
        BNE      |L2.4296|
        B        |L2.4312|
|L2.4280|
        MOV      r0,r4
        BL       |L2.676|
|L2.4288|
        TST      r5,#0x10
        BEQ      |L2.4312|
|L2.4296|
        MOV      r0,#0x4c67
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.4312|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.612|
|L2.4328|
        CMP      r0,#2
        BNE      |L2.4288|
        MOV      r0,r4
        BL       |L2.1312|
        TST      r5,#0x10
        BNE      |L2.4296|
        B        |L2.4312|
        ENDP

|symbol_number.96| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.756|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4448|
        TST      r5,#8
        BEQ      |L2.4456|
        MOV      r0,#0x4d30
        MOVT     r0,#0x4000
        LDR      r2,[r0,#0]
        LDR      r1,[r0,#0]
        CMP      r2,#0
        BEQ      |L2.4496|
        CMP      r1,#1
        BNE      |L2.4456|
        MOV      r0,r4
        BL       |L2.1312|
        TST      r5,#0x10
        BNE      |L2.4464|
        B        |L2.4480|
|L2.4448|
        MOV      r0,r4
        BL       |L2.676|
|L2.4456|
        TST      r5,#0x10
        BEQ      |L2.4480|
|L2.4464|
        MOV      r0,#0x4c68
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.4480|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.612|
|L2.4496|
        ADD      r1,r1,#1
        STR      r1,[r0,#0]
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.1284|
        TST      r5,#0x10
        BNE      |L2.4464|
        B        |L2.4480|
        ENDP

|symbol_number.105| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.756|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4620|
        TST      r5,#8
        BEQ      |L2.4628|
        MOV      r0,#0x4d34
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x394c
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1284|
        TST      r5,#0x10
        BNE      |L2.4636|
        B        |L2.4652|
|L2.4620|
        MOV      r0,r4
        BL       |L2.676|
|L2.4628|
        TST      r5,#0x10
        BEQ      |L2.4652|
|L2.4636|
        MOV      r0,#0x4c69
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.4652|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.612|
        ENDP

|symbol_number.118| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.756|
        MOV      r5,r0
        TST      r5,#1
        BEQ      |L2.4708|
        MOV      r0,r4
        BL       |L2.676|
|L2.4708|
        TST      r5,#0x10
        BEQ      |L2.4732|
        MOV      r0,#0x4c6a
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.4732|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.612|
        ENDP

|symbol_number.125| PROC
        PUSH     {r4-r7,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.756|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.4828|
        TST      r5,#8
        BEQ      |L2.4836|
        MOV      r6,#0x4c62
        MOVT     r6,#0x4000
        LDRB     r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.4900|
        MOV      r0,r4
        BL       |L2.1312|
        TST      r5,#0x10
        BNE      |L2.4844|
        B        |L2.4884|
|L2.4828|
        MOV      r0,r4
        BL       |L2.676|
|L2.4836|
        TST      r5,#0x10
        BEQ      |L2.4884|
|L2.4844|
        MOV      r0,#0x4c60
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        MOV      r1,#0x4c5c
        MOVT     r1,#0x4000
        LDRB     r1,[r1,#0]
        AND      r0,r1,r0
        MOV      r1,#0x4c6b
        MOVT     r1,#0x4000
        STRB     r0,[r1,#0]
|L2.4884|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r7,r11,lr}
        B        |L2.612|
|L2.4900|
        MOVW     r0,#0x60
        MOVT     r0,#0xe735
        MOV      r7,#1
        STR      r7,[r0,#0]
        MOV      r0,r4
        BL       |L2.724|
        STRB     r7,[r6,#0]
        TST      r5,#0x10
        BNE      |L2.4844|
        B        |L2.4884|
        ENDP

|symbol_number.144| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.756|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5024|
        TST      r5,#2
        BEQ      |L2.5100|
        MOV      r6,#0x4d0c
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.5044|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.5056|
        MOV      r0,r4
        BL       |L2.1244|
        B        |L2.5076|
|L2.5024|
        MOV      r0,r4
        BL       |L2.676|
        TST      r5,#0x10
        BNE      |L2.5108|
        B        |L2.5124|
|L2.5044|
        MOV      r0,r4
        BL       |L2.1232|
        B        |L2.5076|
|L2.5056|
        LDR      r0,[r6,#0]
        CMP      r0,#2
        BNE      |L2.5100|
        MOV      r0,r4
        BL       |L2.1220|
|L2.5076|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x4cc8
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.5100|
        TST      r5,#0x10
        BEQ      |L2.5124|
|L2.5108|
        MOV      r0,#0x4c6c
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.5124|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.612|
        ENDP

|symbol_number.154| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.756|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5228|
        TST      r5,#2
        BEQ      |L2.5236|
        MOV      r6,#0x4d10
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.5276|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.5236|
        MOV      r0,r4
        BL       |L2.1220|
        B        |L2.5284|
|L2.5228|
        MOV      r0,r4
        BL       |L2.676|
|L2.5236|
        TST      r5,#0x10
        BEQ      |L2.5260|
|L2.5244|
        MOV      r0,#0x4c6d
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.5260|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.612|
|L2.5276|
        MOV      r0,r4
        BL       |L2.1244|
|L2.5284|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x4cd0
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
        TST      r5,#0x10
        BNE      |L2.5244|
        B        |L2.5260|
        ENDP

|symbol_number.163| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.756|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5424|
        TST      r5,#8
        BEQ      |L2.5432|
        MOV      r1,#0x4d44
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        LDR      r0,[r1,#0]
        CMP      r2,#1
        BHI      |L2.5472|
        ADD      r2,r0,#1
        STR      r2,[r1,#0]
        MOV      r1,#0x3964
        MOVT     r1,#0x4000
        LDR      r1,[r1,r0,LSL #2]
        MOV      r0,r4
        BL       |L2.1284|
        TST      r5,#0x10
        BNE      |L2.5440|
        B        |L2.5456|
|L2.5424|
        MOV      r0,r4
        BL       |L2.676|
|L2.5432|
        TST      r5,#0x10
        BEQ      |L2.5456|
|L2.5440|
        MOV      r0,#0x4c6e
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.5456|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.612|
|L2.5472|
        CMP      r0,#2
        BNE      |L2.5432|
        MOV      r0,r4
        BL       |L2.1312|
        TST      r5,#0x10
        BNE      |L2.5440|
        B        |L2.5456|
        ENDP

|symbol_number.173| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.756|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5592|
        TST      r5,#8
        BEQ      |L2.5600|
        MOV      r0,#0x4d48
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x396c
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1284|
        TST      r5,#0x10
        BNE      |L2.5608|
        B        |L2.5624|
|L2.5592|
        MOV      r0,r4
        BL       |L2.676|
|L2.5600|
        TST      r5,#0x10
        BEQ      |L2.5624|
|L2.5608|
        MOV      r0,#0x4c6f
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.5624|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.612|
        ENDP

|symbol_number.185| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.756|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5744|
        TST      r5,#8
        BEQ      |L2.5752|
        MOV      r1,#0x4d4c
        MOVT     r1,#0x4000
        LDR      r2,[r1,#0]
        LDR      r0,[r1,#0]
        CMP      r2,#1
        BHI      |L2.5792|
        ADD      r2,r0,#1
        STR      r2,[r1,#0]
        MOV      r1,#0x3974
        MOVT     r1,#0x4000
        LDR      r1,[r1,r0,LSL #2]
        MOV      r0,r4
        BL       |L2.1284|
        TST      r5,#0x10
        BNE      |L2.5760|
        B        |L2.5776|
|L2.5744|
        MOV      r0,r4
        BL       |L2.676|
|L2.5752|
        TST      r5,#0x10
        BEQ      |L2.5776|
|L2.5760|
        MOV      r0,#0x4c70
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.5776|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.612|
|L2.5792|
        CMP      r0,#2
        BNE      |L2.5752|
        MOV      r0,r4
        BL       |L2.1312|
        TST      r5,#0x10
        BNE      |L2.5760|
        B        |L2.5776|
        ENDP

|symbol_number.197| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.756|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.5900|
        TST      r5,#2
        BEQ      |L2.5908|
        MOV      r6,#0x4c5f
        MOVT     r6,#0x4000
        LDRB     r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.5972|
        MOV      r0,r4
        BL       |L2.1312|
        TST      r5,#0x10
        BNE      |L2.5916|
        B        |L2.5956|
|L2.5900|
        MOV      r0,r4
        BL       |L2.676|
|L2.5908|
        TST      r5,#0x10
        BEQ      |L2.5956|
|L2.5916|
        MOV      r0,#0x4c61
        MOVT     r0,#0x4000
        LDRB     r0,[r0,#0]
        MOV      r1,#0x4c5d
        MOVT     r1,#0x4000
        LDRB     r1,[r1,#0]
        AND      r0,r1,r0
        MOV      r1,#0x4c71
        MOVT     r1,#0x4000
        STRB     r0,[r1,#0]
|L2.5956|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.612|
|L2.5972|
        MOV      r0,r4
        BL       |L2.708|
        MOV      r0,#1
        STRB     r0,[r6,#0]
        TST      r5,#0x10
        BNE      |L2.5916|
        B        |L2.5956|
        ENDP

main PROC
|L2.6000|
        PUSH     {r4-r6,lr}
        SUB      sp,sp,#0x48
        BL       |L2.592|
        MOV      r5,#0
        MOV      r6,#0x4c10
        MOVT     r6,#0x4000
        MOV      r4,sp
|L2.6028|
        BL       |L2.1432|
        MOV      r0,#0x64
        BL       |L2.2220|
        MOV      r0,#0
        MOV      r1,#1
        BL       |L2.1328|
        LDR      r0,[r6,r5,LSL #2]
        BLX      r0
        STR      r0,[r4,r5,LSL #2]
        CMP      r0,#1
        BEQ      |L2.6096|
        ADD      r5,r5,#1
        CMP      r5,#0x11
        BLS      |L2.6028|
        BL       |L2.1380|
        BL       |L2.1412|
        B        |L2.6140|
|L2.6096|
        BL       |L2.1380|
        BL       |L2.1412|
        MOV      r0,#0
|L2.6108|
        LDR      r1,[r4,r0,LSL #2]
        CMP      r1,#1
        BEQ      |L2.6136|
        ADD      r0,r0,#1
        CMP      r0,#0x12
        BCC      |L2.6108|
        B        |L2.6140|
|L2.6136|
        BL       |L2.2240|
|L2.6140|
        BL       |L2.2280|
|L2.6144|
        B        |L2.6144|
        ENDP

renesas_slave_rx PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        ADD      r5,r4,#0x8000
        MOV      r1,#0x39f4
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.768|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r5
        MOV      r1,#0x19
        BL       |L2.740|
        MOV      r0,r5
        BL       |L2.692|
        MOV      r1,#0x3bb4
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.1620|
        LDR      r0,[r4,#0]
        BIC      r0,r0,#8
        STR      r0,[r4,#0]
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r4
        MOV      r1,#0x13
        BL       |L2.1592|
        MOV      r0,r4
        BL       |L2.1544|
        BL       |L2.264|
        MOVW     r1,#0xa50
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.568|
        MOV      r1,#0x1050
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.568|
        MOVW     r0,#0x10e
        BL       |L2.336|
        MOV      r0,#0x10f
        BL       |L2.336|
        MOV      r0,#0x4d2c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x393c
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r5
        BL       |L2.1292|
        MOV      r0,#0x4c67
        MOVT     r0,#0x4000
|L2.6372|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.6372|
        MOV      r0,r5
        BL       |L2.628|
        MOV      r0,r4
        BL       |L2.1496|
        MOV      r1,#0
        MOV      r0,#0x4c9c
        MOVT     r0,#0x4000
|L2.6412|
        LDR      r2,[r6,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.6452|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.6412|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.6452|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

renesas_slave_rx_delay PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#4
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x3994
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.768|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r4
        BL       |L2.692|
        SUB      r10,r4,#0x8000
        MOV      r1,#0x3b54
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1620|
        MOVW     r0,#0x8000
        MOVT     r0,#0xffff
        LDR      r1,[r4,r0]
        BIC      r1,r1,#8
        STR      r1,[r4,r0]
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r10
        BL       |L2.1544|
        MOV      r0,r4
        MOV      r1,#0xaa
        BL       |L2.1292|
        MOV      r6,#0x8008
        MOVT     r6,#0xffff
|L2.6592|
        LDR      r0,[r4,r6]
        TST      r0,#1
        BEQ      |L2.6592|
        MOV      r0,r10
        MOV      r1,#1
        BL       |L2.1480|
        MOV      r7,#0x800c
        MOVT     r7,#0xe650
|L2.6624|
        LDR      r0,[r7,#0]
        TST      r0,#1
        BEQ      |L2.6624|
        MOV      r0,r4
        BL       |L2.676|
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.612|
        MOV      r5,#1
        MOV      r8,#0x391c
        MOVT     r8,#0x4000
        MOV      r9,#0x4c7c
        MOVT     r9,#0x4000
|L2.6676|
        LDR      r0,[r7,#0]
        TST      r0,#8
        BEQ      |L2.6676|
        CMP      r5,#1
        BHI      |L2.6712|
        LDR      r1,[r8,r5,LSL #2]
        MOV      r0,r4
        BL       |L2.1284|
        B        |L2.6728|
|L2.6712|
        CMP      r5,#2
        BNE      |L2.6728|
        MOV      r0,r4
        BL       |L2.1312|
|L2.6728|
        MOV      r0,r4
        MOV      r1,#8
        BL       |L2.612|
|L2.6740|
        LDR      r0,[r7,#0]
        TST      r0,#4
        BEQ      |L2.6740|
        MOV      r0,r4
        MOV      r1,#4
        BL       |L2.612|
|L2.6764|
        LDR      r0,[r4,r6]
        TST      r0,#2
        BEQ      |L2.6764|
        ADD      r11,r9,r5,LSL #2
        MOV      r0,r10
        BL       |L2.2100|
        STR      r0,[r11,#-4]
        MOV      r0,#0x320
        BL       |L2.2220|
        MOV      r0,r10
        MOV      r1,#2
        BL       |L2.1480|
        ADD      r5,r5,#1
        CMP      r5,#3
        BNE      |L2.6676|
|L2.6824|
        LDR      r0,[r4,r6]
        TST      r0,#0x10
        BEQ      |L2.6824|
        MOV      r0,r10
        MOV      r1,#0x10
        BL       |L2.1480|
|L2.6848|
        LDR      r0,[r7,#0]
        TST      r0,#0x10
        BEQ      |L2.6848|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.612|
        MOV      r0,r4
        BL       |L2.628|
        MOV      r0,r10
        BL       |L2.1496|
        MOV      r0,#0
|L2.6892|
        LDR      r1,[r8,r0,LSL #2]
        LDR      r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.6936|
        ADD      r1,r0,#1
        MOV      r0,#1
        CMP      r1,#1
        BLS      |L2.6892|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.6936|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

renesas_slave_rx_fna PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        ADD      r5,r4,#0x8000
        MOV      r1,#0x3a3c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.768|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r5
        MOV      r1,#0x19
        BL       |L2.740|
        MOV      r0,r5
        BL       |L2.692|
        MOV      r1,#0x3bfc
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.1620|
        LDR      r0,[r4,#0]
        BIC      r0,r0,#8
        STR      r0,[r4,#0]
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r4
        MOV      r1,#0x13
        BL       |L2.1592|
        MOV      r0,r4
        BL       |L2.1544|
        BL       |L2.264|
        MOVW     r1,#0xb00
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.568|
        MOV      r1,#0x11b0
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.568|
        MOVW     r0,#0x10e
        BL       |L2.336|
        MOV      r0,#0x10f
        BL       |L2.336|
        MOV      r0,#0x4d34
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x394c
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r5
        BL       |L2.1292|
        MOV      r0,#0x4c69
        MOVT     r0,#0x4000
|L2.7172|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.7172|
        MOV      r0,r5
        BL       |L2.628|
        MOV      r0,r4
        BL       |L2.1496|
        MOV      r1,#0
        MOV      r0,#0x4cb0
        MOVT     r0,#0x4000
|L2.7212|
        LDR      r2,[r6,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.7252|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.7212|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.7252|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

renesas_slave_rx_fna_delay PROC
        PUSH     {r4-r9,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        ADD      r5,r4,#0x8000
        MOV      r1,#0x39c4
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.768|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r5
        BL       |L2.692|
        MOV      r1,#0x3b84
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.1620|
        LDR      r0,[r4,#0]
        BIC      r0,r0,#8
        STR      r0,[r4,#0]
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r4
        BL       |L2.1544|
        MOV      r0,r5
        MOV      r1,#0xaa
        BL       |L2.1292|
|L2.7372|
        LDR      r0,[r4,#8]
        TST      r0,#1
        BEQ      |L2.7372|
        MOV      r0,r4
        MOV      r1,#1
        BL       |L2.1480|
        MOV      r6,#0x800c
        MOVT     r6,#0xe650
|L2.7404|
        LDR      r0,[r6,#0]
        TST      r0,#1
        BEQ      |L2.7404|
        MOV      r0,r5
        BL       |L2.676|
        MOV      r0,r5
        MOV      r1,#9
        BL       |L2.612|
        MOV      r7,#1
        MOV      r8,#0x392c
        MOVT     r8,#0x4000
        MOV      r9,#0x4c8c
        MOVT     r9,#0x4000
|L2.7456|
        LDR      r0,[r6,#0]
        TST      r0,#8
        BEQ      |L2.7456|
        CMP      r7,#1
        BHI      |L2.7488|
        LDR      r1,[r8,r7,LSL #2]
        MOV      r0,r5
        BL       |L2.1284|
|L2.7488|
        MOV      r0,r5
        MOV      r1,#8
        BL       |L2.612|
|L2.7500|
        LDR      r0,[r6,#0]
        TST      r0,#4
        BEQ      |L2.7500|
        MOV      r0,r5
        MOV      r1,#4
        BL       |L2.612|
|L2.7524|
        LDR      r0,[r4,#8]
        TST      r0,#2
        BEQ      |L2.7524|
        CMP      r7,#2
        BEQ      |L2.7572|
        CMP      r7,#1
        BEQ      |L2.7584|
        CMP      r7,#0
        BNE      |L2.7600|
        MOV      r0,r4
        BL       |L2.2100|
        B        |L2.7592|
|L2.7572|
        MOV      r0,r4
        BL       |L2.2088|
        B        |L2.7592|
|L2.7584|
        MOV      r0,r4
        BL       |L2.2112|
|L2.7592|
        ADD      r1,r9,r7,LSL #2
        STR      r0,[r1,#-4]
|L2.7600|
        MOV      r0,#0x320
        BL       |L2.2220|
        MOV      r0,r4
        MOV      r1,#2
        BL       |L2.1480|
        ADD      r7,r7,#1
        CMP      r7,#3
        BNE      |L2.7456|
|L2.7632|
        LDR      r0,[r6,#0]
        TST      r0,#0x40
        BEQ      |L2.7632|
        MOV      r0,r5
        MOV      r1,#0x40
        BL       |L2.612|
|L2.7656|
        LDR      r0,[r4,#8]
        TST      r0,#0x10
        BEQ      |L2.7656|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.1480|
|L2.7680|
        LDR      r0,[r6,#0]
        TST      r0,#0x10
        BEQ      |L2.7680|
        MOV      r0,r5
        MOV      r1,#0x10
        BL       |L2.612|
        MOV      r0,r5
        BL       |L2.628|
        MOV      r0,r4
        BL       |L2.1496|
        MOV      r0,#0
|L2.7724|
        LDR      r1,[r8,r0,LSL #2]
        LDR      r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.7764|
        ADD      r1,r0,#1
        MOV      r0,#1
        CMP      r1,#1
        BLS      |L2.7724|
        MOV      r0,#0
        POP      {r4-r9,r11,pc}
|L2.7764|
        MOV      r0,#1
        POP      {r4-r9,r11,pc}
        ENDP

renesas_slave_rx_fna_sdbs PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x3ae4
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.768|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.740|
        MOV      r0,r4
        BL       |L2.692|
        SUB      r5,r4,#0x8000
        MOV      r1,#0x3ca4
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1620|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1592|
        MOV      r0,r5
        BL       |L2.1544|
        BL       |L2.264|
        MOVW     r1,#0xd10
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.568|
        MOV      r1,#0x157c
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.568|
        MOVW     r0,#0x10e
        BL       |L2.336|
        MOV      r0,#0x10f
        BL       |L2.336|
        MOV      r0,#0x4d48
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x396c
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1292|
        MOV      r0,#0x4c6f
        MOVT     r0,#0x4000
|L2.7984|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.7984|
        MOV      r0,r4
        BL       |L2.628|
        MOV      r0,r5
        BL       |L2.1496|
        MOV      r1,#0
        MOV      r0,#0x4cdc
        MOVT     r0,#0x4000
|L2.8024|
        LDR      r2,[r6,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.8064|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.8024|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.8064|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

renesas_slave_rx_sdbs PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x3acc
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.768|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.740|
        MOV      r0,r4
        BL       |L2.692|
        SUB      r5,r4,#0x8000
        MOV      r1,#0x3c8c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1620|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1592|
        MOV      r0,r5
        BL       |L2.1544|
        BL       |L2.264|
        MOV      r1,#0xcb8
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.568|
        MOV      r1,#0x14c8
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.568|
        MOVW     r0,#0x10e
        BL       |L2.336|
        MOV      r0,#0x10f
        BL       |L2.336|
        MOV      r0,#0x4d44
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x3964
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1292|
        MOV      r0,#0x4c6e
        MOVT     r0,#0x4000
|L2.8284|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.8284|
        MOV      r0,r4
        BL       |L2.628|
        MOV      r0,r5
        BL       |L2.1496|
        MOV      r1,#0
        MOV      r0,#0x4cd4
        MOVT     r0,#0x4000
|L2.8324|
        LDR      r2,[r6,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.8364|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.8324|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.8364|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

renesas_slave_tx PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        ADD      r5,r4,#0x8000
        MOV      r1,#0x397c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.768|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.740|
        MOV      r0,r5
        BL       |L2.692|
        MOV      r1,#0x3b3c
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.1620|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.1592|
        MOV      r0,r4
        BL       |L2.1544|
        MOV      r0,#0x4d20
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x3914
        MOVT     r6,#0x4000
        LDRB     r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.2136|
        BL       |L2.264|
        MOV      r1,#0x914
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.568|
        MOV      r1,#0xe48
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.568|
        MOVW     r0,#0x10e
        BL       |L2.336|
        MOV      r0,#0x10f
        BL       |L2.336|
        MOV      r0,r5
        BL       |L2.1268|
        MOV      r0,#0x4c64
        MOVT     r0,#0x4000
|L2.8592|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.8592|
        MOV      r0,r5
        BL       |L2.628|
        MOV      r0,r4
        BL       |L2.1496|
        MOV      r1,#0
        MOV      r0,#0x4c74
        MOVT     r0,#0x4000
|L2.8632|
        LDR      r2,[r6,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.8672|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.8632|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.8672|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

renesas_slave_tx_delay PROC
        PUSH     {r4-r10,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x3a0c
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.768|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r4
        BL       |L2.692|
        SUB      r10,r4,#0x8000
        MOV      r1,#0x3bcc
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1620|
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r10
        BL       |L2.1544|
        MOV      r0,r10
        MOV      r1,#0xaa
        BL       |L2.2136|
        MOV      r0,r4
        BL       |L2.1268|
        MOV      r6,#0x8008
        MOVT     r6,#0xffff
|L2.8796|
        LDR      r0,[r4,r6]
        TST      r0,#1
        BEQ      |L2.8796|
        MOV      r0,r10
        MOV      r1,#1
        BL       |L2.1480|
        MOV      r7,#0x800c
        MOVT     r7,#0xe650
|L2.8828|
        LDR      r0,[r7,#0]
        TST      r0,#1
        BEQ      |L2.8828|
        MOV      r0,r4
        BL       |L2.676|
        MOV      r0,r4
        MOV      r1,#3
        BL       |L2.612|
        MOV      r5,#1
        MOV      r8,#0x3944
        MOVT     r8,#0x4000
        MOV      r9,#0x4ca4
        MOVT     r9,#0x4000
|L2.8880|
        LDR      r0,[r4,r6]
        TST      r0,#8
        BEQ      |L2.8880|
        CMP      r5,#1
        BHI      |L2.8912|
        LDRB     r1,[r8,r5,LSL #2]
        MOV      r0,r10
        BL       |L2.2136|
|L2.8912|
        MOV      r0,#0x7d0
        BL       |L2.2220|
        MOV      r0,r10
        MOV      r1,#8
        BL       |L2.1480|
|L2.8932|
        LDR      r0,[r4,r6]
        TST      r0,#4
        BEQ      |L2.8932|
        MOV      r0,r10
        MOV      r1,#4
        BL       |L2.1480|
|L2.8956|
        LDR      r0,[r7,#0]
        TST      r0,#2
        BEQ      |L2.8956|
        CMP      r5,#2
        BEQ      |L2.9004|
        CMP      r5,#1
        BEQ      |L2.9016|
        CMP      r5,#0
        BNE      |L2.9032|
        MOV      r0,r4
        BL       |L2.1232|
        B        |L2.9024|
|L2.9004|
        MOV      r0,r4
        BL       |L2.1220|
        B        |L2.9024|
|L2.9016|
        MOV      r0,r4
        BL       |L2.1244|
|L2.9024|
        ADD      r1,r9,r5,LSL #2
        STR      r0,[r1,#-4]
|L2.9032|
        MOV      r0,r4
        MOV      r1,#2
        BL       |L2.612|
        ADD      r5,r5,#1
        CMP      r5,#3
        BNE      |L2.8880|
|L2.9056|
        LDR      r0,[r4,r6]
        TST      r0,#0x10
        BEQ      |L2.9056|
        MOV      r0,r10
        MOV      r1,#0x10
        BL       |L2.1480|
|L2.9080|
        LDR      r0,[r7,#0]
        TST      r0,#0x10
        BEQ      |L2.9080|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.612|
        MOV      r0,r4
        BL       |L2.628|
        MOV      r0,r10
        BL       |L2.1496|
        MOV      r0,#0
|L2.9124|
        LDR      r1,[r8,r0,LSL #2]
        LDR      r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.9164|
        ADD      r1,r0,#1
        MOV      r0,#1
        CMP      r1,#1
        BLS      |L2.9124|
        MOV      r0,#0
        POP      {r4-r10,pc}
|L2.9164|
        MOV      r0,#1
        POP      {r4-r10,pc}
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
        MOVW     r0,#0x8000
        MOVT     r0,#0xe650
        BL       |L2.660|
        MOV      r0,#0x4c60
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

|symbol_number.198| PROC
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
        BL       |L2.644|
        MOV      r0,#0x4c5d
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
        MOVW     r0,#0
        MOVT     r0,#0xe650
        BL       |L2.1512|
        MOV      r0,#0x4c5c
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

|symbol_number.199| PROC
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
        MOVW     r0,#0
        MOVT     r0,#0xe650
        BL       |L2.1528|
        MOV      r0,#0x4c61
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
        POP      {r11,lr}
        BX       lr
        ENDP

slave_general_call PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x3afc
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.768|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.740|
        MOV      r0,r4
        BL       |L2.692|
        SUB      r5,r4,#0x8000
        MOV      r1,#0x3cbc
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1620|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1592|
        MOV      r0,r5
        BL       |L2.1544|
        BL       |L2.264|
        MOVW     r1,#0xd90
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.568|
        MOV      r1,#0x1608
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.568|
        MOVW     r0,#0x10e
        BL       |L2.336|
        MOV      r0,#0x10f
        BL       |L2.336|
        MOV      r0,#0x4d4c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x3974
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1292|
        MOV      r0,#0x4c70
        MOVT     r0,#0x4000
|L2.9752|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.9752|
        MOV      r0,r4
        BL       |L2.628|
        MOV      r0,r5
        BL       |L2.1496|
        MOV      r1,#0
        MOV      r0,#0x4ce4
        MOVT     r0,#0x4000
|L2.9792|
        LDR      r2,[r6,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.9832|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.9792|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.9832|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

slave_nack_addr PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x3a54
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.768|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.740|
        MOV      r0,r4
        BL       |L2.692|
        SUB      r5,r4,#0x8000
        MOV      r1,#0x3c14
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1620|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1592|
        MOV      r0,r5
        BL       |L2.1544|
        BL       |L2.264|
        MOVW     r1,#0xb80
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.568|
        MOV      r1,#0x123c
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.568|
        MOVW     r0,#0x10e
        BL       |L2.336|
        MOV      r0,#0x10f
        BL       |L2.336|
        MOV      r0,#0x4d38
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        ADR      r0,|symbol_number.116|
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1292|
        MOV      r0,#0x4c6a
        MOVT     r0,#0x4000
|L2.10048|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.10048|
        MOV      r0,r4
        BL       |L2.628|
        MOV      r0,r5
        BL       |L2.1496|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|symbol_number.116|
        DCD      0x000000aa
        DCD      0x00000055
        ENDP

slave_rx PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x39ac
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.768|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.740|
        MOV      r0,r4
        BL       |L2.692|
        SUB      r5,r4,#0x8000
        MOV      r1,#0x3b6c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1620|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1592|
        MOV      r0,r5
        BL       |L2.1544|
        BL       |L2.264|
        MOV      r1,#0x978
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.568|
        MOVW     r1,#0xf10
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.568|
        MOVW     r0,#0x10e
        BL       |L2.336|
        MOV      r0,#0x10f
        BL       |L2.336|
        MOV      r0,#0x4d24
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x3924
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1292|
        MOV      r0,#0x4c65
        MOVT     r0,#0x4000
|L2.10304|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.10304|
        MOV      r0,r4
        BL       |L2.628|
        MOV      r0,r5
        BL       |L2.1496|
        MOV      r1,#0
        MOV      r0,#0x4c84
        MOVT     r0,#0x4000
|L2.10344|
        LDR      r2,[r6,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.10384|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.10344|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.10384|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

slave_rx_dma PROC
        PUSH     {r4-r9,r11,lr}
        MOV      r4,#0x2c1c
        MOVT     r4,#0xe615
        MOV      r0,r4
        MOV      r1,#9
        BL       |L2.180|
        ADD      r0,r4,#0x80
        MOV      r1,#9
        BL       |L2.180|
        MOV      r6,#0x3b2c
        MOVT     r6,#0x4000
        ADD      r0,r6,#4
        MOVW     r7,#0xc
        MOVT     r7,#0xe730
        STR      r0,[r7,#-0xc]
        MOV      r0,#0x8024
        MOVT     r0,#0xe650
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
        MOV      r0,#0x93
        STRH     r0,[r7,#0x34]
        LDR      r0,[r7,#0]
        ORR      r0,r0,#4
        STR      r0,[r7,#0]
        LDR      r0,[r7,#0]
        ORR      r0,r0,#1
        STR      r0,[r7,#0]
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x3a6c
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.768|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.740|
        MOV      r0,r4
        BL       |L2.692|
        MOV      r0,#0x7fdc
        SUB      r0,r4,r0
        STR      r0,[r7,#0xff4]
        MOV      r0,#0x100c
        MOVT     r0,#0xe730
        MOV      r7,#0x4cb8
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
        MOV      r1,#0xa0
        STRH     r1,[r0,#0x34]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#4
        STR      r1,[r0,#0]
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        SUB      r5,r4,#0x8000
        MOV      r1,#0x3c2c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1620|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1592|
        MOV      r0,r5
        BL       |L2.1544|
        BL       |L2.264|
        MOV      r1,#0xba4
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.568|
        MOV      r1,#0x128c
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.568|
        MOV      r1,#0x23d4
        MOVT     r1,#0x4000
        MOV      r0,#0x40
        BL       |L2.568|
        MOV      r1,#0x248c
        MOVT     r1,#0x4000
        MOV      r0,#0x41
        BL       |L2.568|
        MOVW     r0,#0x10e
        BL       |L2.336|
        MOV      r0,#0x10f
        BL       |L2.336|
        MOV      r0,#0x40
        BL       |L2.336|
        MOV      r0,#0x41
        BL       |L2.336|
        MOV      r0,r4
        MOV      r1,#0xaa
        BL       |L2.1292|
        MOV      r0,#0x4c6b
        MOVT     r0,#0x4000
|L2.10944|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.10944|
        MOV      r0,r4
        BL       |L2.628|
        MOV      r0,r5
        BL       |L2.1496|
        MOV      r0,#0
|L2.10976|
        LDR      r1,[r6,r0,LSL #2]
        LDRB     r2,[r7,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.11016|
        ADD      r1,r0,#1
        MOV      r0,#1
        CMP      r1,#1
        BLS      |L2.10976|
        MOV      r0,#0
        POP      {r4-r9,r11,pc}
|L2.11016|
        MOV      r0,#1
        POP      {r4-r9,r11,pc}
        ENDP

slave_rx_fbsc_check PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#4
        BL       |L2.264|
        MOV      r1,#0xaa8
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.568|
        MOV      r1,#0x1104
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.568|
        MOVW     r0,#0x10e
        BL       |L2.336|
        MOV      r0,#0x10f
        BL       |L2.336|
        MOV      r11,#0
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r7,#0x4d30
        MOVT     r7,#0x4000
        MOV      r5,#0x4c68
        MOVT     r5,#0x4000
        SUB      r6,r4,#0x8000
        MOV      r9,#0x3be4
        MOVT     r9,#0x4000
        MOV      r8,#0x4cac
        MOVT     r8,#0x4000
        MOV      r10,#0
|L2.11136|
        STR      r11,[r7,#0]
        MOV      r0,#0x4d04
        MOVT     r0,#0x4000
        STR      r11,[r0,#0]
        STRB     r11,[r5,#0]
        MOV      r0,r4
        MOV      r1,#0x3a24
        MOVT     r1,#0x4000
        BL       |L2.768|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.740|
        MOV      r0,r4
        BL       |L2.692|
        MOV      r0,r6
        MOV      r1,r9
        BL       |L2.1620|
        MOV      r0,r4
        MOV      r1,#0x8038
        MOVT     r1,#0xffff
        LDR      r1,[r0,r1]!
        BIC      r1,r1,#0x1f000000
        ORR      r1,r1,r10,LSL #24
        STR      r1,[r0,#0]
        MOV      r0,r6
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r6
        MOV      r1,#0x13
        BL       |L2.1592|
        MOV      r0,r6
        BL       |L2.1544|
        LDR      r0,[r7,#0]
        ADD      r0,r0,#1
        STR      r0,[r7,#0]
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.1292|
|L2.11300|
        LDRB     r0,[r5,#0]
        CMP      r0,#0
        BEQ      |L2.11300|
        MOV      r0,r4
        BL       |L2.628|
        MOV      r0,r6
        BL       |L2.1496|
        LDR      r0,[r8,#0]
        CMP      r0,#0x48
        BNE      |L2.11364|
        ADD      r10,r10,#1
        CMP      r10,#0x20
        BCC      |L2.11136|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.11364|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

slave_rx_fna PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x39dc
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.768|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.740|
        MOV      r0,r4
        BL       |L2.692|
        SUB      r5,r4,#0x8000
        MOV      r1,#0x3b9c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1620|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1592|
        MOV      r0,r5
        BL       |L2.1544|
        BL       |L2.264|
        MOVW     r1,#0x9d0
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.568|
        MOV      r1,#0xfc4
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.568|
        MOVW     r0,#0x10e
        BL       |L2.336|
        MOV      r0,#0x10f
        BL       |L2.336|
        MOV      r0,#0x4d28
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x3934
        MOVT     r6,#0x4000
        LDR      r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1292|
        MOV      r0,#0x4c66
        MOVT     r0,#0x4000
|L2.11588|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.11588|
        MOV      r0,r4
        BL       |L2.628|
        MOV      r0,r5
        BL       |L2.1496|
        MOV      r1,#0
        MOV      r0,#0x4c94
        MOVT     r0,#0x4000
|L2.11628|
        LDR      r2,[r6,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.11668|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.11628|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.11668|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

slave_tx PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        ADD      r5,r4,#0x8000
        MOV      r1,#0x3a9c
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.768|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.740|
        MOV      r0,r5
        BL       |L2.692|
        MOV      r1,#0x3c5c
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.1620|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.1592|
        MOV      r0,r4
        BL       |L2.1544|
        MOV      r0,#0x4d3c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r6,#0x395c
        MOVT     r6,#0x4000
        LDRB     r1,[r6,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.2136|
        BL       |L2.264|
        MOV      r1,#0xbf8
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.568|
        MOV      r1,#0x134c
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.568|
        MOVW     r0,#0x10e
        BL       |L2.336|
        MOV      r0,#0x10f
        BL       |L2.336|
        MOV      r0,r5
        BL       |L2.1268|
        MOV      r0,#0x4c6c
        MOVT     r0,#0x4000
|L2.11896|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.11896|
        MOV      r0,r5
        BL       |L2.628|
        MOV      r0,r4
        BL       |L2.1496|
        MOV      r1,#0
        MOV      r0,#0x4cc8
        MOVT     r0,#0x4000
|L2.11936|
        LDR      r2,[r6,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.11976|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.11936|
        MOV      r0,#0
        POP      {r4-r6,pc}
|L2.11976|
        MOV      r0,#1
        POP      {r4-r6,pc}
        ENDP

slave_tx_delay PROC
        PUSH     {r4-r10,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r1,#0x3a84
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.768|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r4
        BL       |L2.692|
        SUB      r10,r4,#0x8000
        MOV      r1,#0x3c44
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1620|
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r10
        BL       |L2.1544|
        MOV      r0,r10
        MOV      r1,#0xaa
        BL       |L2.2136|
        MOV      r0,r4
        BL       |L2.1268|
        MOV      r7,#0x8008
        MOVT     r7,#0xffff
|L2.12100|
        LDR      r0,[r4,r7]
        TST      r0,#1
        BEQ      |L2.12100|
        MOV      r0,r10
        MOV      r1,#1
        BL       |L2.1480|
        MOV      r6,#0x800c
        MOVT     r6,#0xe650
|L2.12132|
        LDR      r0,[r6,#0]
        TST      r0,#1
        BEQ      |L2.12132|
        MOV      r0,r4
        BL       |L2.676|
        MOV      r0,r4
        MOV      r1,#3
        BL       |L2.612|
        MOV      r5,#1
        MOV      r9,#0x4cc0
        MOVT     r9,#0x4000
        MOV      r8,#0x3954
        MOVT     r8,#0x4000
|L2.12184|
        LDR      r0,[r6,#0]
        TST      r0,#2
        BEQ      |L2.12184|
        CMP      r5,#2
        BEQ      |L2.12232|
        CMP      r5,#1
        BEQ      |L2.12244|
        CMP      r5,#0
        BNE      |L2.12260|
        MOV      r0,r4
        BL       |L2.1232|
        B        |L2.12252|
|L2.12232|
        MOV      r0,r4
        BL       |L2.1220|
        B        |L2.12252|
|L2.12244|
        MOV      r0,r4
        BL       |L2.1244|
|L2.12252|
        ADD      r1,r9,r5,LSL #2
        STR      r0,[r1,#-4]
|L2.12260|
        MOV      r0,r4
        MOV      r1,#2
        BL       |L2.612|
|L2.12272|
        LDR      r0,[r4,r7]
        TST      r0,#4
        BEQ      |L2.12272|
        MOV      r0,r10
        MOV      r1,#4
        BL       |L2.1480|
|L2.12296|
        LDR      r0,[r4,r7]
        TST      r0,#8
        BEQ      |L2.12296|
        CMP      r5,#1
        BHI      |L2.12328|
        LDRB     r1,[r8,r5,LSL #2]
        MOV      r0,r10
        BL       |L2.2136|
|L2.12328|
        MOV      r0,#0xc8
        BL       |L2.2220|
        MOV      r0,r10
        MOV      r1,#8
        BL       |L2.1480|
        ADD      r5,r5,#1
        CMP      r5,#3
        BNE      |L2.12184|
|L2.12360|
        LDR      r0,[r4,r7]
        TST      r0,#0x10
        BEQ      |L2.12360|
        MOV      r0,r10
        MOV      r1,#0x10
        BL       |L2.1480|
|L2.12384|
        LDR      r0,[r6,#0]
        TST      r0,#0x10
        BEQ      |L2.12384|
        MOV      r0,r4
        MOV      r1,#0x10
        BL       |L2.612|
        MOV      r0,r4
        BL       |L2.628|
        MOV      r0,r10
        BL       |L2.1496|
        MOV      r0,#0
|L2.12428|
        LDR      r1,[r8,r0,LSL #2]
        LDR      r2,[r9,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.12468|
        ADD      r1,r0,#1
        MOV      r0,#1
        CMP      r1,#1
        BLS      |L2.12428|
        MOV      r0,#0
        POP      {r4-r10,pc}
|L2.12468|
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
        BL       |L2.180|
        ADD      r0,r4,#0x80
        MOV      r1,#9
        BL       |L2.180|
        MOVW     r4,#0xc
        MOVT     r4,#0xe730
        MOV      r0,#0x8024
        MOVT     r0,#0xe650
        STR      r0,[r4,#-0xc]
        MOV      r6,#0x4cec
        MOVT     r6,#0x4000
        STR      r6,[r4,#-8]
        LDR      r0,[r4,#-4]
        MOV      r8,#2
        BFI      r0,r8,#0,#24
        STR      r0,[r4,#-4]
        LDR      r0,[r4,#0]
        MOV      r9,#1
        BFI      r0,r9,#14,#2
        STR      r0,[r4,#0]
        LDR      r0,[r4,#0]
        BIC      r0,r0,#0x3000
        STR      r0,[r4,#0]
        LDR      r0,[r4,#0]
        MOV      r11,#8
        BFI      r0,r11,#8,#4
        STR      r0,[r4,#0]
        LDR      r0,[r4,#0]
        BIC      r0,r0,#0x300000
        STR      r0,[r4,#0]
        LDR      r0,[r4,#0]
        BFI      r0,r8,#3,#2
        STR      r0,[r4,#0]
        MOV      r0,#0x92
        STRH     r0,[r4,#0x34]
        LDR      r0,[r4,#0]
        ORR      r0,r0,#4
        STR      r0,[r4,#0]
        LDR      r0,[r4,#0]
        ORR      r0,r0,#1
        STR      r0,[r4,#0]
        MOVW     r10,#0
        MOVT     r10,#0xe650
        ADD      r5,r10,#0x8000
        MOV      r1,#0x3b14
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.768|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.740|
        MOV      r0,r5
        BL       |L2.692|
        MOV      r7,#0x3b34
        MOVT     r7,#0x4000
        ADD      r0,r7,#4
        STR      r0,[r4,#0xff4]
        ADD      r0,r10,#0x24
        MOV      r1,#0x100c
        MOVT     r1,#0xe730
        STR      r0,[r1,#-8]
        LDR      r0,[r1,#-4]
        BFI      r0,r9,#0,#24
        STR      r0,[r1,#-4]
        LDR      r0,[r1,#0]
        BIC      r0,r0,#0xc000
        STR      r0,[r1,#0]
        LDR      r0,[r1,#0]
        BFI      r0,r9,#12,#2
        STR      r0,[r1,#0]
        LDR      r0,[r1,#0]
        BFI      r0,r11,#8,#4
        STR      r0,[r1,#0]
        LDR      r0,[r1,#0]
        BIC      r0,r0,#0x300000
        STR      r0,[r1,#0]
        LDR      r0,[r1,#0]
        BFI      r0,r8,#3,#2
        STR      r0,[r1,#0]
        MOV      r0,#0xa1
        STRH     r0,[r1,#0x34]
        LDR      r0,[r1,#0]
        ORR      r0,r0,#4
        STR      r0,[r1,#0]
        LDR      r0,[r1,#0]
        ORR      r0,r0,#1
        STR      r0,[r1,#0]
        MOV      r1,#0x3cd4
        MOVT     r1,#0x4000
        MOV      r0,r10
        BL       |L2.1620|
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r10
        MVN      r1,#0
        BL       |L2.1592|
        MOV      r0,r10
        MOV      r1,#0xaa
        BL       |L2.2136|
        MOV      r0,r10
        BL       |L2.1544|
        BL       |L2.264|
        MOV      r1,#0xde8
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.568|
        MOV      r1,#0x16bc
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.568|
        MOV      r1,#0x2428
        MOVT     r1,#0x4000
        MOV      r0,#0x40
        BL       |L2.568|
        MOV      r1,#0x24f0
        MOVT     r1,#0x4000
        MOV      r0,#0x41
        BL       |L2.568|
        MOVW     r0,#0x10e
        BL       |L2.336|
        MOV      r0,#0x10f
        BL       |L2.336|
        MOV      r0,#0x40
        BL       |L2.336|
        MOV      r0,#0x41
        BL       |L2.336|
        MOV      r0,r5
        BL       |L2.1268|
        MOV      r0,#0x4c71
        MOVT     r0,#0x4000
|L2.13036|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.13036|
        MOV      r0,r5
        BL       |L2.628|
        MOV      r0,r10
        BL       |L2.1496|
        MOV      r0,#0
|L2.13068|
        LDR      r1,[r7,r0,LSL #2]
        LDRB     r2,[r6,r0,LSL #2]
        CMP      r2,r1
        BNE      |L2.13112|
        ADD      r1,r0,#1
        MOV      r0,#1
        CMP      r1,#1
        BLS      |L2.13068|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.13112|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

slave_tx_fbsc_check PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#4
        BL       |L2.264|
        MOV      r1,#0xc5c
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.568|
        MOV      r1,#0x1414
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.568|
        MOVW     r0,#0x10e
        BL       |L2.336|
        MOV      r0,#0x10f
        BL       |L2.336|
        MOV      r11,#0
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r7,#0x4d40
        MOVT     r7,#0x4000
        MOV      r6,#0x4c6d
        MOVT     r6,#0x4000
        ADD      r5,r4,#0x8000
        MOV      r9,#0x3c74
        MOVT     r9,#0x4000
        MOV      r10,#0x4cd0
        MOVT     r10,#0x4000
        MOV      r8,#0
|L2.13236|
        STR      r11,[r7,#0]
        MOV      r0,#0x4d10
        MOVT     r0,#0x4000
        STR      r11,[r0,#0]
        STRB     r11,[r6,#0]
        MOV      r0,r5
        MOV      r1,#0x3ab4
        MOVT     r1,#0x4000
        BL       |L2.768|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.612|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.740|
        MOV      r0,r5
        BL       |L2.692|
        MOV      r0,r4
        MOV      r1,r9
        BL       |L2.1620|
        LDR      r0,[r4,#0x38]
        BIC      r0,r0,#0x1f0000
        ORR      r0,r0,r8,LSL #16
        STR      r0,[r4,#0x38]
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.1480|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.1592|
        MOV      r0,r4
        BL       |L2.1544|
        LDR      r0,[r7,#0]
        ADD      r0,r0,#1
        STR      r0,[r7,#0]
        MOV      r0,r4
        MOV      r1,#0x48
        BL       |L2.2136|
        MOV      r0,r5
        BL       |L2.1268|
|L2.13396|
        LDRB     r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.13396|
        MOV      r0,r5
        BL       |L2.628|
        MOV      r0,r4
        BL       |L2.1496|
        LDR      r0,[r10,#0]
        CMP      r0,#0x48
        BNE      |L2.13460|
        ADD      r8,r8,#1
        CMP      r8,#0x20
        BCC      |L2.13236|
        MOV      r0,#0
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
|L2.13460|
        MOV      r0,#1
        ADD      sp,sp,#4
        POP      {r4-r11,pc}
        ENDP

||$Ven$AA$L$$Reset_Handler|| PROC
|L2.13472|
        LDR      pc,|L2.13476|
|L2.13476|
        DCD      0x00000070
        ENDP

_fp_init PROC
|L2.13480|
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
sendData
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.49|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.56|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.64|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.71|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.82|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.91|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.108|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.140|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.147|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.166|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.176|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.188|
        DCD      0x000000aa
        DCD      0x00000055
masterConfig
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.47|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.54|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.62|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.69|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.80|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.89|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.100|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.106|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.119|
        DCD      0x00000000
        DCD      0x00000052
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.129|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.138|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.145|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.158|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.164|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.174|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.186|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.201|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.128|
        DCD      0x000000aa
        DCD      0x00000055
|symbol_number.202|
        DCD      0x000000aa
        DCD      0x00000055
slaveConfig
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.48|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.55|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.63|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.70|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.81|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.90|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.101|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.107|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.120|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.131|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.139|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.146|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.159|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.165|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.175|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.187|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.203|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005

        AREA ||area_number.3||, DATA, ALIGN=2

        EXPORTAS ||area_number.3||, ER10
GIC_intHandler
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
        DCD      0x40000104
pattern
        DCD      0x40001e5c
        DCD      0x40001f88
        DCD      0x40001804
        DCD      0x4000193c
        DCD      0x40001b24
        DCD      0x40001c5c
        DCD      0x400020b4
        DCD      0x400021e8
        DCD      0x40002544
        DCD      0x40002670
        DCD      0x4000276c
        DCD      0x40002c70
        DCD      0x40002d9c
        DCD      0x40002ed0
        DCD      0x40002898
        DCD      0x400030bc
        DCD      0x40002b10
        DCD      0x40003344

        AREA ||area_number.4||, DATA, NOINIT, ALIGN=2

        EXPORTAS ||area_number.4||, ER10
DumpOffset
        %        4
isAutoRXComplete
        %        1
|symbol_number.208|
        %        1
isAutoRXStarted
        %        1
|symbol_number.206|
        %        1
isAutoTXComplete
        %        1
|symbol_number.207|
        %        1
isAutoTXStarted
        %        1
|symbol_number.205|
        %        1
isTransferComplete
        %        1
|symbol_number.58|
        %        1
|symbol_number.73|
        %        1
|symbol_number.84|
        %        1
|symbol_number.99|
        %        1
|symbol_number.110|
        %        1
|symbol_number.122|
        %        1
|symbol_number.132|
        %        1
|symbol_number.149|
        %        1
|symbol_number.157|
        %        1
|symbol_number.168|
        %        1
|symbol_number.178|
        %        1
|symbol_number.190|
        %        1
|symbol_number.204|
        %        3
receivedData
        %        8
|symbol_number.50|
        %        8
|symbol_number.59|
        %        8
|symbol_number.65|
        %        8
|symbol_number.74|
        %        8
|symbol_number.85|
        %        8
|symbol_number.92|
        %        8
|symbol_number.102|
        %        4
|symbol_number.111|
        %        8
|symbol_number.130|
        %        8
|symbol_number.141|
        %        8
|symbol_number.150|
        %        8
|symbol_number.160|
        %        4
|symbol_number.169|
        %        8
|symbol_number.179|
        %        8
|symbol_number.191|
        %        8
|symbol_number.200|
        %        8
receivedDataIndex
        %        4
|symbol_number.60|
        %        4
|symbol_number.75|
        %        4
|symbol_number.86|
        %        4
|symbol_number.98|
        %        4
|symbol_number.112|
        %        4
|symbol_number.151|
        %        4
|symbol_number.156|
        %        4
|symbol_number.170|
        %        4
|symbol_number.180|
        %        4
|symbol_number.192|
        %        4
sendDataIndex
        %        4
|symbol_number.57|
        %        4
|symbol_number.72|
        %        4
|symbol_number.83|
        %        4
|symbol_number.97|
        %        4
|symbol_number.109|
        %        4
|symbol_number.121|
        %        4
|symbol_number.148|
        %        4
|symbol_number.155|
        %        4
|symbol_number.167|
        %        4
|symbol_number.177|
        %        4
|symbol_number.189|
        %        4

        AREA ARM_LIB_STACK, DATA, NOINIT, ALIGN=0

        %        1024

||Image$$ARM_LIB_HEAP$$ZI$$Base|| EQU 1073761616
||Image$$ARM_LIB_HEAP$$ZI$$Limit|| EQU 1073761616
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
        EXPORT I2C_masterDisableStartGeneration [CODE]
        EXPORT I2C_masterEnable [CODE]
        EXPORT I2C_masterEnableDMAReceive [CODE]
        EXPORT I2C_masterEnableDMATransmit [CODE]
        EXPORT I2C_masterEnableInterrupt [CODE]
        EXPORT I2C_masterGetInterruptStatus [CODE]
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
        EXPORT slave_rx_fbsc_check [CODE]
        EXPORT slave_rx_fna [CODE]
        EXPORT slave_tx [CODE]
        EXPORT slave_tx_delay [CODE]
        EXPORT slave_tx_dma [CODE]
        EXPORT slave_tx_fbsc_check [CODE]
        EXPORT ||$Ven$AA$L$$Reset_Handler|| [CODE]
        EXPORT _fp_init [CODE,DYNAMIC]
        EXPORT __fplib_config_fpu_vfp [CODE,DYNAMIC]
        EXPORT __fplib_config_pureend_doubles [CODE,DYNAMIC]
        EXPORT I2C_CLOCK_SETTINGS [DATA,SIZE=1120]
        EXPORT GIC_intHandler [DATA,SIZE=3876]
        EXPORT pattern [DATA,SIZE=72]
        EXPORT DumpOffset [DATA,SIZE=4]

        KEEP __ddr_init_start
        KEEP __ddr_init_end
        KEEP i2c0InterruptHandler
        KEEP i2c1InterruptHandler
        KEEP masterConfig
        KEEP slaveConfig
        KEEP sendData
        KEEP |symbol_number.47|
        EXPORTAS |symbol_number.47|, masterConfig
        KEEP |symbol_number.48|
        EXPORTAS |symbol_number.48|, slaveConfig
        KEEP |symbol_number.49|
        EXPORTAS |symbol_number.49|, sendData
        KEEP |symbol_number.52|
        EXPORTAS |symbol_number.52|, i2c0InterruptHandler
        KEEP |symbol_number.53|
        EXPORTAS |symbol_number.53|, i2c1InterruptHandler
        KEEP |symbol_number.54|
        EXPORTAS |symbol_number.54|, masterConfig
        KEEP |symbol_number.55|
        EXPORTAS |symbol_number.55|, slaveConfig
        KEEP |symbol_number.56|
        EXPORTAS |symbol_number.56|, sendData
        KEEP |symbol_number.62|
        EXPORTAS |symbol_number.62|, masterConfig
        KEEP |symbol_number.63|
        EXPORTAS |symbol_number.63|, slaveConfig
        KEEP |symbol_number.64|
        EXPORTAS |symbol_number.64|, sendData
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
        KEEP |symbol_number.78|
        EXPORTAS |symbol_number.78|, i2c0InterruptHandler
        KEEP |symbol_number.79|
        EXPORTAS |symbol_number.79|, i2c1InterruptHandler
        KEEP |symbol_number.80|
        EXPORTAS |symbol_number.80|, masterConfig
        KEEP |symbol_number.81|
        EXPORTAS |symbol_number.81|, slaveConfig
        KEEP |symbol_number.82|
        EXPORTAS |symbol_number.82|, sendData
        KEEP |symbol_number.89|
        EXPORTAS |symbol_number.89|, masterConfig
        KEEP |symbol_number.90|
        EXPORTAS |symbol_number.90|, slaveConfig
        KEEP |symbol_number.91|
        EXPORTAS |symbol_number.91|, sendData
        KEEP |symbol_number.95|
        EXPORTAS |symbol_number.95|, i2c0InterruptHandler
        KEEP |symbol_number.96|
        EXPORTAS |symbol_number.96|, i2c1InterruptHandler
        KEEP |symbol_number.100|
        EXPORTAS |symbol_number.100|, masterConfig
        KEEP |symbol_number.101|
        EXPORTAS |symbol_number.101|, slaveConfig
        KEEP |symbol_number.104|
        EXPORTAS |symbol_number.104|, i2c0InterruptHandler
        KEEP |symbol_number.105|
        EXPORTAS |symbol_number.105|, i2c1InterruptHandler
        KEEP |symbol_number.106|
        EXPORTAS |symbol_number.106|, masterConfig
        KEEP |symbol_number.107|
        EXPORTAS |symbol_number.107|, slaveConfig
        KEEP |symbol_number.108|
        EXPORTAS |symbol_number.108|, sendData
        KEEP |symbol_number.116|
        EXPORTAS |symbol_number.116|, sendData
        KEEP |symbol_number.117|
        EXPORTAS |symbol_number.117|, i2c0InterruptHandler
        KEEP |symbol_number.118|
        EXPORTAS |symbol_number.118|, i2c1InterruptHandler
        KEEP |symbol_number.119|
        EXPORTAS |symbol_number.119|, masterConfig
        KEEP |symbol_number.120|
        EXPORTAS |symbol_number.120|, slaveConfig
        KEEP |symbol_number.124|
        EXPORTAS |symbol_number.124|, i2c0InterruptHandler
        KEEP |symbol_number.125|
        EXPORTAS |symbol_number.125|, i2c1InterruptHandler
        KEEP sdmac1ch0InterruptHandler
        KEEP sdmac1ch1InterruptHandler
        KEEP |symbol_number.128|
        EXPORTAS |symbol_number.128|, sendData
        KEEP |symbol_number.129|
        EXPORTAS |symbol_number.129|, masterConfig
        KEEP |symbol_number.131|
        EXPORTAS |symbol_number.131|, slaveConfig
        KEEP |symbol_number.138|
        EXPORTAS |symbol_number.138|, masterConfig
        KEEP |symbol_number.139|
        EXPORTAS |symbol_number.139|, slaveConfig
        KEEP |symbol_number.140|
        EXPORTAS |symbol_number.140|, sendData
        KEEP |symbol_number.143|
        EXPORTAS |symbol_number.143|, i2c0InterruptHandler
        KEEP |symbol_number.144|
        EXPORTAS |symbol_number.144|, i2c1InterruptHandler
        KEEP |symbol_number.145|
        EXPORTAS |symbol_number.145|, masterConfig
        KEEP |symbol_number.146|
        EXPORTAS |symbol_number.146|, slaveConfig
        KEEP |symbol_number.147|
        EXPORTAS |symbol_number.147|, sendData
        KEEP |symbol_number.153|
        EXPORTAS |symbol_number.153|, i2c0InterruptHandler
        KEEP |symbol_number.154|
        EXPORTAS |symbol_number.154|, i2c1InterruptHandler
        KEEP |symbol_number.158|
        EXPORTAS |symbol_number.158|, masterConfig
        KEEP |symbol_number.159|
        EXPORTAS |symbol_number.159|, slaveConfig
        KEEP |symbol_number.162|
        EXPORTAS |symbol_number.162|, i2c0InterruptHandler
        KEEP |symbol_number.163|
        EXPORTAS |symbol_number.163|, i2c1InterruptHandler
        KEEP |symbol_number.164|
        EXPORTAS |symbol_number.164|, masterConfig
        KEEP |symbol_number.165|
        EXPORTAS |symbol_number.165|, slaveConfig
        KEEP |symbol_number.166|
        EXPORTAS |symbol_number.166|, sendData
        KEEP |symbol_number.172|
        EXPORTAS |symbol_number.172|, i2c0InterruptHandler
        KEEP |symbol_number.173|
        EXPORTAS |symbol_number.173|, i2c1InterruptHandler
        KEEP |symbol_number.174|
        EXPORTAS |symbol_number.174|, masterConfig
        KEEP |symbol_number.175|
        EXPORTAS |symbol_number.175|, slaveConfig
        KEEP |symbol_number.176|
        EXPORTAS |symbol_number.176|, sendData
        KEEP |symbol_number.184|
        EXPORTAS |symbol_number.184|, i2c0InterruptHandler
        KEEP |symbol_number.185|
        EXPORTAS |symbol_number.185|, i2c1InterruptHandler
        KEEP |symbol_number.186|
        EXPORTAS |symbol_number.186|, masterConfig
        KEEP |symbol_number.187|
        EXPORTAS |symbol_number.187|, slaveConfig
        KEEP |symbol_number.188|
        EXPORTAS |symbol_number.188|, sendData
        KEEP |symbol_number.196|
        EXPORTAS |symbol_number.196|, i2c0InterruptHandler
        KEEP |symbol_number.197|
        EXPORTAS |symbol_number.197|, i2c1InterruptHandler
        KEEP |symbol_number.198|
        EXPORTAS |symbol_number.198|, sdmac1ch0InterruptHandler
        KEEP |symbol_number.199|
        EXPORTAS |symbol_number.199|, sdmac1ch1InterruptHandler
        KEEP |symbol_number.201|
        EXPORTAS |symbol_number.201|, masterConfig
        KEEP |symbol_number.202|
        EXPORTAS |symbol_number.202|, sendData
        KEEP |symbol_number.203|
        EXPORTAS |symbol_number.203|, slaveConfig
        KEEP __lit__00000000
        KEEP sendDataIndex
        KEEP isTransferComplete
        KEEP receivedData
        KEEP receivedDataIndex
        KEEP |symbol_number.50|
        EXPORTAS |symbol_number.50|, receivedData
        KEEP |symbol_number.57|
        EXPORTAS |symbol_number.57|, sendDataIndex
        KEEP |symbol_number.58|
        EXPORTAS |symbol_number.58|, isTransferComplete
        KEEP |symbol_number.59|
        EXPORTAS |symbol_number.59|, receivedData
        KEEP |symbol_number.60|
        EXPORTAS |symbol_number.60|, receivedDataIndex
        KEEP |symbol_number.65|
        EXPORTAS |symbol_number.65|, receivedData
        KEEP |symbol_number.72|
        EXPORTAS |symbol_number.72|, sendDataIndex
        KEEP |symbol_number.73|
        EXPORTAS |symbol_number.73|, isTransferComplete
        KEEP |symbol_number.74|
        EXPORTAS |symbol_number.74|, receivedData
        KEEP |symbol_number.75|
        EXPORTAS |symbol_number.75|, receivedDataIndex
        KEEP |symbol_number.83|
        EXPORTAS |symbol_number.83|, sendDataIndex
        KEEP |symbol_number.84|
        EXPORTAS |symbol_number.84|, isTransferComplete
        KEEP |symbol_number.85|
        EXPORTAS |symbol_number.85|, receivedData
        KEEP |symbol_number.86|
        EXPORTAS |symbol_number.86|, receivedDataIndex
        KEEP |symbol_number.92|
        EXPORTAS |symbol_number.92|, receivedData
        KEEP |symbol_number.97|
        EXPORTAS |symbol_number.97|, sendDataIndex
        KEEP |symbol_number.98|
        EXPORTAS |symbol_number.98|, receivedDataIndex
        KEEP |symbol_number.99|
        EXPORTAS |symbol_number.99|, isTransferComplete
        KEEP |symbol_number.102|
        EXPORTAS |symbol_number.102|, receivedData
        KEEP |symbol_number.109|
        EXPORTAS |symbol_number.109|, sendDataIndex
        KEEP |symbol_number.110|
        EXPORTAS |symbol_number.110|, isTransferComplete
        KEEP |symbol_number.111|
        EXPORTAS |symbol_number.111|, receivedData
        KEEP |symbol_number.112|
        EXPORTAS |symbol_number.112|, receivedDataIndex
        KEEP |symbol_number.121|
        EXPORTAS |symbol_number.121|, sendDataIndex
        KEEP |symbol_number.122|
        EXPORTAS |symbol_number.122|, isTransferComplete
        KEEP |symbol_number.130|
        EXPORTAS |symbol_number.130|, receivedData
        KEEP |symbol_number.132|
        EXPORTAS |symbol_number.132|, isTransferComplete
        KEEP isAutoRXStarted
        KEEP isAutoTXStarted
        KEEP isAutoTXComplete
        KEEP isAutoRXComplete
        KEEP |symbol_number.141|
        EXPORTAS |symbol_number.141|, receivedData
        KEEP |symbol_number.148|
        EXPORTAS |symbol_number.148|, sendDataIndex
        KEEP |symbol_number.149|
        EXPORTAS |symbol_number.149|, isTransferComplete
        KEEP |symbol_number.150|
        EXPORTAS |symbol_number.150|, receivedData
        KEEP |symbol_number.151|
        EXPORTAS |symbol_number.151|, receivedDataIndex
        KEEP |symbol_number.155|
        EXPORTAS |symbol_number.155|, sendDataIndex
        KEEP |symbol_number.156|
        EXPORTAS |symbol_number.156|, receivedDataIndex
        KEEP |symbol_number.157|
        EXPORTAS |symbol_number.157|, isTransferComplete
        KEEP |symbol_number.160|
        EXPORTAS |symbol_number.160|, receivedData
        KEEP |symbol_number.167|
        EXPORTAS |symbol_number.167|, sendDataIndex
        KEEP |symbol_number.168|
        EXPORTAS |symbol_number.168|, isTransferComplete
        KEEP |symbol_number.169|
        EXPORTAS |symbol_number.169|, receivedData
        KEEP |symbol_number.170|
        EXPORTAS |symbol_number.170|, receivedDataIndex
        KEEP |symbol_number.177|
        EXPORTAS |symbol_number.177|, sendDataIndex
        KEEP |symbol_number.178|
        EXPORTAS |symbol_number.178|, isTransferComplete
        KEEP |symbol_number.179|
        EXPORTAS |symbol_number.179|, receivedData
        KEEP |symbol_number.180|
        EXPORTAS |symbol_number.180|, receivedDataIndex
        KEEP |symbol_number.189|
        EXPORTAS |symbol_number.189|, sendDataIndex
        KEEP |symbol_number.190|
        EXPORTAS |symbol_number.190|, isTransferComplete
        KEEP |symbol_number.191|
        EXPORTAS |symbol_number.191|, receivedData
        KEEP |symbol_number.192|
        EXPORTAS |symbol_number.192|, receivedDataIndex
        KEEP |symbol_number.200|
        EXPORTAS |symbol_number.200|, receivedData
        KEEP |symbol_number.204|
        EXPORTAS |symbol_number.204|, isTransferComplete
        KEEP |symbol_number.205|
        EXPORTAS |symbol_number.205|, isAutoTXStarted
        KEEP |symbol_number.206|
        EXPORTAS |symbol_number.206|, isAutoRXStarted
        KEEP |symbol_number.207|
        EXPORTAS |symbol_number.207|, isAutoTXComplete
        KEEP |symbol_number.208|
        EXPORTAS |symbol_number.208|, isAutoRXComplete

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
