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
        DCD      0x40000824
        ENDP

||$Ven$AA$L$$SupervisorCall_Handler|| PROC
|L1.5060|
        LDR      pc,|L1.5064|
|L1.5064|
        DCD      0x40000818
        ENDP

||$Ven$AA$L$$PrefetchAbort_Handler|| PROC
|L1.5068|
        LDR      pc,|L1.5072|
|L1.5072|
        DCD      0x400007c0
        ENDP

||$Ven$AA$L$$DataAbort_Handler|| PROC
|L1.5076|
        LDR      pc,|L1.5080|
|L1.5080|
        DCD      0x4000011c
        ENDP

||$Ven$AA$L$$IRQ_Handler|| PROC
|L1.5084|
        LDR      pc,|L1.5088|
|L1.5088|
        DCD      0x40000780
        ENDP

||$Ven$AT$L$$__rt_entry|| PROC
|L1.5092|
        LDR      pc,|L1.5096|
|L1.5096|
        DCD      0x4000007d
        ENDP

||Region$$Table$$Base||
        DCD      0x400032b8
        DCD      0x400032b8
        DCD      0x000004a8
        DCD      0x000011bc
||Region$$Table$$Limit||

        AREA ER10, CODE, READONLY, ALIGN=2

__vectors_start                  ; Alternate entry point
        B        |L2.6684|
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
        BL       |L2.2084|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.48|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.2072|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.64|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.1984|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.80|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.284|
        POP      {r0-r3,r10-r12,lr}
        ERET     
|L2.96|
        PUSH     {r0-r3,r10-r12,lr}
        BL       |L2.1920|
        POP      {r0-r3,r10-r12,lr}
        ERET     
        THUMB
__rt_lib_init                  ; Alternate entry point
|L2.112|
        PUSH     {r0-r4,lr}
__rt_lib_init_fp_1                  ; Alternate entry point
        BLX      |L2.6692|
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
        BLX      |L2.3060|
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
        BLX      |L2.2096|
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

DataAbort_Handler PROC
|L2.284|
        PUSH     {r11,lr}
        BL       |L2.2056|
|L2.292|
        B        |L2.292|
        ENDP

GIC_defaultHandler PROC
|L2.296|
        B        |L2.296|
        ENDP

GIC_enable PROC
|L2.300|
        CPSIE    i
        MOVW     r0,#0x14
        MOVT     r0,#0xf010
        MOV      r1,#0
        STR      r1,[r0,#0]
|L2.320|
        LDR      r1,[r0,#0]
        TST      r1,#6
        BNE      |L2.320|
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
|L2.372|
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
|L2.532|
        CMP      r0,#0x3c8
        BXHI     lr
        MCR      p15,#0x0,r0,c12,c12,#1
        DSB      
        BX       lr
        ENDP

GIC_executeInterruptHandler PROC
|L2.552|
        CMP      r0,#0x3c8
        BXHI     lr
        MOVW     r1,#0x2380
        MOVT     r1,#0x4000
        LDR      r0,[r1,r0,LSL #2]
        BX       r0
        ENDP

GIC_getACKID PROC
|L2.576|
        PUSH     {r4,lr}
        MRC      p15,#0x0,r4,c12,c12,#0
        DSB      
        MOV      r0,r4
        BL       |L2.532|
        MOV      r0,r4
        POP      {r4,pc}
        ENDP

GIC_setInterruptHandler PROC
|L2.604|
        CMP      r0,#0x3c8
        BXHI     lr
        MOVW     r2,#0x2380
        MOVT     r2,#0x4000
        STR      r1,[r2,r0,LSL #2]
        BX       lr
        ENDP

I2C_configPins PROC
|L2.628|
        MOVW     r0,#0x800
        MOVT     r0,#0xe605
        ADD      r1,r0,#0x100
        MOV      r2,#0xfffc
        B        |L2.1960|
        ENDP

I2C_masterClearInterruptStatus PROC
|L2.648|
        LDR      r2,[r0,#0xc]
        BIC      r1,r2,r1
        STR      r1,[r0,#0xc]
        BX       lr
        ENDP

I2C_masterDisableStartGeneration PROC
|L2.664|
        LDR      r1,[r0,#4]
        BIC      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterEnable PROC
|L2.680|
        LDR      r1,[r0,#4]
        ORR      r1,r1,#8
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_masterEnableInterrupt PROC
|L2.696|
        LDR      r2,[r0,#0x14]
        ORR      r1,r2,r1
        STR      r1,[r0,#0x14]
        BX       lr
        ENDP

I2C_masterGetInterruptStatus PROC
|L2.712|
        LDR      r0,[r0,#0xc]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_masterInit PROC
|L2.724|
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
        MOV      r12,#0x1a30
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

I2C_masterSendMultipleByteNext PROC
|L2.1176|
        STR      r1,[r0,#0x24]
        BX       lr
        ENDP

I2C_masterSendMultipleByteStart PROC
|L2.1184|
        STR      r1,[r0,#0x24]
        LDR      r1,[r0,#4]
        ORR      r1,r1,#1
        STR      r1,[r0,#4]
        BX       lr
        ENDP

I2C_modelConnect PROC
|L2.1204|
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
        BL       |L2.1996|
        POP      {r0,r1,r10}
        POP      {r11,pc}
        ENDP

I2C_modelDisable PROC
|L2.1256|
        PUSH     {r11,lr}
        PUSH     {r10}
        MOV      r10,#0
        MOVT     r10,#0xa55a
        MOV      r0,#0x14
        BL       |L2.1996|
        POP      {r10}
        POP      {r11,pc}
        ENDP

I2C_releasePins PROC
|L2.1288|
        MOVW     r0,#0x800
        MOVT     r0,#0xe605
        ADD      r1,r0,#0x100
        MOV      r2,#0xfffc
        B        |L2.1936|
        ENDP

I2C_reset PROC
|L2.1308|
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
|L2.1356|
        LDR      r2,[r0,#8]
        BIC      r1,r2,r1
        STR      r1,[r0,#8]
        BX       lr
        ENDP

I2C_slaveEnable PROC
|L2.1372|
        LDR      r1,[r0,#0]
        ORR      r1,r1,#4
        STR      r1,[r0,#0]
        BX       lr
        ENDP

I2C_slaveEnableInterrupt PROC
|L2.1388|
        LDR      r2,[r0,#0x10]
        ORR      r1,r2,r1
        STR      r1,[r0,#0x10]
        BX       lr
        ENDP

I2C_slaveGetInterruptStatus PROC
|L2.1404|
        LDR      r0,[r0,#8]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_slaveInit PROC
|L2.1416|
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
        MOV      r12,#0x1a30
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
|L2.1884|
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

I2C_slaveReceiveMultipleByteStop PROC
|L2.1896|
        LDR      r1,[r0,#0]
        ORR      r1,r1,#1
        STR      r1,[r0,#0]
        LDR      r0,[r0,#0x24]
        UXTB     r0,r0
        BX       lr
        ENDP

IRQ_Handler PROC
|L2.1920|
        PUSH     {r11,lr}
        BL       |L2.576|
        POP      {r11,lr}
        B        |L2.552|
        ENDP

PFC_ClearMultipleBit PROC
|L2.1936|
        LDR      r3,[r1,#0]
        BIC      r2,r3,r2
        MVN      r3,r2
        STR      r3,[r0,#0]
        STR      r2,[r1,#0]
        BX       lr
        ENDP

PFC_SetMultipleBit PROC
|L2.1960|
        LDR      r3,[r1,#0]
        ORR      r2,r3,r2
        MVN      r3,r2
        STR      r3,[r0,#0]
        STR      r2,[r1,#0]
        BX       lr
        ENDP

PrefetchAbort_Handler PROC
|L2.1984|
        PUSH     {r11,lr}
        BL       |L2.2056|
|L2.1992|
        B        |L2.1992|
        ENDP

Sim_Delay PROC
|L2.1996|
        CMP      r0,#0
        BXEQ     lr
|L2.2004|
        SUBS     r0,r0,#1
        BNE      |L2.2004|
        BX       lr
        ENDP

Sim_Dump PROC
|L2.2016|
        MOV      r1,#0x32b8
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
|L2.2056|
        MOV      r0,#0x7f00000
        MOV      r1,#0
        STR      r1,[r0,#0]
        BX       lr
        ENDP

SupervisorCall_Handler PROC
|L2.2072|
        PUSH     {r11,lr}
        BL       |L2.2056|
|L2.2080|
        B        |L2.2080|
        ENDP

UndefinedInstruction_Handler PROC
|L2.2084|
        PUSH     {r11,lr}
        BL       |L2.2056|
|L2.2092|
        B        |L2.2092|
        ENDP

_sys_exit PROC
|L2.2096|
        B        |L2.2096|
        ENDP

checkReg PROC
|L2.2100|
        MVN      r3,#0
        STR      r3,[r2,#0]
        MOV      r3,#0x32d8
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

|symbol_number.50| PROC
|L2.2148|
        MVN      r2,#0
        STR      r2,[r1,#0]
        LDR      r2,[r1,#0]
        MOV      r3,#0x34d8
        MOVT     r3,#0x4000
        STR      r2,[r3,r0,LSL #3]!
        MOV      r0,#0
        STR      r0,[r1,#0]
        LDR      r0,[r1,#0]
        STR      r0,[r3,#4]
        BX       lr
        ENDP

|symbol_number.56| PROC
|L2.2192|
        MVN      r3,#0
        STR      r3,[r2,#0]
        MOV      r3,#0x3558
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
        BL       |L2.712|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.2332|
        TST      r5,#8
        BEQ      |L2.2340|
        MOV      r0,#0x3758
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x1e90
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1176|
        TST      r5,#0x10
        BNE      |L2.2348|
        B        |L2.2364|
|L2.2332|
        MOV      r0,r4
        BL       |L2.664|
|L2.2340|
        TST      r5,#0x10
        BEQ      |L2.2364|
|L2.2348|
        MOV      r0,#0x32bc
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.2364|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.648|
        ENDP

|symbol_number.64| PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.712|
        MOV      r5,r0
        TST      r5,#1
        BNE      |L2.2472|
        TST      r5,#8
        BEQ      |L2.2480|
        MOV      r0,#0x375c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r0,#0x1e98
        MOVT     r0,#0x4000
        LDR      r1,[r0,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1176|
        TST      r5,#0x10
        BNE      |L2.2488|
        B        |L2.2504|
|L2.2472|
        MOV      r0,r4
        BL       |L2.664|
|L2.2480|
        TST      r5,#0x10
        BEQ      |L2.2504|
|L2.2488|
        MOV      r0,#0x32bd
        MOVT     r0,#0x4000
        MOV      r1,#1
        STRB     r1,[r0,#0]
|L2.2504|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4,r5,r11,lr}
        B        |L2.648|
        ENDP

i2c1InterruptHandler PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1404|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.2632|
        MOV      r6,#0x32d0
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.2600|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.2632|
        MOV      r0,r4
        BL       |L2.1884|
        B        |L2.2608|
|L2.2600|
        MOV      r0,r4
        BL       |L2.1896|
|L2.2608|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOVW     r2,#0x32c0
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.2632|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1356|
        ENDP

|symbol_number.65| PROC
        PUSH     {r4-r6,lr}
        MOVW     r4,#0x8000
        MOVT     r4,#0xe650
        MOV      r0,r4
        BL       |L2.1404|
        MOV      r5,r0
        TST      r5,#2
        BEQ      |L2.2760|
        MOV      r6,#0x32d4
        MOVT     r6,#0x4000
        LDR      r0,[r6,#0]
        LDR      r0,[r6,#0]
        CMP      r0,#0
        BEQ      |L2.2728|
        LDR      r0,[r6,#0]
        CMP      r0,#1
        BNE      |L2.2760|
        MOV      r0,r4
        BL       |L2.1884|
        B        |L2.2736|
|L2.2728|
        MOV      r0,r4
        BL       |L2.1896|
|L2.2736|
        LDR      r1,[r6,#0]
        ADD      r2,r1,#1
        STR      r2,[r6,#0]
        MOV      r2,#0x32c8
        MOVT     r2,#0x4000
        STR      r0,[r2,r1,LSL #2]
|L2.2760|
        MOV      r0,r4
        MOV      r1,r5
        POP      {r4-r6,lr}
        B        |L2.1356|
        ENDP

interrupt_check PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x2338
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.724|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.648|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.696|
        MOV      r0,r4
        BL       |L2.680|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x2368
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1416|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1356|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1388|
        MOV      r0,r5
        BL       |L2.1372|
        BL       |L2.300|
        MOV      r1,#0x94c
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.604|
        MOV      r1,#0xa58
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.604|
        MOVW     r0,#0x10e
        BL       |L2.372|
        MOV      r0,#0x10f
        BL       |L2.372|
        MOV      r0,#0x375c
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x1e98
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1184|
        MOV      r0,#0x32bd
        MOVT     r0,#0x4000
|L2.2988|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.2988|
        MOV      r1,#0
        MOV      r0,#0x32c8
        MOVT     r0,#0x4000
|L2.3012|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.3052|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.3012|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.3052|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
        ENDP

main PROC
|L2.3060|
        PUSH     {r4-r6,lr}
        SUB      sp,sp,#0x18
        BL       |L2.628|
        MOV      r5,#0
        MOV      r6,#0x32a4
        MOVT     r6,#0x4000
        ADD      r4,sp,#4
|L2.3088|
        BL       |L2.1308|
        MOV      r0,#0x64
        BL       |L2.1996|
        MOV      r0,#0
        MOV      r1,#1
        BL       |L2.1204|
        LDR      r0,[r6,r5,LSL #2]
        BLX      r0
        STR      r0,[r4,r5,LSL #2]
        CMP      r0,#1
        BEQ      |L2.3156|
        ADD      r5,r5,#1
        CMP      r5,#4
        BLS      |L2.3088|
        BL       |L2.1256|
        BL       |L2.1288|
        B        |L2.3200|
|L2.3156|
        BL       |L2.1256|
        BL       |L2.1288|
        MOV      r0,#0
|L2.3168|
        LDR      r1,[r4,r0,LSL #2]
        CMP      r1,#1
        BEQ      |L2.3196|
        ADD      r0,r0,#1
        CMP      r0,#5
        BCC      |L2.3168|
        B        |L2.3200|
|L2.3196|
        BL       |L2.2016|
|L2.3200|
        BL       |L2.2056|
|L2.3204|
        B        |L2.3204|
        ENDP

mstp_check PROC
        PUSH     {r4-r11,lr}
        SUB      sp,sp,#0x3c
        MOVW     r6,#0
        MOVT     r6,#0xe650
        MOV      r0,#0
        MOV      r1,#0
        MOV      r2,r6
        BL       |L2.2100|
        ADD      r2,r6,#4
        MOV      r0,#0
        MOV      r1,#1
        STR      r2,[sp,#0x38]
        BL       |L2.2100|
        ADD      r2,r6,#8
        MOV      r0,#0
        MOV      r1,#2
        STR      r2,[sp,#0x34]
        BL       |L2.2100|
        ADD      r2,r6,#0xc
        MOV      r0,#0
        MOV      r1,#3
        STR      r2,[sp,#0x30]
        BL       |L2.2100|
        ADD      r2,r6,#0x10
        MOV      r0,#0
        MOV      r1,#4
        STR      r2,[sp,#0x2c]
        BL       |L2.2100|
        ADD      r2,r6,#0x14
        MOV      r0,#0
        MOV      r1,#5
        STR      r2,[sp,#0x28]
        BL       |L2.2100|
        ADD      r2,r6,#0x18
        MOV      r0,#0
        MOV      r1,#6
        STR      r2,[sp,#0x24]
        BL       |L2.2100|
        ADD      r2,r6,#0x1c
        MOV      r0,#0
        MOV      r1,#7
        STR      r2,[sp,#0x20]
        BL       |L2.2100|
        ADD      r2,r6,#0x20
        MOV      r0,#0
        MOV      r1,#8
        STR      r2,[sp,#0x1c]
        BL       |L2.2100|
        ADD      r2,r6,#0x24
        MOV      r0,#0
        MOV      r1,#9
        STR      r2,[sp,#0x18]
        BL       |L2.2100|
        ADD      r10,r6,#0x28
        MOV      r0,#0
        MOV      r1,#0xa
        MOV      r2,r10
        BL       |L2.2100|
        ADD      r11,r6,#0x2c
        MOV      r0,#0
        MOV      r1,#0xb
        MOV      r2,r11
        BL       |L2.2100|
        ADD      r8,r6,#0x30
        MOV      r0,#0
        MOV      r1,#0xc
        MOV      r2,r8
        BL       |L2.2100|
        ADD      r5,r6,#0x34
        MOV      r0,#0
        MOV      r1,#0xd
        MOV      r2,r5
        BL       |L2.2100|
        ADD      r7,r6,#0x38
        MOV      r0,#0
        MOV      r1,#0xe
        MOV      r2,r7
        BL       |L2.2100|
        ADD      r4,r6,#0x3c
        MOV      r0,#0
        MOV      r1,#0xf
        MOV      r2,r4
        BL       |L2.2100|
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
|L2.3628|
        LDR      r0,[r9,#0x100]
        TST      r0,#0x40000
        BEQ      |L2.3628|
        MOV      r0,#1
        MOV      r1,#0
        MOV      r2,r6
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#1
        LDR      r2,[sp,#0x38]
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#2
        LDR      r2,[sp,#0x34]
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#3
        LDR      r2,[sp,#0x30]
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#4
        LDR      r2,[sp,#0x2c]
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#5
        LDR      r2,[sp,#0x28]
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#6
        LDR      r2,[sp,#0x24]
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#7
        LDR      r2,[sp,#0x20]
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#8
        LDR      r2,[sp,#0x1c]
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#9
        LDR      r2,[sp,#0x18]
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#0xa
        MOV      r2,r10
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#0xb
        MOV      r2,r11
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#0xc
        MOV      r2,r8
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#0xd
        MOV      r2,r5
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#0xe
        MOV      r2,r7
        BL       |L2.2100|
        MOV      r0,#1
        MOV      r1,#0xf
        MOV      r2,r4
        BL       |L2.2100|
        MOV      r0,r9
        MOV      r1,#0x12
        BL       |L2.180|
|L2.3908|
        LDR      r0,[r9,#0x100]
        TST      r0,#0x40000
        BNE      |L2.3908|
        LDR      r0,[r6,#0]
        MOV      r9,#0x32d8
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
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#1
        LDR      r2,[sp,#0x10]
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#2
        LDR      r2,[sp,#0x14]
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#3
        LDR      r2,[sp,#0x2c]
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#4
        MOV      r2,r5
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#5
        MOV      r2,r11
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#6
        MOV      r2,r8
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#7
        LDR      r2,[sp,#0x30]
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#8
        MOV      r2,r4
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#9
        LDR      r2,[sp,#0x18]
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#0xa
        LDR      r2,[sp,#0x34]
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#0xb
        LDR      r2,[sp,#0x38]
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#0xc
        MOV      r2,r7
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#0xd
        LDR      r2,[sp,#0x1c]
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#0xe
        LDR      r2,[sp,#0x20]
        BL       |L2.2100|
        MOV      r0,#3
        MOV      r1,#0xf
        LDR      r2,[sp,#0x24]
        BL       |L2.2100|
        MOVW     r0,#0x1ea0
        MOVT     r0,#0x4000
|L2.4696|
        MOV      r1,#0
|L2.4700|
        MOV      r2,#0
|L2.4704|
        ADD      r3,r0,r10,LSL #7
        ADD      r3,r3,r1,LSL #3
        LDR      r3,[r3,r2,LSL #2]
        ADD      r7,r9,r10,LSL #7
        ADD      r7,r7,r1,LSL #3
        LDR      r7,[r7,r2,LSL #2]
        CMP      r7,r3
        BNE      |L2.4788|
        ADD      r3,r2,#1
        MOV      r2,#1
        CMP      r3,#1
        BLS      |L2.4704|
        ADD      r1,r1,#1
        CMP      r1,#0x10
        BCC      |L2.4700|
        ADD      r10,r10,#1
        CMP      r10,#4
        BCC      |L2.4696|
        MOV      r0,#0
        ADD      sp,sp,#0x3c
        POP      {r4-r11,pc}
|L2.4788|
        MOV      r0,#1
        ADD      sp,sp,#0x3c
        POP      {r4-r11,pc}
        ENDP

pad_check PROC
        PUSH     {r4,r5,r11,lr}
        MOVW     r4,#0
        MOVT     r4,#0xe650
        MOV      r1,#0x2320
        MOVT     r1,#0x4000
        MOV      r0,r4
        BL       |L2.724|
        MOV      r0,r4
        MVN      r1,#0
        BL       |L2.648|
        MOV      r0,r4
        MOV      r1,#0x19
        BL       |L2.696|
        MOV      r0,r4
        BL       |L2.680|
        ADD      r5,r4,#0x8000
        MOV      r1,#0x2350
        MOVT     r1,#0x4000
        MOV      r0,r5
        BL       |L2.1416|
        MOV      r0,r5
        MVN      r1,#0
        BL       |L2.1356|
        MOV      r0,r5
        MOV      r1,#0x13
        BL       |L2.1388|
        MOV      r0,r5
        BL       |L2.1372|
        BL       |L2.300|
        MOVW     r1,#0x8c0
        MOVT     r1,#0x4000
        MOVW     r0,#0x10e
        BL       |L2.604|
        MOV      r1,#0x9d8
        MOVT     r1,#0x4000
        MOV      r0,#0x10f
        BL       |L2.604|
        MOVW     r0,#0x10e
        BL       |L2.372|
        MOV      r0,#0x10f
        BL       |L2.372|
        MOV      r0,#0x3758
        MOVT     r0,#0x4000
        LDR      r1,[r0,#0]
        ADD      r2,r1,#1
        STR      r2,[r0,#0]
        MOV      r5,#0x1e90
        MOVT     r5,#0x4000
        LDR      r1,[r5,r1,LSL #2]
        MOV      r0,r4
        BL       |L2.1184|
        MOV      r0,#0x32bc
        MOVT     r0,#0x4000
|L2.5012|
        LDRB     r1,[r0,#0]
        CMP      r1,#0
        BEQ      |L2.5012|
        MOV      r1,#0
        MOVW     r0,#0x32c0
        MOVT     r0,#0x4000
|L2.5036|
        LDR      r2,[r5,r1,LSL #2]
        LDR      r3,[r0,r1,LSL #2]
        CMP      r3,r2
        BNE      |L2.5076|
        ADD      r2,r1,#1
        MOV      r1,#1
        CMP      r2,#1
        BLS      |L2.5036|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.5076|
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
        BL       |L2.2148|
        ADD      r1,r4,#4
        MOV      r0,#1
        BL       |L2.2148|
        ADD      r1,r4,#8
        MOV      r0,#2
        BL       |L2.2148|
        ADD      r1,r4,#0xc
        MOV      r0,#3
        BL       |L2.2148|
        ADD      r1,r4,#0x10
        MOV      r0,#4
        BL       |L2.2148|
        ADD      r1,r4,#0x14
        MOV      r0,#5
        BL       |L2.2148|
        ADD      r1,r4,#0x18
        MOV      r0,#6
        BL       |L2.2148|
        ADD      r1,r4,#0x1c
        MOV      r0,#7
        BL       |L2.2148|
        ADD      r1,r4,#0x20
        MOV      r0,#8
        BL       |L2.2148|
        ADD      r1,r4,#0x24
        MOV      r0,#9
        BL       |L2.2148|
        ADD      r1,r4,#0x28
        MOV      r0,#0xa
        BL       |L2.2148|
        ADD      r1,r4,#0x2c
        MOV      r0,#0xb
        BL       |L2.2148|
        ADD      r1,r4,#0x30
        MOV      r0,#0xc
        BL       |L2.2148|
        ADD      r1,r4,#0x34
        MOV      r0,#0xd
        BL       |L2.2148|
        ADD      r1,r4,#0x38
        MOV      r0,#0xe
        BL       |L2.2148|
        ADD      r1,r4,#0x3c
        MOV      r0,#0xf
        BL       |L2.2148|
        MOV      r0,#0x20a0
        MOVT     r0,#0x4000
        MOV      r1,#0x34d8
        MOVT     r1,#0x4000
|L2.5308|
        MOV      r2,#0
|L2.5312|
        ADD      r3,r0,r5,LSL #3
        LDR      r3,[r3,r2,LSL #2]
        ADD      r4,r1,r5,LSL #3
        LDR      r4,[r4,r2,LSL #2]
        CMP      r4,r3
        BNE      |L2.5372|
        ADD      r3,r2,#1
        MOV      r2,#1
        CMP      r3,#1
        BLS      |L2.5312|
        ADD      r5,r5,#1
        CMP      r5,#0x10
        BCC      |L2.5308|
        MOV      r0,#0
        POP      {r4,r5,r11,pc}
|L2.5372|
        MOV      r0,#1
        POP      {r4,r5,r11,pc}
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
        BL       |L2.2192|
        ADD      r2,r4,#4
        STR      r2,[sp,#0x38]
        MOV      r0,#0
        MOV      r1,#1
        BL       |L2.2192|
        ADD      r2,r4,#8
        STR      r2,[sp,#0x34]
        MOV      r0,#0
        MOV      r1,#2
        BL       |L2.2192|
        ADD      r2,r4,#0xc
        STR      r2,[sp,#0x2c]
        MOV      r0,#0
        MOV      r1,#3
        BL       |L2.2192|
        ADD      r11,r4,#0x10
        MOV      r0,#0
        MOV      r1,#4
        MOV      r2,r11
        STR      r11,[sp,#0x24]
        BL       |L2.2192|
        ADD      r2,r4,#0x14
        STR      r2,[sp,#0x28]
        MOV      r0,#0
        MOV      r1,#5
        BL       |L2.2192|
        ADD      r6,r4,#0x18
        MOV      r0,#0
        MOV      r1,#6
        MOV      r2,r6
        STR      r6,[sp,#0x20]
        BL       |L2.2192|
        ADD      r2,r4,#0x1c
        STR      r2,[sp,#0x30]
        MOV      r0,#0
        MOV      r1,#7
        BL       |L2.2192|
        ADD      r2,r4,#0x20
        STR      r2,[sp,#0x10]
        MOV      r0,#0
        MOV      r1,#8
        BL       |L2.2192|
        ADD      r8,r4,#0x24
        MOV      r0,#0
        MOV      r1,#9
        MOV      r2,r8
        BL       |L2.2192|
        ADD      r2,r4,#0x28
        STR      r2,[sp,#0xc]
        MOV      r0,#0
        MOV      r1,#0xa
        BL       |L2.2192|
        ADD      r10,r4,#0x2c
        MOV      r0,#0
        MOV      r1,#0xb
        MOV      r2,r10
        STR      r10,[sp,#0x1c]
        BL       |L2.2192|
        ADD      r7,r4,#0x30
        MOV      r0,#0
        MOV      r1,#0xc
        MOV      r2,r7
        STR      r7,[sp,#0x18]
        BL       |L2.2192|
        ADD      r2,r4,#0x34
        STR      r2,[sp,#8]
        MOV      r0,#0
        MOV      r1,#0xd
        BL       |L2.2192|
        ADD      r5,r4,#0x38
        MOV      r0,#0
        MOV      r1,#0xe
        MOV      r2,r5
        STR      r5,[sp,#0x14]
        BL       |L2.2192|
        ADD      r2,r4,#0x3c
        STR      r2,[sp,#4]
        MOV      r0,#0
        MOV      r1,#0xf
        BL       |L2.2192|
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
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#1
        LDR      r2,[sp,#0x38]
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#2
        LDR      r2,[sp,#0x34]
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#3
        LDR      r2,[sp,#0x2c]
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#4
        MOV      r2,r11
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#5
        LDR      r2,[sp,#0x28]
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#6
        MOV      r2,r6
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#7
        LDR      r2,[sp,#0x30]
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#8
        LDR      r11,[sp,#0x10]
        MOV      r2,r11
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#9
        MOV      r2,r8
        MOV      r6,r8
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#0xa
        LDR      r8,[sp,#0xc]
        MOV      r2,r8
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#0xb
        MOV      r2,r10
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#0xc
        MOV      r2,r7
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#0xd
        LDR      r7,[sp,#8]
        MOV      r2,r7
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#0xe
        MOV      r2,r5
        BL       |L2.2192|
        MOV      r0,#1
        MOV      r1,#0xf
        LDR      r5,[sp,#4]
        MOV      r2,r5
        BL       |L2.2192|
        MOV      r0,#0x2c14
        MOVT     r0,#0xe615
        ADD      r0,r0,#0x80
        MOV      r1,#0x12
        BL       |L2.216|
        LDR      r0,[r4,#0]
        MOV      r10,#0x3558
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
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#1
        LDR      r2,[sp,#0x38]
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#2
        LDR      r2,[sp,#0x34]
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#3
        LDR      r2,[sp,#0x2c]
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#4
        LDR      r2,[sp,#0x24]
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#5
        LDR      r2,[sp,#0x28]
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#6
        LDR      r2,[sp,#0x20]
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#7
        LDR      r2,[sp,#0x30]
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#8
        MOV      r2,r11
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#9
        MOV      r2,r6
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#0xa
        MOV      r2,r8
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#0xb
        LDR      r2,[sp,#0x1c]
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#0xc
        LDR      r2,[sp,#0x18]
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#0xd
        MOV      r2,r7
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#0xe
        LDR      r2,[sp,#0x14]
        BL       |L2.2192|
        MOV      r0,#3
        MOV      r1,#0xf
        MOV      r2,r5
        BL       |L2.2192|
        MOV      r0,#0x2120
        MOVT     r0,#0x4000
|L2.6580|
        MOV      r1,#0
|L2.6584|
        MOV      r2,#0
|L2.6588|
        ADD      r3,r0,r9,LSL #7
        ADD      r3,r3,r1,LSL #3
        LDR      r3,[r3,r2,LSL #2]
        ADD      r7,r10,r9,LSL #7
        ADD      r7,r7,r1,LSL #3
        LDR      r7,[r7,r2,LSL #2]
        CMP      r7,r3
        BNE      |L2.6672|
        ADD      r3,r2,#1
        MOV      r2,#1
        CMP      r3,#1
        BLS      |L2.6588|
        ADD      r1,r1,#1
        CMP      r1,#0x10
        BCC      |L2.6584|
        ADD      r9,r9,#1
        CMP      r9,#4
        BCC      |L2.6580|
        MOV      r0,#0
        ADD      sp,sp,#0x3c
        POP      {r4-r11,pc}
|L2.6672|
        MOV      r0,#1
        ADD      sp,sp,#0x3c
        POP      {r4-r11,pc}
        ENDP

||$Ven$AA$L$$Reset_Handler|| PROC
|L2.6684|
        LDR      pc,|L2.6688|
|L2.6688|
        DCD      0x00000070
        ENDP

_fp_init PROC
|L2.6692|
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
|symbol_number.68|
        DCD      0x000000aa
        DCD      0x00000055
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
|symbol_number.52|
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
|symbol_number.58|
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
masterConfig
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.66|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
slaveConfig
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.67|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005

        AREA ||area_number.3||, DATA, ALIGN=2

        EXPORTAS ||area_number.3||, ER10
GIC_intHandler
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
        DCD      0x40000128
pattern
        DCD      0x400013dc
        DCD      0x40000c88
        DCD      0x40001504
        DCD      0x400012c0
        DCD      0x40000ad8

        AREA ||area_number.4||, DATA, NOINIT, ALIGN=2

        EXPORTAS ||area_number.4||, ER10
DumpOffset
        %        4
isTransferComplete
        %        1
|symbol_number.70|
        %        3
receivedData
        %        8
|symbol_number.71|
        %        8
receivedDataIndex
        %        4
|symbol_number.72|
        %        4
result
        %        512
|symbol_number.51|
        %        128
|symbol_number.57|
        %        512
sendDataIndex
        %        4
|symbol_number.69|
        %        4

        AREA ARM_LIB_STACK, DATA, NOINIT, ALIGN=0

        %        1024

||Image$$ARM_LIB_HEAP$$ZI$$Base|| EQU 1073756000
||Image$$ARM_LIB_HEAP$$ZI$$Limit|| EQU 1073756000
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
        EXPORT I2C_masterDisableStartGeneration [CODE]
        EXPORT I2C_masterEnable [CODE]
        EXPORT I2C_masterEnableInterrupt [CODE]
        EXPORT I2C_masterGetInterruptStatus [CODE]
        EXPORT I2C_masterInit [CODE]
        EXPORT I2C_masterSendMultipleByteNext [CODE]
        EXPORT I2C_masterSendMultipleByteStart [CODE]
        EXPORT I2C_modelConnect [CODE]
        EXPORT I2C_modelDisable [CODE]
        EXPORT I2C_releasePins [CODE]
        EXPORT I2C_reset [CODE]
        EXPORT I2C_slaveClearInterruptStatus [CODE]
        EXPORT I2C_slaveEnable [CODE]
        EXPORT I2C_slaveEnableInterrupt [CODE]
        EXPORT I2C_slaveGetInterruptStatus [CODE]
        EXPORT I2C_slaveInit [CODE]
        EXPORT I2C_slaveReceiveMultipleByteFinish [CODE]
        EXPORT I2C_slaveReceiveMultipleByteStop [CODE]
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
        EXPORT mstp_check [CODE]
        EXPORT pad_check [CODE]
        EXPORT reg_check [CODE]
        EXPORT srst_check [CODE]
        EXPORT ||$Ven$AA$L$$Reset_Handler|| [CODE]
        EXPORT _fp_init [CODE,DYNAMIC]
        EXPORT __fplib_config_fpu_vfp [CODE,DYNAMIC]
        EXPORT __fplib_config_pureend_doubles [CODE,DYNAMIC]
        EXPORT I2C_CLOCK_SETTINGS [DATA,SIZE=1120]
        EXPORT GIC_intHandler [DATA,SIZE=3876]
        EXPORT pattern [DATA,SIZE=20]
        EXPORT DumpOffset [DATA,SIZE=4]

        KEEP __ddr_init_start
        KEEP __ddr_init_end
        KEEP i2c0InterruptHandler
        KEEP i2c1InterruptHandler
        KEEP masterConfig
        KEEP slaveConfig
        KEEP sendData
        KEEP checkReg
        KEEP golden
        KEEP |symbol_number.50|
        EXPORTAS |symbol_number.50|, checkReg
        KEEP |symbol_number.52|
        EXPORTAS |symbol_number.52|, golden
        KEEP |symbol_number.56|
        EXPORTAS |symbol_number.56|, checkReg
        KEEP |symbol_number.58|
        EXPORTAS |symbol_number.58|, golden
        KEEP |symbol_number.64|
        EXPORTAS |symbol_number.64|, i2c0InterruptHandler
        KEEP |symbol_number.65|
        EXPORTAS |symbol_number.65|, i2c1InterruptHandler
        KEEP |symbol_number.66|
        EXPORTAS |symbol_number.66|, masterConfig
        KEEP |symbol_number.67|
        EXPORTAS |symbol_number.67|, slaveConfig
        KEEP |symbol_number.68|
        EXPORTAS |symbol_number.68|, sendData
        KEEP __lit__00000000
        KEEP sendDataIndex
        KEEP isTransferComplete
        KEEP receivedData
        KEEP receivedDataIndex
        KEEP result
        KEEP |symbol_number.51|
        EXPORTAS |symbol_number.51|, result
        KEEP |symbol_number.57|
        EXPORTAS |symbol_number.57|, result
        KEEP |symbol_number.69|
        EXPORTAS |symbol_number.69|, sendDataIndex
        KEEP |symbol_number.70|
        EXPORTAS |symbol_number.70|, isTransferComplete
        KEEP |symbol_number.71|
        EXPORTAS |symbol_number.71|, receivedData
        KEEP |symbol_number.72|
        EXPORTAS |symbol_number.72|, receivedDataIndex

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
