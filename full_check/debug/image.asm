        THUMB
        REQUIRE8
        PRESERVE8

        AREA ER00, CODE, READONLY, ALIGN=8

        MOV      w0,#0x800
        MOVK     w0,#0xe617,LSL #16
        MOV      w1,#0x10
        STR      w1,[x0,#0]
        DSB      SY
        ISB      
        MOV      w0,#0
        MSR      ELR_EL1,x0
        MSR      ELR_EL2,x0
        MSR      ELR_EL3,x0
        MSR      SPSR_EL1,x0
        MSR      SPSR_EL2,x0
        MSR      SPSR_EL3,x0
        LDR      x0,|L1.112|
        MSR      VBAR_EL3,x0
        MOV      w0,#0
        MSR      CPTR_EL3,x0
        MOV      w0,#0
        ORR      w0,w0,#0x800
        ORR      w0,w0,#0x400
        ORR      w0,w0,#8
        ORR      w0,w0,#4
        ORR      w0,w0,#2
        MSR      SCR_EL3,x0
        MOV      w0,#0
        MSR      DAIF,x0
        BL       |L1.5272|
        B        |L1.120|
|L1.112|
        DCD      0x40000000
        DCD      0x00000000
__main                  ; Alternate entry point
|L1.120|
        BL       |L1.5288|
        BL       |L1.128|
__rt_entry                  ; Alternate entry point
__rt_entry_presh_1                  ; Alternate entry point
__rt_entry_sh                  ; Alternate entry point
|L1.128|
        LDR      x0,__lit__00000000
        MOV      sp,x0
__rt_entry_li                  ; Alternate entry point
__rt_entry_postsh_1                  ; Alternate entry point
        BL       |L1.5304|
__rt_entry_main                  ; Alternate entry point
__rt_entry_postli_1                  ; Alternate entry point
        BL       |L1.5320|
        BL       |L1.5336|
        DCI      0x00000000 ; ? Undefined
__lit__00000000
        DCD      0x70000000
        DCD      0x00000000
__ddr_init_bsc                  ; Alternate entry point
        LDR      x0,|L1.3072|
        LDR      w1,[x0,#0]
        LDR      w2,|L1.3080|
        AND      w1,w1,w2
        MVN      w2,w1
        LDR      x0,|L1.3088|
        STR      w2,[x0,#0]
        LDR      x0,|L1.3096|
        STR      w1,[x0,#0]
        LDR      x0,|L1.3072|
        LDR      w1,[x0,#0]
        LDR      w0,|L1.3104|
|L1.208|
        SUB      w0,w0,#1
        CMP      w0,#0
        B.NE     |L1.208|
        B        |L1.276|
        NOP      
        LDR      x4,|L1.3112|
        AND      x1,x1,x4
        STR      x1,[x2,#0]
        STR      x0,[x3,#0]
|L1.244|
        LDR      x0,[x2,#0]
        LDR      x4,|L1.3120|
        AND      x0,x0,x4
        CMP      x0,x4
        B.NE     |L1.244|
        ORR      x1,x1,x4
        STR      x1,[x2,#0]
        BR       x30
|L1.276|
        LDR      w0,|L1.3128|
        LDR      x1,|L1.3136|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3128|
        LDR      x1,|L1.3144|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3152|
        LDR      x1,|L1.3160|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3152|
        LDR      x1,|L1.3168|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.3184|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.3192|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.3200|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.3208|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.3216|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.3224|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.3232|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.3240|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3248|
        LDR      x1,|L1.3256|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3264|
        LDR      x1,|L1.3272|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3280|
        LDR      x1,|L1.3288|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3296|
        LDR      x1,|L1.3304|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3312|
        LDR      x1,|L1.3320|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3328|
        LDR      x1,|L1.3336|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3344|
        LDR      x1,|L1.3352|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3360|
        LDR      x1,|L1.3368|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3376|
        LDR      x1,|L1.3384|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3392|
        LDR      x1,|L1.3400|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3104|
        LDR      x1,|L1.3408|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3416|
        LDR      x1,|L1.3424|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3416|
        LDR      x1,|L1.3432|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3440|
        LDR      x1,|L1.3448|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3456|
        LDR      x1,|L1.3464|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3472|
        LDR      x1,|L1.3480|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3488|
        LDR      x1,|L1.3496|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3504|
        LDR      x1,|L1.3512|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3520|
        LDR      x1,|L1.3528|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3536|
        LDR      x1,|L1.3544|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3552|
        LDR      x1,|L1.3560|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3568|
        LDR      x1,|L1.3576|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3584|
        LDR      x1,|L1.3592|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3600|
        LDR      x1,|L1.3608|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3600|
        LDR      x1,|L1.3616|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3624|
        LDR      x1,|L1.3632|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3624|
        LDR      x1,|L1.3640|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3624|
        LDR      x1,|L1.3648|
|L1.752|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3624|
        LDR      x1,|L1.3656|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3664|
        LDR      x1,|L1.3672|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3680|
        LDR      x1,|L1.3688|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3584|
        LDR      x1,|L1.3696|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3704|
        LDR      x1,|L1.3712|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3720|
        LDR      x1,|L1.3728|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3264|
        LDR      x1,|L1.3736|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3744|
        LDR      x1,|L1.3752|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3760|
        LDR      x1,|L1.3768|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3776|
        LDR      x1,|L1.3784|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3792|
        LDR      x1,|L1.3800|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3808|
        LDR      x1,|L1.3816|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3824|
        LDR      x1,|L1.3832|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3840|
        LDR      x1,|L1.3848|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3792|
        LDR      x1,|L1.3856|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3808|
        LDR      x1,|L1.3864|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3824|
        LDR      x1,|L1.3872|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3880|
        LDR      x1,|L1.3888|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3808|
        LDR      x1,|L1.3896|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3904|
        LDR      x1,|L1.3912|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3920|
        LDR      x1,|L1.3928|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3808|
        LDR      x1,|L1.3936|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3944|
        LDR      x1,|L1.3952|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3824|
        LDR      x1,|L1.3960|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3968|
        LDR      x1,|L1.3976|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3904|
        LDR      x1,|L1.3984|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3824|
        LDR      x1,|L1.3992|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3920|
        LDR      x1,|L1.4000|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4008|
        LDR      x1,|L1.4016|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3920|
        LDR      x1,|L1.4024|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3968|
        LDR      x1,|L1.4032|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4008|
        LDR      x1,|L1.4040|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3392|
        LDR      x1,|L1.4048|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4056|
        LDR      x1,|L1.4064|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4072|
        LDR      x1,|L1.4080|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4088|
        LDR      x1,|L1.4096|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3264|
        LDR      x1,|L1.4104|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3600|
        LDR      x1,|L1.4112|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3600|
        LDR      x1,|L1.4120|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3264|
        LDR      x1,|L1.4128|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4136|
        LDR      x1,|L1.4144|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4152|
        LDR      x1,|L1.4160|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4152|
        LDR      x1,|L1.4168|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4152|
        LDR      x1,|L1.4176|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4152|
        LDR      x1,|L1.4184|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4192|
        LDR      x1,|L1.4200|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4192|
        LDR      x1,|L1.4208|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4192|
        LDR      x1,|L1.4216|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4192|
        LDR      x1,|L1.4224|
        STR      w0,[x1,#0]
        LDR      w6,|L1.3264|
|L1.1348|
        LDR      x0,|L1.4232|
        LDR      w7,[x0,#0]
        AND      w7,w6,w7
        CMP      w6,w7
        B.NE     |L1.1348|
        LDR      x0,|L1.4240|
        LDR      w7,[x0,#0]
        AND      w7,w6,w7
        CMP      w6,w7
        B.NE     |L1.1348|
        LDR      x0,|L1.4248|
        LDR      w7,[x0,#0]
        AND      w7,w6,w7
        CMP      w6,w7
        B.NE     |L1.1348|
        LDR      x0,|L1.4256|
        LDR      w7,[x0,#0]
        AND      w7,w6,w7
        CMP      w6,w7
        B.NE     |L1.1348|
        LDR      x0,|L1.4104|
        LDR      w0,|L1.4264|
        LDR      x1,|L1.4272|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4280|
        LDR      x1,|L1.4272|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4284|
        LDR      x1,|L1.4272|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4288|
        LDR      x1,|L1.4272|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4292|
        LDR      x1,|L1.4272|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4296|
        LDR      x1,|L1.4272|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4300|
        LDR      x1,|L1.4272|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4304|
        LDR      x1,|L1.4272|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4308|
        LDR      x1,|L1.4312|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4320|
        LDR      x1,|L1.4328|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4336|
        LDR      x1,|L1.4344|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4352|
        LDR      x1,|L1.4360|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3264|
        LDR      x1,|L1.4368|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4376|
        LDR      x1,|L1.4384|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4376|
        LDR      x1,|L1.4392|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4376|
        LDR      x1,|L1.4400|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4376|
        LDR      x1,|L1.4408|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3264|
        LDR      x1,|L1.4416|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3264|
        LDR      x1,|L1.4424|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3248|
        LDR      x1,|L1.4432|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3128|
        LDR      x1,|L1.4440|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3128|
        LDR      x1,|L1.4448|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3152|
        LDR      x1,|L1.4456|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3152|
        LDR      x1,|L1.4464|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.4472|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.4480|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.4488|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.4496|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.4504|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.4512|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.4520|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3176|
        LDR      x1,|L1.4528|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3248|
        LDR      x1,|L1.4536|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3264|
        LDR      x1,|L1.4544|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3280|
        LDR      x1,|L1.4552|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3296|
        LDR      x1,|L1.4560|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3312|
        LDR      x1,|L1.4568|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3328|
        LDR      x1,|L1.4576|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3344|
        LDR      x1,|L1.4584|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3360|
        LDR      x1,|L1.4592|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3376|
        LDR      x1,|L1.4600|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3392|
        LDR      x1,|L1.4608|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3104|
        LDR      x1,|L1.4616|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3416|
        LDR      x1,|L1.4624|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3416|
        LDR      x1,|L1.4632|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3440|
        LDR      x1,|L1.4640|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3456|
        LDR      x1,|L1.4648|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3472|
        LDR      x1,|L1.4656|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3488|
        LDR      x1,|L1.4664|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3504|
        LDR      x1,|L1.4672|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3520|
        LDR      x1,|L1.4680|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3536|
        LDR      x1,|L1.4688|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3552|
        LDR      x1,|L1.4696|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3568|
        LDR      x1,|L1.4704|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3584|
        LDR      x1,|L1.4712|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3600|
        LDR      x1,|L1.4720|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3600|
        LDR      x1,|L1.4728|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3624|
        LDR      x1,|L1.4736|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3624|
        LDR      x1,|L1.4744|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3624|
        LDR      x1,|L1.4752|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3624|
        LDR      x1,|L1.4760|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3664|
        LDR      x1,|L1.4768|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3680|
        LDR      x1,|L1.4776|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3584|
        LDR      x1,|L1.4784|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3704|
        LDR      x1,|L1.4792|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3720|
        LDR      x1,|L1.4800|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3264|
        LDR      x1,|L1.4808|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3744|
        LDR      x1,|L1.4816|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3760|
        LDR      x1,|L1.4824|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3776|
        LDR      x1,|L1.4832|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3792|
        LDR      x1,|L1.4840|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3808|
        LDR      x1,|L1.4848|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3824|
        LDR      x1,|L1.4856|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3840|
        LDR      x1,|L1.4864|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3792|
        LDR      x1,|L1.4872|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3808|
        LDR      x1,|L1.4880|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3824|
        LDR      x1,|L1.4888|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3880|
        LDR      x1,|L1.4896|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3808|
        LDR      x1,|L1.4904|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3904|
        LDR      x1,|L1.4912|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3920|
        LDR      x1,|L1.4920|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3808|
        LDR      x1,|L1.4928|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3944|
        LDR      x1,|L1.4936|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3824|
        LDR      x1,|L1.4944|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3968|
        LDR      x1,|L1.4952|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3904|
        LDR      x1,|L1.4960|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3824|
        LDR      x1,|L1.4968|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3920|
        LDR      x1,|L1.4976|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4008|
        LDR      x1,|L1.4984|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3920|
        LDR      x1,|L1.4992|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3968|
        LDR      x1,|L1.5000|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4008|
        LDR      x1,|L1.5008|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3392|
        LDR      x1,|L1.5016|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4056|
        LDR      x1,|L1.5024|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4072|
        LDR      x1,|L1.5032|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4088|
        LDR      x1,|L1.5040|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3264|
        LDR      x1,|L1.5048|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3600|
        LDR      x1,|L1.5056|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3600|
        LDR      x1,|L1.5064|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3264|
        LDR      x1,|L1.5072|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4136|
        LDR      x1,|L1.5080|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4152|
        LDR      x1,|L1.5088|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4152|
        LDR      x1,|L1.5096|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4152|
        LDR      x1,|L1.5104|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4152|
        LDR      x1,|L1.5112|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4192|
        LDR      x1,|L1.5120|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4192|
        LDR      x1,|L1.5128|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4192|
        LDR      x1,|L1.5136|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4192|
        LDR      x1,|L1.5144|
        STR      w0,[x1,#0]
        LDR      w6,|L1.3264|
|L1.2744|
        LDR      x0,|L1.5152|
        LDR      w7,[x0,#0]
        AND      w7,w6,w7
        CMP      w6,w7
        B.NE     |L1.2744|
        LDR      x0,|L1.5160|
        LDR      w7,[x0,#0]
        AND      w7,w6,w7
        CMP      w6,w7
        B.NE     |L1.2744|
        LDR      x0,|L1.5168|
        LDR      w7,[x0,#0]
        AND      w7,w6,w7
        CMP      w6,w7
        B.NE     |L1.2744|
        LDR      x0,|L1.5176|
        LDR      w7,[x0,#0]
        AND      w7,w6,w7
        CMP      w6,w7
        B.NE     |L1.2744|
        LDR      x0,|L1.5048|
        LDR      w0,|L1.4264|
        LDR      x1,|L1.5184|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4280|
        LDR      x1,|L1.5184|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4284|
        LDR      x1,|L1.5184|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4288|
        LDR      x1,|L1.5184|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4292|
        LDR      x1,|L1.5184|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4296|
        LDR      x1,|L1.5184|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4300|
        LDR      x1,|L1.5184|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4304|
        LDR      x1,|L1.5184|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4308|
        LDR      x1,|L1.5192|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4320|
        LDR      x1,|L1.5200|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4336|
        LDR      x1,|L1.5208|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4352|
        LDR      x1,|L1.5216|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3264|
        LDR      x1,|L1.5224|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4376|
        LDR      x1,|L1.5232|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4376|
        LDR      x1,|L1.5240|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4376|
        LDR      x1,|L1.5248|
        STR      w0,[x1,#0]
        LDR      w0,|L1.4376|
        LDR      x1,|L1.5256|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3264|
        LDR      x1,|L1.5264|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3264|
        LDR      x1,|L1.4424|
        STR      w0,[x1,#0]
        LDR      w0,|L1.3248|
        LDR      x1,|L1.4432|
        STR      w0,[x1,#0]
        B        |L1.5272|
|L1.3072|
        DCD      0xe6152e10
        DCD      0x00000000
|L1.3080|
        DCD      0xffffffe7
        DCD      0x00000000
|L1.3088|
        DCD      0xe6150000
        DCD      0x00000000
|L1.3096|
        DCD      0xe6152d10
        DCD      0x00000000
|L1.3104|
        DCD      0x00000010
        DCD      0x00000000
|L1.3112|
        DCD      0x00003fff
        DCD      0x00000000
|L1.3120|
        DCD      0x00008000
        DCD      0x00000000
|L1.3128|
        DCD      0x00001234
        DCD      0x00000000
|L1.3136|
        DCD      0xe6790100
        DCD      0x00000000
|L1.3144|
        DCD      0xe6790108
        DCD      0x00000000
|L1.3152|
        DCD      0x0000000a
        DCD      0x00000000
|L1.3160|
        DCD      0xe6790020
        DCD      0x00000000
|L1.3168|
        DCD      0xe6790024
        DCD      0x00000000
|L1.3176|
        DCD      0x0e030a01
        DCD      0x00000000
|L1.3184|
        DCD      0xe6790030
        DCD      0x00000000
|L1.3192|
        DCD      0xe6790070
        DCD      0x00000000
|L1.3200|
        DCD      0xe6790034
        DCD      0x00000000
|L1.3208|
        DCD      0xe6790074
        DCD      0x00000000
|L1.3216|
        DCD      0xe6790040
        DCD      0x00000000
|L1.3224|
        DCD      0xe6790080
        DCD      0x00000000
|L1.3232|
        DCD      0xe6790044
        DCD      0x00000000
|L1.3240|
        DCD      0xe6790084
        DCD      0x00000000
|L1.3248|
        DCD      0x00000000
        DCD      0x00000000
|L1.3256|
        DCD      0xe6790104
        DCD      0x00000000
|L1.3264|
        DCD      0x00000001
        DCD      0x00000000
|L1.3272|
        DCD      0xe6790010
        DCD      0x00000000
|L1.3280|
        DCD      0x00000028
        DCD      0x00000000
|L1.3288|
        DCD      0xe6790300
        DCD      0x00000000
|L1.3296|
        DCD      0x00000012
        DCD      0x00000000
|L1.3304|
        DCD      0xe6790304
        DCD      0x00000000
|L1.3312|
        DCD      0x00000027
        DCD      0x00000000
|L1.3320|
        DCD      0xe679030c
        DCD      0x00000000
|L1.3328|
        DCD      0x002d0027
        DCD      0x00000000
|L1.3336|
        DCD      0xe6790310
        DCD      0x00000000
|L1.3344|
        DCD      0x00000087
        DCD      0x00000000
|L1.3352|
        DCD      0xe6790314
        DCD      0x00000000
|L1.3360|
        DCD      0x0000005a
        DCD      0x00000000
|L1.3368|
        DCD      0xe6790318
        DCD      0x00000000
|L1.3376|
        DCD      0x00100010
        DCD      0x00000000
|L1.3384|
        DCD      0xe679031c
        DCD      0x00000000
|L1.3392|
        DCD      0x00000040
        DCD      0x00000000
|L1.3400|
        DCD      0xe6790320
        DCD      0x00000000
|L1.3408|
        DCD      0xe6790324
        DCD      0x00000000
|L1.3416|
        DCD      0x00000029
        DCD      0x00000000
|L1.3424|
        DCD      0xe6790328
        DCD      0x00000000
|L1.3432|
        DCD      0xe679032c
        DCD      0x00000000
|L1.3440|
        DCD      0x00310031
        DCD      0x00000000
|L1.3448|
        DCD      0xe6790330
        DCD      0x00000000
|L1.3456|
        DCD      0x00000116
        DCD      0x00000000
|L1.3464|
        DCD      0xe6790334
        DCD      0x00000000
|L1.3472|
        DCD      0x00130013
        DCD      0x00000000
|L1.3480|
        DCD      0xe6790338
        DCD      0x00000000
|L1.3488|
        DCD      0x00200010
        DCD      0x00000000
|L1.3496|
        DCD      0xe679033c
        DCD      0x00000000
|L1.3504|
        DCD      0x0d400a0e
        DCD      0x00000000
|L1.3512|
        DCD      0xe6790340
        DCD      0x00000000
|L1.3520|
        DCD      0x081e0000
        DCD      0x00000000
|L1.3528|
        DCD      0xe6790344
        DCD      0x00000000
|L1.3536|
        DCD      0x01290129
        DCD      0x00000000
|L1.3544|
        DCD      0xe6790350
        DCD      0x00000000
|L1.3552|
        DCD      0x00080008
        DCD      0x00000000
|L1.3560|
        DCD      0xe6790354
        DCD      0x00000000
|L1.3568|
        DCD      0x08550040
        DCD      0x00000000
|L1.3576|
        DCD      0xe6790358
        DCD      0x00000000
|L1.3584|
        DCD      0x00000003
        DCD      0x00000000
|L1.3592|
        DCD      0xe679035c
        DCD      0x00000000
|L1.3600|
        DCD      0x00000002
        DCD      0x00000000
|L1.3608|
        DCD      0xe6790400
        DCD      0x00000000
|L1.3616|
        DCD      0xe6790404
        DCD      0x00000000
|L1.3624|
        DCD      0x00004444
        DCD      0x00000000
|L1.3632|
        DCD      0xe6790438
        DCD      0x00000000
|L1.3640|
        DCD      0xe679043c
        DCD      0x00000000
|L1.3648|
        DCD      0xe6790440
        DCD      0x00000000
|L1.3656|
        DCD      0xe6790444
        DCD      0x00000000
|L1.3664|
        DCD      0x00104214
        DCD      0x00000000
|L1.3672|
        DCD      0xe6790904
        DCD      0x00000000
|L1.3680|
        DCD      0x000001c4
        DCD      0x00000000
|L1.3688|
        DCD      0xe6790908
        DCD      0x00000000
|L1.3696|
        DCD      0xe679090c
        DCD      0x00000000
|L1.3704|
        DCD      0x000f0037
        DCD      0x00000000
|L1.3712|
        DCD      0xe6791000
        DCD      0x00000000
|L1.3720|
        DCD      0x00001010
        DCD      0x00000000
|L1.3728|
        DCD      0xe6791004
        DCD      0x00000000
|L1.3736|
        DCD      0xe6791010
        DCD      0x00000000
|L1.3744|
        DCD      0xf7311111
        DCD      0x00000000
|L1.3752|
        DCD      0xe6791020
        DCD      0x00000000
|L1.3760|
        DCD      0x00001834
        DCD      0x00000000
|L1.3768|
        DCD      0xe6791024
        DCD      0x00000000
|L1.3776|
        DCD      0xffffffff
        DCD      0x00000000
|L1.3784|
        DCD      0xe6791030
        DCD      0x00000000
|L1.3792|
        DCD      0x00000480
        DCD      0x00000000
|L1.3800|
        DCD      0xe6791034
        DCD      0x00000000
|L1.3808|
        DCD      0x00000300
        DCD      0x00000000
|L1.3816|
        DCD      0xe6791038
        DCD      0x00000000
|L1.3824|
        DCD      0x00000180
        DCD      0x00000000
|L1.3832|
        DCD      0xe679103c
        DCD      0x00000000
|L1.3840|
        DCD      0x00000600
        DCD      0x00000000
|L1.3848|
        DCD      0xe6791070
        DCD      0x00000000
|L1.3856|
        DCD      0xe6791074
        DCD      0x00000000
|L1.3864|
        DCD      0xe6791078
        DCD      0x00000000
|L1.3872|
        DCD      0xe679107c
        DCD      0x00000000
|L1.3880|
        DCD      0x00000400
        DCD      0x00000000
|L1.3888|
        DCD      0xe67910c0
        DCD      0x00000000
|L1.3896|
        DCD      0xe67910c4
        DCD      0x00000000
|L1.3904|
        DCD      0x00000200
        DCD      0x00000000
|L1.3912|
        DCD      0xe67910c8
        DCD      0x00000000
|L1.3920|
        DCD      0x00000100
        DCD      0x00000000
|L1.3928|
        DCD      0xe67910cc
        DCD      0x00000000
|L1.3936|
        DCD      0xe6791100
        DCD      0x00000000
|L1.3944|
        DCD      0x00000240
        DCD      0x00000000
|L1.3952|
        DCD      0xe6791104
        DCD      0x00000000
|L1.3960|
        DCD      0xe6791108
        DCD      0x00000000
|L1.3968|
        DCD      0x000000c0
        DCD      0x00000000
|L1.3976|
        DCD      0xe679110c
        DCD      0x00000000
|L1.3984|
        DCD      0xe6791110
        DCD      0x00000000
|L1.3992|
        DCD      0xe6791114
        DCD      0x00000000
|L1.4000|
        DCD      0xe6791118
        DCD      0x00000000
|L1.4008|
        DCD      0x00000080
        DCD      0x00000000
|L1.4016|
        DCD      0xe679111c
        DCD      0x00000000
|L1.4024|
        DCD      0xe6791120
        DCD      0x00000000
|L1.4032|
        DCD      0xe6791124
        DCD      0x00000000
|L1.4040|
        DCD      0xe6791128
        DCD      0x00000000
|L1.4048|
        DCD      0xe679112c
        DCD      0x00000000
|L1.4056|
        DCD      0x220e110a
        DCD      0x00000000
|L1.4064|
        DCD      0xe6791700
        DCD      0x00000000
|L1.4072|
        DCD      0x0b0d0a0c
        DCD      0x00000000
|L1.4080|
        DCD      0xe6791708
        DCD      0x00000000
|L1.4088|
        DCD      0x111f1fff
        DCD      0x00000000
|L1.4096|
        DCD      0xe679170c
        DCD      0x00000000
|L1.4104|
        DCD      0xe6790000
        DCD      0x00000000
|L1.4112|
        DCD      0xe6790004
        DCD      0x00000000
|L1.4120|
        DCD      0xe6790008
        DCD      0x00000000
|L1.4128|
        DCD      0xe679000c
        DCD      0x00000000
|L1.4136|
        DCD      0x00000041
        DCD      0x00000000
|L1.4144|
        DCD      0xe6790014
        DCD      0x00000000
|L1.4152|
        DCD      0x00000011
        DCD      0x00000000
|L1.4160|
        DCD      0xe6790604
        DCD      0x00000000
|L1.4168|
        DCD      0xe6790644
        DCD      0x00000000
|L1.4176|
        DCD      0xe6790684
        DCD      0x00000000
|L1.4184|
        DCD      0xe67906c4
        DCD      0x00000000
|L1.4192|
        DCD      0x0000cf01
        DCD      0x00000000
|L1.4200|
        DCD      0xe679061c
        DCD      0x00000000
|L1.4208|
        DCD      0xe679065c
        DCD      0x00000000
|L1.4216|
        DCD      0xe679069c
        DCD      0x00000000
|L1.4224|
        DCD      0xe67906dc
        DCD      0x00000000
|L1.4232|
        DCD      0xe6790600
        DCD      0x00000000
|L1.4240|
        DCD      0xe6790640
        DCD      0x00000000
|L1.4248|
        DCD      0xe6790680
        DCD      0x00000000
|L1.4256|
        DCD      0xe67906c0
        DCD      0x00000000
|L1.4264|
        DCD      0x08840000
        DCD      0x00000000
|L1.4272|
        DCD      0xe6790208
        DCD      0x00000000
|L1.4280|
        DCD      0x08840001
|L1.4284|
        DCD      0x01840001
|L1.4288|
        DCD      0x0e840aff
|L1.4292|
        DCD      0x0e840154
|L1.4296|
        DCD      0x0e84022e
|L1.4300|
        DCD      0x0d84004f
|L1.4304|
        DCD      0x0d840051
|L1.4308|
        DCD      0x70000100
|L1.4312|
        DCD      0xe6790804
        DCD      0x00000000
|L1.4320|
        DCD      0x18010001
        DCD      0x00000000
|L1.4328|
        DCD      0xe6790800
        DCD      0x00000000
|L1.4336|
        DCD      0x00081860
        DCD      0x00000000
|L1.4344|
        DCD      0xe6790414
        DCD      0x00000000
|L1.4352|
        DCD      0x00010000
        DCD      0x00000000
|L1.4360|
        DCD      0xe6790418
        DCD      0x00000000
|L1.4368|
        DCD      0xe6790204
        DCD      0x00000000
|L1.4376|
        DCD      0x0000a55a
        DCD      0x00000000
|L1.4384|
        DCD      0xe6790620
        DCD      0x00000000
|L1.4392|
        DCD      0xe6790660
        DCD      0x00000000
|L1.4400|
        DCD      0xe67906a0
        DCD      0x00000000
|L1.4408|
        DCD      0xe67906e0
        DCD      0x00000000
|L1.4416|
        DCD      0xe6790200
        DCD      0x00000000
|L1.4424|
        DCD      0xe67f0024
        DCD      0x00000000
|L1.4432|
        DCD      0xe67f0018
        DCD      0x00000000
|L1.4440|
        DCD      0xe6798100
        DCD      0x00000000
|L1.4448|
        DCD      0xe6798108
        DCD      0x00000000
|L1.4456|
        DCD      0xe6798020
        DCD      0x00000000
|L1.4464|
        DCD      0xe6798024
        DCD      0x00000000
|L1.4472|
        DCD      0xe6798030
        DCD      0x00000000
|L1.4480|
        DCD      0xe6798070
        DCD      0x00000000
|L1.4488|
        DCD      0xe6798034
        DCD      0x00000000
|L1.4496|
        DCD      0xe6798074
        DCD      0x00000000
|L1.4504|
        DCD      0xe6798040
        DCD      0x00000000
|L1.4512|
        DCD      0xe6798080
        DCD      0x00000000
|L1.4520|
        DCD      0xe6798044
        DCD      0x00000000
|L1.4528|
        DCD      0xe6798084
        DCD      0x00000000
|L1.4536|
        DCD      0xe6798104
        DCD      0x00000000
|L1.4544|
        DCD      0xe6798010
        DCD      0x00000000
|L1.4552|
        DCD      0xe6798300
        DCD      0x00000000
|L1.4560|
        DCD      0xe6798304
        DCD      0x00000000
|L1.4568|
        DCD      0xe679830c
        DCD      0x00000000
|L1.4576|
        DCD      0xe6798310
        DCD      0x00000000
|L1.4584|
        DCD      0xe6798314
        DCD      0x00000000
|L1.4592|
        DCD      0xe6798318
        DCD      0x00000000
|L1.4600|
        DCD      0xe679831c
        DCD      0x00000000
|L1.4608|
        DCD      0xe6798320
        DCD      0x00000000
|L1.4616|
        DCD      0xe6798324
        DCD      0x00000000
|L1.4624|
        DCD      0xe6798328
        DCD      0x00000000
|L1.4632|
        DCD      0xe679832c
        DCD      0x00000000
|L1.4640|
        DCD      0xe6798330
        DCD      0x00000000
|L1.4648|
        DCD      0xe6798334
        DCD      0x00000000
|L1.4656|
        DCD      0xe6798338
        DCD      0x00000000
|L1.4664|
        DCD      0xe679833c
        DCD      0x00000000
|L1.4672|
        DCD      0xe6798340
        DCD      0x00000000
|L1.4680|
        DCD      0xe6798344
        DCD      0x00000000
|L1.4688|
        DCD      0xe6798350
        DCD      0x00000000
|L1.4696|
        DCD      0xe6798354
        DCD      0x00000000
|L1.4704|
        DCD      0xe6798358
        DCD      0x00000000
|L1.4712|
        DCD      0xe679835c
        DCD      0x00000000
|L1.4720|
        DCD      0xe6798400
        DCD      0x00000000
|L1.4728|
        DCD      0xe6798404
        DCD      0x00000000
|L1.4736|
        DCD      0xe6798438
        DCD      0x00000000
|L1.4744|
        DCD      0xe679843c
        DCD      0x00000000
|L1.4752|
        DCD      0xe6798440
        DCD      0x00000000
|L1.4760|
        DCD      0xe6798444
        DCD      0x00000000
|L1.4768|
        DCD      0xe6798904
        DCD      0x00000000
|L1.4776|
        DCD      0xe6798908
        DCD      0x00000000
|L1.4784|
        DCD      0xe679890c
        DCD      0x00000000
|L1.4792|
        DCD      0xe6799000
        DCD      0x00000000
|L1.4800|
        DCD      0xe6799004
        DCD      0x00000000
|L1.4808|
        DCD      0xe6799010
        DCD      0x00000000
|L1.4816|
        DCD      0xe6799020
        DCD      0x00000000
|L1.4824|
        DCD      0xe6799024
        DCD      0x00000000
|L1.4832|
        DCD      0xe6799030
        DCD      0x00000000
|L1.4840|
        DCD      0xe6799034
        DCD      0x00000000
|L1.4848|
        DCD      0xe6799038
        DCD      0x00000000
|L1.4856|
        DCD      0xe679903c
        DCD      0x00000000
|L1.4864|
        DCD      0xe6799070
        DCD      0x00000000
|L1.4872|
        DCD      0xe6799074
        DCD      0x00000000
|L1.4880|
        DCD      0xe6799078
        DCD      0x00000000
|L1.4888|
        DCD      0xe679907c
        DCD      0x00000000
|L1.4896|
        DCD      0xe67990c0
        DCD      0x00000000
|L1.4904|
        DCD      0xe67990c4
        DCD      0x00000000
|L1.4912|
        DCD      0xe67990c8
        DCD      0x00000000
|L1.4920|
        DCD      0xe67990cc
        DCD      0x00000000
|L1.4928|
        DCD      0xe6799100
        DCD      0x00000000
|L1.4936|
        DCD      0xe6799104
        DCD      0x00000000
|L1.4944|
        DCD      0xe6799108
        DCD      0x00000000
|L1.4952|
        DCD      0xe679910c
        DCD      0x00000000
|L1.4960|
        DCD      0xe6799110
        DCD      0x00000000
|L1.4968|
        DCD      0xe6799114
        DCD      0x00000000
|L1.4976|
        DCD      0xe6799118
        DCD      0x00000000
|L1.4984|
        DCD      0xe679911c
        DCD      0x00000000
|L1.4992|
        DCD      0xe6799120
        DCD      0x00000000
|L1.5000|
        DCD      0xe6799124
        DCD      0x00000000
|L1.5008|
        DCD      0xe6799128
        DCD      0x00000000
|L1.5016|
        DCD      0xe679912c
        DCD      0x00000000
|L1.5024|
        DCD      0xe6799700
        DCD      0x00000000
|L1.5032|
        DCD      0xe6799708
        DCD      0x00000000
|L1.5040|
        DCD      0xe679970c
        DCD      0x00000000
|L1.5048|
        DCD      0xe6798000
        DCD      0x00000000
|L1.5056|
        DCD      0xe6798004
        DCD      0x00000000
|L1.5064|
        DCD      0xe6798008
        DCD      0x00000000
|L1.5072|
        DCD      0xe679800c
        DCD      0x00000000
|L1.5080|
        DCD      0xe6798014
        DCD      0x00000000
|L1.5088|
        DCD      0xe6798604
        DCD      0x00000000
|L1.5096|
        DCD      0xe6798644
        DCD      0x00000000
|L1.5104|
        DCD      0xe6798684
        DCD      0x00000000
|L1.5112|
        DCD      0xe67986c4
        DCD      0x00000000
|L1.5120|
        DCD      0xe679861c
        DCD      0x00000000
|L1.5128|
        DCD      0xe679865c
        DCD      0x00000000
|L1.5136|
        DCD      0xe679869c
        DCD      0x00000000
|L1.5144|
        DCD      0xe67986dc
        DCD      0x00000000
|L1.5152|
        DCD      0xe6798600
        DCD      0x00000000
|L1.5160|
        DCD      0xe6798640
        DCD      0x00000000
|L1.5168|
        DCD      0xe6798680
        DCD      0x00000000
|L1.5176|
        DCD      0xe67986c0
        DCD      0x00000000
|L1.5184|
        DCD      0xe6798208
        DCD      0x00000000
|L1.5192|
        DCD      0xe6798804
        DCD      0x00000000
|L1.5200|
        DCD      0xe6798800
        DCD      0x00000000
|L1.5208|
        DCD      0xe6798414
        DCD      0x00000000
|L1.5216|
        DCD      0xe6798418
        DCD      0x00000000
|L1.5224|
        DCD      0xe6798204
        DCD      0x00000000
|L1.5232|
        DCD      0xe6798620
        DCD      0x00000000
|L1.5240|
        DCD      0xe6798660
        DCD      0x00000000
|L1.5248|
        DCD      0xe67986a0
        DCD      0x00000000
|L1.5256|
        DCD      0xe67986e0
        DCD      0x00000000
|L1.5264|
        DCD      0xe6798200
        DCD      0x00000000
||$Ven$XX$L$$__ddr_init||                  ; Alternate entry point
|L1.5272|
        LDR      x16,|L1.5280|
        BR       x16
|L1.5280|
        DCD      0x400012e0
        DCD      0x00000000
||$Ven$XX$L$$__scatterload||                  ; Alternate entry point
|L1.5288|
        LDR      x16,|L1.5296|
        BR       x16
|L1.5296|
        DCD      0x400004c0
        DCD      0x00000000
||$Ven$XX$L$$__rt_lib_init||                  ; Alternate entry point
|L1.5304|
        LDR      x16,|L1.5312|
        BR       x16
|L1.5312|
        DCD      0x40000440
        DCD      0x00000000
||$Ven$XX$L$$main||                  ; Alternate entry point
|L1.5320|
        LDR      x16,|L1.5328|
        BR       x16
|L1.5328|
        DCD      0x40002440
        DCD      0x00000000
||$Ven$XX$L$$exit||                  ; Alternate entry point
|L1.5336|
        LDR      x16,|L1.5344|
        BR       x16
|L1.5344|
        DCD      0x40000490
        DCD      0x00000000
||Region$$Table$$Base||
        DCD      0x40009e28
        DCD      0x00000000
        DCD      0x40009e28
        DCD      0x00000000
        DCD      0x00000b48
        DCD      0x00000000
        DCD      0x40000520
        DCD      0x00000000
||Region$$Table$$Limit||

        AREA ER10, CODE, READONLY, ALIGN=7

__vectors_start                  ; Alternate entry point
        B        |L2.1024|
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
        B        |L2.1032|
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
        B        |L2.1040|
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
        B        |L2.1048|
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
        B        |L2.1056|
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
        B        |L2.1064|
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
        B        |L2.1072|
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
        B        |L2.1080|
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
|L2.1024|
        BL       |L2.4816|
        ERET     
|L2.1032|
        BL       |L2.4672|
        ERET     
|L2.1040|
        BL       |L2.4592|
        ERET     
|L2.1048|
        B        |L2.1048|
        ERET     
|L2.1056|
        BL       |L2.4816|
        ERET     
|L2.1064|
        BL       |L2.4672|
        ERET     
|L2.1072|
        BL       |L2.4592|
        ERET     
|L2.1080|
        B        |L2.1080|
        ERET     
__rt_lib_init                  ; Alternate entry point
        STP      x21,x30,[sp,#-0x10]!
        STP      x2,x3,[sp,#-0x10]!
        STP      x0,x1,[sp,#-0x10]!
__rt_lib_init_fp_1                  ; Alternate entry point
        BL       |L2.1148|
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
        LDP      x0,x1,[sp],#0x10
        LDP      x2,x3,[sp],#0x10
        LDP      x21,x30,[sp],#0x10
        RET      
__rt_lib_shutdown                  ; Alternate entry point
|L2.1120|
        STP      x21,x30,[sp,#-0x10]!
__rt_lib_shutdown_cpp_1                  ; Alternate entry point
__rt_lib_shutdown_fp_trap_1                  ; Alternate entry point
__rt_lib_shutdown_heap_1                  ; Alternate entry point
__rt_lib_shutdown_return                  ; Alternate entry point
__rt_lib_shutdown_signal_1                  ; Alternate entry point
__rt_lib_shutdown_stdio_1                  ; Alternate entry point
__rt_lib_shutdown_user_alloc_1                  ; Alternate entry point
        LDP      x21,x30,[sp],#0x10
        RET      
__rt_exit                  ; Alternate entry point
|L2.1132|
        STP      x0,x1,[sp,#-0x10]!
__rt_exit_ls                  ; Alternate entry point
__rt_exit_prels_1                  ; Alternate entry point
        BL       |L2.1120|
__rt_exit_exit                  ; Alternate entry point
        LDP      x0,x1,[sp],#0x10
        BL       |L2.5040|
_fp_init                  ; Alternate entry point
|L2.1148|
        MOV      x0,#0x3000000
        MSR      FPCR,x0
        ISB      
        RET      
||__semihosting$guard||                  ; Alternate entry point
__use_no_semihosting_swi                  ; Alternate entry point
        RET      
exit                  ; Alternate entry point
        SUB      sp,sp,#0x20
        STR      x30,[sp,#0x10]
        STP      x19,x29,[sp,#0]
        ADD      x29,sp,#8
        MOV      w19,w0
        NOP      
        MOV      w0,w19
        LDP      x19,x29,[sp,#0]
        LDR      x30,[sp,#0x10]
        ADD      sp,sp,#0x20
        B        |L2.1132|
        DCI      0x00000000 ; ? Undefined
__scatterload                  ; Alternate entry point
__scatterload_rt2                  ; Alternate entry point
        LDR      x0,|L2.1296|
        MOV      x19,x0
        SUB      x20,x19,#1
        LDR      x21,|L2.1304|
|L2.1232|
        CMP      x19,x21
        B.CC     |L2.1244|
        BL       |L2.27824|
|L2.1244|
        LDR      x3,[x19,#0x18]
        AND      x0,x3,#1
        CMP      x0,#0
        B.EQ     |L2.1264|
        SUB      x3,x20,x3
|L2.1264|
        LDR      x0,[x19,#0]
        LDR      x1,[x19,#8]
        LDR      x2,[x19,#0x10]
        ADD      x19,x19,#0x20
        BLR      x3
        B        |L2.1232|
__scatterload_null                  ; Alternate entry point
        RET      
        DCD      0x00000000
|L2.1296|
        DCD      0x000014e8
        DCD      0x00000000
|L2.1304|
        DCD      0x00001508
        DCD      0x00000000
__scatterload_zeroinit                  ; Alternate entry point
        MOV      w0,#0
        B        |L2.1328|
|L2.1320|
        STR      w0,[x1],#4
        SUB      x2,x2,#4
|L2.1328|
        CMP      x2,#0
        B.NE     |L2.1320|
        RET      
        DCI      0x00000000 ; ? Undefined
CPG_ClearBit                  ; Alternate entry point
|L2.1344|
        LDR      w8,[x0,#0]
        AND      w9,w1,#0xff
        ORR      w10,wzr,#1
        LSL      w9,w10,w9
        BIC      w8,w8,w9
        MVN      w9,w8
        MOV      w10,#0xe6150000
        STR      w9,[x10,#0]
        STR      w8,[x0,#0]
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
CPG_SetBit                  ; Alternate entry point
|L2.1392|
        LDR      w8,[x0,#0]
        AND      w9,w1,#0xff
        ORR      w10,wzr,#1
        LSL      w9,w10,w9
        ORR      w8,w8,w9
        MVN      w9,w8
        MOV      w10,#0xe6150000
        STR      w9,[x10,#0]
        STR      w8,[x0,#0]
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
DMAC_initDescriptorMemory                  ; Alternate entry point
|L2.1440|
        TST      w1,#0xff
        B.EQ     |L2.1480|
        AND      w8,w1,#0xff
        ADD      x9,x0,#0x80c
|L2.1456|
        STUR     wzr,[x9,#-0xc]
        STUR     wzr,[x9,#-8]
        STUR     wzr,[x9,#-4]
        STR      wzr,[x9],#0x10
        SUBS     x8,x8,#1
        B.NE     |L2.1456|
|L2.1480|
        RET      
        DCI      0x00000000 ; ? Undefined
GIC_defaultHandler                  ; Alternate entry point
|L2.1488|
        B        |L2.1488|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
GIC_enable                  ; Alternate entry point
|L2.1504|
        MOV      w0,#0
        MSR      DAIF,x0
        ISB      
        MOV      w8,#0xf1000000
        ORR      w9,wzr,#0x30
        MOV      w10,#0x37
        STR      w9,[x8,#0]
        STR      w10,[x8,#0]
        ORR      w9,wzr,#0x1ff0
        STR      w9,[x8,#0x20]
        ORR      w9,wzr,#0x60000
        MOV      w10,#1
        MOVK     w10,#0x700,LSL #16
        STR      w10,[x8,x9]
        MOV      w8,#0x14
        MOVK     w8,#0xf106,LSL #16
        ORR      w9,wzr,#2
        STR      w9,[x8,#0x10]
|L2.1576|
        LDR      w9,[x8,#0x10]
        TBNZ     w9,#0,|L2.1576|
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
|L2.1596|
        LDR      w9,[x8,#0]
        TBNZ     w9,#2,|L2.1596|
        MOV      x0,#0xf
        MSR      ICC_SRE_EL3,x0
        ISB      
        MSR      ICC_SRE_EL1,x0
        ISB      
        MOV      w0,#1
        MSR      ICC_IGRPEN0_EL1,x0
        ISB      
        MRS      x0,ICC_IGRPEN1_EL3
        ORR      w0,w0,#1
        MSR      ICC_IGRPEN1_EL3,x0
        ISB      
        MOV      x0,#0xff
        MSR      ICC_PMR_EL1,x0
        RET      
GIC_enableInterrupt                  ; Alternate entry point
|L2.1664|
        MOV      w8,#0x80
        MOVK     w8,#0xf100,LSL #16
        ADD      w9,w0,w8
        LSL      w10,w0,#3
        MOV      w11,#0x6000
        MOVK     w11,#0xf100,LSL #16
        ADD      w11,w10,w11
        STR      xzr,[x11,#0]
        LSR      w11,w0,#3
        AND      w11,w11,#0x1ffffffc
        AND      w12,w0,#0x1f
        ADD      w11,w11,w8
        ORR      w13,wzr,#1
        LSL      w12,w13,w12
        LDR      w14,[x11,#0]
        ORR      w14,w14,w12
        STR      w14,[x11,#0]
        ADD      w14,w11,#0xc80
        LDR      w15,[x14,#0]
        BIC      w15,w15,w12
        STR      w15,[x14,#0]
        AND      w10,w10,#0x18
        ADD      w9,w9,#0x380
        AND      w9,w9,#0xfffffffc
        LSL      w10,w13,w10
        LDR      w14,[x9,#0]
        BIC      w10,w14,w10
        STR      w10,[x9,#0]
        LSR      w9,w0,#2
        AND      w9,w9,#0x3ffffffc
        UBFIZ    w10,w0,#1,#4
        ADD      w8,w9,w8
        ADD      w8,w8,#0xb80
        LSL      w9,w13,w10
        LDR      w10,[x8,#0]
        ORR      w9,w10,w9
        STR      w9,[x8,#0]
        ADD      w8,w11,#0x80
        LDR      w9,[x8,#0]
        ORR      w9,w9,w12
        STR      w9,[x8,#0]
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
GIC_endInterrupt                  ; Alternate entry point
|L2.1840|
        MSR      ICC_EOIR1_EL1,x0
        DSB      SY
        RET      
        DCI      0x00000000 ; ? Undefined
GIC_executeInterruptHandler                  ; Alternate entry point
|L2.1856|
        CMP      w0,#0x3c8
        B.LS     |L2.1868|
        RET      
|L2.1868|
        ADRP     x8,|L2.30540|
        ADD      x8,x8,#0xed8
        LDR      x0,[x8,w0,UXTW #3]
        BR       x0
        DCI      0x00000000 ; ? Undefined
GIC_getACKID                  ; Alternate entry point
|L2.1888|
        STP      x19,x30,[sp,#-0x10]!
        MRS      x19,ICC_IAR1_EL1
        DSB      SY
        MOV      w0,w19
        BL       |L2.1840|
        MOV      w0,w19
        LDP      x19,x30,[sp],#0x10
        RET      
GIC_setInterruptHandler                  ; Alternate entry point
|L2.1920|
        ADRP     x8,|L2.30592|
        ADD      x8,x8,#0xed8
        STR      x1,[x8,w0,UXTW #3]
        RET      
I2C_configPins                  ; Alternate entry point
|L2.1936|
        MOV      w8,#0x800
        MOVK     w8,#0xe605,LSL #16
        ADD      x1,x8,#0x100
        MOV      w0,#0x800
        MOVK     w0,#0xe605,LSL #16
        ORR      w2,wzr,#0xfffc
        B        |L2.4640|
        DCI      0x00000000 ; ? Undefined
I2C_masterClearInterruptStatus                  ; Alternate entry point
|L2.1968|
        LDR      w8,[x0,#0xc]
        BIC      w8,w8,w1
        STR      w8,[x0,#0xc]
        RET      
I2C_masterDisable                  ; Alternate entry point
|L2.1984|
        LDR      w8,[x0,#4]
        AND      w8,w8,#0xfffffff7
        STR      w8,[x0,#4]
        RET      
I2C_masterDisableDMAReceive                  ; Alternate entry point
|L2.2000|
        LDR      w8,[x0,#0x3c]
        AND      w8,w8,#0xfffffffd
        STR      w8,[x0,#0x3c]
        RET      
I2C_masterDisableDMATransmit                  ; Alternate entry point
|L2.2016|
        LDR      w8,[x0,#0x3c]
        AND      w8,w8,#0xfffffffe
        STR      w8,[x0,#0x3c]
        RET      
I2C_masterDisableStartByteTransmit                  ; Alternate entry point
|L2.2032|
        LDR      w8,[x0,#4]
        AND      w8,w8,#0xfffffffb
        STR      w8,[x0,#4]
        RET      
I2C_masterDisableStartGeneration                  ; Alternate entry point
|L2.2048|
        LDR      w8,[x0,#4]
        AND      w8,w8,#0xfffffffe
        STR      w8,[x0,#4]
        RET      
I2C_masterEnable                  ; Alternate entry point
|L2.2064|
        LDR      w8,[x0,#4]
        ORR      w8,w8,#8
        STR      w8,[x0,#4]
        RET      
I2C_masterEnableDMAContinuousReceive                  ; Alternate entry point
|L2.2080|
        LDR      w8,[x0,#0x3c]
        ORR      w8,w8,#0x40
        STR      w8,[x0,#0x3c]
        RET      
I2C_masterEnableDMAReceive                  ; Alternate entry point
|L2.2096|
        LDR      w8,[x0,#0x3c]
        ORR      w8,w8,#2
        STR      w8,[x0,#0x3c]
        RET      
I2C_masterEnableDMATransmit                  ; Alternate entry point
|L2.2112|
        LDR      w8,[x0,#0x3c]
        ORR      w8,w8,#1
        STR      w8,[x0,#0x3c]
        RET      
I2C_masterEnableInterrupt                  ; Alternate entry point
|L2.2128|
        LDR      w8,[x0,#0x14]
        ORR      w8,w8,w1
        STR      w8,[x0,#0x14]
        RET      
I2C_masterGetInterruptStatus                  ; Alternate entry point
|L2.2144|
        LDR      w8,[x0,#0xc]
        AND      w0,w8,#0xff
        RET      
        DCI      0x00000000 ; ? Undefined
I2C_masterInit                  ; Alternate entry point
|L2.2160|
        LDRB     w8,[x1,#4]
        LDR      w9,[x1,#0]
        ORR      w8,w9,w8,LSL #1
        STR      w8,[x0,#0x20]
        LDR      w8,[x1,#8]
        CMP      w8,#1
        ORR      w8,wzr,#0x80
        MOV      w9,#0x84
        CSEL     w8,w9,w8,EQ
        STR      w8,[x0,#4]
        LDR      w8,[x1,#0xc]
        CMP      w8,#1
        B.EQ     |L2.2272|
        CBNZ     w8,|L2.2360|
        LDR      w8,[x1,#0x10]
        CMP      w8,#1
        B.EQ     |L2.2420|
        CBNZ     w8,|L2.2360|
        LDR      w8,[x0,#0x28]
        AND      w8,w8,#0xfffffff8
        STR      w8,[x0,#0x28]
        LDR      w8,[x1,#0x14]
        CMP      w8,#6
        B.HI     |L2.2372|
        ADRP     x9,|L2.26832|
        ADD      x9,x9,#0xd68
        LDR      x8,[x9,x8,LSL #3]
        BR       x8
|L2.2272|
        LDR      w8,[x1,#0x10]
        CMP      w8,#1
        B.EQ     |L2.2476|
        CBNZ     w8,|L2.2360|
        LDR      w8,[x0,#0x28]
        AND      w8,w8,#0xfffffff8
        STR      w8,[x0,#0x28]
        LDR      w8,[x1,#0x14]
        CMP      w8,#6
        B.HI     |L2.2372|
        ADRP     x9,|L2.26888|
        ADD      x9,x9,#0xcf8
        LDR      x8,[x9,x8,LSL #3]
        BR       x8
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        MOV      w9,#0x2c
        BFI      w8,w9,#3,#6
        B        |L2.2400|
|L2.2360|
        LDR      w8,[x0,#0x28]
        AND      w8,w8,#0xfffffff8
        STR      w8,[x0,#0x28]
|L2.2372|
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        ORR      w8,w8,#0x18
|L2.2400|
        STR      w8,[x0,#0x18]
        STR      wzr,[x0,#0x2c]
        STR      wzr,[x0,#0x30]
        STR      wzr,[x0,#0x34]
        RET      
|L2.2420|
        LDR      w8,[x0,#0x28]
        ORR      w8,w8,#7
        STR      w8,[x0,#0x28]
        LDR      w8,[x0,#0x38]
        AND      w8,w8,#0xffffffe0
        ORR      w8,w8,#0xf
        STR      w8,[x0,#0x38]
        LDR      w8,[x1,#0x14]
        CMP      w8,#6
        B.HI     |L2.2588|
        ADRP     x9,|L2.27036|
        ADD      x9,x9,#0xd30
        LDR      x8,[x9,x8,LSL #3]
        BR       x8
|L2.2476|
        LDR      w8,[x0,#0x28]
        ORR      w8,w8,#7
        STR      w8,[x0,#0x28]
        LDR      w8,[x0,#0x38]
        AND      w8,w8,#0xffffffe0
        ORR      w8,w8,#0xf
        STR      w8,[x0,#0x38]
        LDR      w8,[x1,#0x14]
        CMP      w8,#6
        B.HI     |L2.2588|
        ADRP     x9,|L2.27092|
        ADD      x9,x9,#0xcc0
        LDR      x8,[x9,x8,LSL #3]
        BR       x8
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        STR      w8,[x0,#0x18]
        ORR      w8,wzr,#0x1c
        MOV      w9,#0x501
        STR      w8,[x0,#0x2c]
        STR      w9,[x0,#0x30]
        MOV      w8,#0x514
        STR      w8,[x0,#0x34]
        RET      
|L2.2588|
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        STR      w8,[x0,#0x18]
        ORR      w8,wzr,#0x1c
        MOV      w9,#0x73
        STR      w8,[x0,#0x2c]
        STR      w9,[x0,#0x30]
        MOV      w8,#0x85
        STR      w8,[x0,#0x34]
        RET      
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        MOV      w9,#0x14
        BFI      w8,w9,#3,#6
        B        |L2.2400|
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        MOV      w9,#9
        BFI      w8,w9,#3,#6
        B        |L2.2400|
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        ORR      w8,w8,#0x38
        B        |L2.2400|
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        MOV      w9,#5
        BFI      w8,w9,#3,#6
        B        |L2.2400|
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        ORR      w8,w8,#0x18
        STR      w8,[x0,#0x18]
        STR      wzr,[x0,#0x2c]
        STR      wzr,[x0,#0x30]
        STR      wzr,[x0,#0x34]
        B        |L2.3096|
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        STR      w8,[x0,#0x18]
        ORR      w8,wzr,#0x1c
        MOV      w9,#0x267
        STR      w8,[x0,#0x2c]
        STR      w9,[x0,#0x30]
        MOV      w8,#0x279
        STR      w8,[x0,#0x34]
        RET      
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        STR      w8,[x0,#0x18]
        ORR      w8,wzr,#0x1c
        MOV      w9,#0x119
        STR      w8,[x0,#0x2c]
        STR      w9,[x0,#0x30]
        MOV      w8,#0x12c
        STR      w8,[x0,#0x34]
        RET      
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        STR      w8,[x0,#0x18]
        ORR      w8,wzr,#0x1c
        MOV      w9,#0xd7
        STR      w8,[x0,#0x2c]
        STR      w9,[x0,#0x30]
        MOV      w8,#0xe9
        STR      w8,[x0,#0x34]
        RET      
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        STR      w8,[x0,#0x18]
        ORR      w8,wzr,#0x1c
        MOV      w9,#0xaa
        STR      w8,[x0,#0x2c]
        STR      w9,[x0,#0x30]
        MOV      w8,#0xbd
        STR      w8,[x0,#0x34]
        RET      
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        STR      w8,[x0,#0x18]
        MOV      w8,#0x1b
        STR      w8,[x0,#0x2c]
        ORR      w8,wzr,#0x20
        STR      w8,[x0,#0x30]
        MOV      w8,#0x27
        STR      w8,[x0,#0x34]
|L2.3096|
        LDR      w8,[x0,#0x28]
        ORR      w8,w8,#0x80
        STR      w8,[x0,#0x28]
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
I2C_masterReceiveMultipleByteFinish                  ; Alternate entry point
|L2.3120|
        LDR      w8,[x0,#0x24]
        AND      w0,w8,#0xff
        RET      
        DCI      0x00000000 ; ? Undefined
I2C_masterReceiveMultipleByteNext                  ; Alternate entry point
|L2.3136|
        LDR      w8,[x0,#0x24]
        AND      w0,w8,#0xff
        RET      
        DCI      0x00000000 ; ? Undefined
I2C_masterReceiveMultipleByteStop                  ; Alternate entry point
|L2.3152|
        LDR      w8,[x0,#4]
        ORR      w8,w8,#2
        STR      w8,[x0,#4]
        LDR      w8,[x0,#0x24]
        AND      w0,w8,#0xff
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
I2C_masterReceiveStart                  ; Alternate entry point
|L2.3184|
        LDR      w8,[x0,#4]
        ORR      w8,w8,#1
        STR      w8,[x0,#4]
        RET      
I2C_masterRestart                  ; Alternate entry point
|L2.3200|
        AND      w8,w1,#0xff
        ORR      w8,w2,w8,LSL #1
        STR      w8,[x0,#0x20]
        LDR      w8,[x0,#4]
        ORR      w8,w8,#1
        STR      w8,[x0,#4]
        RET      
        DCI      0x00000000 ; ? Undefined
I2C_masterSendMultipleByteNext                  ; Alternate entry point
|L2.3232|
        STR      w1,[x0,#0x24]
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
I2C_masterSendMultipleByteStart                  ; Alternate entry point
|L2.3248|
        STR      w1,[x0,#0x24]
        LDR      w8,[x0,#4]
        ORR      w8,w8,#1
        STR      w8,[x0,#4]
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
I2C_masterSendMultipleByteStop                  ; Alternate entry point
|L2.3280|
        LDR      w8,[x0,#4]
        ORR      w8,w8,#2
        STR      w8,[x0,#4]
        RET      
I2C_masterSetDMAContinuousReceiveBlockCount                  ; Alternate entry point
|L2.3296|
        AND      w8,w1,#0xff
        LDR      w9,[x0,#0x3c]
        BFI      w9,w8,#16,#8
        STR      w9,[x0,#0x3c]
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
I2C_masterSetDMAContinuousTransferCount                  ; Alternate entry point
|L2.3328|
        LDR      w8,[x0,#0x3c]
        BFI      w8,w1,#24,#8
        STR      w8,[x0,#0x3c]
        RET      
I2C_modelConnect                  ; Alternate entry point
|L2.3344|
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
I2C_modelDisable                  ; Alternate entry point
|L2.3360|
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
I2C_releasePins                  ; Alternate entry point
|L2.3376|
        MOV      w8,#0x800
        MOVK     w8,#0xe605,LSL #16
        ADD      x1,x8,#0x100
        MOV      w0,#0x800
        MOVK     w0,#0xe605,LSL #16
        ORR      w2,wzr,#0xfffc
        B        |L2.4608|
        DCI      0x00000000 ; ? Undefined
I2C_slaveClearInterruptStatus                  ; Alternate entry point
|L2.3408|
        LDR      w8,[x0,#8]
        BIC      w8,w8,w1
        STR      w8,[x0,#8]
        RET      
I2C_slaveDisable                  ; Alternate entry point
|L2.3424|
        LDR      w8,[x0,#0]
        AND      w8,w8,#0xfffffffb
        STR      w8,[x0,#0]
        RET      
I2C_slaveDisableDMAReceive                  ; Alternate entry point
|L2.3440|
        LDR      w8,[x0,#0x3c]
        AND      w8,w8,#0xfffffff7
        STR      w8,[x0,#0x3c]
        RET      
I2C_slaveDisableDMATransmit                  ; Alternate entry point
|L2.3456|
        LDR      w8,[x0,#0x3c]
        AND      w8,w8,#0xfffffffb
        STR      w8,[x0,#0x3c]
        RET      
I2C_slaveEnable                  ; Alternate entry point
|L2.3472|
        LDR      w8,[x0,#0]
        ORR      w8,w8,#4
        STR      w8,[x0,#0]
        RET      
I2C_slaveEnableDMAReceive                  ; Alternate entry point
|L2.3488|
        LDR      w8,[x0,#0x3c]
        ORR      w8,w8,#8
        STR      w8,[x0,#0x3c]
        RET      
I2C_slaveEnableDMATransmit                  ; Alternate entry point
|L2.3504|
        LDR      w8,[x0,#0x3c]
        ORR      w8,w8,#4
        STR      w8,[x0,#0x3c]
        RET      
I2C_slaveEnableInterrupt                  ; Alternate entry point
|L2.3520|
        LDR      w8,[x0,#0x10]
        ORR      w8,w8,w1
        STR      w8,[x0,#0x10]
        RET      
I2C_slaveGetInterruptStatus                  ; Alternate entry point
|L2.3536|
        LDR      w8,[x0,#8]
        AND      w0,w8,#0xff
        RET      
        DCI      0x00000000 ; ? Undefined
I2C_slaveInit                  ; Alternate entry point
|L2.3552|
        LDRB     w8,[x1,#0]
        STR      w8,[x0,#0x1c]
        LDP      w8,w9,[x1,#4]
        CMP      w8,#1
        ORR      w8,wzr,#8
        ORR      w10,wzr,#0x18
        CSEL     w8,w10,w8,EQ
        ORR      w10,w8,#2
        CMP      w9,#1
        CSEL     w8,w10,w8,EQ
        STR      w8,[x0,#0]
        LDR      w8,[x1,#0xc]
        CMP      w8,#1
        B.EQ     |L2.3668|
        CBNZ     w8,|L2.3756|
        LDR      w8,[x1,#0x10]
        CMP      w8,#1
        B.EQ     |L2.3816|
        CBNZ     w8,|L2.3756|
        LDR      w8,[x0,#0x28]
        AND      w8,w8,#0xfffffff8
        STR      w8,[x0,#0x28]
        LDR      w8,[x1,#0x14]
        CMP      w8,#6
        B.HI     |L2.3768|
        ADRP     x9,|L2.28228|
        ADD      x9,x9,#0xe48
        LDR      x8,[x9,x8,LSL #3]
        BR       x8
|L2.3668|
        LDR      w8,[x1,#0x10]
        CMP      w8,#1
        B.EQ     |L2.3872|
        CBNZ     w8,|L2.3756|
        LDR      w8,[x0,#0x28]
        AND      w8,w8,#0xfffffff8
        STR      w8,[x0,#0x28]
        LDR      w8,[x1,#0x14]
        CMP      w8,#6
        B.HI     |L2.3768|
        ADRP     x9,|L2.28284|
        ADD      x9,x9,#0xdd8
        LDR      x8,[x9,x8,LSL #3]
        BR       x8
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        MOV      w9,#0x2c
        BFI      w8,w9,#3,#6
        B        |L2.3796|
|L2.3756|
        LDR      w8,[x0,#0x28]
        AND      w8,w8,#0xfffffff8
        STR      w8,[x0,#0x28]
|L2.3768|
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        ORR      w8,w8,#0x18
|L2.3796|
        STR      w8,[x0,#0x18]
        STR      wzr,[x0,#0x2c]
        STR      wzr,[x0,#0x30]
        STR      wzr,[x0,#0x34]
        RET      
|L2.3816|
        LDR      w8,[x0,#0x28]
        ORR      w8,w8,#7
        STR      w8,[x0,#0x28]
        LDR      w8,[x0,#0x38]
        AND      w8,w8,#0xffffffe0
        ORR      w8,w8,#0xf
        STR      w8,[x0,#0x38]
        LDR      w8,[x1,#0x14]
        CMP      w8,#6
        B.HI     |L2.3984|
        ADRP     x9,|L2.28432|
        ADD      x9,x9,#0xe10
        LDR      x8,[x9,x8,LSL #3]
        BR       x8
|L2.3872|
        LDR      w8,[x0,#0x28]
        ORR      w8,w8,#7
        STR      w8,[x0,#0x28]
        LDR      w8,[x0,#0x38]
        AND      w8,w8,#0xffffffe0
        ORR      w8,w8,#0xf
        STR      w8,[x0,#0x38]
        LDR      w8,[x1,#0x14]
        CMP      w8,#6
        B.HI     |L2.3984|
        ADRP     x9,|L2.28488|
        ADD      x9,x9,#0xda0
        LDR      x8,[x9,x8,LSL #3]
        BR       x8
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        STR      w8,[x0,#0x18]
        ORR      w8,wzr,#0x1c
        MOV      w9,#0x501
        STR      w8,[x0,#0x2c]
        STR      w9,[x0,#0x30]
        MOV      w8,#0x514
        STR      w8,[x0,#0x34]
        RET      
|L2.3984|
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        STR      w8,[x0,#0x18]
        ORR      w8,wzr,#0x1c
        MOV      w9,#0x73
        STR      w8,[x0,#0x2c]
        STR      w9,[x0,#0x30]
        MOV      w8,#0x85
        STR      w8,[x0,#0x34]
        RET      
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        MOV      w9,#0x14
        BFI      w8,w9,#3,#6
        B        |L2.3796|
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        MOV      w9,#9
        BFI      w8,w9,#3,#6
        B        |L2.3796|
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
|L2.4128|
        ORR      w8,w8,#0x38
        B        |L2.3796|
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
|L2.4144|
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        MOV      w9,#5
        BFI      w8,w9,#3,#6
        B        |L2.3796|
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        ORR      w8,w8,#0x18
        STR      w8,[x0,#0x18]
        STR      wzr,[x0,#0x2c]
        STR      wzr,[x0,#0x30]
        STR      wzr,[x0,#0x34]
        B        |L2.4492|
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        STR      w8,[x0,#0x18]
        ORR      w8,wzr,#0x1c
        MOV      w9,#0x267
        STR      w8,[x0,#0x2c]
        STR      w9,[x0,#0x30]
        MOV      w8,#0x279
        STR      w8,[x0,#0x34]
        RET      
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        STR      w8,[x0,#0x18]
        ORR      w8,wzr,#0x1c
        MOV      w9,#0x119
        STR      w8,[x0,#0x2c]
        STR      w9,[x0,#0x30]
        MOV      w8,#0x12c
        STR      w8,[x0,#0x34]
        RET      
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        STR      w8,[x0,#0x18]
        ORR      w8,wzr,#0x1c
        MOV      w9,#0xd7
        STR      w8,[x0,#0x2c]
        STR      w9,[x0,#0x30]
        MOV      w8,#0xe9
        STR      w8,[x0,#0x34]
        RET      
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        STR      w8,[x0,#0x18]
        ORR      w8,wzr,#0x1c
        MOV      w9,#0xaa
        STR      w8,[x0,#0x2c]
        STR      w9,[x0,#0x30]
        MOV      w8,#0xbd
        STR      w8,[x0,#0x34]
        RET      
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffff8
        ORR      w8,w8,#6
        STR      w8,[x0,#0x18]
        LDR      w8,[x0,#0x18]
        AND      w8,w8,#0xfffffe07
        STR      w8,[x0,#0x18]
        MOV      w8,#0x1b
        STR      w8,[x0,#0x2c]
        ORR      w8,wzr,#0x20
        STR      w8,[x0,#0x30]
        MOV      w8,#0x27
        STR      w8,[x0,#0x34]
|L2.4492|
        LDR      w8,[x0,#0x28]
        ORR      w8,w8,#0x80
        STR      w8,[x0,#0x28]
        RET      
        DCI      0x00000000 ; ? Undefined
I2C_slaveReceiveMultipleByteFinish                  ; Alternate entry point
|L2.4512|
        LDR      w8,[x0,#0x24]
        AND      w0,w8,#0xff
        RET      
        DCI      0x00000000 ; ? Undefined
I2C_slaveReceiveMultipleByteNext                  ; Alternate entry point
|L2.4528|
        LDR      w8,[x0,#0x24]
        AND      w0,w8,#0xff
        RET      
        DCI      0x00000000 ; ? Undefined
I2C_slaveReceiveMultipleByteStop                  ; Alternate entry point
|L2.4544|
        LDR      w8,[x0,#0]
        ORR      w8,w8,#1
        STR      w8,[x0,#0]
        LDR      w8,[x0,#0x24]
        AND      w0,w8,#0xff
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
I2C_slaveSetData                  ; Alternate entry point
|L2.4576|
        AND      w8,w1,#0xff
        STR      w8,[x0,#0x24]
        RET      
        DCI      0x00000000 ; ? Undefined
IRQ_Handler                  ; Alternate entry point
|L2.4592|
        STR      x30,[sp,#-0x10]!
        BL       |L2.1888|
        LDR      x30,[sp],#0x10
        B        |L2.1856|
PFC_ClearMultipleBit                  ; Alternate entry point
|L2.4608|
        LDR      w8,[x1,#0]
        BIC      w8,w8,w2
        MVN      w9,w8
        STR      w9,[x0,#0]
        STR      w8,[x1,#0]
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
PFC_SetMultipleBit                  ; Alternate entry point
|L2.4640|
        LDR      w8,[x1,#0]
        ORR      w8,w8,w2
        MVN      w9,w8
        STR      w9,[x0,#0]
        STR      w8,[x1,#0]
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
SError_Handler                  ; Alternate entry point
|L2.4672|
        STR      x30,[sp,#-0x10]!
        BL       |L2.4800|
|L2.4680|
        B        |L2.4680|
        DCI      0x00000000 ; ? Undefined
Sim_Delay                  ; Alternate entry point
|L2.4688|
        CBZ      w0,|L2.4700|
|L2.4692|
        SUBS     w0,w0,#1
        B.NE     |L2.4692|
|L2.4700|
        RET      
Sim_Dump                  ; Alternate entry point
|L2.4704|
        ADRP     x8,|L3.5000|
        LDR      w9,[x8,#0xe28]
        LSL      x9,x9,#2
        ORR      w10,wzr,#0x4000000
        STR      w0,[x9,x10]
        LDR      w9,[x8,#0xe28]
        ADD      w9,w9,#1
        STR      w9,[x8,#0xe28]
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
Sim_Judge                  ; Alternate entry point
|L2.4752|
        CMP      w0,#1
        B.EQ     |L2.4776|
        CBNZ     w0,|L2.4776|
        MOV      w0,#0xebbe
|L2.4768|
        MOVK     w0,#0xebbe,LSL #16
        B        |L2.4704|
|L2.4776|
        MOV      w0,#0xadde
        MOVK     w0,#0xadde,LSL #16
|L2.4784|
        B        |L2.4704|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
Sim_Stop                  ; Alternate entry point
|L2.4800|
        ORR      w8,wzr,#0x7f00000
        STR      wzr,[x8,#0]
        RET      
        DCI      0x00000000 ; ? Undefined
Synchronous_Handler                  ; Alternate entry point
|L2.4816|
        STR      x30,[sp,#-0x10]!
        BL       |L2.4800|
|L2.4824|
        B        |L2.4824|
        DCI      0x00000000 ; ? Undefined
__ddr_init                  ; Alternate entry point
        MOV      w8,#0x60
        MOVK     w8,#0xe735,LSL #16
        MOV      w9,#0xc
        MOVK     w9,#0xe730,LSL #16
        ADRP     x10,|L1.752|
        ADD      x10,x10,#0xa0
        STUR     w10,[x9,#-0xc]
        ADRP     x10,|L3.5156|
        LDR      x11,[x10,#0xd20]
        STUR     w11,[x9,#-8]
        LDUR     w11,[x9,#-4]
        AND      w11,w11,#0xff000000
        ORR      w11,w11,#1
        STUR     w11,[x9,#-4]
        LDR      w11,[x9,#0]
        AND      w11,w11,#0xffff3fff
        ORR      w11,w11,#0x4000
        STR      w11,[x9,#0]
        LDR      w11,[x9,#0]
        AND      w11,w11,#0xffffcfff
        ORR      w11,w11,#0x1000
        STR      w11,[x9,#0]
        LDR      w11,[x9,#0]
        AND      w11,w11,#0xfffff0ff
        ORR      w11,w11,#0x400
        STR      w11,[x9,#0]
        LDR      w11,[x9,#0]
        AND      w11,w11,#0xffffffe7
        ORR      w11,w11,#8
        STR      w11,[x9,#0]
        LDR      w11,[x9,#0]
        AND      w11,w11,#0xffcfffff
        ORR      w11,w11,#0x100000
        STR      w11,[x9,#0]
        LDR      w11,[x9,#0]
        ORR      w11,w11,#1
        STR      w11,[x9,#0]
        ORR      w11,wzr,#1
        STR      w11,[x8,#0]
|L2.4988|
        LDR      w11,[x9,#0]
        TBZ      w11,#1,|L2.4988|
        LDR      w11,[x9,#0]
        AND      w11,w11,#0xfffffffe
        STR      w11,[x9,#0]
|L2.5008|
        LDR      w11,[x9,#0]
        AND      w11,w11,#0xfffffffd
        STR      w11,[x9,#0]
        STR      wzr,[x8,#0]
|L2.5024|
        LDR      x0,[x10,#0xd20]
        BR       x0
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
_sys_exit                  ; Alternate entry point
|L2.5040|
        B        |L2.5040|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
checkReg                  ; Alternate entry point
        MOV      w8,#0xffffffff
        STR      w8,[x2,#0]
        LDR      w8,[x2,#0]
        MOV      w9,w0
        ADRP     x10,|L4.1448|
        ADD      x10,x10,#0x4c8
        ADD      x9,x10,x9,LSL #7
        ADD      x9,x9,w1,UXTW #3
        STR      w8,[x9,#0]
        STR      wzr,[x2,#0]
        LDR      w8,[x2,#0]
        STR      w8,[x9,#4]
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.218|                  ; Alternate entry point
        MOV      w8,#0xffffffff
        STR      w8,[x1,#0]
        ADRP     x8,|symbol_number.271|
        ADD      x8,x8,#0x6c8
        LDR      w9,[x1,#0]
        ADD      x8,x8,w0,UXTW #3
        STR      w9,[x8,#0]
        STR      wzr,[x1,#0]
        LDR      w9,[x1,#0]
        STR      w9,[x8,#4]
        RET      
        DCI      0x00000000 ; ? Undefined
|symbol_number.273|                  ; Alternate entry point
        MOV      w8,#0xffffffff
        STR      w8,[x2,#0]
        LDR      w8,[x2,#0]
        MOV      w9,w0
        ADRP     x10,|L4.1560|
        ADD      x10,x10,#0x748
        ADD      x9,x10,x9,LSL #7
        ADD      x9,x9,w1,UXTW #3
        STR      w8,[x9,#0]
        STR      wzr,[x2,#0]
        LDR      w8,[x2,#0]
        STR      w8,[x9,#4]
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
i2c0InterruptHandler                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        MOV      w0,#0xe6500000
        BL       |L2.2144|
        MOV      w19,w0
        TBNZ     w19,#0,|L2.5300|
        TBZ      w19,#3,|L2.5308|
        ADRP     x8,|L4.1632|
        LDR      w9,[x8,#0x948]
        ADD      w10,w9,#1
        ADRP     x11,|L2.29844|
        ADD      x11,x11,#0x5d0
        STR      w10,[x8,#0x948]
        LDR      w1,[x11,x9,LSL #2]
        MOV      w0,#0xe6500000
        BL       |L2.3232|
        TBNZ     w19,#4,|L2.5312|
        B        |L2.5324|
|L2.5300|
        MOV      w0,#0xe6500000
        BL       |L2.2048|
|L2.5308|
        TBZ      w19,#4,|L2.5324|
|L2.5312|
        ADRP     x8,|L3.5608|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe50]
|L2.5324|
        MOV      w0,#0xe6500000
        MOV      w1,w19
        LDP      x19,x30,[sp],#0x10
        B        |L2.1968|
        DCI      0x00000000 ; ? Undefined
|symbol_number.59|                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w20,#0xe6500000
        MOV      w0,#0xe6500000
        BL       |L2.2144|
        MOV      w19,w0
        TBNZ     w19,#0,|L2.5404|
        TBZ      w19,#3,|L2.5412|
        ADRP     x8,|L3.5672|
        LDRB     w8,[x8,#0xe34]
        CBZ      w8,|L2.5448|
        MOV      w0,#0xe6500000
        BL       |L2.3280|
        TBNZ     w19,#4,|L2.5416|
        B        |L2.5428|
|L2.5404|
        MOV      w0,#0xe6500000
        BL       |L2.2048|
|L2.5412|
        TBZ      w19,#4,|L2.5428|
|L2.5416|
        ADRP     x8,|L3.5712|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe54]
|L2.5428|
        MOV      w0,#0xe6500000
        MOV      w1,w19
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.1968|
|L2.5448|
        MOV      w8,#0x60
        MOVK     w8,#0xe735,LSL #16
        ORR      w9,wzr,#1
        STR      w9,[x8,#0]
        ADD      x0,x20,#8,LSL #12
        BL       |L2.3488|
        MOV      w0,#0xe6500000
        BL       |L2.2112|
|L2.5480|
        TBNZ     w19,#4,|L2.5416|
        B        |L2.5428|
|symbol_number.90|                  ; Alternate entry point
        STR      x30,[sp,#-0x10]!
        MOV      w0,#0xe6500000
        BL       |L2.3536|
        MOV      w1,w0
        MOV      w0,#0xe6500000
        LDR      x30,[sp],#0x10
        B        |L2.3408|
        DCI      0x00000000 ; ? Undefined
|symbol_number.107|                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        MOV      w0,#0xe6500000
        BL       |L2.2144|
        MOV      w19,w0
        TBZ      w19,#0,|L2.5548|
        MOV      w0,#0xe6500000
        BL       |L2.2048|
|L2.5548|
        TBZ      w19,#4,|L2.5564|
        ADRP     x8,|L3.5848|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe5c]
|L2.5564|
        MOV      w0,#0xe6500000
        MOV      w1,w19
        LDP      x19,x30,[sp],#0x10
        B        |L2.1968|
        DCI      0x00000000 ; ? Undefined
|symbol_number.117|                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        MOV      w0,#0xe6500000
        BL       |L2.2144|
        MOV      w19,w0
        TBNZ     w19,#0,|L2.5652|
        TBZ      w19,#3,|L2.5668|
        ADRP     x8,|L4.1984|
        LDR      w9,[x8,#0x94c]
|L2.5616|
        ADD      w10,w9,#1
        ADRP     x11,|L2.30196|
        ADD      x11,x11,#0x7a4
        STR      w10,[x8,#0x94c]
|L2.5632|
        LDR      w1,[x11,x9,LSL #2]
        MOV      w0,#0xe6500000
        BL       |L2.3232|
        TBNZ     w19,#4,|L2.5672|
        B        |L2.5684|
|L2.5652|
        MOV      w0,#0xe6500000
        BL       |L2.2048|
        MOV      w0,#0xe6500000
        BL       |L2.2032|
|L2.5668|
        TBZ      w19,#4,|L2.5684|
|L2.5672|
        ADRP     x8,|L3.5968|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe60]
|L2.5684|
        MOV      w0,#0xe6500000
        MOV      w1,w19
        LDP      x19,x30,[sp],#0x10
        B        |L2.1968|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.128|                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        MOV      w0,#0xe6500000
        BL       |L2.2144|
        MOV      w19,w0
        TBNZ     w19,#0,|L2.5780|
        TBZ      w19,#3,|L2.5788|
        ADRP     x8,|L4.2112|
        LDR      w9,[x8,#0x950]
        ADD      w10,w9,#1
        ADRP     x11,|L2.30324|
        ADD      x11,x11,#0x7d8
        STR      w10,[x8,#0x950]
        LDR      w1,[x11,x9,LSL #2]
        MOV      w0,#0xe6500000
        BL       |L2.3232|
        TBNZ     w19,#4,|L2.5792|
|L2.5776|
        B        |L2.5804|
|L2.5780|
        MOV      w0,#0xe6500000
        BL       |L2.2048|
|L2.5788|
        TBZ      w19,#4,|L2.5804|
|L2.5792|
        ADRP     x8,|L3.6088|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe64]
|L2.5804|
        MOV      w0,#0xe6500000
|L2.5808|
        MOV      w1,w19
        LDP      x19,x30,[sp],#0x10
        B        |L2.1968|
        DCI      0x00000000 ; ? Undefined
|symbol_number.138|                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        MOV      w0,#0xe6500000
        BL       |L2.2144|
        MOV      w19,w0
        TBNZ     w19,#0,|L2.5892|
        TBZ      w19,#3,|L2.5900|
        ADRP     x8,|L4.2224|
        LDR      w9,[x8,#0x954]
        ADD      w10,w9,#1
        ADRP     x11,|L2.30436|
        ADD      x11,x11,#0x80c
        STR      w10,[x8,#0x954]
        LDR      w1,[x11,x9,LSL #2]
        MOV      w0,#0xe6500000
        BL       |L2.3232|
        TBNZ     w19,#4,|L2.5904|
        B        |L2.5916|
|L2.5892|
        MOV      w0,#0xe6500000
        BL       |L2.2048|
|L2.5900|
        TBZ      w19,#4,|L2.5916|
|L2.5904|
        ADRP     x8,|L3.6200|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe68]
|L2.5916|
        MOV      w0,#0xe6500000
        MOV      w1,w19
        LDP      x19,x30,[sp],#0x10
        B        |L2.1968|
        DCI      0x00000000 ; ? Undefined
|symbol_number.148|                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w20,#0xe6500000
        MOV      w0,#0xe6500000
        BL       |L2.2144|
        MOV      w19,w0
        MOV      w8,#9
        AND      w8,w19,w8
        CMP      w8,#8
        B.NE     |L2.6000|
        MOV      w8,#0x60
        MOVK     w8,#0xe735,LSL #16
|L2.5984|
        ORR      w9,wzr,#1
        STR      w9,[x8,#0]
        ADD      x0,x20,#8,LSL #12
        BL       |L2.3488|
|L2.6000|
        TBZ      w19,#4,|L2.6020|
        ADRP     x8,|L3.6300|
        LDRB     w8,[x8,#0xe40]
        ADRP     x9,|L3.6308|
        STRB     w8,[x9,#0xe6c]
|L2.6020|
        MOV      w0,#0xe6500000
        MOV      w1,w19
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.1968|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.160|                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        MOV      w0,#0xe6500000
        BL       |L2.2144|
        MOV      w19,w0
        TBNZ     w19,#0,|L2.6116|
        TBZ      w19,#3,|L2.6124|
        ADRP     x8,|L4.2448|
        LDR      w9,[x8,#0x958]
        ADD      w10,w9,#1
        ADRP     x11,|L2.30660|
        ADD      x11,x11,#0x8a8
        STR      w10,[x8,#0x958]
        LDR      w1,[x11,x9,LSL #2]
        MOV      w0,#0xe6500000
        BL       |L2.3232|
        TBNZ     w19,#4,|L2.6128|
        B        |L2.6140|
|L2.6116|
        MOV      w0,#0xe6500000
|L2.6120|
        BL       |L2.2048|
|L2.6124|
        TBZ      w19,#4,|L2.6140|
|L2.6128|
        ADRP     x8,|L3.6424|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe70]
|L2.6140|
        MOV      w0,#0xe6500000
        MOV      w1,w19
        LDP      x19,x30,[sp],#0x10
        B        |L2.1968|
        DCI      0x00000000 ; ? Undefined
|symbol_number.181|                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        ADRP     x19,|L3.6464|
        LDRB     w8,[x19,#0xe4c]
        CBZ      w8,|L2.6224|
        MOV      w0,#0xe6500000
        BL       |L2.3536|
        MOV      w19,w0
        TBZ      w19,#1,|L2.6336|
        ADRP     x20,|L4.2572|
        LDR      w8,[x20,#0x4b8]
        CMP      w8,#0xa
        B.HI     |L2.6268|
        MOV      w0,#0xe6500000
        BL       |L2.4528|
        B        |L2.6312|
|L2.6224|
        MOV      w0,#0xe6500000
        BL       |L2.2144|
        MOV      w8,w0
        TBZ      w8,#5,|L2.6248|
        ORR      w9,wzr,#1
        STRB     w9,[x19,#0xe4c]
|L2.6248|
        MOV      w0,#0xe6500000
        MOV      w1,w8
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.1968|
|L2.6268|
        LDR      w8,[x20,#0x4b8]
|L2.6272|
        CMP      w8,#0xb
        B.NE     |L2.6292|
        MOV      w0,#0xe6500000
        BL       |L2.4544|
        B        |L2.6312|
|L2.6292|
        LDR      w8,[x20,#0x4b8]
        CMP      w8,#0xc
        B.NE     |L2.6336|
        MOV      w0,#0xe6500000
        BL       |L2.4512|
|L2.6312|
        LDR      w8,[x20,#0x4b8]
        ADD      w9,w8,#1
        ADRP     x10,|L4.2696|
        ADD      x10,x10,#0x200
        STR      w9,[x20,#0x4b8]
        STR      w0,[x10,x8,LSL #2]
|L2.6336|
        MOV      w0,#0xe6500000
        MOV      w1,w19
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.3408|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.193|                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w0,#0xe6500000
        BL       |L2.2144|
        MOV      w19,w0
        TBNZ     w19,#0,|L2.6424|
        TBZ      w19,#1,|L2.6508|
        ADRP     x20,|L4.2772|
        LDR      w8,[x20,#0x4bc]
        CMP      w8,#0xa
        B.HI     |L2.6440|
        MOV      w0,#0xe6500000
        BL       |L2.3136|
        B        |L2.6484|
|L2.6424|
        MOV      w0,#0xe6500000
        BL       |L2.2048|
        TBNZ     w19,#3,|L2.6512|
        B        |L2.6528|
|L2.6440|
        LDR      w8,[x20,#0x4bc]
        CMP      w8,#0xb
        B.NE     |L2.6464|
        MOV      w0,#0xe6500000
        BL       |L2.3152|
        B        |L2.6484|
|L2.6464|
        LDR      w8,[x20,#0x4bc]
        CMP      w8,#0xc
        B.NE     |L2.6508|
        MOV      w0,#0xe6500000
        BL       |L2.3120|
|L2.6484|
        LDR      w8,[x20,#0x4bc]
        ADD      w9,w8,#1
        ADRP     x10,|symbol_number.187|
        ADD      x10,x10,#0x234
        STR      w9,[x20,#0x4bc]
        STR      w0,[x10,x8,LSL #2]
|L2.6508|
        TBZ      w19,#3,|L2.6528|
|L2.6512|
        MOV      w0,#0xe6500000
        MOV      w1,#0x51
        ORR      w2,wzr,#1
        BL       |L2.3200|
|L2.6528|
        TBZ      w19,#4,|L2.6544|
        ADRP     x8,|L3.6828|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe78]
|L2.6544|
        MOV      w0,#0xe6500000
        MOV      w1,w19
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.1968|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.203|                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        MOV      w0,#0xe6500000
        BL       |L2.2144|
        MOV      w19,w0
        TBNZ     w19,#0,|L2.6656|
        TBZ      w19,#3,|L2.6664|
        ADRP     x8,|L2.43464|
        LDR      w9,[x8,#0x964]
        CMP      w9,#0xc
        B.HI     |L2.6696|
        LDR      w9,[x8,#0x964]
        ADD      w10,w9,#1
        ADRP     x11,|symbol_number.215|
        ADD      x11,x11,#0x9ac
        STR      w10,[x8,#0x964]
        LDR      w1,[x11,x9,LSL #2]
        MOV      w0,#0xe6500000
        BL       |L2.3232|
        TBNZ     w19,#4,|L2.6668|
        B        |L2.6680|
|L2.6656|
        MOV      w0,#0xe6500000
        BL       |L2.2048|
|L2.6664|
        TBZ      w19,#4,|L2.6680|
|L2.6668|
        ADRP     x8,|L3.6964|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe7c]
|L2.6680|
        MOV      w0,#0xe6500000
        MOV      w1,w19
        LDP      x19,x30,[sp],#0x10
        B        |L2.1968|
|L2.6696|
        MOV      w0,#0xe6500000
        BL       |L2.3280|
        TBNZ     w19,#4,|L2.6668|
        B        |L2.6680|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.227|                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w20,#0xe6500000
|L2.6732|
        MOV      w0,#0xe6500000
        BL       |L2.3536|
        MOV      w19,w0
        TBZ      w19,#3,|L2.6804|
|L2.6748|
        ADRP     x8,|L3.7044|
        LDRB     w8,[x8,#0xe44]
        CBZ      w8,|L2.6772|
        ADD      x0,x20,#8,LSL #12
        BL       |L2.3280|
        B        |L2.6804|
|L2.6772|
        MOV      w8,#0x60
        MOVK     w8,#0xe735,LSL #16
        ORR      w9,wzr,#1
        STR      w9,[x8,#0]
        ADD      x0,x20,#8,LSL #12
        BL       |L2.2096|
        MOV      w0,#0xe6500000
        BL       |L2.3504|
|L2.6804|
        MOV      w0,#0xe6500000
        MOV      w1,w19
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.3408|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.239|                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w20,#0xe6500000
        MOV      w0,#0xe6500000
        BL       |L2.2144|
        MOV      w19,w0
        AND      w8,w19,#3
        CMP      w8,#2
        B.NE     |L2.6892|
        MOV      w8,#0x60
        MOVK     w8,#0xe735,LSL #16
        ORR      w9,wzr,#1
        STR      w9,[x8,#0]
        ADD      x0,x20,#8,LSL #12
        BL       |L2.3504|
|L2.6892|
        TBZ      w19,#4,|L2.6912|
        ADRP     x8,|L3.7192|
        LDRB     w8,[x8,#0xe48]
        ADRP     x9,|L3.7200|
        STRB     w8,[x9,#0xe84]
|L2.6912|
        MOV      w0,#0xe6500000
        MOV      w1,w19
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.1968|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.286|                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w0,#0xe6500000
        BL       |L2.2144|
        MOV      w19,w0
        TBNZ     w19,#0,|L2.7000|
        TBZ      w19,#1,|L2.7084|
        ADRP     x20,|L2.43836|
        LDR      w8,[x20,#0x4c4]
        CMP      w8,#0xa
        B.HI     |L2.7016|
        MOV      w0,#0xe6500000
        BL       |L2.3136|
        B        |L2.7060|
|L2.7000|
        MOV      w0,#0xe6500000
        BL       |L2.2048|
        TBNZ     w19,#4,|L2.7088|
        B        |L2.7100|
|L2.7016|
        LDR      w8,[x20,#0x4c4]
        CMP      w8,#0xb
        B.NE     |L2.7040|
        MOV      w0,#0xe6500000
        BL       |L2.3152|
        B        |L2.7060|
|L2.7040|
        LDR      w8,[x20,#0x4c4]
        CMP      w8,#0xc
        B.NE     |L2.7084|
        MOV      w0,#0xe6500000
        BL       |L2.3120|
|L2.7060|
        LDR      w8,[x20,#0x4c4]
        ADD      w9,w8,#1
        ADRP     x10,|L2.43932|
        ADD      x10,x10,#0x470
        STR      w9,[x20,#0x4c4]
        STR      w0,[x10,x8,LSL #2]
|L2.7084|
        TBZ      w19,#4,|L2.7100|
|L2.7088|
        ADRP     x8,|L3.7384|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe88]
|L2.7100|
        MOV      w0,#0xe6500000
        MOV      w1,w19
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.1968|
i2c1InterruptHandler                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3536|
        MOV      w19,w0
        TBZ      w19,#1,|L2.7256|
        ADRP     x20,|L2.44012|
        LDR      w8,[x20,#0x4a4]
        CMP      w8,#0xa
        B.HI     |L2.7180|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4528|
        B        |L2.7232|
|L2.7180|
        LDR      w8,[x20,#0x4a4]
        CMP      w8,#0xb
        B.NE     |L2.7208|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4544|
        B        |L2.7232|
|L2.7208|
        LDR      w8,[x20,#0x4a4]
        CMP      w8,#0xc
        B.NE     |L2.7256|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4512|
|L2.7232|
        LDR      w8,[x20,#0x4a4]
        ADD      w9,w8,#1
        ADRP     x10,|L3.7536|
        ADD      x10,x10,#0xe8c
        STR      w9,[x20,#0x4a4]
        STR      w0,[x10,x8,LSL #2]
|L2.7256|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,w19
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.3408|
|symbol_number.58|                  ; Alternate entry point
        STR      x30,[sp,#-0x10]!
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3536|
        MOV      w1,w0
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        LDR      x30,[sp],#0x10
        B        |L2.3408|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.91|                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w20,#0x8000
        MOVK     w20,#0xe650,LSL #16
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2144|
        MOV      w19,w0
        TBNZ     w19,#0,|L2.7400|
        TBZ      w19,#3,|L2.7412|
        ADRP     x8,|L3.7664|
        LDRB     w8,[x8,#0xe38]
        CBZ      w8,|L2.7452|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3280|
        TBNZ     w19,#4,|L2.7416|
        B        |L2.7428|
|L2.7400|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
|L2.7412|
        TBZ      w19,#4,|L2.7428|
|L2.7416|
        ADRP     x8,|L3.7712|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe58]
|L2.7428|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,w19
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.1968|
|L2.7452|
        MOV      w8,#0x60
        MOVK     w8,#0xe735,LSL #16
        ORR      w9,wzr,#1
        STR      w9,[x8,#0]
        SUB      x0,x20,#8,LSL #12
        BL       |L2.3488|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2112|
        TBNZ     w19,#4,|L2.7416|
        B        |L2.7428|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.106|                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w20,#0x8000
        MOVK     w20,#0xe650,LSL #16
        MOV      w0,#0x8000
|L2.7524|
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3536|
        MOV      w19,w0
        TBZ      w19,#3,|L2.7600|
|L2.7540|
        ADRP     x8,|L3.7836|
        LDRB     w8,[x8,#0xe3c]
        CBZ      w8,|L2.7564|
        SUB      x0,x20,#8,LSL #12
        BL       |L2.3280|
        B        |L2.7600|
|L2.7564|
        MOV      w8,#0x60
        MOVK     w8,#0xe735,LSL #16
        ORR      w9,wzr,#1
|L2.7576|
        STR      w9,[x8,#0]
        SUB      x0,x20,#8,LSL #12
        BL       |L2.2096|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3504|
|L2.7600|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,w19
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.3408|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.118|                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3536|
        MOV      w19,w0
        TBZ      w19,#1,|L2.7768|
        ADRP     x20,|L2.44524|
        LDR      w8,[x20,#0x4a8]
        CMP      w8,#0xa
        B.HI     |L2.7692|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4528|
        B        |L2.7744|
|L2.7692|
        LDR      w8,[x20,#0x4a8]
        CMP      w8,#0xb
        B.NE     |L2.7720|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4544|
        B        |L2.7744|
|L2.7720|
        LDR      w8,[x20,#0x4a8]
        CMP      w8,#0xc
        B.NE     |L2.7768|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4512|
|L2.7744|
        LDR      w8,[x20,#0x4a8]
        ADD      w9,w8,#1
        ADRP     x10,|L2.44616|
        ADD      x10,x10,#0x60
        STR      w9,[x20,#0x4a8]
        STR      w0,[x10,x8,LSL #2]
|L2.7768|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,w19
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.3408|
|symbol_number.129|                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3536|
        MOV      w19,w0
        TBZ      w19,#1,|L2.7928|
        ADRP     x20,|L2.44684|
        LDR      w8,[x20,#0x4ac]
        CMP      w8,#0xa
        B.HI     |L2.7852|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4528|
        B        |L2.7904|
|L2.7852|
        LDR      w8,[x20,#0x4ac]
        CMP      w8,#0xb
        B.NE     |L2.7880|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4544|
        B        |L2.7904|
|L2.7880|
        LDR      w8,[x20,#0x4ac]
        CMP      w8,#0xc
        B.NE     |L2.7928|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4512|
|L2.7904|
        LDR      w8,[x20,#0x4ac]
        ADD      w9,w8,#1
        ADRP     x10,|L2.44776|
        ADD      x10,x10,#0x94
        STR      w9,[x20,#0x4ac]
        STR      w0,[x10,x8,LSL #2]
|L2.7928|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
|L2.7936|
        MOV      w1,w19
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.3408|
|symbol_number.139|                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3536|
        MOV      w19,w0
        TBZ      w19,#1,|L2.8088|
        ADRP     x20,|L2.44844|
        LDR      w8,[x20,#0x4b0]
        CMP      w8,#0xa
        B.HI     |L2.8012|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4528|
        B        |L2.8064|
|L2.8012|
        LDR      w8,[x20,#0x4b0]
        CMP      w8,#0xb
        B.NE     |L2.8040|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4544|
        B        |L2.8064|
|L2.8040|
        LDR      w8,[x20,#0x4b0]
        CMP      w8,#0xc
        B.NE     |L2.8088|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4512|
|L2.8064|
        LDR      w8,[x20,#0x4b0]
        ADD      w9,w8,#1
        ADRP     x10,|L2.44936|
        ADD      x10,x10,#0xc8
|L2.8080|
        STR      w9,[x20,#0x4b0]
        STR      w0,[x10,x8,LSL #2]
|L2.8088|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,w19
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.3408|
|symbol_number.149|                  ; Alternate entry point
        STR      x30,[sp,#-0x10]!
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3536|
        MOV      w1,w0
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        LDR      x30,[sp],#0x10
        B        |L2.3408|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.161|                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3536|
        MOV      w19,w0
        TBZ      w19,#1,|L2.8296|
        ADRP     x20,|L2.45052|
        LDR      w8,[x20,#0x4b4]
        CMP      w8,#0xa
        B.HI     |L2.8220|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4528|
        B        |L2.8272|
|L2.8220|
        LDR      w8,[x20,#0x4b4]
        CMP      w8,#0xb
        B.NE     |L2.8248|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4544|
        B        |L2.8272|
|L2.8248|
        LDR      w8,[x20,#0x4b4]
        CMP      w8,#0xc
        B.NE     |L2.8296|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4512|
|L2.8272|
        LDR      w8,[x20,#0x4b4]
        ADD      w9,w8,#1
        ADRP     x10,|L4.560|
        ADD      x10,x10,#0x164
        STR      w9,[x20,#0x4b4]
        STR      w0,[x10,x8,LSL #2]
|L2.8296|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,w19
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        B        |L2.3408|
|symbol_number.182|                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2144|
        MOV      w19,w0
        TBNZ     w19,#0,|L2.8396|
        TBZ      w19,#3,|L2.8408|
        ADRP     x8,|L4.628|
        LDR      w9,[x8,#0x95c]
        ADD      w10,w9,#1
        ADRP     x11,|L2.28840|
        ADD      x11,x11,#0x944
        STR      w10,[x8,#0x95c]
        LDR      w1,[x11,x9,LSL #2]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3232|
        TBNZ     w19,#4,|L2.8412|
        B        |L2.8424|
|L2.8396|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
|L2.8408|
        TBZ      w19,#4,|L2.8424|
|L2.8412|
        ADRP     x8,|L3.4612|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe74]
|L2.8424|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,w19
        LDP      x19,x30,[sp],#0x10
        B        |L2.1968|
        DCI      0x00000000 ; ? Undefined
|symbol_number.194|                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3536|
        MOV      w19,w0
        TBZ      w19,#1,|L2.8552|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4528|
        ADRP     x8,|L4.764|
        LDR      w9,[x8,#0x4bc]
        ADD      w10,w9,#1
        ADRP     x11,|L4.776|
        ADD      x11,x11,#0x234
        STR      w10,[x8,#0x4bc]
        STR      w0,[x11,x9,LSL #2]
        ADRP     x8,|L4.792|
        LDR      w9,[x8,#0x960]
        ADD      w10,w9,#1
        ADRP     x11,|L2.29004|
        ADD      x11,x11,#0x978
        STR      w10,[x8,#0x960]
        LDR      w1,[x11,x9,LSL #2]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4576|
|L2.8552|
        TBZ      w19,#3,|L2.8596|
        ADRP     x8,|L4.836|
        LDR      w9,[x8,#0x960]
        ADD      w10,w9,#1
        ADRP     x11,|L2.29048|
        ADD      x11,x11,#0x978
        STR      w10,[x8,#0x960]
        LDR      w1,[x11,x9,LSL #2]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4576|
|L2.8596|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,w19
        LDP      x19,x30,[sp],#0x10
        B        |L2.3408|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.204|                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3536|
        MOV      w19,w0
        TBZ      w19,#1,|L2.8688|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4528|
        ADRP     x8,|L4.940|
        LDR      w9,[x8,#0x4c0]
        ADD      w10,w9,#1
        ADRP     x11,|L4.952|
        ADD      x11,x11,#0x268
        STR      w10,[x8,#0x4c0]
        STR      w0,[x11,x9,LSL #2]
|L2.8688|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,w19
        LDP      x19,x30,[sp],#0x10
        B        |L2.3408|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.228|                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2144|
        MOV      w19,w0
        TBZ      w19,#0,|L2.8756|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
|L2.8756|
        TBZ      w19,#4,|L2.8772|
        ADRP     x8,|L3.4960|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe80]
|L2.8772|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,w19
        LDP      x19,x30,[sp],#0x10
        B        |L2.1968|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.240|                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3536|
        MOV      w19,w0
        TBZ      w19,#4,|L2.8864|
        ADRP     x8,|L3.5024|
        LDR      w8,[x8,#0xe30]
        MOV      w9,#0x34
        ADRP     x10,|L2.29316|
        ADD      x10,x10,#0xa7c
        MUL      x8,x8,x9
        LDR      w1,[x10,x8]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4576|
|L2.8864|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,w19
        LDP      x19,x30,[sp],#0x10
        B        |L2.3408|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.287|                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3536|
        MOV      w19,w0
        TBZ      w19,#3,|L2.8960|
        ADRP     x8,|L4.1200|
        LDR      w9,[x8,#0x96c]
        ADD      w10,w9,#1
        ADRP     x11,|L2.29412|
        ADD      x11,x11,#0xbe8
        STR      w10,[x8,#0x96c]
        LDR      w1,[x11,x9,LSL #2]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.4576|
|L2.8960|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,w19
        LDP      x19,x30,[sp],#0x10
        B        |L2.3408|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
interrupt_check                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        ADRP     x1,|L2.29476|
        ADD      x1,x1,#0x3f0
        MOV      w19,#0xe6500000
        MOV      w0,#0xe6500000
        BL       |L2.2160|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.2128|
        MOV      w0,#0xe6500000
        BL       |L2.2064|
        ADD      x19,x19,#8,LSL #12
        ADRP     x1,|L2.29532|
        ADD      x1,x1,#0xd0c
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3520|
        MOV      x0,x19
        BL       |L2.3472|
        BL       |L2.1504|
        ADRP     x1,|L2.5008|
        ADD      x1,x1,#0x650
        MOV      w0,#0x10e
        BL       |L2.1920|
        ADRP     x1,|L2.5024|
        ADD      x1,x1,#0xe70
        MOV      w0,#0x10f
        BL       |L2.1920|
        MOV      w0,#0x10e
        BL       |L2.1664|
        MOV      w0,#0x10f
        BL       |L2.1664|
        ADRP     x8,|L4.1432|
        LDR      w9,[x8,#0x950]
        ADD      w10,w9,#1
        ADRP     x19,|L2.29644|
        ADD      x19,x19,#0x7d8
        STR      w10,[x8,#0x950]
        LDR      w1,[x19,x9,LSL #2]
        MOV      w0,#0xe6500000
        BL       |L2.3248|
        ADRP     x8,|L3.5388|
|L2.9192|
        LDRB     w9,[x8,#0xe64]
        CBZ      w9,|L2.9192|
        MOV      x8,xzr
        ADRP     x9,|L4.1484|
        ADD      x9,x9,#0x94
|L2.9212|
        LSL      x10,x8,#2
        LDR      w11,[x9,x10]
        LDR      w10,[x19,x10]
        CMP      w11,w10
        B.NE     |L2.9256|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.9212|
        MOV      w0,wzr
        LDP      x19,x30,[sp],#0x10
        RET      
|L2.9256|
        ORR      w0,wzr,#1
        LDP      x19,x30,[sp],#0x10
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
main                  ; Alternate entry point
        SUB      sp,sp,#0xa0
        STP      x21,x20,[sp,#0x80]
        STP      x19,x30,[sp,#0x90]
        BL       |L2.1936|
        ORR      w1,wzr,#1
        MOV      w0,wzr
        BL       |L2.3344|
        MOV      x19,xzr
        MOV      x20,sp
        ADRP     x21,|L3.5516|
        ADD      x21,x21,#0xd28
|L2.9324|
        LDR      x8,[x21,x19,LSL #3]
        BLR      x8
        STR      w0,[x20,x19,LSL #2]
        CMP      w0,#1
        B.EQ     |L2.9364|
        ADD      x19,x19,#1
        CMP      x19,#0x1f
        B.LS     |L2.9324|
        MOV      w19,wzr
        B        |L2.9368|
|L2.9364|
        ORR      w19,wzr,#1
|L2.9368|
        BL       |L2.3360|
        BL       |L2.3376|
        CBZ      w19,|L2.9408|
        MOV      x20,xzr
        MOV      x21,sp
|L2.9388|
        LDR      w0,[x21,x20]
        BL       |L2.4704|
        ADD      x20,x20,#4
        CMP      x20,#0x80
        B.NE     |L2.9388|
|L2.9408|
        MOV      w0,w19
        BL       |L2.4752|
        BL       |L2.4800|
|L2.9420|
        B        |L2.9420|
master_arbitration_lost                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w20,#0xe6500000
        ADRP     x1,|L2.29916|
        ADD      x1,x1,#0x5a0
        MOV      w0,#0xe6500000
        BL       |L2.2160|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.2128|
        MOV      w0,#0xe6500000
        BL       |L2.2064|
        ADRP     x1,|L2.29964|
        ADD      x1,x1,#0xebc
        MOV      w0,#0xe6500000
        BL       |L2.3552|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.3408|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.3520|
        MOV      w0,#0xe6500000
        BL       |L2.3472|
        ADD      x19,x20,#8,LSL #12
        ADRP     x1,|symbol_number.263|
        ADD      x1,x1,#0x5b8
        MOV      x0,x19
        BL       |L2.2160|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.1968|
        MOV      x0,x19
        BL       |L2.2064|
        BL       |L2.1504|
        ADRP     x1,|L2.5480|
        ADD      x1,x1,#0x810
        MOV      w0,#0x10e
        BL       |L2.1920|
|L2.9592|
        ADRP     x1,|L2.9592|
        ADD      x1,x1,#0x80
        MOV      w0,#0x10f
        BL       |L2.1920|
        MOV      w0,#0x10e
        BL       |L2.1664|
        MOV      w0,#0x10f
        BL       |L2.1664|
        MOV      w1,#0x48
        MOV      x0,x19
        BL       |L2.3248|
        ADRP     x8,|L4.1916|
        LDR      w9,[x8,#0x95c]
        ADD      w10,w9,#1
        ADRP     x19,|L2.30128|
        ADD      x19,x19,#0x944
        STR      w10,[x8,#0x95c]
        LDR      w1,[x19,x9,LSL #2]
        MOV      w0,#0xe6500000
        BL       |L2.3248|
        ADRP     x8,|L3.5872|
|L2.9676|
        LDRB     w9,[x8,#0xe74]
        CBZ      w9,|L2.9676|
        MOV      w0,#0xe6500000
        BL       |L2.1984|
        MOV      w0,#0xe6500000
        BL       |L2.3424|
        ADD      x0,x20,#8,LSL #12
        BL       |L2.1984|
        MOV      x8,xzr
        ADRP     x9,|L4.1992|
        ADD      x9,x9,#0x200
|L2.9720|
        LSL      x10,x8,#2
        LDR      w11,[x9,x10]
        LDR      w10,[x19,x10]
        CMP      w11,w10
        B.NE     |L2.9760|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.9720|
        MOV      w0,wzr
        B        |L2.9764|
|L2.9760|
        ORR      w0,wzr,#1
|L2.9764|
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        RET      
master_general_call                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        ADRP     x1,|L2.30260|
        ADD      x1,x1,#0x300
        MOV      w19,#0xe6500000
        MOV      w0,#0xe6500000
        BL       |L2.2160|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.2128|
        MOV      w0,#0xe6500000
        BL       |L2.2064|
        ADD      x19,x19,#8,LSL #12
        ADRP     x1,|symbol_number.77|
        ADD      x1,x1,#0xc1c
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3520|
        MOV      x0,x19
        BL       |L2.3472|
        BL       |L2.1504|
|L2.9888|
        ADRP     x1,|L2.5792|
        ADD      x1,x1,#0x470
        MOV      w0,#0x10e
        BL       |L2.1920|
        ADRP     x1,|L2.5808|
        ADD      x1,x1,#0xbd0
        MOV      w0,#0x10f
        BL       |L2.1920|
        MOV      w0,#0x10e
        BL       |L2.1664|
        MOV      w0,#0x10f
        BL       |L2.1664|
        ADRP     x8,|L4.2216|
        LDR      w9,[x8,#0x948]
        ADD      w10,w9,#1
        ADRP     x19,|L2.30428|
        ADD      x19,x19,#0x5d0
        STR      w10,[x8,#0x948]
        LDR      w1,[x19,x9,LSL #2]
        MOV      w0,#0xe6500000
        BL       |L2.3248|
        ADRP     x8,|L3.6172|
|L2.9976|
        LDRB     w9,[x8,#0xe50]
        CBZ      w9,|L2.9976|
        MOV      x8,xzr
        ADRP     x9,|L3.6188|
        ADD      x9,x9,#0xe8c
|L2.9996|
        LSL      x10,x8,#2
        LDR      w11,[x9,x10]
        LDR      w10,[x19,x10]
        CMP      w11,w10
        B.NE     |L2.10040|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.9996|
        MOV      w0,wzr
        LDP      x19,x30,[sp],#0x10
        RET      
|L2.10040|
        ORR      w0,wzr,#1
        LDP      x19,x30,[sp],#0x10
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
master_rx                  ; Alternate entry point
        STR      x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        ADRP     x1,|L2.30552|
        ADD      x1,x1,#0x588
        MOV      w19,#0xe6500000
        MOV      w0,#0xe6500000
        BL       |L2.2160|
        MOV      w0,#0xe6500000
|L2.10096|
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.2128|
        MOV      w0,#0xe6500000
        BL       |L2.2064|
        ADD      x19,x19,#8,LSL #12
        ADRP     x1,|L2.30608|
        ADD      x1,x1,#0xea4
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3520|
        MOV      x0,x19
        BL       |L2.3472|
        ADRP     x8,|L4.2456|
        LDR      w9,[x8,#0x96c]
        ADD      w10,w9,#1
        ADRP     x20,|L2.30668|
        ADD      x20,x20,#0xbe8
        STR      w10,[x8,#0x96c]
        LDR      w1,[x20,x9,LSL #2]
        MOV      x0,x19
        BL       |L2.4576|
        BL       |L2.1504|
        ADRP     x1,|L2.6120|
        ADD      x1,x1,#0xb20
        MOV      w0,#0x10e
        BL       |L2.1920|
|L2.10232|
        ADRP     x1,|L2.10232|
        ADD      x1,x1,#0x2c0
        MOV      w0,#0x10f
        BL       |L2.1920|
        MOV      w0,#0x10e
        BL       |L2.1664|
        MOV      w0,#0x10f
        BL       |L2.1664|
        MOV      w0,#0xe6500000
        BL       |L2.3184|
        ADRP     x8,|L3.6472|
|L2.10276|
        LDRB     w9,[x8,#0xe88]
        CBZ      w9,|L2.10276|
        MOV      x8,xzr
        ADRP     x9,|L4.2568|
        ADD      x9,x9,#0x470
|L2.10296|
        LSL      x10,x8,#2
        LDR      w11,[x9,x10]
        LDR      w10,[x20,x10]
        CMP      w11,w10
        B.NE     |L2.10336|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.10296|
        MOV      w0,wzr
        B        |L2.10340|
|L2.10336|
        ORR      w0,wzr,#1
|L2.10340|
        LDP      x19,x30,[sp,#0x10]
        LDR      x20,[sp],#0x20
        RET      
master_rx_dma                  ; Alternate entry point
        STP      x23,x22,[sp,#-0x30]!
        STP      x21,x20,[sp,#0x10]
        STP      x19,x30,[sp,#0x20]
        MOV      w21,#0xe6500000
        MOV      w19,#0x2c1c
        MOVK     w19,#0xe615,LSL #16
        MOV      w0,#0x2c1c
        MOVK     w0,#0xe615,LSL #16
|L2.10384|
        MOV      w1,#9
        BL       |L2.1392|
        ADD      x0,x19,#0x80
        MOV      w1,#9
        BL       |L2.1392|
        ORR      w8,wzr,#0xe00000
        MOV      w19,#0x24
        MOVK     w19,#0xe650,LSL #16
        STR      w19,[x21,x8]
        ADRP     x20,|L4.2700|
        ADD      x20,x20,#0x2c
        MOV      w23,#0xc
        MOVK     w23,#0xe730,LSL #16
        STUR     w20,[x23,#-8]
        LDUR     w8,[x23,#-4]
        MOV      w9,#0xd
        BFXIL    w8,w9,#0,#24
        STUR     w8,[x23,#-4]
        LDR      w8,[x23,#0]
        AND      w8,w8,#0xffff3fff
        ORR      w8,w8,#0x4000
        STR      w8,[x23,#0]
        LDR      w8,[x23,#0]
        AND      w8,w8,#0xffffcfff
        STR      w8,[x23,#0]
        LDR      w8,[x23,#0]
        AND      w8,w8,#0xfffff0ff
        ORR      w8,w8,#0x800
        STR      w8,[x23,#0]
        LDR      w8,[x23,#0]
        AND      w8,w8,#0xffcfffff
        STR      w8,[x23,#0]
        LDR      w8,[x23,#0]
        AND      w8,w8,#0xffffffe7
        ORR      w8,w8,#0x10
        STR      w8,[x23,#0]
        MOV      w8,#0x90
        STRH     w8,[x23,#0x34]
        LDR      w8,[x23,#0]
        ORR      w8,w8,#4
        STR      w8,[x23,#0]
        LDR      w8,[x23,#0]
        ORR      w8,w8,#1
        STR      w8,[x23,#0]
        ADRP     x1,|L2.31040|
        ADD      x1,x1,#0x3c0
        MOV      w0,#0xe6500000
        BL       |L2.2160|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.2128|
        MOV      w0,#0xe6500000
        BL       |L2.2064|
        ADRP     x22,|L2.31088|
        ADD      x22,x22,#0x770
        ADD      w8,w22,#4
        STR      w8,[x23,#0xff4]
        ADD      w8,w19,#8,LSL #12
        STR      w8,[x23,#0xff8]
        MOV      w8,#0x100c
        MOVK     w8,#0xe730,LSL #16
        LDUR     w9,[x8,#-4]
        AND      w9,w9,#0xff000000
        ORR      w9,w9,#0xc
        STUR     w9,[x8,#-4]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffff3fff
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffffcfff
        ORR      w9,w9,#0x1000
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffff0ff
        ORR      w9,w9,#0x800
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffcfffff
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffffffe7
        ORR      w9,w9,#0x10
        STR      w9,[x8,#0]
        MOV      w9,#0xa3
        STRH     w9,[x8,#0x34]
        LDR      w9,[x8,#0]
        ORR      w9,w9,#4
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        ORR      w9,w9,#1
        STR      w9,[x8,#0]
        ADD      x19,x21,#8,LSL #12
        ADRP     x1,|L2.31244|
        ADD      x1,x1,#0xcdc
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3520|
        MOV      w1,#0x48
        MOV      x0,x19
        BL       |L2.4576|
        MOV      x0,x19
        BL       |L2.3472|
        BL       |L2.1504|
        ADRP     x1,|L2.6732|
        ADD      x1,x1,#0xd50
        MOV      w0,#0x10f
        BL       |L2.1920|
        ADRP     x1,|L2.6748|
        ADD      x1,x1,#0x590
        MOV      w0,#0x10e
        BL       |L2.1920|
        ADRP     x1,|L2.23148|
        ADD      x1,x1,#0x280
        ORR      w0,wzr,#0x40
        BL       |L2.1920|
        ADRP     x1,|L2.23164|
        ADD      x1,x1,#0x4a0
        MOV      w0,#0x41
        BL       |L2.1920|
        MOV      w0,#0x10f
        BL       |L2.1664|
        MOV      w0,#0x10e
        BL       |L2.1664|
        ORR      w0,wzr,#0x40
        BL       |L2.1664|
        MOV      w0,#0x41
        BL       |L2.1664|
        MOV      w0,#0xe6500000
        BL       |L2.3184|
        ADRP     x8,|L3.7132|
|L2.10936|
        LDRB     w9,[x8,#0xe5c]
        CBZ      w9,|L2.10936|
        MOV      w0,#0xe6500000
        BL       |L2.1984|
        ADD      x0,x21,#8,LSL #12
        BL       |L2.3424|
        MOV      x8,xzr
|L2.10964|
        LSL      x9,x8,#2
        LDR      w10,[x20,x9]
        LDR      w9,[x22,x9]
        CMP      w10,w9
        B.NE     |L2.11004|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.10964|
        MOV      w0,wzr
        B        |L2.11008|
|L2.11004|
        ORR      w0,wzr,#1
|L2.11008|
        LDP      x19,x30,[sp,#0x20]
        LDP      x21,x20,[sp,#0x10]
        LDP      x23,x22,[sp],#0x30
        RET      
master_rx_dma_continuous                  ; Alternate entry point
        STP      x25,x24,[sp,#-0x40]!
        STP      x23,x22,[sp,#0x10]
        STP      x21,x20,[sp,#0x20]
        STP      x19,x30,[sp,#0x30]
        MOV      w19,#0x24
        MOVK     w19,#0xe650,LSL #16
        MOV      w20,#0x2c1c
        MOVK     w20,#0xe615,LSL #16
        MOV      w0,#0x2c1c
        MOVK     w0,#0xe615,LSL #16
        MOV      w1,#9
        BL       |L2.1392|
        ADD      x0,x20,#0x80
        MOV      w1,#9
        BL       |L2.1392|
        MOV      w20,#0xe7350000
        MOV      w0,#0xe7350000
        ORR      w1,wzr,#2
        BL       |L2.1440|
        MOV      x8,xzr
        ADD      x9,x20,#0x80c
        MOV      w10,#0xd
        MOV      w11,#0x90
        ADRP     x12,|L2.43884|
        ADD      x12,x12,#0x304
|L2.11124|
        ADD      w13,w12,w8
        STUR     w19,[x9,#-0xc]
        STUR     w13,[x9,#-8]
        LDUR     w13,[x9,#-4]
        BFXIL    w13,w10,#0,#24
        STUR     w13,[x9,#-4]
        LDR      w13,[x9,#0]
        AND      w13,w13,#0xfffff3ff
        ORR      w13,w13,#0x400
        STR      w13,[x9,#0]
        LDR      w13,[x9,#0]
        AND      w13,w13,#0xfffffcff
        STR      w13,[x9,#0]
        LDR      w13,[x9,#0]
        AND      w13,w13,#0xffffff3f
        STR      w13,[x9,#0]
        LDR      w13,[x9,#0]
        AND      w13,w13,#0xfffffff0
        ORR      w13,w13,#2
        STR      w13,[x9,#0]
        LDR      w13,[x9,#0]
        BFI      w13,w11,#16,#8
        STR      w13,[x9],#0x10
        ADD      x8,x8,#0x34
        CMP      x8,#0x68
        B.NE     |L2.11124|
        MOV      w21,#0x100c
        MOVK     w21,#0xe730,LSL #16
        ORR      x8,xzr,#0xfffffffffffff000
        LDR      w9,[x21,x8]
        AND      w9,w9,#0xcfffffff
        ORR      w9,w9,#0x10000000
        STR      w9,[x21,x8]
        LDR      w9,[x21,x8]
        ORR      w9,w9,#0xf000000
        STR      w9,[x21,x8]
        LDR      w9,[x21,x8]
        ORR      w9,w9,#0x400000
        STR      w9,[x21,x8]
        SUB      x9,x21,#0xff0
        LDR      w10,[x9,#0]
        ORR      w11,wzr,#0x1000000
        BFXIL    w11,w10,#0,#24
        STR      w11,[x9,#0]
        LDR      w10,[x9,#0]
        ORR      w10,w10,#0x8000
        STR      w10,[x9,#0]
        LDR      w9,[x21,x8]
        ORR      w9,w9,#4
        STR      w9,[x21,x8]
        MOV      w20,#0xe6500000
        LDR      w9,[x21,x8]
        ORR      w9,w9,#1
        STR      w9,[x21,x8]
        ADRP     x1,|symbol_number.65|
        ADD      x1,x1,#0x4f8
        MOV      w0,#0xe6500000
        BL       |L2.2160|
        MOV      w0,#0xe6500000
        ORR      w1,wzr,#1
        BL       |L2.3328|
        MOV      w22,#0xd
        MOV      w0,#0xe6500000
        MOV      w1,#0xd
        BL       |L2.3296|
        MOV      w0,#0xe6500000
        BL       |L2.2080|
        MOV      w0,#0xe6500000
        BL       |L2.2096|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.2128|
        MOV      w0,#0xe6500000
        BL       |L2.2064|
        ADRP     x23,|L3.7632|
        LDR      w8,[x23,#0xe30]
        MOV      w24,#0x34
        ADRP     x25,|L2.31924|
        ADD      x25,x25,#0xa7c
        MADD     w8,w8,w24,w25
        ADD      w8,w8,#4
        STUR     w8,[x21,#-0xc]
        ADD      w8,w19,#8,LSL #12
        STUR     w8,[x21,#-8]
        LDUR     w8,[x21,#-4]
        BFXIL    w8,w22,#0,#24
        STUR     w8,[x21,#-4]
        LDR      w8,[x21,#0]
        AND      w8,w8,#0xffff3fff
        STR      w8,[x21,#0]
        LDR      w8,[x21,#0]
        AND      w8,w8,#0xffffcfff
        ORR      w8,w8,#0x1000
        STR      w8,[x21,#0]
        LDR      w8,[x21,#0]
        AND      w8,w8,#0xfffff0ff
        ORR      w8,w8,#0x800
        STR      w8,[x21,#0]
        LDR      w8,[x21,#0]
        AND      w8,w8,#0xffcfffff
        STR      w8,[x21,#0]
        LDR      w8,[x21,#0]
        AND      w8,w8,#0xffffffe7
        ORR      w8,w8,#0x10
        STR      w8,[x21,#0]
        MOV      w8,#0x1040
        MOVK     w8,#0xe730,LSL #16
        MOV      w9,#0xa3
        STRH     w9,[x8,#0]
        LDR      w8,[x21,#0]
        ORR      w8,w8,#4
        STR      w8,[x21,#0]
        LDR      w8,[x21,#0]
        ORR      w8,w8,#1
        STR      w8,[x21,#0]
        ADD      x19,x20,#8,LSL #12
        ADRP     x1,|L2.32080|
        ADD      x1,x1,#0xe14
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3520|
        LDR      w8,[x23,#0xe30]
        MUL      x8,x8,x24
        LDR      w1,[x25,x8]
        MOV      x0,x19
        BL       |L2.4576|
        MOV      x0,x19
        BL       |L2.3472|
        BL       |L2.1504|
        ADRP     x1,|L2.7576|
        ADD      x1,x1,#0xab0
        MOV      w0,#0x10e
        BL       |L2.1920|
|L2.11688|
        ADRP     x1,|L2.11688|
        ADD      x1,x1,#0x260
        MOV      w0,#0x10f
        BL       |L2.1920|
        ADRP     x1,|L2.23992|
        ADD      x1,x1,#0x380
        ORR      w0,wzr,#0x40
        BL       |L2.1920|
        ADRP     x1,|L2.24008|
        ADD      x1,x1,#0x5d0
        MOV      w0,#0x41
        BL       |L2.1920|
        MOV      w0,#0x10e
        BL       |L2.1664|
        MOV      w0,#0x10f
        BL       |L2.1664|
        ORR      w0,wzr,#0x40
        BL       |L2.1664|
        MOV      w0,#0x41
        BL       |L2.1664|
        MOV      w0,#0xe6500000
        BL       |L2.3184|
        ADRP     x8,|L3.7976|
|L2.11780|
        LDRB     w9,[x8,#0xe84]
        CBZ      w9,|L2.11780|
        MOV      w0,#0xe6500000
        BL       |L2.1984|
        ADD      x0,x20,#8,LSL #12
        BL       |L2.3424|
        MOV      x8,xzr
        ADRP     x9,|L2.32288|
        ADD      x9,x9,#0xa7c
        ADRP     x10,|L2.44584|
        ADD      x10,x10,#0x304
|L2.11824|
        MOV      x11,xzr
|L2.11828|
        LSL      x12,x11,#2
        LDR      w13,[x10,x12]
        LDR      w12,[x9,x12]
        CMP      w13,w12
        B.NE     |L2.11888|
        ADD      x11,x11,#1
        CMP      w11,#0xc
        B.LS     |L2.11828|
        ADD      x8,x8,#1
        ADD      x9,x9,#0x34
        ADD      x10,x10,#0x34
        CMP      x8,#2
        B.CC     |L2.11824|
        MOV      w0,wzr
        B        |L2.11892|
|L2.11888|
        ORR      w0,wzr,#1
|L2.11892|
        LDP      x19,x30,[sp,#0x30]
        LDP      x21,x20,[sp,#0x20]
        LDP      x23,x22,[sp,#0x10]
        LDP      x25,x24,[sp],#0x40
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
master_send_start_byte                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        ADRP     x1,|L2.32404|
        ADD      x1,x1,#0x3d8
        MOV      w19,#0xe6500000
        MOV      w0,#0xe6500000
        BL       |L2.2160|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.2128|
        MOV      w0,#0xe6500000
        BL       |L2.2064|
        ADD      x19,x19,#8,LSL #12
        ADRP     x1,|L2.32460|
        ADD      x1,x1,#0xcf4
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3520|
        MOV      x0,x19
        BL       |L2.3472|
        BL       |L2.1504|
        ADRP     x1,|L2.7936|
        ADD      x1,x1,#0x5d0
        MOV      w0,#0x10e
        BL       |L2.1920|
        ADRP     x1,|symbol_number.139|
        ADD      x1,x1,#0xdd0
        MOV      w0,#0x10f
        BL       |L2.1920|
        MOV      w0,#0x10e
        BL       |L2.1664|
        MOV      w0,#0x10f
        BL       |L2.1664|
        ADRP     x8,|L2.44848|
        LDR      w9,[x8,#0x94c]
        ADD      w10,w9,#1
        ADRP     x19,|L3.100|
        ADD      x19,x19,#0x7a4
        STR      w10,[x8,#0x94c]
        LDR      w1,[x19,x9,LSL #2]
        MOV      w0,#0xe6500000
        BL       |L2.3248|
        ADRP     x8,|L4.300|
|L2.12120|
        LDRB     w9,[x8,#0xe60]
        CBZ      w9,|L2.12120|
        MOV      x8,xzr
        ADRP     x9,|L2.44900|
        ADD      x9,x9,#0x60
|L2.12140|
        LSL      x10,x8,#2
        LDR      w11,[x9,x10]
        LDR      w10,[x19,x10]
        CMP      w11,w10
        B.NE     |L2.12184|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.12140|
        MOV      w0,wzr
        LDP      x19,x30,[sp],#0x10
        RET      
|L2.12184|
        ORR      w0,wzr,#1
        LDP      x19,x30,[sp],#0x10
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
master_tx                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        ADRP     x1,|L3.220|
        ADD      x1,x1,#0x408
        MOV      w19,#0xe6500000
        MOV      w0,#0xe6500000
        BL       |L2.2160|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.2128|
        MOV      w0,#0xe6500000
        BL       |L2.2064|
        ADD      x19,x19,#8,LSL #12
        ADRP     x1,|L3.276|
        ADD      x1,x1,#0xd24
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3520|
        MOV      x0,x19
        BL       |L2.3472|
        BL       |L2.1504|
        ADRP     x1,|L2.4128|
        ADD      x1,x1,#0x6c0
        MOV      w0,#0x10e
        BL       |L2.1920|
        ADRP     x1,|L2.4144|
        ADD      x1,x1,#0xf10
        MOV      w0,#0x10f
        BL       |L2.1920|
        MOV      w0,#0x10e
        BL       |L2.1664|
        MOV      w0,#0x10f
        BL       |L2.1664|
        ADRP     x8,|L4.552|
        LDR      w9,[x8,#0x954]
        ADD      w10,w9,#1
        ADRP     x19,|L2.28764|
        ADD      x19,x19,#0x80c
        STR      w10,[x8,#0x954]
        LDR      w1,[x19,x9,LSL #2]
        MOV      w0,#0xe6500000
        BL       |L2.3248|
        ADRP     x8,|L3.4508|
|L2.12408|
        LDRB     w9,[x8,#0xe68]
        CBZ      w9,|L2.12408|
        MOV      x8,xzr
        ADRP     x9,|L4.604|
        ADD      x9,x9,#0xc8
|L2.12428|
        LSL      x10,x8,#2
        LDR      w11,[x9,x10]
        LDR      w10,[x19,x10]
        CMP      w11,w10
        B.NE     |L2.12472|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.12428|
        MOV      w0,wzr
        LDP      x19,x30,[sp],#0x10
        RET      
|L2.12472|
        ORR      w0,wzr,#1
        LDP      x19,x30,[sp],#0x10
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
master_tx_dma                  ; Alternate entry point
        STR      x22,[sp,#-0x30]!
        STP      x21,x20,[sp,#0x10]
        STP      x19,x30,[sp,#0x20]
        MOV      w21,#0xe6500000
        MOV      w19,#0x2c1c
        MOVK     w19,#0xe615,LSL #16
        MOV      w0,#0x2c1c
        MOVK     w0,#0xe615,LSL #16
        MOV      w1,#9
        BL       |L2.1392|
        ADD      x0,x19,#0x80
        MOV      w1,#9
        BL       |L2.1392|
        ADRP     x20,|L2.28932|
        ADD      x20,x20,#0x638
        ADD      w8,w20,#4
        ORR      w9,wzr,#0xe00000
        STR      w8,[x21,x9]
        MOV      w19,#0xc
        MOVK     w19,#0xe730,LSL #16
        MOV      w22,#0x24
        MOVK     w22,#0xe650,LSL #16
        STUR     w22,[x19,#-8]
        LDUR     w8,[x19,#-4]
        AND      w8,w8,#0xff000000
        ORR      w8,w8,#0xc
        STUR     w8,[x19,#-4]
        LDR      w8,[x19,#0]
        AND      w8,w8,#0xffff3fff
        STR      w8,[x19,#0]
        LDR      w8,[x19,#0]
        AND      w8,w8,#0xffffcfff
        ORR      w8,w8,#0x1000
        STR      w8,[x19,#0]
        LDR      w8,[x19,#0]
        AND      w8,w8,#0xfffff0ff
        ORR      w8,w8,#0x800
        STR      w8,[x19,#0]
        LDR      w8,[x19,#0]
        AND      w8,w8,#0xffcfffff
        STR      w8,[x19,#0]
        LDR      w8,[x19,#0]
        AND      w8,w8,#0xffffffe7
        ORR      w8,w8,#0x10
        STR      w8,[x19,#0]
        MOV      w8,#0x91
        STRH     w8,[x19,#0x34]
        LDR      w8,[x19,#0]
        ORR      w8,w8,#4
        STR      w8,[x19,#0]
        LDR      w8,[x19,#0]
        ORR      w8,w8,#1
        STR      w8,[x19,#0]
        ADRP     x1,|L2.29092|
        ADD      x1,x1,#0x330
        MOV      w0,#0xe6500000
        BL       |L2.2160|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.2128|
        MOV      w0,#0xe6500000
        BL       |L2.2064|
        ADD      w8,w22,#8,LSL #12
        STR      w8,[x19,#0xff4]
        ADRP     x22,|L3.4868|
        ADD      x22,x22,#0xef4
        STR      w22,[x19,#0xff8]
        MOV      w8,#0x100c
        MOVK     w8,#0xe730,LSL #16
        LDUR     w9,[x8,#-4]
        MOV      w10,#0xd
        BFXIL    w9,w10,#0,#24
        STUR     w9,[x8,#-4]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffff3fff
        ORR      w9,w9,#0x4000
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffffcfff
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffff0ff
        ORR      w9,w9,#0x800
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffcfffff
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffffffe7
        ORR      w9,w9,#0x10
        STR      w9,[x8,#0]
        MOV      w9,#0xa2
        STRH     w9,[x8,#0x34]
        LDR      w9,[x8,#0]
        ORR      w9,w9,#4
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        ORR      w9,w9,#1
        STR      w9,[x8,#0]
        ADD      x19,x21,#8,LSL #12
        ADRP     x1,|L2.29292|
        ADD      x1,x1,#0xc4c
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3520|
        MOV      x0,x19
        BL       |L2.3472|
        BL       |L2.1504|
        ADRP     x1,|L2.4768|
        ADD      x1,x1,#0xc70
        MOV      w0,#0x10f
        BL       |L2.1920|
        ADRP     x1,|L2.4784|
        ADD      x1,x1,#0x4e0
        MOV      w0,#0x10e
        BL       |L2.1920|
        ADRP     x1,|L2.21184|
        ADD      x1,x1,#0x1f0
        ORR      w0,wzr,#0x40
        BL       |L2.1920|
        ADRP     x1,|L2.21200|
        ADD      x1,x1,#0x3d0
        MOV      w0,#0x41
        BL       |L2.1920|
        MOV      w0,#0x10f
        BL       |L2.1664|
        MOV      w0,#0x10e
        BL       |L2.1664|
        ORR      w0,wzr,#0x40
        BL       |L2.1664|
        MOV      w0,#0x41
        BL       |L2.1664|
        MOV      w0,#0xe6500000
        MOV      w1,#0x48
        BL       |L2.3248|
        ADRP     x8,|L3.5172|
|L2.13072|
        LDRB     w9,[x8,#0xe54]
        CBZ      w9,|L2.13072|
        MOV      w0,#0xe6500000
        BL       |L2.1984|
        ADD      x0,x21,#8,LSL #12
        BL       |L2.3424|
        MOV      x8,xzr
|L2.13100|
        LSL      x9,x8,#2
        LDR      w10,[x22,x9]
        LDR      w9,[x20,x9]
        CMP      w10,w9
        B.NE     |L2.13140|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.13100|
        MOV      w0,wzr
        B        |L2.13144|
|L2.13140|
        ORR      w0,wzr,#1
|L2.13144|
        LDP      x19,x30,[sp,#0x20]
        LDP      x21,x20,[sp,#0x10]
        LDR      x22,[sp],#0x30
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
master_tx_dma_continuous                  ; Alternate entry point
        STP      x25,x24,[sp,#-0x40]!
        STP      x23,x22,[sp,#0x10]
        STP      x21,x20,[sp,#0x20]
        STP      x19,x30,[sp,#0x30]
        MOV      w22,#0x800
        MOVK     w22,#0xe735,LSL #16
        MOV      w19,#0x24
        MOVK     w19,#0xe650,LSL #16
        MOV      w20,#0x2c1c
        MOVK     w20,#0xe615,LSL #16
        MOV      w0,#0x2c1c
        MOVK     w0,#0xe615,LSL #16
        MOV      w1,#9
        BL       |L2.1392|
        ADD      x0,x20,#0x80
        MOV      w1,#9
        BL       |L2.1392|
        SUB      x0,x22,#0x800
        ORR      w1,wzr,#2
        BL       |L2.1440|
        MOV      x8,xzr
        ADRP     x20,|L3.5356|
        MOV      w9,#0x34
        MOV      w10,#0xd
        MOV      w11,#0x91
        ADRP     x21,|L2.29652|
        ADD      x21,x21,#0x840
|L2.13276|
        LDR      w12,[x20,#0xe2c]
        MADD     w12,w12,w9,w21
        ADD      x13,x22,x8
        ADD      w12,w12,#4
        STR      w12,[x13,#0]
        STR      w19,[x13,#4]
        LDR      w12,[x13,#8]
        BFXIL    w12,w10,#0,#24
        STR      w12,[x13,#8]
        LDR      w12,[x13,#0xc]
        AND      w12,w12,#0xfffff3ff
        STR      w12,[x13,#0xc]
        LDR      w12,[x13,#0xc]
        AND      w12,w12,#0xfffffcff
        ORR      w12,w12,#0x100
        STR      w12,[x13,#0xc]
        LDR      w12,[x13,#0xc]
        AND      w12,w12,#0xffffff3f
        STR      w12,[x13,#0xc]
        LDR      w12,[x13,#0xc]
        AND      w12,w12,#0xfffffff0
        ORR      w12,w12,#2
        STR      w12,[x13,#0xc]
        LDR      w12,[x13,#0xc]
        BFI      w12,w11,#16,#8
        ADD      x8,x8,#0x10
        CMP      x8,#0x20
        STR      w12,[x13,#0xc]
        B.NE     |L2.13276|
        MOV      w23,#0x100c
        MOVK     w23,#0xe730,LSL #16
        ORR      x8,xzr,#0xfffffffffffff000
        LDR      w9,[x23,x8]
        AND      w9,w9,#0xcfffffff
        ORR      w9,w9,#0x10000000
        STR      w9,[x23,x8]
        LDR      w9,[x23,x8]
        ORR      w9,w9,#0xf000000
        STR      w9,[x23,x8]
        LDR      w9,[x23,x8]
        ORR      w9,w9,#0x400000
        STR      w9,[x23,x8]
        SUB      x9,x23,#0xff0
        LDR      w10,[x9,#0]
        ORR      w11,wzr,#0x1000000
        BFXIL    w11,w10,#0,#24
        STR      w11,[x9,#0]
        LDR      w10,[x9,#0]
        ORR      w10,w10,#0x8000
        STR      w10,[x9,#0]
        LDR      w9,[x23,x8]
        ORR      w9,w9,#4
        STR      w9,[x23,x8]
        MOV      w22,#0xe6500000
        LDR      w9,[x23,x8]
        ORR      w9,w9,#1
        STR      w9,[x23,x8]
        ADRP     x1,|L2.29888|
        ADD      x1,x1,#0x420
        MOV      w0,#0xe6500000
        BL       |L2.2160|
        MOV      w0,#0xe6500000
        ORR      w1,wzr,#1
        BL       |L2.3328|
        MOV      w25,#0xd
        MOV      w0,#0xe6500000
        MOV      w1,#0xd
        BL       |L2.3296|
        MOV      w0,#0xe6500000
        BL       |L2.2080|
        MOV      w0,#0xe6500000
        BL       |L2.2096|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.2128|
        MOV      w0,#0xe6500000
        BL       |L2.2064|
        ADD      w8,w19,#8,LSL #12
        STUR     w8,[x23,#-0xc]
        LDR      w8,[x20,#0xe2c]
        MOV      w24,#0x34
        ADRP     x9,|L4.1796|
        ADD      x9,x9,#0xfc
        MADD     w8,w8,w24,w9
        STUR     w8,[x23,#-8]
        LDUR     w8,[x23,#-4]
        BFXIL    w8,w25,#0,#24
        STUR     w8,[x23,#-4]
        LDR      w8,[x23,#0]
        AND      w8,w8,#0xffff3fff
        ORR      w8,w8,#0x4000
        STR      w8,[x23,#0]
        LDR      w8,[x23,#0]
        AND      w8,w8,#0xffffcfff
        STR      w8,[x23,#0]
        LDR      w8,[x23,#0]
        AND      w8,w8,#0xfffff0ff
        ORR      w8,w8,#0x800
        STR      w8,[x23,#0]
        LDR      w8,[x23,#0]
        AND      w8,w8,#0xffcfffff
        STR      w8,[x23,#0]
        LDR      w8,[x23,#0]
        AND      w8,w8,#0xffffffe7
        ORR      w8,w8,#0x10
        STR      w8,[x23,#0]
        MOV      w8,#0x1040
        MOVK     w8,#0xe730,LSL #16
        MOV      w9,#0xa2
        STRH     w9,[x8,#0]
        LDR      w8,[x23,#0]
        ORR      w8,w8,#4
        STR      w8,[x23,#0]
        LDR      w8,[x23,#0]
        ORR      w8,w8,#1
        STR      w8,[x23,#0]
        ADD      x19,x22,#8,LSL #12
        ADRP     x1,|L2.30140|
        ADD      x1,x1,#0xd3c
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3520|
        MOV      x0,x19
        BL       |L2.3472|
        BL       |L2.1504|
        ADRP     x1,|L2.5616|
        ADD      x1,x1,#0x730
        MOV      w0,#0x10e
        BL       |L2.1920|
        ADRP     x1,|L2.5632|
        ADD      x1,x1,#0xfb0
        MOV      w0,#0x10f
        BL       |L2.1920|
        ADRP     x1,|L2.22032|
        ADD      x1,x1,#0x2e0
        ORR      w0,wzr,#0x40
        BL       |L2.1920|
        ADRP     x1,|L2.22048|
        ADD      x1,x1,#0x4e0
        MOV      w0,#0x41
        BL       |L2.1920|
        MOV      w0,#0x10e
        BL       |L2.1664|
        MOV      w0,#0x10f
        BL       |L2.1664|
        ORR      w0,wzr,#0x40
        BL       |L2.1664|
        MOV      w0,#0x41
        BL       |L2.1664|
        LDR      w8,[x20,#0xe2c]
        MUL      x8,x8,x24
        LDR      w1,[x21,x8]
        MOV      w0,#0xe6500000
        BL       |L2.3248|
        ADRP     x8,|L3.6028|
|L2.13928|
        LDRB     w9,[x8,#0xe6c]
        CBZ      w9,|L2.13928|
        MOV      w0,#0xe6500000
        BL       |L2.1984|
        ADD      x0,x22,#8,LSL #12
        BL       |L2.3424|
        MOV      x8,xzr
        ADRP     x9,|L2.30340|
        ADD      x9,x9,#0x840
        ADRP     x10,|L4.2148|
        ADD      x10,x10,#0xfc
|L2.13972|
        MOV      x11,xzr
|L2.13976|
        LSL      x12,x11,#2
        LDR      w13,[x10,x12]
        LDR      w12,[x9,x12]
        CMP      w13,w12
        B.NE     |L2.14036|
        ADD      x11,x11,#1
        CMP      w11,#0xc
        B.LS     |L2.13976|
        ADD      x8,x8,#1
        ADD      x9,x9,#0x34
        ADD      x10,x10,#0x34
        CMP      x8,#2
        B.CC     |L2.13972|
        MOV      w0,wzr
        B        |L2.14040|
|L2.14036|
        ORR      w0,wzr,#1
|L2.14040|
        LDP      x19,x30,[sp,#0x30]
        LDP      x21,x20,[sp,#0x20]
        LDP      x23,x22,[sp,#0x10]
        LDP      x25,x24,[sp],#0x40
        RET      
        DCI      0x00000000 ; ? Undefined
master_tx_fsb                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        ADRP     x1,|L2.30452|
        ADD      x1,x1,#0x498
        MOV      w19,#0xe6500000
        MOV      w0,#0xe6500000
        BL       |L2.2160|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.2128|
        MOV      w0,#0xe6500000
        BL       |L2.2064|
        ADD      x19,x19,#8,LSL #12
        ADRP     x1,|L2.30508|
        ADD      x1,x1,#0xdb4
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3520|
        MOV      x0,x19
        BL       |L2.3472|
        BL       |L2.1504|
        ADRP     x1,|L2.5984|
        ADD      x1,x1,#0x9b0
        MOV      w0,#0x10e
        BL       |L2.1920|
        ADRP     x1,|L2.10096|
        ADD      x1,x1,#0x1b0
        MOV      w0,#0x10f
        BL       |L2.1920|
        MOV      w0,#0x10e
        BL       |L2.1664|
        MOV      w0,#0x10f
        BL       |L2.1664|
        ADRP     x8,|L4.2408|
        LDR      w9,[x8,#0x964]
        ADD      w10,w9,#1
        ADRP     x19,|L2.30620|
        ADD      x19,x19,#0x9ac
        STR      w10,[x8,#0x964]
        LDR      w1,[x19,x9,LSL #2]
        MOV      w0,#0xe6500000
        BL       |L2.3248|
        ADRP     x8,|L3.6364|
|L2.14264|
        LDRB     w9,[x8,#0xe7c]
        CBZ      w9,|L2.14264|
        MOV      x8,xzr
        ADRP     x9,|L4.2460|
        ADD      x9,x9,#0x268
|L2.14284|
        LSL      x10,x8,#2
        LDR      w11,[x9,x10]
        LDR      w10,[x19,x10]
        CMP      w11,w10
        B.NE     |L2.14328|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.14284|
        MOV      w0,wzr
        LDP      x19,x30,[sp],#0x10
        RET      
|L2.14328|
        ORR      w0,wzr,#1
        LDP      x19,x30,[sp],#0x10
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
master_tx_rpt_master_rx                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        ADRP     x1,|L2.30740|
        ADD      x1,x1,#0x480
        MOV      w19,#0xe6500000
        MOV      w0,#0xe6500000
        BL       |L2.2160|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.2128|
        MOV      w0,#0xe6500000
        BL       |L2.2064|
        ADD      x19,x19,#8,LSL #12
        ADRP     x1,|L2.30796|
        ADD      x1,x1,#0xd9c
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3520|
        MOV      x0,x19
        BL       |L2.3472|
        BL       |L2.1504|
        ADRP     x1,|L2.6272|
        ADD      x1,x1,#0x8e0
        MOV      w0,#0x10e
        BL       |L2.1920|
        ADRP     x1,|L2.10384|
        ADD      x1,x1,#0x100
        MOV      w0,#0x10f
        BL       |L2.1920|
        MOV      w0,#0x10e
        BL       |L2.1664|
        MOV      w0,#0x10f
        BL       |L2.1664|
        ADRP     x8,|L4.2696|
        LDR      w9,[x8,#0x960]
        ADD      w10,w9,#1
        ADRP     x19,|L2.30908|
        ADD      x19,x19,#0x978
        STR      w10,[x8,#0x960]
        LDR      w1,[x19,x9,LSL #2]
        MOV      w0,#0xe6500000
        BL       |L2.3248|
        ADRP     x8,|L3.6652|
|L2.14552|
        LDRB     w9,[x8,#0xe78]
        CBZ      w9,|L2.14552|
        MOV      x8,xzr
        ADRP     x9,|L4.2748|
        ADD      x9,x9,#0x234
|L2.14572|
        LSL      x10,x8,#2
        LDR      w11,[x9,x10]
        LDR      w10,[x19,x10]
        CMP      w11,w10
        B.NE     |L2.14616|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.14572|
        MOV      w0,wzr
        LDP      x19,x30,[sp],#0x10
        RET      
|L2.14616|
        ORR      w0,wzr,#1
        LDP      x19,x30,[sp],#0x10
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
mstp_check                  ; Alternate entry point
        SUB      sp,sp,#0x90
        STP      x28,x27,[sp,#0x30]
        STP      x26,x25,[sp,#0x40]
        STP      x24,x23,[sp,#0x50]
        STP      x22,x21,[sp,#0x60]
        STP      x20,x19,[sp,#0x70]
        STP      x29,x30,[sp,#0x80]
        MOV      w23,#0xe6500000
        MOV      w19,#0x2d14
        MOVK     w19,#0xe615,LSL #16
        MOV      w2,#0xe6500000
        MOV      w0,wzr
        MOV      w1,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#4
        ORR      w1,wzr,#1
        MOV      w0,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#8
        ORR      w1,wzr,#2
        MOV      w0,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#0xc
        ORR      w1,wzr,#3
        MOV      w0,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#0x10
        ORR      w1,wzr,#4
        MOV      w0,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#0x14
        MOV      w1,#5
        MOV      w0,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#0x18
        ORR      w1,wzr,#6
        MOV      w0,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#0x1c
        ORR      w1,wzr,#7
        MOV      w0,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#0x20
        ORR      w1,wzr,#8
        MOV      w0,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#0x24
        MOV      w1,#9
        MOV      w0,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#0x28
        MOV      w1,#0xa
        MOV      w0,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#0x2c
        MOV      w1,#0xb
        MOV      w0,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#0x30
        ORR      w1,wzr,#0xc
        MOV      w0,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#0x34
        MOV      w1,#0xd
        MOV      w0,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#0x38
        ORR      w1,wzr,#0xe
        MOV      w0,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#0x3c
        ORR      w1,wzr,#0xf
        MOV      w0,wzr
        BL       |symbol_number.273|
        MOV      w8,#0xffffffff
        STR      w8,[x23,#0]
        STR      w8,[x23,#4]
        STR      w8,[x23,#8]
        STR      w8,[x23,#0xc]
        STR      w8,[x23,#0x10]
        STR      w8,[x23,#0x14]
        STR      w8,[x23,#0x18]
        STR      w8,[x23,#0x1c]
        STR      w8,[x23,#0x20]
        STR      w8,[x23,#0x24]
        STR      w8,[x23,#0x28]
        STR      w8,[x23,#0x2c]
        STR      w8,[x23,#0x30]
        STR      w8,[x23,#0x34]
        STR      w8,[x23,#0x38]
        STR      w8,[x23,#0x3c]
        MOV      w0,#0x2d14
        MOVK     w0,#0xe615,LSL #16
        MOV      w1,#0x12
        BL       |L2.1392|
|L2.15020|
        LDR      w8,[x19,#0x100]
        TBZ      w8,#18,|L2.15020|
        ORR      w0,wzr,#1
        MOV      w2,#0xe6500000
        MOV      w1,wzr
        BL       |symbol_number.273|
        ADD      x2,x23,#4
        ORR      w0,wzr,#1
        ORR      w1,wzr,#1
        BL       |symbol_number.273|
        ADD      x2,x23,#8
        ORR      w0,wzr,#1
        ORR      w1,wzr,#2
        BL       |symbol_number.273|
        ADD      x2,x23,#0xc
        ORR      w0,wzr,#1
        ORR      w1,wzr,#3
        BL       |symbol_number.273|
        ADD      x2,x23,#0x10
        ORR      w0,wzr,#1
        ORR      w1,wzr,#4
        BL       |symbol_number.273|
        ADD      x2,x23,#0x14
        ORR      w0,wzr,#1
        MOV      w1,#5
        BL       |symbol_number.273|
        ADD      x2,x23,#0x18
        ORR      w0,wzr,#1
        ORR      w1,wzr,#6
        BL       |symbol_number.273|
        ADD      x2,x23,#0x1c
        ORR      w0,wzr,#1
        ORR      w1,wzr,#7
        BL       |symbol_number.273|
        ADD      x2,x23,#0x20
        ORR      w0,wzr,#1
        ORR      w1,wzr,#8
        BL       |symbol_number.273|
        ADD      x2,x23,#0x24
        ORR      w0,wzr,#1
        MOV      w1,#9
        BL       |symbol_number.273|
        ADD      x2,x23,#0x28
        ORR      w0,wzr,#1
        MOV      w1,#0xa
        BL       |symbol_number.273|
        ADD      x2,x23,#0x2c
        ORR      w0,wzr,#1
        MOV      w1,#0xb
        BL       |symbol_number.273|
        ADD      x2,x23,#0x30
        ORR      w0,wzr,#1
        ORR      w1,wzr,#0xc
        BL       |symbol_number.273|
        ADD      x2,x23,#0x34
        ORR      w0,wzr,#1
        MOV      w1,#0xd
        BL       |symbol_number.273|
        ADD      x2,x23,#0x38
        ORR      w0,wzr,#1
        ORR      w1,wzr,#0xe
        BL       |symbol_number.273|
        ADD      x2,x23,#0x3c
        ORR      w0,wzr,#1
        ORR      w1,wzr,#0xf
        BL       |symbol_number.273|
        MOV      w0,#0x2d14
        MOVK     w0,#0xe615,LSL #16
        MOV      w1,#0x12
        BL       |L2.1344|
|L2.15300|
        LDR      w8,[x19,#0x100]
        TBNZ     w8,#18,|L2.15300|
        ADRP     x24,|L2.43980|
        ADD      x24,x24,#0x748
        LDR      w8,[x23,#0]
        STR      w8,[x24,#0x100]
        MOV      w22,#0xe6500000
        LDR      w8,[x22,#4]!
        STR      w8,[x24,#0x108]
        MOV      w21,#0xe6500000
        LDR      w8,[x21,#8]!
        STR      w8,[x24,#0x110]
        MOV      w20,#0xe6500000
        LDR      w8,[x20,#0xc]!
        STR      w8,[x24,#0x118]
        MOV      w19,#0xe6500000
        LDR      w8,[x19,#0x10]!
        STR      w8,[x24,#0x120]
        MOV      w29,#0xe6500000
        LDR      w8,[x29,#0x14]!
        STR      w8,[x24,#0x128]
        MOV      w28,#0xe6500000
        LDR      w8,[x28,#0x18]!
        STR      w8,[x24,#0x130]
        MOV      w27,#0xe6500000
        LDR      w8,[x27,#0x1c]!
        STR      w8,[x24,#0x138]
        MOV      w26,#0xe6500000
        LDR      w8,[x26,#0x20]!
        STR      w8,[x24,#0x140]
        MOV      w25,#0xe6500000
        LDR      w8,[x25,#0x24]!
        STR      w8,[x24,#0x148]
        MOV      w9,#0xe6500000
        LDR      w8,[x9,#0x28]!
        MOV      x14,x9
        STR      w8,[x24,#0x150]
        MOV      w9,#0xe6500000
        LDR      w8,[x9,#0x2c]!
        MOV      x13,x9
        STR      w8,[x24,#0x158]
        MOV      w9,#0xe6500000
        LDR      w8,[x9,#0x30]!
        MOV      x12,x9
        STR      w8,[x24,#0x160]
        MOV      w9,#0xe6500000
        LDR      w8,[x9,#0x34]!
        MOV      x11,x9
        STR      w8,[x24,#0x168]
        MOV      w9,#0xe6500000
        LDR      w8,[x9,#0x38]!
        MOV      x10,x9
        STR      w8,[x24,#0x170]
        MOV      w9,#0xe6500000
        LDR      w8,[x9,#0x3c]!
        STR      w8,[x24,#0x178]
        STR      wzr,[x23,#0]
        STR      wzr,[x22,#0]
        STR      wzr,[x21,#0]
        STR      wzr,[x20,#0]
        STR      wzr,[x19,#0]
        STR      wzr,[x29,#0]
        STR      wzr,[x28,#0]
        STR      wzr,[x27,#0]
        STR      wzr,[x26,#0]
        STR      wzr,[x25,#0]
        STR      wzr,[x14,#0]
        STR      wzr,[x13,#0]
        STP      x13,x12,[sp,#8]
        STR      wzr,[x12,#0]
        STR      wzr,[x11,#0]
        STP      x11,x10,[sp,#0x18]
        STR      wzr,[x10,#0]
        STR      wzr,[x9,#0]
        STR      x9,[sp,#0x28]
        LDR      w8,[x23,#0]
        STR      w8,[x24,#0x104]
        LDR      w8,[x22,#0]
        STR      w8,[x24,#0x10c]
        LDR      w8,[x21,#0]
        STR      w8,[x24,#0x114]
        LDR      w8,[x20,#0]
        STR      w8,[x24,#0x11c]
        LDR      w8,[x19,#0]
        STR      w8,[x24,#0x124]
        LDR      w8,[x29,#0]
        STR      w8,[x24,#0x12c]
        LDR      w8,[x28,#0]
        STR      w8,[x24,#0x134]
        LDR      w8,[x27,#0]
        STR      w8,[x24,#0x13c]
        LDR      w8,[x26,#0]
        STR      w8,[x24,#0x144]
        LDR      w8,[x25,#0]
        STR      w8,[x24,#0x14c]
        LDR      w8,[x14,#0]
        MOV      x23,x14
        STR      w8,[x24,#0x154]
        LDR      w8,[x13,#0]
        STR      w8,[x24,#0x15c]
        LDR      w8,[x12,#0]
        STR      w8,[x24,#0x164]
        LDR      w8,[x11,#0]
        STR      w8,[x24,#0x16c]
        LDR      w8,[x10,#0]
        STR      w8,[x24,#0x174]
        LDR      w8,[x9,#0]
        STR      w8,[x24,#0x17c]
        ORR      w0,wzr,#3
        MOV      w2,#0xe6500000
        MOV      w1,wzr
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        ORR      w1,wzr,#1
        MOV      x2,x22
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        ORR      w1,wzr,#2
        MOV      x2,x21
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        ORR      w1,wzr,#3
        MOV      x2,x20
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        ORR      w1,wzr,#4
        MOV      x2,x19
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        MOV      w1,#5
        MOV      x2,x29
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        ORR      w1,wzr,#6
        MOV      x2,x28
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        ORR      w1,wzr,#7
        MOV      x2,x27
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        ORR      w1,wzr,#8
        MOV      x2,x26
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        MOV      w1,#9
        MOV      x2,x25
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        MOV      w1,#0xa
        MOV      x2,x23
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        MOV      w1,#0xb
        LDR      x2,[sp,#8]
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        ORR      w1,wzr,#0xc
        LDR      x2,[sp,#0x10]
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        MOV      w1,#0xd
        LDR      x2,[sp,#0x18]
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        ORR      w1,wzr,#0xe
        LDR      x2,[sp,#0x20]
        BL       |symbol_number.273|
        ORR      w0,wzr,#3
        ORR      w1,wzr,#0xf
        LDR      x2,[sp,#0x28]
        BL       |symbol_number.273|
        MOV      x8,xzr
        ADRP     x9,|L2.32376|
        ADD      x9,x9,#0x100
|L2.16000|
        MOV      x10,xzr
|L2.16004|
        MOV      w11,wzr
|L2.16008|
        MOV      w12,w11
        LSL      x13,x8,#7
        ADD      x14,x24,x13
        LSL      x15,x10,#3
        ADD      x14,x14,x15
        LSL      x12,x12,#2
        LDR      w14,[x14,x12]
        ADD      x13,x9,x13
        ADD      x13,x13,x15
        LDR      w12,[x13,x12]
        CMP      w14,w12
        B.NE     |L2.16104|
        ADD      w12,w11,#1
        ORR      w11,wzr,#1
        CMP      w12,#1
        B.LS     |L2.16008|
        ADD      x10,x10,#1
        CMP      x10,#0x10
        B.CC     |L2.16004|
        ADD      x8,x8,#1
        CMP      x8,#4
        B.CC     |L2.16000|
        MOV      w0,wzr
        B        |L2.16108|
|L2.16104|
        ORR      w0,wzr,#1
|L2.16108|
        LDP      x29,x30,[sp,#0x80]
        LDP      x20,x19,[sp,#0x70]
        LDP      x22,x21,[sp,#0x60]
        LDP      x24,x23,[sp,#0x50]
        LDP      x26,x25,[sp,#0x40]
        LDP      x28,x27,[sp,#0x30]
        ADD      sp,sp,#0x90
        RET      
        DCI      0x00000000 ; ? Undefined
pad_check                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        ADRP     x1,|L3.60|
        ADD      x1,x1,#0x438
        MOV      w19,#0xe6500000
        MOV      w0,#0xe6500000
        BL       |L2.2160|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.2128|
        MOV      w0,#0xe6500000
        BL       |L2.2064|
        ADD      x19,x19,#8,LSL #12
        ADRP     x1,|L3.116|
        ADD      x1,x1,#0xd54
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3520|
        MOV      x0,x19
        BL       |L2.3472|
        BL       |L2.1504|
        ADRP     x1,|L2.8064|
        ADD      x1,x1,#0x7a0
        MOV      w0,#0x10e
        BL       |L2.1920|
        ADRP     x1,|L2.8080|
        ADD      x1,x1,#0xfe0
        MOV      w0,#0x10f
        BL       |L2.1920|
        MOV      w0,#0x10e
        BL       |L2.1664|
        MOV      w0,#0x10f
        BL       |L2.1664|
        ADRP     x8,|L2.44976|
        LDR      w9,[x8,#0x958]
        ADD      w10,w9,#1
        ADRP     x19,|L3.228|
        ADD      x19,x19,#0x8a8
        STR      w10,[x8,#0x958]
        LDR      w1,[x19,x9,LSL #2]
        MOV      w0,#0xe6500000
        BL       |L2.3248|
        ADRP     x8,|L4.428|
|L2.16344|
        LDRB     w9,[x8,#0xe70]
        CBZ      w9,|L2.16344|
        MOV      x8,xzr
        ADRP     x9,|L2.45028|
        ADD      x9,x9,#0x164
|L2.16364|
        LSL      x10,x8,#2
        LDR      w11,[x9,x10]
        LDR      w10,[x19,x10]
        CMP      w11,w10
        B.NE     |L2.16408|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.16364|
        MOV      w0,wzr
        LDP      x19,x30,[sp],#0x10
        RET      
|L2.16408|
        ORR      w0,wzr,#1
        LDP      x19,x30,[sp],#0x10
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
reg_check                  ; Alternate entry point
        STP      x19,x30,[sp,#-0x10]!
        MOV      w19,#0xe6500000
        MOV      w1,#0xe6500000
        MOV      w0,wzr
        BL       |symbol_number.218|
        ADD      x1,x19,#4
        ORR      w0,wzr,#1
        BL       |symbol_number.218|
        ADD      x1,x19,#8
        ORR      w0,wzr,#2
        BL       |symbol_number.218|
        ADD      x1,x19,#0xc
        ORR      w0,wzr,#3
        BL       |symbol_number.218|
        ADD      x1,x19,#0x10
        ORR      w0,wzr,#4
        BL       |symbol_number.218|
        ADD      x1,x19,#0x14
        MOV      w0,#5
        BL       |symbol_number.218|
        ADD      x1,x19,#0x18
        ORR      w0,wzr,#6
        BL       |symbol_number.218|
        ADD      x1,x19,#0x1c
        ORR      w0,wzr,#7
        BL       |symbol_number.218|
        ADD      x1,x19,#0x20
        ORR      w0,wzr,#8
        BL       |symbol_number.218|
        ADD      x1,x19,#0x24
        MOV      w0,#9
        BL       |symbol_number.218|
        ADD      x1,x19,#0x28
        MOV      w0,#0xa
        BL       |symbol_number.218|
        ADD      x1,x19,#0x2c
        MOV      w0,#0xb
        BL       |symbol_number.218|
        ADD      x1,x19,#0x30
        ORR      w0,wzr,#0xc
        BL       |symbol_number.218|
        ADD      x1,x19,#0x34
        MOV      w0,#0xd
        BL       |symbol_number.218|
        ADD      x1,x19,#0x38
        ORR      w0,wzr,#0xe
        BL       |symbol_number.218|
        ADD      x1,x19,#0x3c
        ORR      w0,wzr,#0xf
        BL       |symbol_number.218|
        MOV      x8,xzr
        ADRP     x9,|symbol_number.155|
        ADD      x9,x9,#0x6c8
        ADRP     x10,|L2.28932|
        ADD      x10,x10,#0x80
|L2.16652|
        MOV      w11,wzr
|L2.16656|
        MOV      w12,w11
        LSL      x13,x8,#3
        ADD      x14,x9,x13
        LSL      x12,x12,#2
        LDR      w14,[x14,x12]
        ADD      x13,x10,x13
        LDR      w12,[x13,x12]
        CMP      w14,w12
        B.NE     |L2.16732|
        ADD      w12,w11,#1
        ORR      w11,wzr,#1
        CMP      w12,#1
        B.LS     |L2.16656|
        ADD      x8,x8,#1
        CMP      x8,#0x10
        B.CC     |L2.16652|
        MOV      w0,wzr
        LDP      x19,x30,[sp],#0x10
        RET      
|L2.16732|
        ORR      w0,wzr,#1
        LDP      x19,x30,[sp],#0x10
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
renesas_slave_rx                  ; Alternate entry point
        STP      x25,x24,[sp,#-0x40]!
        STP      x23,x22,[sp,#0x10]
        STP      x21,x20,[sp,#0x20]
        STP      x19,x30,[sp,#0x30]
        MOV      w20,#0x8000
        MOVK     w20,#0xe650,LSL #16
        ADRP     x1,|L2.29064|
        ADD      x1,x1,#0x570
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2160|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2064|
        SUB      x19,x20,#8,LSL #12
        ADRP     x1,|L2.29116|
        ADD      x1,x1,#0xe8c
        MOV      x0,x19
        BL       |L2.3552|
        LDR      w8,[x19,#0]
        AND      w8,w8,#0xfffffff7
        STR      w8,[x19,#0]
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      x0,x19
        BL       |L2.3472|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0x48
        BL       |L2.3248|
        MOV      x8,#0xffffffffffff8008
|L2.16896|
        LDR      w9,[x20,x8]
        TBZ      w9,#0,|L2.16896|
        MOV      w23,#0x800c
        MOVK     w23,#0xe650,LSL #16
        ORR      w1,wzr,#1
        MOV      x0,x19
        BL       |L2.3408|
|L2.16924|
        LDR      w8,[x23,#0]
        TBZ      w8,#0,|L2.16924|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#9
        BL       |L2.1968|
        ORR      w24,wzr,#1
        ADRP     x21,|L2.29252|
        ADD      x21,x21,#0xbb4
        MOV      x25,#0xffffffffffff8008
        ADRP     x22,|L4.1064|
        ADD      x22,x22,#0x43c
|L2.16984|
        LDR      w8,[x23,#0]
        TBZ      w8,#3,|L2.16984|
        CMP      x24,#0xc
        B.HI     |L2.17020|
        LDR      w1,[x21,x24,LSL #2]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3232|
        B        |L2.17040|
|L2.17020|
        CMP      x24,#0xd
        B.NE     |L2.17040|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3280|
|L2.17040|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#8
        BL       |L2.1968|
|L2.17056|
        LDR      w8,[x23,#0]
        TBZ      w8,#2,|L2.17056|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#4
        BL       |L2.1968|
|L2.17080|
        LDR      w8,[x20,x25]
        TBZ      w8,#1,|L2.17080|
        MOV      x0,x19
        BL       |L2.4528|
        ADD      x8,x22,x24,LSL #2
        STUR     w0,[x8,#-4]
        ORR      w1,wzr,#2
        MOV      x0,x19
        BL       |L2.3408|
        ADD      x24,x24,#1
        CMP      x24,#0xe
        B.NE     |L2.16984|
        MOV      x8,#0xffffffffffff8008
|L2.17132|
        LDR      w9,[x20,x8]
        TBZ      w9,#4,|L2.17132|
        ORR      w1,wzr,#0x10
        MOV      x0,x19
        BL       |L2.3408|
|L2.17152|
        LDR      w8,[x23,#0]
        TBZ      w8,#4,|L2.17152|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x10
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.1984|
        MOV      x0,x19
        BL       |L2.3424|
        MOV      x8,xzr
|L2.17200|
        LSL      x9,x8,#2
        LDR      w10,[x22,x9]
        LDR      w9,[x21,x9]
        CMP      w10,w9
        B.NE     |L2.17240|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.17200|
        MOV      w0,wzr
        B        |L2.17244|
|L2.17240|
        ORR      w0,wzr,#1
|L2.17244|
        LDP      x19,x30,[sp,#0x30]
        LDP      x21,x20,[sp,#0x20]
        LDP      x23,x22,[sp,#0x10]
        LDP      x25,x24,[sp],#0x40
        RET      
renesas_slave_rx_delay                  ; Alternate entry point
        STP      x25,x24,[sp,#-0x40]!
        STP      x23,x22,[sp,#0x10]
        STP      x21,x20,[sp,#0x20]
        STP      x19,x30,[sp,#0x30]
        MOV      w20,#0x8000
        MOVK     w20,#0xe650,LSL #16
        ADRP     x1,|L2.29576|
        ADD      x1,x1,#0x468
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2160|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2064|
        SUB      x19,x20,#8,LSL #12
        ADRP     x1,|L2.29628|
        ADD      x1,x1,#0xd84
        MOV      x0,x19
        BL       |L2.3552|
        LDR      w8,[x19,#0]
        AND      w8,w8,#0xfffffff7
        STR      w8,[x19,#0]
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      x0,x19
        BL       |L2.3472|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0x48
        BL       |L2.3248|
        MOV      x8,#0xffffffffffff8008
|L2.17408|
        LDR      w9,[x20,x8]
        TBZ      w9,#0,|L2.17408|
        MOV      w23,#0x800c
        MOVK     w23,#0xe650,LSL #16
        ORR      w1,wzr,#1
        MOV      x0,x19
        BL       |L2.3408|
|L2.17436|
        LDR      w8,[x23,#0]
        TBZ      w8,#0,|L2.17436|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#9
        BL       |L2.1968|
        ORR      w24,wzr,#1
        ADRP     x21,|L2.29764|
        ADD      x21,x21,#0x910
        MOV      x25,#0xffffffffffff8008
        ADRP     x22,|L4.1576|
        ADD      x22,x22,#0x1cc
|L2.17496|
        LDR      w8,[x23,#0]
        TBZ      w8,#3,|L2.17496|
        CMP      x24,#0xc
        B.HI     |L2.17532|
        LDR      w1,[x21,x24,LSL #2]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3232|
        B        |L2.17552|
|L2.17532|
        CMP      x24,#0xd
        B.NE     |L2.17552|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3280|
|L2.17552|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#8
        BL       |L2.1968|
|L2.17568|
        LDR      w8,[x23,#0]
        TBZ      w8,#2,|L2.17568|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#4
        BL       |L2.1968|
|L2.17592|
        LDR      w8,[x20,x25]
        TBZ      w8,#1,|L2.17592|
        MOV      x0,x19
        BL       |L2.4528|
        ADD      x8,x22,x24,LSL #2
        STUR     w0,[x8,#-4]
        MOV      w0,#0x320
        BL       |L2.4688|
        ORR      w1,wzr,#2
        MOV      x0,x19
        BL       |L2.3408|
        ADD      x24,x24,#1
        CMP      x24,#0xe
        B.NE     |L2.17496|
        MOV      x8,#0xffffffffffff8008
|L2.17652|
        LDR      w9,[x20,x8]
        TBZ      w9,#4,|L2.17652|
        ORR      w1,wzr,#0x10
        MOV      x0,x19
        BL       |L2.3408|
|L2.17672|
        LDR      w8,[x23,#0]
        TBZ      w8,#4,|L2.17672|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x10
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.1984|
        MOV      x0,x19
        BL       |L2.3424|
        MOV      x8,xzr
|L2.17720|
        LSL      x9,x8,#2
        LDR      w10,[x22,x9]
        LDR      w9,[x21,x9]
        CMP      w10,w9
        B.NE     |L2.17760|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.17720|
        MOV      w0,wzr
        B        |L2.17764|
|L2.17760|
        ORR      w0,wzr,#1
|L2.17764|
        LDP      x19,x30,[sp,#0x30]
        LDP      x21,x20,[sp,#0x20]
        LDP      x23,x22,[sp,#0x10]
        LDP      x25,x24,[sp],#0x40
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
renesas_slave_rx_fna                  ; Alternate entry point
        STP      x23,x22,[sp,#-0x30]!
        STP      x21,x20,[sp,#0x10]
        STP      x19,x30,[sp,#0x20]
        MOV      w20,#0xe6500000
        ADD      x19,x20,#8,LSL #12
        ADRP     x1,|L2.30100|
        ADD      x1,x1,#0x360
        MOV      x0,x19
        BL       |L2.2160|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.1968|
        MOV      x0,x19
        BL       |L2.2064|
        ADRP     x1,masterConfig1
        ADD      x1,x1,#0xc7c
        MOV      w0,#0xe6500000
        BL       |L2.3552|
        LDR      w8,[x20,#0]
        AND      w8,w8,#0xfffffff7
        STR      w8,[x20,#0]
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.3408|
        MOV      w0,#0xe6500000
        BL       |L2.3472|
        MOV      w1,#0x48
        MOV      x0,x19
        BL       |L2.3248|
|L2.17908|
        LDR      w8,[x20,#8]
        TBZ      w8,#0,|L2.17908|
        MOV      w23,#0x800c
        MOVK     w23,#0xe650,LSL #16
        MOV      w0,#0xe6500000
        ORR      w1,wzr,#1
        BL       |L2.3408|
|L2.17936|
        LDR      w8,[x23,#0]
        TBZ      w8,#0,|L2.17936|
        ADD      x19,x20,#8,LSL #12
        MOV      x0,x19
        BL       |L2.2048|
        MOV      w1,#9
        MOV      x0,x19
        BL       |L2.1968|
        ADRP     x21,|L2.30256|
        ADD      x21,x21,#0x6a0
        ORR      w19,wzr,#1
        ADRP     x22,|L3.5988|
        ADD      x22,x22,#0xf5c
|L2.17988|
        LDR      w8,[x23,#0]
        TBZ      w8,#3,|L2.17988|
        CMP      x19,#0xc
        B.HI     |L2.18016|
        LDR      w1,[x21,x19,LSL #2]
        ADD      x0,x20,#8,LSL #12
        BL       |L2.3232|
|L2.18016|
        ADD      x0,x20,#8,LSL #12
        ORR      w1,wzr,#8
        BL       |L2.1968|
|L2.18028|
        LDR      w8,[x23,#0]
        TBZ      w8,#2,|L2.18028|
        ADD      x0,x20,#8,LSL #12
        ORR      w1,wzr,#4
        BL       |L2.1968|
|L2.18048|
        LDR      w8,[x20,#8]
        TBZ      w8,#1,|L2.18048|
        CMP      x19,#0xb
        B.HI     |L2.18076|
        MOV      w0,#0xe6500000
        BL       |L2.4528|
        B        |L2.18116|
|L2.18076|
        AND      w8,w19,#0xff
        CMP      w8,#0xd
        B.EQ     |L2.18108|
        CMP      w8,#0xc
        B.NE     |L2.18124|
        MOV      w0,#0xe6500000
        BL       |L2.4544|
        B        |L2.18116|
|L2.18108|
        MOV      w0,#0xe6500000
        BL       |L2.4512|
|L2.18116|
        ADD      x8,x22,x19,LSL #2
        STUR     w0,[x8,#-4]
|L2.18124|
        MOV      w0,#0xe6500000
        ORR      w1,wzr,#2
        BL       |L2.3408|
        ADD      x19,x19,#1
        CMP      x19,#0xe
        B.NE     |L2.17988|
|L2.18148|
        LDR      w8,[x23,#0]
        TBZ      w8,#6,|L2.18148|
        ADD      x0,x20,#8,LSL #12
        ORR      w1,wzr,#0x40
        BL       |L2.1968|
|L2.18168|
        LDR      w8,[x20,#8]
        TBZ      w8,#4,|L2.18168|
        MOV      w0,#0xe6500000
        ORR      w1,wzr,#0x10
        BL       |L2.3408|
|L2.18188|
        LDR      w8,[x23,#0]
        TBZ      w8,#4,|L2.18188|
        ADD      x19,x20,#8,LSL #12
        ORR      w1,wzr,#0x10
        MOV      x0,x19
        BL       |L2.1968|
        MOV      x0,x19
        BL       |L2.1984|
        MOV      w0,#0xe6500000
        BL       |L2.3424|
        MOV      w8,wzr
|L2.18232|
        AND      w9,w8,#0xff
        LSL      x9,x9,#2
        LDR      w10,[x22,x9]
        LDR      w9,[x21,x9]
        CMP      w10,w9
        B.NE     |L2.18280|
        ADD      w8,w8,#1
        AND      w9,w8,#0xff
        CMP      w9,#0xc
        B.LS     |L2.18232|
        MOV      w0,wzr
        B        |L2.18284|
|L2.18280|
        ORR      w0,wzr,#1
|L2.18284|
        LDP      x19,x30,[sp,#0x20]
        LDP      x21,x20,[sp,#0x10]
        LDP      x23,x22,[sp],#0x30
        RET      
        DCI      0x00000000 ; ? Undefined
renesas_slave_rx_fna_delay                  ; Alternate entry point
        STP      x23,x22,[sp,#-0x30]!
        STP      x21,x20,[sp,#0x10]
        STP      x19,x30,[sp,#0x20]
        MOV      w20,#0xe6500000
        ADD      x19,x20,#8,LSL #12
        ADRP     x1,|L2.30612|
        ADD      x1,x1,#0x558
        MOV      x0,x19
        BL       |L2.2160|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.1968|
        MOV      x0,x19
        BL       |L2.2064|
        ADRP     x1,|L2.30648|
        ADD      x1,x1,#0xe74
        MOV      w0,#0xe6500000
        BL       |L2.3552|
        LDR      w8,[x20,#0]
        AND      w8,w8,#0xfffffff7
        STR      w8,[x20,#0]
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.3408|
        MOV      w0,#0xe6500000
        BL       |L2.3472|
        MOV      w1,#0x48
        MOV      x0,x19
        BL       |L2.3248|
|L2.18420|
        LDR      w8,[x20,#8]
        TBZ      w8,#0,|L2.18420|
        MOV      w23,#0x800c
        MOVK     w23,#0xe650,LSL #16
        MOV      w0,#0xe6500000
        ORR      w1,wzr,#1
        BL       |L2.3408|
|L2.18448|
        LDR      w8,[x23,#0]
        TBZ      w8,#0,|L2.18448|
        ADD      x19,x20,#8,LSL #12
        MOV      x0,x19
        BL       |L2.2048|
        MOV      w1,#9
        MOV      x0,x19
        BL       |L2.1968|
        ADRP     x21,|L2.30768|
        ADD      x21,x21,#0xb80
        ORR      w19,wzr,#1
        ADRP     x22,|L4.2580|
        ADD      x22,x22,#0x408
|L2.18500|
        LDR      w8,[x23,#0]
        TBZ      w8,#3,|L2.18500|
        CMP      x19,#0xc
        B.HI     |L2.18528|
        LDR      w1,[x21,x19,LSL #2]
        ADD      x0,x20,#8,LSL #12
        BL       |L2.3232|
|L2.18528|
        ADD      x0,x20,#8,LSL #12
        ORR      w1,wzr,#8
        BL       |L2.1968|
|L2.18540|
        LDR      w8,[x23,#0]
        TBZ      w8,#2,|L2.18540|
        ADD      x0,x20,#8,LSL #12
        ORR      w1,wzr,#4
        BL       |L2.1968|
|L2.18560|
        LDR      w8,[x20,#8]
        TBZ      w8,#1,|L2.18560|
        CMP      x19,#0xb
        B.HI     |L2.18588|
        MOV      w0,#0xe6500000
        BL       |L2.4528|
        B        |L2.18624|
|L2.18588|
        CMP      w19,#0xd
        B.EQ     |L2.18616|
        CMP      w19,#0xc
        B.NE     |L2.18632|
        MOV      w0,#0xe6500000
        BL       |L2.4544|
        B        |L2.18624|
|L2.18616|
        MOV      w0,#0xe6500000
        BL       |L2.4512|
|L2.18624|
        ADD      x8,x22,x19,LSL #2
        STUR     w0,[x8,#-4]
|L2.18632|
        MOV      w0,#0x320
        BL       |L2.4688|
        MOV      w0,#0xe6500000
        ORR      w1,wzr,#2
        BL       |L2.3408|
        ADD      x19,x19,#1
        CMP      x19,#0xe
        B.NE     |L2.18500|
|L2.18664|
        LDR      w8,[x23,#0]
        TBZ      w8,#6,|L2.18664|
        ADD      x0,x20,#8,LSL #12
        ORR      w1,wzr,#0x40
        BL       |L2.1968|
|L2.18684|
        LDR      w8,[x20,#8]
        TBZ      w8,#4,|L2.18684|
        MOV      w0,#0xe6500000
        ORR      w1,wzr,#0x10
        BL       |L2.3408|
|L2.18704|
        LDR      w8,[x23,#0]
        TBZ      w8,#4,|L2.18704|
        ADD      x19,x20,#8,LSL #12
        ORR      w1,wzr,#0x10
        MOV      x0,x19
        BL       |L2.1968|
        MOV      x0,x19
        BL       |L2.1984|
        MOV      w0,#0xe6500000
        BL       |L2.3424|
        MOV      x8,xzr
|L2.18748|
        LSL      x9,x8,#2
        LDR      w10,[x22,x9]
        LDR      w9,[x21,x9]
        CMP      w10,w9
        B.NE     |L2.18788|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.18748|
        MOV      w0,wzr
        B        |L2.18792|
|L2.18788|
        ORR      w0,wzr,#1
|L2.18792|
        LDP      x19,x30,[sp,#0x20]
        LDP      x21,x20,[sp,#0x10]
        LDP      x23,x22,[sp],#0x30
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
renesas_slave_rx_fna_sdbs                  ; Alternate entry point
        STP      x25,x24,[sp,#-0x40]!
        STP      x23,x22,[sp,#0x10]
        STP      x21,x20,[sp,#0x20]
        STP      x19,x30,[sp,#0x30]
        MOV      w20,#0x8000
        MOVK     w20,#0xe650,LSL #16
        ADRP     x1,|L2.31128|
        ADD      x1,x1,#0x3a8
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2160|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2064|
        SUB      x19,x20,#8,LSL #12
        ADRP     x1,|L2.31180|
        ADD      x1,x1,#0xcc4
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      x0,x19
        BL       |L2.3472|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0x48
        BL       |L2.3248|
        MOV      x8,#0xffffffffffff8008
|L2.18948|
        LDR      w9,[x20,x8]
        TBZ      w9,#0,|L2.18948|
        MOV      w23,#0x800c
        MOVK     w23,#0xe650,LSL #16
        ORR      w1,wzr,#1
        MOV      x0,x19
        BL       |L2.3408|
|L2.18976|
        LDR      w8,[x23,#0]
        TBZ      w8,#0,|L2.18976|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#9
        BL       |L2.1968|
        ORR      w24,wzr,#1
        ADRP     x21,|symbol_number.233|
        ADD      x21,x21,#0x73c
        MOV      x25,#0xffffffffffff8008
        ADRP     x22,|L3.7036|
        ADD      x22,x22,#0xff8
|L2.19036|
        LDR      w8,[x23,#0]
        TBZ      w8,#3,|L2.19036|
        CMP      x24,#0xc
        B.HI     |L2.19068|
        LDR      w1,[x21,x24,LSL #2]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3232|
|L2.19068|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#8
        BL       |L2.1968|
|L2.19084|
        LDR      w8,[x23,#0]
        TBZ      w8,#2,|L2.19084|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#4
        BL       |L2.1968|
|L2.19108|
        LDR      w8,[x20,x25]
        TBZ      w8,#1,|L2.19108|
        CMP      x24,#0xb
        B.HI     |L2.19136|
        MOV      x0,x19
        BL       |L2.4528|
        B        |L2.19172|
|L2.19136|
        CMP      w24,#0xd
        B.EQ     |L2.19164|
        CMP      w24,#0xc
        B.NE     |L2.19180|
        MOV      x0,x19
        BL       |L2.4544|
        B        |L2.19172|
|L2.19164|
        MOV      x0,x19
        BL       |L2.4512|
|L2.19172|
        ADD      x8,x22,x24,LSL #2
        STUR     w0,[x8,#-4]
|L2.19180|
        ORR      w1,wzr,#2
        MOV      x0,x19
        BL       |L2.3408|
        ADD      x24,x24,#1
        CMP      x24,#0xe
        B.NE     |L2.19036|
|L2.19204|
        LDR      w8,[x23,#0]
        TBZ      w8,#6,|L2.19204|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x40
        BL       |L2.1968|
        MOV      x8,#0xffffffffffff8008
|L2.19232|
        LDR      w9,[x20,x8]
        TBZ      w9,#4,|L2.19232|
        ORR      w1,wzr,#0x10
        MOV      x0,x19
        BL       |L2.3408|
|L2.19252|
        LDR      w8,[x23,#0]
        TBZ      w8,#4,|L2.19252|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x10
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.1984|
        MOV      x0,x19
        BL       |L2.3424|
        MOV      x8,xzr
|L2.19300|
        LSL      x9,x8,#2
        LDR      w10,[x22,x9]
        LDR      w9,[x21,x9]
        CMP      w10,w9
        B.NE     |L2.19340|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.19300|
        MOV      w0,wzr
        B        |L2.19344|
|L2.19340|
        ORR      w0,wzr,#1
|L2.19344|
        LDP      x19,x30,[sp,#0x30]
        LDP      x21,x20,[sp,#0x20]
        LDP      x23,x22,[sp,#0x10]
        LDP      x25,x24,[sp],#0x40
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
renesas_slave_rx_sdbs                  ; Alternate entry point
        STP      x25,x24,[sp,#-0x40]!
        STP      x23,x22,[sp,#0x10]
        STP      x21,x20,[sp,#0x20]
        STP      x19,x30,[sp,#0x30]
        MOV      w20,#0x8000
        MOVK     w20,#0xe650,LSL #16
        ADRP     x1,|L2.31688|
        ADD      x1,x1,#0x348
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2160|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2064|
        SUB      x19,x20,#8,LSL #12
        ADRP     x1,|L2.31740|
        ADD      x1,x1,#0xc64
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      x0,x19
        BL       |L2.3472|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0x48
        BL       |L2.3248|
        MOV      x8,#0xffffffffffff8008
|L2.19508|
        LDR      w9,[x20,x8]
        TBZ      w9,#0,|L2.19508|
        MOV      w23,#0x800c
        MOVK     w23,#0xe650,LSL #16
        ORR      w1,wzr,#1
        MOV      x0,x19
        BL       |L2.3408|
|L2.19536|
        LDR      w8,[x23,#0]
        TBZ      w8,#0,|L2.19536|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#9
        BL       |L2.1968|
        ORR      w24,wzr,#1
        ADRP     x21,|L2.31864|
        ADD      x21,x21,#0x66c
        MOV      x25,#0xffffffffffff8008
        ADRP     x22,|L3.7596|
        ADD      x22,x22,#0xf28
|L2.19596|
        LDR      w8,[x23,#0]
        TBZ      w8,#3,|L2.19596|
        CMP      x24,#0xc
        B.HI     |L2.19632|
        LDR      w1,[x21,x24,LSL #2]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3232|
        B        |L2.19652|
|L2.19632|
        CMP      x24,#0xd
        B.NE     |L2.19652|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3280|
|L2.19652|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#8
        BL       |L2.1968|
|L2.19668|
        LDR      w8,[x23,#0]
        TBZ      w8,#2,|L2.19668|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#4
        BL       |L2.1968|
|L2.19692|
        LDR      w8,[x20,x25]
        TBZ      w8,#1,|L2.19692|
        MOV      x0,x19
        BL       |L2.4528|
        ADD      x8,x22,x24,LSL #2
        STUR     w0,[x8,#-4]
        ORR      w1,wzr,#2
        MOV      x0,x19
        BL       |L2.3408|
        ADD      x24,x24,#1
        CMP      x24,#0xe
        B.NE     |L2.19596|
        MOV      x8,#0xffffffffffff8008
|L2.19744|
        LDR      w9,[x20,x8]
        TBZ      w9,#4,|L2.19744|
        ORR      w1,wzr,#0x10
        MOV      x0,x19
        BL       |L2.3408|
|L2.19764|
        LDR      w8,[x23,#0]
        TBZ      w8,#4,|L2.19764|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x10
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.1984|
        MOV      x0,x19
        BL       |L2.3424|
        MOV      x8,xzr
|L2.19812|
        LSL      x9,x8,#2
        LDR      w10,[x22,x9]
        LDR      w9,[x21,x9]
        CMP      w10,w9
        B.NE     |L2.19852|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.19812|
        MOV      w0,wzr
        B        |L2.19856|
|L2.19852|
        ORR      w0,wzr,#1
|L2.19856|
        LDP      x19,x30,[sp,#0x30]
        LDP      x21,x20,[sp,#0x20]
        LDP      x23,x22,[sp,#0x10]
        LDP      x25,x24,[sp],#0x40
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
renesas_slave_tx                  ; Alternate entry point
        STP      x25,x24,[sp,#-0x40]!
        STP      x23,x22,[sp,#0x10]
        STP      x21,x20,[sp,#0x20]
        STP      x19,x30,[sp,#0x30]
        MOV      w20,#0x8000
        MOVK     w20,#0xe650,LSL #16
        ADRP     x1,|L2.32200|
        ADD      x1,x1,#0x378
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2160|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2064|
        SUB      x19,x20,#8,LSL #12
        ADRP     x1,|symbol_number.234|
        ADD      x1,x1,#0xc94
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      x0,x19
        BL       |L2.3472|
        MOV      w1,#0x48
        MOV      x0,x19
        BL       |L2.4576|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3184|
        MOV      x8,#0xffffffffffff8008
|L2.20028|
        LDR      w9,[x20,x8]
        TBZ      w9,#0,|L2.20028|
        MOV      w23,#0x800c
        MOVK     w23,#0xe650,LSL #16
        ORR      w1,wzr,#1
        MOV      x0,x19
        BL       |L2.3408|
|L2.20056|
        LDR      w8,[x23,#0]
        TBZ      w8,#0,|L2.20056|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#3
        BL       |L2.1968|
        ORR      w24,wzr,#1
        ADRP     x21,|L2.32384|
        ADD      x21,x21,#0x6d4
        MOV      x25,#0xffffffffffff8008
        ADRP     x22,receivedData
        ADD      x22,x22,#0xf90
|L2.20116|
        LDR      w8,[x20,x25]
        TBZ      w8,#3,|L2.20116|
        CMP      x24,#0xc
        B.HI     |L2.20144|
        LDR      w1,[x21,x24,LSL #2]
        MOV      x0,x19
        BL       |L2.4576|
|L2.20144|
        ORR      w1,wzr,#8
        MOV      x0,x19
        BL       |L2.3408|
|L2.20156|
        LDR      w8,[x20,x25]
        TBZ      w8,#2,|L2.20156|
        ORR      w1,wzr,#4
        MOV      x0,x19
        BL       |L2.3408|
|L2.20176|
        LDR      w8,[x23,#0]
        TBZ      w8,#1,|L2.20176|
        CMP      x24,#0xb
        B.HI     |L2.20208|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3136|
        B        |L2.20252|
|L2.20208|
        CMP      w24,#0xd
        B.EQ     |L2.20240|
        CMP      w24,#0xc
        B.NE     |L2.20260|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3152|
        B        |L2.20252|
|L2.20240|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3120|
|L2.20252|
        ADD      x8,x22,x24,LSL #2
        STUR     w0,[x8,#-4]
|L2.20260|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#2
        BL       |L2.1968|
        ADD      x24,x24,#1
        CMP      x24,#0xe
        B.NE     |L2.20116|
        MOV      x8,#0xffffffffffff8008
|L2.20292|
        LDR      w9,[x20,x8]
        TBZ      w9,#4,|L2.20292|
        ORR      w1,wzr,#0x10
        MOV      x0,x19
        BL       |L2.3408|
|L2.20312|
        LDR      w8,[x23,#0]
        TBZ      w8,#4,|L2.20312|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x10
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.1984|
        MOV      x0,x19
        BL       |L2.3424|
        MOV      x8,xzr
|L2.20360|
        LSL      x9,x8,#2
        LDR      w10,[x22,x9]
        LDR      w9,[x21,x9]
        CMP      w10,w9
        B.NE     |L2.20400|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.20360|
        MOV      w0,wzr
        B        |L2.20404|
|L2.20400|
        ORR      w0,wzr,#1
|L2.20404|
        LDP      x19,x30,[sp,#0x30]
        LDP      x21,x20,[sp,#0x20]
        LDP      x23,x22,[sp,#0x10]
        LDP      x25,x24,[sp],#0x40
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
renesas_slave_tx_delay                  ; Alternate entry point
        STP      x25,x24,[sp,#-0x40]!
        STP      x23,x22,[sp,#0x10]
        STP      x21,x20,[sp,#0x20]
        STP      x19,x30,[sp,#0x30]
        MOV      w20,#0x8000
        MOVK     w20,#0xe650,LSL #16
        ADRP     x1,|L3.272|
        ADD      x1,x1,#0x4c8
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2160|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2064|
        SUB      x19,x20,#8,LSL #12
        ADRP     x1,|L2.28700|
        ADD      x1,x1,#0xde4
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      x0,x19
        BL       |L2.3472|
        MOV      w1,#0x48
        MOV      x0,x19
        BL       |L2.4576|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3184|
        MOV      x8,#0xffffffffffff8008
|L2.20572|
        LDR      w9,[x20,x8]
        TBZ      w9,#0,|L2.20572|
        MOV      w23,#0x800c
        MOVK     w23,#0xe650,LSL #16
        ORR      w1,wzr,#1
        MOV      x0,x19
        BL       |L2.3408|
|L2.20600|
        LDR      w8,[x23,#0]
        TBZ      w8,#0,|L2.20600|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#3
        BL       |L2.1968|
        ORR      w24,wzr,#1
        ADRP     x21,|L2.28832|
        ADD      x21,x21,#0xa14
        MOV      x25,#0xffffffffffff8008
        ADRP     x22,|L4.644|
        ADD      x22,x22,#0x29c
|L2.20660|
        LDR      w8,[x20,x25]
        TBZ      w8,#3,|L2.20660|
        CMP      x24,#0xc
        B.HI     |L2.20688|
        LDR      w1,[x21,x24,LSL #2]
        MOV      x0,x19
        BL       |L2.4576|
|L2.20688|
        MOV      w0,#0x320
        BL       |L2.4688|
        ORR      w1,wzr,#8
        MOV      x0,x19
        BL       |L2.3408|
|L2.20708|
        LDR      w8,[x20,x25]
        TBZ      w8,#2,|L2.20708|
        ORR      w1,wzr,#4
        MOV      x0,x19
        BL       |L2.3408|
|L2.20728|
        LDR      w8,[x23,#0]
        TBZ      w8,#1,|L2.20728|
        CMP      x24,#0xb
        B.HI     |L2.20760|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3136|
        B        |L2.20804|
|L2.20760|
        CMP      w24,#0xd
        B.EQ     |L2.20792|
        CMP      w24,#0xc
        B.NE     |L2.20812|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3152|
        B        |L2.20804|
|L2.20792|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3120|
|L2.20804|
        ADD      x8,x22,x24,LSL #2
        STUR     w0,[x8,#-4]
|L2.20812|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#2
        BL       |L2.1968|
        ADD      x24,x24,#1
        CMP      x24,#0xe
        B.NE     |L2.20660|
        MOV      x8,#0xffffffffffff8008
|L2.20844|
        LDR      w9,[x20,x8]
        TBZ      w9,#4,|L2.20844|
        ORR      w1,wzr,#0x10
        MOV      x0,x19
        BL       |L2.3408|
|L2.20864|
        LDR      w8,[x23,#0]
        TBZ      w8,#4,|L2.20864|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x10
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.1984|
        MOV      x0,x19
        BL       |L2.3424|
        MOV      x8,xzr
|L2.20912|
        LSL      x9,x8,#2
        LDR      w10,[x22,x9]
        LDR      w9,[x21,x9]
        CMP      w10,w9
        B.NE     |L2.20952|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.20912|
        MOV      w0,wzr
        B        |L2.20956|
|L2.20952|
        ORR      w0,wzr,#1
|L2.20956|
        LDP      x19,x30,[sp,#0x30]
        LDP      x21,x20,[sp,#0x20]
        LDP      x23,x22,[sp,#0x10]
        LDP      x25,x24,[sp],#0x40
        RET      
sdmac1ch0InterruptHandler                  ; Alternate entry point
        MOV      w8,#0xc
        MOVK     w8,#0xe730,LSL #16
        LDR      w9,[x8,#0]
        TBNZ     w9,#1,|L2.20996|
        RET      
|L2.20996|
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffe
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffb
        STR      w9,[x8,#0]
        MOV      w0,#0xe6500000
        B        |L2.2016|
|symbol_number.92|                  ; Alternate entry point
        MOV      w8,#0xc
        MOVK     w8,#0xe730,LSL #16
        LDR      w9,[x8,#0]
        TBNZ     w9,#1,|L2.21060|
        RET      
|L2.21060|
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffe
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffb
        STR      w9,[x8,#0]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        B        |L2.2016|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.108|                  ; Alternate entry point
        MOV      w8,#0xc
        MOVK     w8,#0xe730,LSL #16
        LDR      w9,[x8,#0]
        TBZ      w9,#1,|L2.21200|
        STR      x30,[sp,#-0x10]!
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffe
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
        MOV      w8,#0x60
        MOVK     w8,#0xe735,LSL #16
        STR      wzr,[x8,#0]
        MOV      w0,#0xe6500000
        BL       |L2.2000|
|L2.21184|
        ADRP     x8,|L3.5096|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe3c]
        LDR      x30,[sp],#0x10
|L2.21200|
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.150|                  ; Alternate entry point
        MOV      w8,#0xc
        MOVK     w8,#0xe730,LSL #16
        LDR      w9,[x8,#0]
        TBZ      w9,#1,|L2.21268|
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffe
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffb
        STR      w9,[x8,#0]
|L2.21268|
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.229|                  ; Alternate entry point
        MOV      w8,#0xc
        MOVK     w8,#0xe730,LSL #16
        LDR      w9,[x8,#0]
        TBZ      w9,#1,|L2.21364|
        STR      x30,[sp,#-0x10]!
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffe
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
        MOV      w8,#0x60
        MOVK     w8,#0xe735,LSL #16
        STR      wzr,[x8,#0]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2000|
        ADRP     x8,|L3.5260|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe44]
        LDR      x30,[sp],#0x10
|L2.21364|
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.241|                  ; Alternate entry point
        MOV      w8,#0xc
        MOVK     w8,#0xe730,LSL #16
        LDR      w9,[x8,#0]
        TBZ      w9,#1,|L2.21452|
        LDR      w9,[x8,#0]
        MOV      w10,#0x60
        MOVK     w10,#0xe735,LSL #16
        AND      w9,w9,#0xfffffffe
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffb
        STR      w9,[x8,#0]
        STR      wzr,[x10,#0]
        ADRP     x8,|L3.5352|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe48]
|L2.21452|
        RET      
sdmac1ch1InterruptHandler                  ; Alternate entry point
        MOV      w8,#0x100c
        MOVK     w8,#0xe730,LSL #16
        LDR      w9,[x8,#0]
        TBZ      w9,#1,|L2.21552|
        STR      x30,[sp,#-0x10]!
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffe
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffb
        STR      w9,[x8,#0]
        MOV      w8,#0x60
        MOVK     w8,#0xe735,LSL #16
        STR      wzr,[x8,#0]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3440|
        ADRP     x8,|L3.5448|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe34]
        LDR      x30,[sp],#0x10
|L2.21552|
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.93|                  ; Alternate entry point
        MOV      w8,#0x100c
        MOVK     w8,#0xe730,LSL #16
        LDR      w9,[x8,#0]
        TBZ      w9,#1,|L2.21660|
        STR      x30,[sp,#-0x10]!
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffe
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffb
        STR      w9,[x8,#0]
        MOV      w8,#0x60
        MOVK     w8,#0xe735,LSL #16
        STR      wzr,[x8,#0]
        MOV      w0,#0xe6500000
        BL       |L2.3440|
        ADRP     x8,|L3.5556|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe38]
        LDR      x30,[sp],#0x10
|L2.21660|
        RET      
|symbol_number.109|                  ; Alternate entry point
        MOV      w8,#0x100c
        MOVK     w8,#0xe730,LSL #16
        LDR      w9,[x8,#0]
        TBNZ     w9,#1,|L2.21684|
        RET      
|L2.21684|
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffe
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        B        |L2.3456|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.151|                  ; Alternate entry point
        MOV      w8,#0x100c
        MOVK     w8,#0xe730,LSL #16
        LDR      w9,[x8,#0]
        TBZ      w9,#1,|L2.21896|
        ADRP     x9,|L3.5656|
        LDR      w10,[x9,#0xe2c]
        ADD      w10,w10,#1
        STR      w10,[x9,#0xe2c]
        LDR      w11,[x8,#0]
        AND      w11,w11,#0xfffffffe
        STR      w11,[x8,#0]
        CMP      w10,#1
        B.HI     |L2.21848|
        LDR      w9,[x9,#0xe2c]
        MOV      w10,#0x34
        ADRP     x11,|L4.1780|
        ADD      x11,x11,#0xfc
        MADD     w9,w9,w10,w11
        STUR     w9,[x8,#-8]
        LDUR     w9,[x8,#-4]
        MOV      w10,#0xd
        BFXIL    w9,w10,#0,#24
        STUR     w9,[x8,#-4]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        ORR      w9,w9,#1
        STR      w9,[x8,#0]
        RET      
|L2.21848|
        LDR      w9,[x8,#0]
        MOV      w10,#0x60
        MOVK     w10,#0xe735,LSL #16
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffb
        STR      w9,[x8,#0]
        STR      wzr,[x10,#0]
        ADRP     x8,|L3.5796|
        ORR      w9,wzr,#1
        STRB     w9,[x8,#0xe40]
|L2.21896|
        RET      
        DCI      0x00000000 ; ? Undefined
|symbol_number.230|                  ; Alternate entry point
        MOV      w8,#0x100c
        MOVK     w8,#0xe730,LSL #16
        LDR      w9,[x8,#0]
        TBNZ     w9,#1,|L2.21924|
        RET      
|L2.21924|
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffe
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
        MOV      w0,#0xe6500000
        B        |L2.3456|
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
|symbol_number.242|                  ; Alternate entry point
        MOV      w8,#0x100c
        MOVK     w8,#0xe730,LSL #16
        LDR      w9,[x8,#0]
        TBZ      w9,#1,|L2.22112|
        ADRP     x9,|L3.5896|
        LDR      w10,[x9,#0xe30]
        ADD      w10,w10,#1
        STR      w10,[x9,#0xe30]
        LDR      w11,[x8,#0]
        AND      w11,w11,#0xfffffffe
        STR      w11,[x8,#0]
        CMP      w10,#1
        B.HI     |L2.22088|
        LDR      w9,[x9,#0xe30]
        MOV      w10,#0x34
        ADRP     x11,|L2.30220|
|L2.22032|
        ADD      x11,x11,#0xa7c
        MADD     w9,w9,w10,w11
        ADD      w9,w9,#4
        STUR     w9,[x8,#-0xc]
|L2.22048|
        LDUR     w9,[x8,#-4]
        MOV      w10,#0xd
        BFXIL    w9,w10,#0,#24
        STUR     w9,[x8,#-4]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        ORR      w9,w9,#1
        B        |L2.22108|
|L2.22088|
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffd
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffffffb
|L2.22108|
        STR      w9,[x8,#0]
|L2.22112|
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
slave_general_call                  ; Alternate entry point
        STP      x25,x24,[sp,#-0x40]!
        STP      x23,x22,[sp,#0x10]
        STP      x21,x20,[sp,#0x20]
        STP      x19,x30,[sp,#0x30]
        MOV      w20,#0x8000
        MOVK     w20,#0xe650,LSL #16
        ADRP     x1,|L2.30344|
        ADD      x1,x1,#0x510
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2160|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0x8000
|L2.22192|
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2064|
        SUB      x19,x20,#8,LSL #12
        ADRP     x1,|L2.30396|
|L2.22208|
        ADD      x1,x1,#0xe2c
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      x0,x19
        BL       |L2.3472|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0x48
        BL       |L2.3248|
        MOV      x8,#0xffffffffffff8008
|L2.22260|
        LDR      w9,[x20,x8]
        TBZ      w9,#0,|L2.22260|
        MOV      w23,#0x800c
        MOVK     w23,#0xe650,LSL #16
        ORR      w1,wzr,#1
        MOV      x0,x19
        BL       |L2.3408|
|L2.22288|
        LDR      w8,[x23,#0]
        TBZ      w8,#0,|L2.22288|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#9
        BL       |L2.1968|
        ORR      w24,wzr,#1
        ADRP     x21,|L2.30520|
        ADD      x21,x21,#0xae4
        MOV      x25,#0xffffffffffff8008
        ADRP     x22,|L4.2332|
        ADD      x22,x22,#0x36c
|L2.22348|
        LDR      w8,[x23,#0]
        TBZ      w8,#3,|L2.22348|
        CMP      x24,#0xc
        B.HI     |L2.22384|
        LDR      w1,[x21,x24,LSL #2]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3232|
        B        |L2.22396|
|L2.22384|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3280|
|L2.22396|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#8
        BL       |L2.1968|
|L2.22412|
        LDR      w8,[x23,#0]
        TBZ      w8,#2,|L2.22412|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#4
        BL       |L2.1968|
|L2.22436|
        LDR      w8,[x20,x25]
        TBZ      w8,#1,|L2.22436|
        MOV      x0,x19
        BL       |L2.4528|
        ADD      x8,x22,x24,LSL #2
        STUR     w0,[x8,#-4]
        ORR      w1,wzr,#2
        MOV      x0,x19
        BL       |L2.3408|
        ADD      x24,x24,#1
        CMP      x24,#0xe
        B.NE     |L2.22348|
        MOV      x8,#0xffffffffffff8008
|L2.22488|
        LDR      w9,[x20,x8]
        TBZ      w9,#4,|L2.22488|
        ORR      w1,wzr,#0x10
        MOV      x0,x19
        BL       |L2.3408|
|L2.22508|
        LDR      w8,[x23,#0]
        TBZ      w8,#4,|L2.22508|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x10
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.1984|
        MOV      x0,x19
        BL       |L2.3424|
        MOV      x8,xzr
|L2.22556|
        LSL      x9,x8,#2
        LDR      w10,[x22,x9]
        LDR      w9,[x21,x9]
        CMP      w10,w9
        B.NE     |L2.22596|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.22556|
        MOV      w0,wzr
        B        |L2.22600|
|L2.22596|
        ORR      w0,wzr,#1
|L2.22600|
        LDP      x19,x30,[sp,#0x30]
        LDP      x21,x20,[sp,#0x20]
        LDP      x23,x22,[sp,#0x10]
        LDP      x25,x24,[sp],#0x40
        RET      
        DCI      0x00000000 ; ? Undefined
slave_nack_addr                  ; Alternate entry point
        STP      x21,x20,[sp,#-0x20]!
        STP      x19,x30,[sp,#0x10]
        MOV      w20,#0x800c
        MOVK     w20,#0xe650,LSL #16
        MOV      w21,#0x8000
        MOVK     w21,#0xe650,LSL #16
        ADRP     x1,|L2.30840|
        ADD      x1,x1,#0x4b0
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2160|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2064|
        SUB      x19,x21,#8,LSL #12
        ADRP     x1,|L2.30892|
        ADD      x1,x1,#0xdcc
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      x0,x19
        BL       |L2.3472|
        ADRP     x8,|L4.2728|
        LDR      w9,[x8,#0x968]
        ADD      w10,w9,#1
        ADRP     x11,|symbol_number.172|
        ADD      x11,x11,#0x9e0
        STR      w10,[x8,#0x968]
        LDR      w1,[x11,x9,LSL #2]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3248|
|L2.22776|
        LDR      w8,[x20,#0]
        TBZ      w8,#0,|L2.22776|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#9
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
|L2.22812|
        LDR      w8,[x20,#0]
        TBZ      w8,#6,|L2.22812|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x40
        BL       |L2.1968|
        MOV      x8,#0xffffffffffff8008
|L2.22840|
        LDR      w9,[x21,x8]
        TBZ      w9,#4,|L2.22840|
        ORR      w1,wzr,#0x10
        MOV      x0,x19
        BL       |L2.3408|
|L2.22860|
        LDR      w8,[x20,#0]
        TBZ      w8,#4,|L2.22860|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x10
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.1984|
        MOV      x0,x19
        BL       |L2.3424|
        MOV      w0,wzr
        LDP      x19,x30,[sp,#0x10]
        LDP      x21,x20,[sp],#0x20
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
slave_rx                  ; Alternate entry point
        STP      x25,x24,[sp,#-0x40]!
        STP      x23,x22,[sp,#0x10]
        STP      x21,x20,[sp,#0x20]
        STP      x19,x30,[sp,#0x30]
        MOV      w20,#0x8000
        MOVK     w20,#0xe650,LSL #16
        ADRP     x1,|L2.31144|
        ADD      x1,x1,#0x450
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2160|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2064|
        SUB      x19,x20,#8,LSL #12
        ADRP     x1,|L2.31196|
        ADD      x1,x1,#0xd6c
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      x0,x19
        BL       |L2.3472|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0x48
        BL       |L2.3248|
        MOV      x8,#0xffffffffffff8008
|L2.23060|
        LDR      w9,[x20,x8]
        TBZ      w9,#0,|L2.23060|
        MOV      w23,#0x800c
        MOVK     w23,#0xe650,LSL #16
        ORR      w1,wzr,#1
        MOV      x0,x19
        BL       |L2.3408|
|L2.23088|
        LDR      w8,[x23,#0]
        TBZ      w8,#0,|L2.23088|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#9
        BL       |L2.1968|
        ORR      w24,wzr,#1
        ADRP     x21,|L2.31320|
        ADD      x21,x21,#0x8dc
        MOV      x25,#0xffffffffffff8008
        ADRP     x22,|L2.43620|
        ADD      x22,x22,#0x198
|L2.23148|
        LDR      w8,[x23,#0]
        TBZ      w8,#3,|L2.23148|
        CMP      x24,#0xc
        B.HI     |L2.23184|
|L2.23164|
        LDR      w1,[x21,x24,LSL #2]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3232|
        B        |L2.23196|
|L2.23184|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3280|
|L2.23196|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#8
        BL       |L2.1968|
|L2.23212|
        LDR      w8,[x23,#0]
        TBZ      w8,#2,|L2.23212|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#4
        BL       |L2.1968|
|L2.23236|
        LDR      w8,[x20,x25]
        TBZ      w8,#1,|L2.23236|
        MOV      x0,x19
        BL       |L2.4528|
        ADD      x8,x22,x24,LSL #2
        STUR     w0,[x8,#-4]
        ORR      w1,wzr,#2
        MOV      x0,x19
        BL       |L2.3408|
        ADD      x24,x24,#1
        CMP      x24,#0xe
        B.NE     |L2.23148|
        MOV      x8,#0xffffffffffff8008
|L2.23288|
        LDR      w9,[x20,x8]
        TBZ      w9,#4,|L2.23288|
        ORR      w1,wzr,#0x10
        MOV      x0,x19
        BL       |L2.3408|
|L2.23308|
        LDR      w8,[x23,#0]
        TBZ      w8,#4,|L2.23308|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x10
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.1984|
        MOV      x0,x19
        BL       |L2.3424|
        MOV      x8,xzr
|L2.23356|
        LSL      x9,x8,#2
        LDR      w10,[x22,x9]
        LDR      w9,[x21,x9]
        CMP      w10,w9
        B.NE     |L2.23396|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.23356|
        MOV      w0,wzr
        B        |L2.23400|
|L2.23396|
        ORR      w0,wzr,#1
|L2.23400|
        LDP      x19,x30,[sp,#0x30]
        LDP      x21,x20,[sp,#0x20]
        LDP      x23,x22,[sp,#0x10]
        LDP      x25,x24,[sp],#0x40
        RET      
        DCI      0x00000000 ; ? Undefined
slave_rx_dma                  ; Alternate entry point
        STR      x22,[sp,#-0x30]!
        STP      x21,x20,[sp,#0x10]
        STP      x19,x30,[sp,#0x20]
        MOV      w19,#0x8000
        MOVK     w19,#0xe650,LSL #16
        MOV      w20,#0x2c1c
        MOVK     w20,#0xe615,LSL #16
        MOV      w0,#0x2c1c
        MOVK     w0,#0xe615,LSL #16
        MOV      w1,#9
        BL       |L2.1392|
        ADD      x0,x20,#0x80
        MOV      w1,#9
        BL       |L2.1392|
        ADD      x8,x19,#0xdf8,LSL #12
        ADRP     x20,|L2.31676|
        ADD      x20,x20,#0x708
        ADD      w9,w20,#4
        STR      w9,[x8,#0]
        MOV      w21,#0x24
        MOVK     w21,#0xe650,LSL #16
        ADD      w8,w21,#8,LSL #12
        MOV      w22,#0xc
        MOVK     w22,#0xe730,LSL #16
        STUR     w8,[x22,#-8]
        LDUR     w8,[x22,#-4]
        AND      w8,w8,#0xff000000
        ORR      w8,w8,#0xc
        STUR     w8,[x22,#-4]
        LDR      w8,[x22,#0]
        AND      w8,w8,#0xffff3fff
        STR      w8,[x22,#0]
        LDR      w8,[x22,#0]
        AND      w8,w8,#0xffffcfff
        ORR      w8,w8,#0x1000
        STR      w8,[x22,#0]
        LDR      w8,[x22,#0]
        AND      w8,w8,#0xfffff0ff
        ORR      w8,w8,#0x800
        STR      w8,[x22,#0]
        LDR      w8,[x22,#0]
        AND      w8,w8,#0xffcfffff
        STR      w8,[x22,#0]
        LDR      w8,[x22,#0]
        AND      w8,w8,#0xffffffe7
        ORR      w8,w8,#0x10
        STR      w8,[x22,#0]
        MOV      w8,#0x93
        STRH     w8,[x22,#0x34]
        LDR      w8,[x22,#0]
        ORR      w8,w8,#4
        STR      w8,[x22,#0]
        LDR      w8,[x22,#0]
        ORR      w8,w8,#1
        STR      w8,[x22,#0]
        ADRP     x1,|L2.31836|
        ADD      x1,x1,#0x390
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2160|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0xffffffff
        BL       |L2.2128|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2064|
        STR      w21,[x22,#0xff4]
        ADRP     x21,|L3.7624|
        ADD      x21,x21,#0xfc4
        STR      w21,[x22,#0xff8]
        MOV      w8,#0x100c
        MOVK     w8,#0xe730,LSL #16
        LDUR     w9,[x8,#-4]
        MOV      w10,#0xd
        BFXIL    w9,w10,#0,#24
        STUR     w9,[x8,#-4]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffff3fff
        ORR      w9,w9,#0x4000
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffffcfff
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffff0ff
        ORR      w9,w9,#0x800
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffcfffff
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffffffe7
        ORR      w9,w9,#0x10
        STR      w9,[x8,#0]
        MOV      w9,#0xa0
        STRH     w9,[x8,#0x34]
        LDR      w9,[x8,#0]
        ORR      w9,w9,#4
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        ORR      w9,w9,#1
        STR      w9,[x8,#0]
        SUB      x19,x19,#8,LSL #12
        ADRP     x1,|L2.32048|
        ADD      x1,x1,#0xcac
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3520|
        MOV      x0,x19
        BL       |L2.3472|
        BL       |L2.1504|
        ADRP     x1,|L2.7524|
        ADD      x1,x1,#0x570
        MOV      w0,#0x10e
        BL       |L2.1920|
        ADRP     x1,|L2.7540|
        ADD      x1,x1,#0xca0
        MOV      w0,#0x10f
        BL       |L2.1920|
|L2.23940|
        ADRP     x1,|L2.23940|
        ADD      x1,x1,#0x230
        ORR      w0,wzr,#0x40
        BL       |L2.1920|
|L2.23956|
        ADRP     x1,|L2.23956|
        ADD      x1,x1,#0x440
        MOV      w0,#0x41
        BL       |L2.1920|
        MOV      w0,#0x10e
        BL       |L2.1664|
        MOV      w0,#0x10f
        BL       |L2.1664|
        ORR      w0,wzr,#0x40
|L2.23992|
        BL       |L2.1664|
        MOV      w0,#0x41
        BL       |L2.1664|
        MOV      w0,#0x8000
|L2.24008|
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0x48
        BL       |L2.3248|
        ADRP     x8,|L3.7932|
|L2.24024|
        LDRB     w9,[x8,#0xe58]
        CBZ      w9,|L2.24024|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.1984|
        MOV      x0,x19
        BL       |L2.3424|
        MOV      x8,xzr
|L2.24056|
        LSL      x9,x8,#2
        LDR      w10,[x21,x9]
        LDR      w9,[x20,x9]
        CMP      w10,w9
        B.NE     |L2.24096|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.24056|
        MOV      w0,wzr
        B        |L2.24100|
|L2.24096|
        ORR      w0,wzr,#1
|L2.24100|
        LDP      x19,x30,[sp,#0x20]
        LDP      x21,x20,[sp,#0x10]
        LDR      x22,[sp],#0x30
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
slave_rx_fna                  ; Alternate entry point
        STP      x25,x24,[sp,#-0x40]!
        STP      x23,x22,[sp,#0x10]
        STP      x21,x20,[sp,#0x20]
        STP      x19,x30,[sp,#0x30]
        MOV      w20,#0x8000
        MOVK     w20,#0xe650,LSL #16
        ADRP     x1,|L2.32344|
        ADD      x1,x1,#0x528
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2160|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2064|
        SUB      x19,x20,#8,LSL #12
        ADRP     x1,|symbol_number.278|
        ADD      x1,x1,#0xe44
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      x0,x19
        BL       |L2.3472|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0x48
        BL       |L2.3248|
        MOV      x8,#0xffffffffffff8008
|L2.24260|
        LDR      w9,[x20,x8]
        TBZ      w9,#0,|L2.24260|
        MOV      w23,#0x800c
        MOVK     w23,#0xe650,LSL #16
        ORR      w1,wzr,#1
        MOV      x0,x19
        BL       |L2.3408|
|L2.24288|
        LDR      w8,[x23,#0]
        TBZ      w8,#0,|L2.24288|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#9
        BL       |L2.1968|
        ORR      w24,wzr,#1
        ADRP     x21,|L3.48|
        ADD      x21,x21,#0xb18
        MOV      x25,#0xffffffffffff8008
        ADRP     x22,|L2.44820|
        ADD      x22,x22,#0x3a0
|L2.24348|
        LDR      w8,[x23,#0]
        TBZ      w8,#3,|L2.24348|
        CMP      x24,#0xc
        B.HI     |L2.24380|
        LDR      w1,[x21,x24,LSL #2]
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3232|
|L2.24380|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#8
        BL       |L2.1968|
|L2.24396|
        LDR      w8,[x23,#0]
        TBZ      w8,#2,|L2.24396|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#4
        BL       |L2.1968|
|L2.24420|
        LDR      w8,[x20,x25]
        TBZ      w8,#1,|L2.24420|
        CMP      x24,#0xb
        B.HI     |L2.24448|
        MOV      x0,x19
        BL       |L2.4528|
        B        |L2.24484|
|L2.24448|
        CMP      w24,#0xd
        B.EQ     |L2.24476|
        CMP      w24,#0xc
        B.NE     |L2.24492|
        MOV      x0,x19
        BL       |L2.4544|
        B        |L2.24484|
|L2.24476|
        MOV      x0,x19
        BL       |L2.4512|
|L2.24484|
        ADD      x8,x22,x24,LSL #2
        STUR     w0,[x8,#-4]
|L2.24492|
        ORR      w1,wzr,#2
        MOV      x0,x19
        BL       |L2.3408|
        ADD      x24,x24,#1
        CMP      x24,#0xe
        B.NE     |L2.24348|
|L2.24516|
        LDR      w8,[x23,#0]
        TBZ      w8,#6,|L2.24516|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x40
        BL       |L2.1968|
        MOV      x8,#0xffffffffffff8008
|L2.24544|
        LDR      w9,[x20,x8]
        TBZ      w9,#4,|L2.24544|
        ORR      w1,wzr,#0x10
        MOV      x0,x19
        BL       |L2.3408|
|L2.24564|
        LDR      w8,[x23,#0]
        TBZ      w8,#4,|L2.24564|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x10
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.1984|
        MOV      x0,x19
        BL       |L2.3424|
        MOV      x8,xzr
|L2.24612|
        LSL      x9,x8,#2
        LDR      w10,[x22,x9]
        LDR      w9,[x21,x9]
        CMP      w10,w9
        B.NE     |L2.24652|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.24612|
        MOV      w0,wzr
        B        |L2.24656|
|L2.24652|
        ORR      w0,wzr,#1
|L2.24656|
        LDP      x19,x30,[sp,#0x30]
        LDP      x21,x20,[sp,#0x20]
        LDP      x23,x22,[sp,#0x10]
        LDP      x25,x24,[sp],#0x40
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
slave_tx                  ; Alternate entry point
        STP      x25,x24,[sp,#-0x40]!
        STP      x23,x22,[sp,#0x10]
        STP      x21,x20,[sp,#0x20]
        STP      x19,x30,[sp,#0x30]
        MOV      w20,#0x8000
        MOVK     w20,#0xe650,LSL #16
        ADRP     x1,|L2.28808|
        ADD      x1,x1,#0x318
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2160|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2064|
        SUB      x19,x20,#8,LSL #12
        ADRP     x1,|L2.28860|
        ADD      x1,x1,#0xc34
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      x0,x19
        BL       |L2.3472|
        MOV      w1,#0x48
        MOV      x0,x19
        BL       |L2.4576|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3184|
        MOV      x8,#0xffffffffffff8008
|L2.24828|
        LDR      w9,[x20,x8]
        TBZ      w9,#0,|L2.24828|
        MOV      w23,#0x800c
        MOVK     w23,#0xe650,LSL #16
        ORR      w1,wzr,#1
        MOV      x0,x19
        BL       |L2.3408|
|L2.24856|
        LDR      w8,[x23,#0]
        TBZ      w8,#0,|L2.24856|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#3
        BL       |L2.1968|
        ORR      w24,wzr,#1
        ADRP     x21,|L2.28992|
        ADD      x21,x21,#0x604
        MOV      x25,#0xffffffffffff8008
        ADRP     x22,|L3.4724|
        ADD      x22,x22,#0xec0
|L2.24916|
        LDR      w8,[x20,x25]
        TBZ      w8,#3,|L2.24916|
        CMP      x24,#0xc
        B.HI     |L2.24944|
        LDR      w1,[x21,x24,LSL #2]
        MOV      x0,x19
        BL       |L2.4576|
|L2.24944|
        ORR      w1,wzr,#8
        MOV      x0,x19
        BL       |L2.3408|
|L2.24956|
        LDR      w8,[x20,x25]
        TBZ      w8,#2,|L2.24956|
        ORR      w1,wzr,#4
        MOV      x0,x19
        BL       |L2.3408|
|L2.24976|
        LDR      w8,[x23,#0]
        TBZ      w8,#1,|L2.24976|
        CMP      x24,#0xb
        B.HI     |L2.25008|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3136|
        B        |L2.25052|
|L2.25008|
        CMP      w24,#0xd
        B.EQ     |L2.25040|
        CMP      w24,#0xc
        B.NE     |L2.25060|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3152|
        B        |L2.25052|
|L2.25040|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3120|
|L2.25052|
        ADD      x8,x22,x24,LSL #2
        STUR     w0,[x8,#-4]
|L2.25060|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#2
        BL       |L2.1968|
        ADD      x24,x24,#1
        CMP      x24,#0xe
        B.NE     |L2.24916|
        MOV      x8,#0xffffffffffff8008
|L2.25092|
        LDR      w9,[x20,x8]
        TBZ      w9,#4,|L2.25092|
        ORR      w1,wzr,#0x10
        MOV      x0,x19
        BL       |L2.3408|
|L2.25112|
        LDR      w8,[x23,#0]
        TBZ      w8,#4,|L2.25112|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x10
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.1984|
        MOV      x0,x19
        BL       |L2.3424|
        MOV      x8,xzr
|L2.25160|
        LSL      x9,x8,#2
        LDR      w10,[x22,x9]
        LDR      w9,[x21,x9]
        CMP      w10,w9
        B.NE     |L2.25200|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.25160|
        MOV      w0,wzr
        B        |L2.25204|
|L2.25200|
        ORR      w0,wzr,#1
|L2.25204|
        LDP      x19,x30,[sp,#0x30]
        LDP      x21,x20,[sp,#0x20]
        LDP      x23,x22,[sp,#0x10]
        LDP      x25,x24,[sp],#0x40
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
slave_tx_delay                  ; Alternate entry point
        STP      x25,x24,[sp,#-0x40]!
        STP      x23,x22,[sp,#0x10]
        STP      x21,x20,[sp,#0x20]
        STP      x19,x30,[sp,#0x30]
        MOV      w20,#0x8000
        MOVK     w20,#0xe650,LSL #16
        ADRP     x1,|L2.29352|
        ADD      x1,x1,#0x540
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2160|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        MOV      w1,#0xffffffff
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2064|
        SUB      x19,x20,#8,LSL #12
        ADRP     x1,|L2.29404|
        ADD      x1,x1,#0xe5c
        MOV      x0,x19
        BL       |L2.3552|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.3408|
        MOV      x0,x19
        BL       |L2.3472|
        MOV      w1,#0x48
        MOV      x0,x19
        BL       |L2.4576|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3184|
        MOV      x8,#0xffffffffffff8008
|L2.25372|
        LDR      w9,[x20,x8]
        TBZ      w9,#0,|L2.25372|
        MOV      w23,#0x800c
        MOVK     w23,#0xe650,LSL #16
        ORR      w1,wzr,#1
        MOV      x0,x19
        BL       |L2.3408|
|L2.25400|
        LDR      w8,[x23,#0]
        TBZ      w8,#0,|L2.25400|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.2048|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#3
        BL       |L2.1968|
        ORR      w24,wzr,#1
        ADRP     x21,|L4.1336|
        ADD      x21,x21,#0x3d4
        MOV      x25,#0xffffffffffff8008
        ADRP     x22,|L2.29548|
        ADD      x22,x22,#0xb4c
|L2.25460|
        LDR      w8,[x23,#0]
        TBZ      w8,#1,|L2.25460|
        CMP      x24,#0xb
        B.HI     |L2.25492|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3136|
        B        |L2.25536|
|L2.25492|
        CMP      w24,#0xd
        B.EQ     |L2.25524|
        CMP      w24,#0xc
        B.NE     |L2.25544|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3152|
        B        |L2.25536|
|L2.25524|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.3120|
|L2.25536|
        ADD      x8,x21,x24,LSL #2
        STUR     w0,[x8,#-4]
|L2.25544|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#2
        BL       |L2.1968|
|L2.25560|
        LDR      w8,[x20,x25]
        TBZ      w8,#2,|L2.25560|
        ORR      w1,wzr,#4
        MOV      x0,x19
        BL       |L2.3408|
|L2.25580|
        LDR      w8,[x20,x25]
        TBZ      w8,#3,|L2.25580|
        CMP      x24,#0xc
        B.HI     |L2.25608|
        LDR      w1,[x22,x24,LSL #2]
        MOV      x0,x19
        BL       |L2.4576|
|L2.25608|
        MOV      w0,#0xc8
        BL       |L2.4688|
        ORR      w1,wzr,#8
        MOV      x0,x19
        BL       |L2.3408|
        ADD      x24,x24,#1
        CMP      x24,#0xe
        B.NE     |L2.25460|
        MOV      x8,#0xffffffffffff8008
|L2.25644|
        LDR      w9,[x20,x8]
        TBZ      w9,#4,|L2.25644|
        ORR      w1,wzr,#0x10
        MOV      x0,x19
        BL       |L2.3408|
|L2.25664|
        LDR      w8,[x23,#0]
        TBZ      w8,#4,|L2.25664|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        ORR      w1,wzr,#0x10
        BL       |L2.1968|
        MOV      w0,#0x8000
        MOVK     w0,#0xe650,LSL #16
        BL       |L2.1984|
        MOV      x0,x19
        BL       |L2.3424|
        MOV      x8,xzr
|L2.25712|
        LSL      x9,x8,#2
        LDR      w10,[x21,x9]
        LDR      w9,[x22,x9]
        CMP      w10,w9
        B.NE     |L2.25752|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.25712|
        MOV      w0,wzr
        B        |L2.25756|
|L2.25752|
        ORR      w0,wzr,#1
|L2.25756|
        LDP      x19,x30,[sp,#0x30]
        LDP      x21,x20,[sp,#0x20]
        LDP      x23,x22,[sp,#0x10]
        LDP      x25,x24,[sp],#0x40
        RET      
slave_tx_dma                  ; Alternate entry point
        STR      x24,[sp,#-0x40]!
        STP      x23,x22,[sp,#0x10]
        STP      x21,x20,[sp,#0x20]
        STP      x19,x30,[sp,#0x30]
        MOV      w21,#0xe6500000
        MOV      w19,#0x2c1c
        MOVK     w19,#0xe615,LSL #16
        MOV      w0,#0x2c1c
        MOVK     w0,#0xe615,LSL #16
        MOV      w1,#9
        BL       |L2.1392|
        ADD      x0,x19,#0x80
        MOV      w1,#9
        BL       |L2.1392|
        MOV      w23,#0x24
        MOVK     w23,#0xe650,LSL #16
        ADD      w8,w23,#8,LSL #12
        ORR      w9,wzr,#0xe00000
        STR      w8,[x21,x9]
        ADRP     x20,|L4.1748|
        ADD      x20,x20,#0x2d0
        MOV      w24,#0xc
        MOVK     w24,#0xe730,LSL #16
        STUR     w20,[x24,#-8]
        LDUR     w8,[x24,#-4]
        MOV      w9,#0xd
        BFXIL    w8,w9,#0,#24
        STUR     w8,[x24,#-4]
        LDR      w8,[x24,#0]
        AND      w8,w8,#0xffff3fff
        ORR      w8,w8,#0x4000
        STR      w8,[x24,#0]
        LDR      w8,[x24,#0]
        AND      w8,w8,#0xffffcfff
        STR      w8,[x24,#0]
        LDR      w8,[x24,#0]
        AND      w8,w8,#0xfffff0ff
        ORR      w8,w8,#0x800
        STR      w8,[x24,#0]
        LDR      w8,[x24,#0]
        AND      w8,w8,#0xffcfffff
        STR      w8,[x24,#0]
        LDR      w8,[x24,#0]
        AND      w8,w8,#0xffffffe7
        ORR      w8,w8,#0x10
        STR      w8,[x24,#0]
        MOV      w8,#0x92
        STRH     w8,[x24,#0x34]
        LDR      w8,[x24,#0]
        ORR      w8,w8,#4
        STR      w8,[x24,#0]
        LDR      w8,[x24,#0]
        ORR      w8,w8,#1
        STR      w8,[x24,#0]
        ADD      x19,x21,#8,LSL #12
        ADRP     x1,|L2.30092|
        ADD      x1,x1,#0x4e0
        MOV      x0,x19
        BL       |L2.2160|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.1968|
        MOV      w1,#0xffffffff
        MOV      x0,x19
        BL       |L2.2128|
        MOV      x0,x19
        BL       |L2.2064|
        ADRP     x22,|L2.30140|
        ADD      x22,x22,#0xa48
        ADD      w8,w22,#4
        STR      w8,[x24,#0xff4]
        STR      w23,[x24,#0xff8]
        MOV      w8,#0x100c
        MOVK     w8,#0xe730,LSL #16
        LDUR     w9,[x8,#-4]
        AND      w9,w9,#0xff000000
        ORR      w9,w9,#0xc
        STUR     w9,[x8,#-4]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffff3fff
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffffcfff
        ORR      w9,w9,#0x1000
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xfffff0ff
        ORR      w9,w9,#0x800
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffcfffff
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        AND      w9,w9,#0xffffffe7
        ORR      w9,w9,#0x10
        STR      w9,[x8,#0]
        MOV      w9,#0xa1
        STRH     w9,[x8,#0x34]
        LDR      w9,[x8,#0]
        ORR      w9,w9,#4
        STR      w9,[x8,#0]
        LDR      w9,[x8,#0]
        ORR      w9,w9,#1
        STR      w9,[x8,#0]
        ADRP     x1,|L2.30288|
        ADD      x1,x1,#0xdfc
        MOV      w0,#0xe6500000
        BL       |L2.3552|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.3408|
        MOV      w0,#0xe6500000
        MOV      w1,#0xffffffff
        BL       |L2.3520|
        MOV      w0,#0xe6500000
        MOV      w1,#0x48
        BL       |L2.4576|
        MOV      w0,#0xe6500000
        BL       |L2.3472|
        BL       |L2.1504|
        ADRP     x1,|L2.5776|
        ADD      x1,x1,#0xa40
        MOV      w0,#0x10e
        BL       |L2.1920|
        ADRP     x1,|L2.9888|
        ADD      x1,x1,#0x210
        MOV      w0,#0x10f
        BL       |L2.1920|
        ADRP     x1,|L2.22192|
        ADD      x1,x1,#0x320
        ORR      w0,wzr,#0x40
        BL       |L2.1920|
        ADRP     x1,|L2.22208|
        ADD      x1,x1,#0x590
        MOV      w0,#0x41
        BL       |L2.1920|
        MOV      w0,#0x10e
        BL       |L2.1664|
        MOV      w0,#0x10f
        BL       |L2.1664|
        ORR      w0,wzr,#0x40
        BL       |L2.1664|
        MOV      w0,#0x41
        BL       |L2.1664|
        MOV      x0,x19
        BL       |L2.3184|
        ADRP     x8,|L3.6176|
|L2.26364|
        LDRB     w9,[x8,#0xe80]
        CBZ      w9,|L2.26364|
        ADD      x0,x21,#8,LSL #12
        BL       |L2.1984|
        MOV      w0,#0xe6500000
        BL       |L2.3424|
        MOV      x8,xzr
|L2.26392|
        LSL      x9,x8,#2
        LDR      w10,[x20,x9]
        LDR      w9,[x22,x9]
        CMP      w10,w9
        B.NE     |L2.26432|
        ADD      x8,x8,#1
        CMP      w8,#0xc
        B.LS     |L2.26392|
        MOV      w0,wzr
        B        |L2.26436|
|L2.26432|
        ORR      w0,wzr,#1
|L2.26436|
        LDP      x19,x30,[sp,#0x30]
        LDP      x21,x20,[sp,#0x20]
        LDP      x23,x22,[sp,#0x10]
        LDR      x24,[sp],#0x40
        RET      
        DCI      0x00000000 ; ? Undefined
        DCI      0x00000000 ; ? Undefined
srst_check                  ; Alternate entry point
        SUB      sp,sp,#0xc0
        STP      x28,x27,[sp,#0x60]
        STP      x26,x25,[sp,#0x70]
        STP      x24,x23,[sp,#0x80]
        STP      x22,x21,[sp,#0x90]
        STP      x20,x19,[sp,#0xa0]
        STP      x29,x30,[sp,#0xb0]
        MOV      w23,#0xe6500000
        MOV      w2,#0xe6500000
        MOV      w0,wzr
        MOV      w1,wzr
        BL       checkReg
        ADD      x24,x23,#4
        ORR      w1,wzr,#1
        MOV      w0,wzr
        MOV      x2,x24
        STR      x24,[sp,#0x58]
        BL       checkReg
        ADD      x25,x23,#8
        ORR      w1,wzr,#2
        MOV      w0,wzr
        MOV      x2,x25
        STR      x25,[sp,#0x50]
        BL       checkReg
        ADD      x2,x23,#0xc
        STR      x2,[sp,#0x28]
        ORR      w1,wzr,#3
        MOV      w0,wzr
        BL       checkReg
        ADD      x26,x23,#0x10
        ORR      w1,wzr,#4
        MOV      w0,wzr
        MOV      x2,x26
        STR      x26,[sp,#0x48]
        BL       checkReg
        ADD      x2,x23,#0x14
        STR      x2,[sp,#0x20]
        MOV      w1,#5
        MOV      w0,wzr
        BL       checkReg
        ADD      x27,x23,#0x18
        ORR      w1,wzr,#6
        MOV      w0,wzr
        MOV      x2,x27
        STR      x27,[sp,#0x40]
        BL       checkReg
        ADD      x2,x23,#0x1c
        STR      x2,[sp,#0x18]
        ORR      w1,wzr,#7
        MOV      w0,wzr
        BL       checkReg
        ADD      x28,x23,#0x20
        ORR      w1,wzr,#8
        MOV      w0,wzr
        MOV      x2,x28
        STR      x28,[sp,#0x38]
        BL       checkReg
        ADD      x2,x23,#0x24
        STR      x2,[sp,#0x10]
        MOV      w1,#9
        MOV      w0,wzr
        BL       checkReg
        ADD      x29,x23,#0x28
        MOV      w1,#0xa
        MOV      w0,wzr
        MOV      x2,x29
        STR      x29,[sp,#0x30]
        BL       checkReg
        ADD      x2,x23,#0x2c
        STR      x2,[sp,#8]
        MOV      w1,#0xb
        MOV      w0,wzr
        BL       checkReg
        ADD      x19,x23,#0x30
        ORR      w1,wzr,#0xc
        MOV      w0,wzr
        MOV      x2,x19
        BL       checkReg
        ADD      x20,x23,#0x34
        MOV      w1,#0xd
        MOV      w0,wzr
        MOV      x2,x20
        BL       checkReg
        ADD      x21,x23,#0x38
        ORR      w1,wzr,#0xe
        MOV      w0,wzr
        MOV      x2,x21
        BL       checkReg
        ADD      x22,x23,#0x3c
        ORR      w1,wzr,#0xf
        MOV      w0,wzr
        MOV      x2,x22
|L2.26832|
        BL       checkReg
        MOV      w8,#0xffffffff
        STR      w8,[x23,#0]
        STR      w8,[x23,#4]
        STR      w8,[x23,#8]
        STR      w8,[x23,#0xc]
        STR      w8,[x23,#0x10]
        STR      w8,[x23,#0x14]
        STR      w8,[x23,#0x18]
        STR      w8,[x23,#0x1c]
        STR      w8,[x23,#0x20]
        STR      w8,[x23,#0x24]
        STR      w8,[x23,#0x28]
        STR      w8,[x23,#0x2c]
|L2.26888|
        STR      w8,[x23,#0x30]
        STR      w8,[x23,#0x34]
        STR      w8,[x23,#0x38]
        STR      w8,[x23,#0x3c]
        MOV      w0,#0x2c14
        MOVK     w0,#0xe615,LSL #16
        MOV      w1,#0x12
        BL       |L2.1392|
        ORR      w0,wzr,#1
        MOV      w2,#0xe6500000
        MOV      w1,wzr
        BL       checkReg
        ORR      w0,wzr,#1
        ORR      w1,wzr,#1
        MOV      x2,x24
        BL       checkReg
        ORR      w0,wzr,#1
        ORR      w1,wzr,#2
        MOV      x2,x25
        BL       checkReg
        ORR      w0,wzr,#1
        ORR      w1,wzr,#3
        LDR      x25,[sp,#0x28]
        MOV      x2,x25
        BL       checkReg
        ORR      w0,wzr,#1
        ORR      w1,wzr,#4
        MOV      x2,x26
        BL       checkReg
        ORR      w0,wzr,#1
        MOV      w1,#5
        LDR      x26,[sp,#0x20]
        MOV      x2,x26
        BL       checkReg
        ORR      w0,wzr,#1
        ORR      w1,wzr,#6
        MOV      x2,x27
|L2.27036|
        BL       checkReg
        ORR      w0,wzr,#1
        ORR      w1,wzr,#7
        LDR      x27,[sp,#0x18]
        MOV      x2,x27
        BL       checkReg
        ORR      w0,wzr,#1
        ORR      w1,wzr,#8
        MOV      x2,x28
        BL       checkReg
        ORR      w0,wzr,#1
        MOV      w1,#9
        LDR      x28,[sp,#0x10]
        MOV      x2,x28
|L2.27092|
        BL       checkReg
        ORR      w0,wzr,#1
        MOV      w1,#0xa
        MOV      x2,x29
        BL       checkReg
        ORR      w0,wzr,#1
        MOV      w1,#0xb
        LDR      x29,[sp,#8]
        MOV      x2,x29
        BL       checkReg
        ORR      w0,wzr,#1
        ORR      w1,wzr,#0xc
        MOV      x2,x19
        BL       checkReg
        ORR      w0,wzr,#1
        MOV      w1,#0xd
        MOV      x2,x20
        BL       checkReg
        ORR      w0,wzr,#1
        ORR      w1,wzr,#0xe
        MOV      x2,x21
        BL       checkReg
        ORR      w0,wzr,#1
        ORR      w1,wzr,#0xf
        MOV      x2,x22
        BL       checkReg
        MOV      w8,#0x2c14
        MOVK     w8,#0xe615,LSL #16
        ADD      x0,x8,#0x80
        MOV      w1,#0x12
        BL       |L2.1392|
        ADRP     x24,|L2.43600|
        ADD      x24,x24,#0x4c8
        LDR      w8,[x23,#0]
        STR      w8,[x24,#0x100]
        LDR      w8,[x23,#4]
        STR      w8,[x24,#0x108]
        LDR      w8,[x23,#8]
        STR      w8,[x24,#0x110]
        LDR      w8,[x23,#0xc]
        STR      w8,[x24,#0x118]
        LDR      w8,[x23,#0x10]
        STR      w8,[x24,#0x120]
        LDR      w8,[x23,#0x14]
        STR      w8,[x24,#0x128]
        LDR      w8,[x23,#0x18]
        STR      w8,[x24,#0x130]
        LDR      w8,[x23,#0x1c]
        STR      w8,[x24,#0x138]
        LDR      w8,[x23,#0x20]
        STR      w8,[x24,#0x140]
        LDR      w8,[x23,#0x24]
        STR      w8,[x24,#0x148]
        LDR      w8,[x23,#0x28]
        STR      w8,[x24,#0x150]
        LDR      w8,[x23,#0x2c]
        STR      w8,[x24,#0x158]
        LDR      w8,[x23,#0x30]
        STR      w8,[x24,#0x160]
        LDR      w8,[x23,#0x34]
        STR      w8,[x24,#0x168]
        LDR      w8,[x23,#0x38]
        STR      w8,[x24,#0x170]
        LDR      w8,[x23,#0x3c]
        STR      wzr,[x24,#0x104]
        STR      wzr,[x24,#0x10c]
        STR      wzr,[x24,#0x114]
        STR      wzr,[x24,#0x11c]
        STR      wzr,[x24,#0x124]
        STR      wzr,[x24,#0x12c]
        STR      wzr,[x24,#0x134]
        STR      wzr,[x24,#0x13c]
        STR      wzr,[x24,#0x144]
        STR      wzr,[x24,#0x14c]
        STR      wzr,[x24,#0x154]
        STR      wzr,[x24,#0x15c]
        STR      wzr,[x24,#0x164]
        STR      w8,[x24,#0x178]
        STR      wzr,[x24,#0x16c]
        STR      wzr,[x24,#0x174]
        STR      wzr,[x24,#0x17c]
        ORR      w0,wzr,#3
        MOV      w2,#0xe6500000
        MOV      w1,wzr
        BL       checkReg
        ORR      w0,wzr,#3
        ORR      w1,wzr,#1
        LDR      x2,[sp,#0x58]
        BL       checkReg
        ORR      w0,wzr,#3
        ORR      w1,wzr,#2
        LDR      x2,[sp,#0x50]
        BL       checkReg
        ORR      w0,wzr,#3
        ORR      w1,wzr,#3
        MOV      x2,x25
        BL       checkReg
        ORR      w0,wzr,#3
        ORR      w1,wzr,#4
        LDR      x2,[sp,#0x48]
        BL       checkReg
        ORR      w0,wzr,#3
        MOV      w1,#5
        MOV      x2,x26
        BL       checkReg
        ORR      w0,wzr,#3
        ORR      w1,wzr,#6
        LDR      x2,[sp,#0x40]
        BL       checkReg
        ORR      w0,wzr,#3
        ORR      w1,wzr,#7
        MOV      x2,x27
        BL       checkReg
        ORR      w0,wzr,#3
        ORR      w1,wzr,#8
        LDR      x2,[sp,#0x38]
        BL       checkReg
        ORR      w0,wzr,#3
        MOV      w1,#9
        MOV      x2,x28
        BL       checkReg
        ORR      w0,wzr,#3
        MOV      w1,#0xa
        LDR      x2,[sp,#0x30]
        BL       checkReg
        ORR      w0,wzr,#3
        MOV      w1,#0xb
        MOV      x2,x29
        BL       checkReg
        ORR      w0,wzr,#3
        ORR      w1,wzr,#0xc
        MOV      x2,x19
        BL       checkReg
        ORR      w0,wzr,#3
        MOV      w1,#0xd
        MOV      x2,x20
        BL       checkReg
        ORR      w0,wzr,#3
        ORR      w1,wzr,#0xe
        MOV      x2,x21
        BL       checkReg
        ORR      w0,wzr,#3
        ORR      w1,wzr,#0xf
        MOV      x2,x22
        BL       checkReg
        MOV      x8,xzr
|L2.27676|
        ADRP     x9,|L2.27676|
        ADD      x9,x9,#0xe80
|L2.27684|
        MOV      x10,xzr
|L2.27688|
        MOV      w11,wzr
|L2.27692|
        MOV      w12,w11
        LSL      x13,x8,#7
        ADD      x14,x24,x13
        LSL      x15,x10,#3
        ADD      x14,x14,x15
        LSL      x12,x12,#2
        LDR      w14,[x14,x12]
        ADD      x13,x9,x13
        ADD      x13,x13,x15
        LDR      w12,[x13,x12]
        CMP      w14,w12
        B.NE     |L2.27788|
        ADD      w12,w11,#1
        ORR      w11,wzr,#1
        CMP      w12,#1
        B.LS     |L2.27692|
        ADD      x10,x10,#1
        CMP      x10,#0x10
        B.CC     |L2.27688|
        ADD      x8,x8,#1
        CMP      x8,#4
        B.CC     |L2.27684|
        MOV      w0,wzr
        B        |L2.27792|
|L2.27788|
        ORR      w0,wzr,#1
|L2.27792|
        LDP      x29,x30,[sp,#0xb0]
        LDP      x20,x19,[sp,#0xa0]
        LDP      x22,x21,[sp,#0x90]
        LDP      x24,x23,[sp,#0x80]
        LDP      x26,x25,[sp,#0x70]
        LDP      x28,x27,[sp,#0x60]
        ADD      sp,sp,#0xc0
        RET      
||$Ven$XX$L$$__rt_entry||                  ; Alternate entry point
|L2.27824|
        LDR      x16,|L2.27832|
        BR       x16
|L2.27832|
        DCD      0x00000080
        DCD      0x00000000
        DCD      0x400009e4
        DCD      0x00000000
        DCD      0x40000b04
        DCD      0x00000000
        DCD      0x40000b3c
        DCD      0x00000000
        DCD      0x40000b74
        DCD      0x00000000
        DCD      0x40000bac
        DCD      0x00000000
        DCD      0x40000a1c
        DCD      0x00000000
        DCD      0x40000be4
        DCD      0x00000000
        DCD      0x40000918
        DCD      0x00000000
        DCD      0x40000a54
        DCD      0x00000000
        DCD      0x40000a74
        DCD      0x00000000
        DCD      0x40000a94
        DCD      0x00000000
        DCD      0x40000ab4
        DCD      0x00000000
        DCD      0x40000944
        DCD      0x00000000
        DCD      0x40000ad4
        DCD      0x00000000
        DCD      0x400009e4
        DCD      0x00000000
        DCD      0x40000b04
        DCD      0x00000000
        DCD      0x40000b3c
        DCD      0x00000000
        DCD      0x40000b74
        DCD      0x00000000
        DCD      0x40000bac
        DCD      0x00000000
        DCD      0x40000a1c
        DCD      0x00000000
        DCD      0x40000be4
        DCD      0x00000000
        DCD      0x40000918
        DCD      0x00000000
        DCD      0x40000a54
        DCD      0x00000000
        DCD      0x40000a74
        DCD      0x00000000
        DCD      0x40000a94
        DCD      0x00000000
        DCD      0x40000ab4
        DCD      0x00000000
        DCD      0x40000944
        DCD      0x00000000
        DCD      0x40000ad4
        DCD      0x00000000
        DCD      0x40000f58
        DCD      0x00000000
        DCD      0x40001078
        DCD      0x00000000
        DCD      0x400010b0
        DCD      0x00000000
        DCD      0x400010e8
        DCD      0x00000000
        DCD      0x40001120
        DCD      0x00000000
        DCD      0x40000f90
        DCD      0x00000000
        DCD      0x40001158
        DCD      0x00000000
        DCD      0x40000e8c
        DCD      0x00000000
        DCD      0x40000fc8
        DCD      0x00000000
        DCD      0x40000fe8
        DCD      0x00000000
        DCD      0x40001008
        DCD      0x00000000
        DCD      0x40001028
        DCD      0x00000000
        DCD      0x40000eb8
        DCD      0x00000000
        DCD      0x40001048
        DCD      0x00000000
        DCD      0x40000f58
        DCD      0x00000000
        DCD      0x40001078
        DCD      0x00000000
        DCD      0x400010b0
        DCD      0x00000000
        DCD      0x400010e8
        DCD      0x00000000
        DCD      0x40001120
        DCD      0x00000000
        DCD      0x40000f90
        DCD      0x00000000
        DCD      0x40001158
|L2.28228|
        DCD      0x00000000
        DCD      0x40000e8c
        DCD      0x00000000
        DCD      0x40000fc8
        DCD      0x00000000
        DCD      0x40000fe8
        DCD      0x00000000
        DCD      0x40001008
        DCD      0x00000000
        DCD      0x40001028
        DCD      0x00000000
        DCD      0x40000eb8
        DCD      0x00000000
        DCD      0x40001048
|L2.28284|
        DCD      0x00000000
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
|L2.28432|
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
|L2.28488|
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
|L2.28700|
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
|L2.28764|
        DCD      0x00000000
        DCD      0x0000ffff
        DCD      0x00000000
        DCD      0x0000ffff
        DCD      0x00000000
        DCD      0x1f1f001f
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
|symbol_number.220|
        DCD      0x1f1f1f1f
        DCD      0x00000000
|L2.28808|
        DCD      0xdfdfdfdf
        DCD      0x40404040
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|L2.28832|
        DCD      0x1f1f1f1f
        DCD      0x00000000
|L2.28840|
        DCD      0x7f7f7f7f
        DCD      0x00000000
        DCD      0x000001ff
        DCD      0x00000000
        DCD      0x7f7f7f7f
|L2.28860|
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
|symbol_number.275|
        DCD      0x1f1f1f1f
|L2.28932|
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
|L2.28992|
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x00000000
|L2.29004|
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
|L2.29048|
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|L2.29064|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|L2.29092|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|L2.29116|
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
|L2.29252|
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
|L2.29292|
        DCD      0x00000000
        DCD      0x1f1f001f
        DCD      0x00000000
        DCD      0xffffffff
        DCD      0x00000000
        DCD      0x1f1f1f1f
|L2.29316|
        DCD      0x00000000
        DCD      0xdfdfdfdf
        DCD      0x40404040
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x1f1f1f1f
        DCD      0x00000000
|L2.29352|
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
|L2.29404|
        DCD      0x00000000
        DCD      0x0000ffff
|L2.29412|
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
|symbol_number.53|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
|L2.29476|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.63|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.75|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|L2.29532|
        DCD      0x00000005
|symbol_number.80|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
|L2.29548|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.85|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
|L2.29576|
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.95|
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
|L2.29628|
        DCD      0x00000005
|symbol_number.111|
        DCD      0x00000001
        DCD      0x00000051
        DCD      0x00000000
|L2.29644|
        DCD      0x00000000
        DCD      0x00000000
|L2.29652|
        DCD      0x00000005
|symbol_number.119|
        DCD      0x00000000
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.130|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.140|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.154|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.162|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
|L2.29764|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.170|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.175|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.195|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|L2.29844|
        DCD      0x00000005
|symbol_number.205|
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.213|
        DCD      0x00000000
        DCD      0x00000052
        DCD      0x00000000
        DCD      0x00000000
|L2.29888|
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.222|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|L2.29916|
        DCD      0x00000005
|symbol_number.232|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.244|
        DCD      0x00000001
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|L2.29964|
        DCD      0x00000005
|symbol_number.251|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.256|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.263|
        DCD      0x00000001
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.268|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.277|
        DCD      0x00000000
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.288|
        DCD      0x00000001
|L2.30092|
        DCD      0x00000051
        DCD      0x00000000
|L2.30100|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
masterConfig0
        DCD      0x00000000
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
|L2.30128|
        DCD      0x00000000
        DCD      0x00000005
masterConfig1
        DCD      0x00000000
|L2.30140|
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
|L2.30196|
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.55|
        DCD      0x00000048
        DCD      0x00000045
|L2.30220|
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
|L2.30256|
        DCD      0x00000044
|L2.30260|
        DCD      0x00000021
|symbol_number.62|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
|L2.30288|
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
|L2.30324|
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
|L2.30340|
        DCD      0x00000020
|L2.30344|
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.82|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
|L2.30396|
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.87|
        DCD      0x00000048
        DCD      0x00000045
|L2.30428|
        DCD      0x0000004c
        DCD      0x0000004c
|L2.30436|
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
|L2.30452|
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.94|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
|L2.30508|
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
|L2.30520|
        DCD      0x00000021
|symbol_number.103|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
|L2.30540|
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
|L2.30552|
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.112|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
|L2.30592|
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
|L2.30608|
        DCD      0x0000004f
|L2.30612|
        DCD      0x00000052
        DCD      0x0000004c
|L2.30620|
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.121|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
|L2.30648|
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
|L2.30660|
        DCD      0x0000004f
        DCD      0x00000052
|L2.30668|
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.132|
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
|symbol_number.142|
        DCD      0x00000048
        DCD      0x00000045
|L2.30740|
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
|L2.30768|
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.152|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
|L2.30796|
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
|L2.30840|
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
|symbol_number.164|
        DCD      0x00000048
|L2.30892|
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
|L2.30908|
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.172|
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
|symbol_number.177|
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
|L2.31040|
        DCD      0x00000021
|symbol_number.186|
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
|L2.31088|
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.197|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
|L2.31128|
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
|L2.31144|
        DCD      0x00000021
|symbol_number.207|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
|L2.31180|
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
|L2.31196|
        DCD      0x00000021
|symbol_number.215|
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
|L2.31244|
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.224|
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
|symbol_number.233|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
|L2.31320|
        DCD      0x0000004f
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.245|
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
|symbol_number.253|
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
|symbol_number.258|
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
|symbol_number.265|
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
|symbol_number.279|
        DCD      0x00000048
        DCD      0x00000045
|L2.31676|
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
|L2.31688|
        DCD      0x0000002c
        DCD      0x00000020
        DCD      0x00000057
        DCD      0x0000004f
        DCD      0x00000052
        DCD      0x0000004c
        DCD      0x00000044
        DCD      0x00000021
|symbol_number.290|
        DCD      0x00000048
        DCD      0x00000045
        DCD      0x0000004c
        DCD      0x0000004c
        DCD      0x0000004f
|L2.31740|
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
|symbol_number.54|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.65|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
|L2.31836|
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.76|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|L2.31864|
        DCD      0x00000005
|symbol_number.81|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.86|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.97|
        DCD      0x00000050
        DCD      0x00000001
|L2.31924|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.102|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.113|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.120|
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.131|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.141|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
|L2.32048|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.156|
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|L2.32080|
        DCD      0x00000005
|symbol_number.163|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.171|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.176|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.196|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.206|
        DCD      0x00000051
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|L2.32200|
        DCD      0x00000005
|symbol_number.214|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.223|
        DCD      0x00000050
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.234|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.247|
        DCD      0x00000051
        DCD      0x00000000
        DCD      0x00000000
|L2.32288|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.252|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.257|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
|L2.32344|
        DCD      0x00000005
|symbol_number.264|
        DCD      0x00000050
        DCD      0x00000001
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.269|
        DCD      0x00000050
|L2.32376|
        DCD      0x00000000
        DCD      0x00000000
|L2.32384|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.278|
        DCD      0x00000050
        DCD      0x00000000
|L2.32404|
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000000
        DCD      0x00000005
|symbol_number.289|
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
|L2.32460|
        DCD      0x00000000
        DCD      0x00000005
        DCD      0x00000000

        AREA ||area_number.3||, DATA, ALIGN=3

        EXPORTAS ||area_number.3||, ER10
GIC_intHandler
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.48|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.60|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.100|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.116|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.220|
        DCD      0x00000000
        DCD      0x400005d0
|L3.228|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.272|
        DCD      0x400005d0
|L3.276|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.4508|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.4612|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.4724|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.4868|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.4960|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.5000|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.5024|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.5096|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.5156|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.5172|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.5260|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.5352|
        DCD      0x400005d0
|L3.5356|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.5388|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.5448|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.5516|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.5556|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.5608|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.5656|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.5672|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.5712|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.5796|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.5848|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.5872|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.5896|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.5968|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.5988|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.6028|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.6088|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.6172|
        DCD      0x00000000
|L3.6176|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.6188|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.6200|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.6300|
        DCD      0x00000000
        DCD      0x400005d0
|L3.6308|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.6364|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.6424|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.6464|
        DCD      0x400005d0
        DCD      0x00000000
|L3.6472|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.6652|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.6828|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.6964|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.7036|
        DCD      0x00000000
        DCD      0x400005d0
|L3.7044|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.7132|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.7192|
        DCD      0x400005d0
        DCD      0x00000000
|L3.7200|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.7384|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.7536|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
|L3.7596|
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.7624|
        DCD      0x400005d0
        DCD      0x00000000
|L3.7632|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.7664|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
|L3.7712|
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
        DCD      0x400005d0
        DCD      0x00000000
__ddr_init_sram
        DCD      0xe63000a0
        DCD      0x00000000
pattern
        DCD      0x40004030
        DCD      0x00000000
        DCD      0x40003930
        DCD      0x00000000
        DCD      0x40006760
        DCD      0x00000000
        DCD      0x40003f10
        DCD      0x00000000
        DCD      0x40002320
        DCD      0x00000000
        DCD      0x40005860
        DCD      0x00000000
        DCD      0x40005670
        DCD      0x00000000
        DCD      0x40005990
        DCD      0x00000000
        DCD      0x40005e40
        DCD      0x00000000
        DCD      0x40006070
|L3.7836|
        DCD      0x00000000
        DCD      0x40006290
        DCD      0x00000000
        DCD      0x40004bb0
        DCD      0x00000000
        DCD      0x40004980
        DCD      0x00000000
        DCD      0x40004170
        DCD      0x00000000
        DCD      0x40004370
        DCD      0x00000000
        DCD      0x40004580
        DCD      0x00000000
        DCD      0x40004780
        DCD      0x00000000
        DCD      0x40004db0
        DCD      0x00000000
        DCD      0x40004fd0
        DCD      0x00000000
        DCD      0x40005b80
        DCD      0x00000000
        DCD      0x400064b0
        DCD      0x00000000
        DCD      0x40002750
|L3.7932|
        DCD      0x00000000
        DCD      0x40002fb0
        DCD      0x00000000
        DCD      0x400036f0
        DCD      0x00000000
        DCD      0x40003810
        DCD      0x00000000
        DCD      0x40002630
        DCD      0x00000000
        DCD      0x40002e90
        DCD      0x00000000
|L3.7976|
        DCD      0x400024d0
        DCD      0x00000000
        DCD      0x40002870
        DCD      0x00000000
        DCD      0x400030d0
        DCD      0x00000000
        DCD      0x40002b10
        DCD      0x00000000
        DCD      0x40003370
        DCD      0x00000000

        AREA ||area_number.4||, DATA, NOINIT, ALIGN=2

        EXPORTAS ||area_number.4||, ER10
DumpOffset
        %        4
currentDataPackageIndex
        %        4
|symbol_number.246|
        %        4
isAutoTransferComplete
        %        4
|symbol_number.99|
        %        4
|symbol_number.115|
        %        4
|symbol_number.158|
        %        4
|symbol_number.236|
        %        4
|symbol_number.249|
        %        4
isMasterLostArbitration
        %        4
isTransferComplete
        %        4
|symbol_number.66|
        %        4
|symbol_number.98|
        %        4
|symbol_number.114|
        %        4
|symbol_number.123|
        %        4
|symbol_number.134|
        %        4
|symbol_number.144|
        %        4
|symbol_number.157|
        %        4
|symbol_number.166|
        %        4
|symbol_number.188|
        %        4
|symbol_number.199|
        %        4
|symbol_number.209|
        %        4
|symbol_number.235|
        %        4
|symbol_number.248|
        %        4
|symbol_number.292|
        %        4
receivedData
        %        52
|symbol_number.56|
        %        52
|symbol_number.64|
        %        52
|symbol_number.78|
        %        44
|L4.300|
        %        8
|symbol_number.83|
        %        52
|symbol_number.88|
        %        52
|symbol_number.96|
        %        16
|L4.428|
        %        36
|symbol_number.104|
        %        52
|symbol_number.110|
        %        36
|L4.552|
        %        8
|L4.560|
        %        8
|symbol_number.124|
        %        36
|L4.604|
        %        16
|symbol_number.135|
        %        8
|L4.628|
        %        16
|L4.644|
        %        28
|symbol_number.145|
        %        52
|symbol_number.155|
        %        40
|L4.764|
        %        12
|L4.776|
        %        16
|L4.792|
        %        36
|symbol_number.167|
        %        8
|L4.836|
        %        44
|symbol_number.173|
        %        52
|symbol_number.178|
        %        8
|L4.940|
        %        12
|L4.952|
        %        32
|symbol_number.189|
        %        52
|symbol_number.200|
        %        28
|L4.1064|
        %        24
|symbol_number.210|
        %        52
|symbol_number.225|
        %        52
|symbol_number.231|
        %        8
|L4.1200|
        %        44
|symbol_number.243|
        %        92
|L4.1336|
        %        12
|symbol_number.254|
        %        52
|symbol_number.259|
        %        32
|L4.1432|
        %        16
|L4.1448|
        %        4
|symbol_number.266|
        %        32
|L4.1484|
        %        20
|symbol_number.271|
        %        52
|symbol_number.280|
        %        4
|L4.1560|
        %        16
|L4.1576|
        %        32
|symbol_number.293|
        %        24
|L4.1632|
        %        28
receivedDataIndex
        %        4
|symbol_number.125|
        %        4
|symbol_number.136|
        %        4
|symbol_number.146|
        %        4
|symbol_number.168|
        %        4
|symbol_number.191|
        %        4
|symbol_number.201|
        %        4
|symbol_number.211|
        %        4
|symbol_number.294|
        %        4
result
        %        52
|L4.1748|
        %        32
|L4.1780|
        %        16
|L4.1796|
        %        120
|L4.1916|
        %        68
|L4.1984|
        %        8
|L4.1992|
        %        120
|L4.2112|
        %        36
|L4.2148|
        %        60
|symbol_number.219|
        %        8
|L4.2216|
        %        8
|L4.2224|
        %        108
|L4.2332|
        %        4
|symbol_number.274|
        %        72
|L4.2408|
        %        40
|L4.2448|
        %        8
|L4.2456|
        %        4
|L4.2460|
        %        108
|L4.2568|
        %        4
|L4.2572|
        %        8
|L4.2580|
        %        116
|L4.2696|
        %        4
|L4.2700|
        %        28
|L4.2728|
        %        20
|L4.2748|
        %        24
|L4.2772|
        %        76
sendDataIndex
        %        4
|symbol_number.122|
        %        4
|symbol_number.133|
        %        4
|symbol_number.143|
        %        4
|symbol_number.165|
        %        4
|symbol_number.187|
        %        4
|symbol_number.198|
        %        4
|symbol_number.208|
        %        4
|symbol_number.216|
        %        4
|symbol_number.291|
        %        4

        AREA ARM_LIB_STACK, DATA, NOINIT, ALIGN=0

        %        1024

||Image$$ARM_LIB_HEAP$$ZI$$Base|| EQU 1073785200
||Image$$ARM_LIB_HEAP$$ZI$$Limit|| EQU 1073785200
||Image$$ARM_LIB_STACK$$ZI$$Limit|| EQU 1879048192

        EXPORT ||Image$$ARM_LIB_HEAP$$ZI$$Base||
        EXPORT ||Image$$ARM_LIB_HEAP$$ZI$$Limit||
        EXPORT ||Image$$ARM_LIB_STACK$$ZI$$Limit||
        EXPORT __main [CODE]
        EXPORT __rt_entry [CODE]
        EXPORT __rt_entry_presh_1 [CODE]
        EXPORT __rt_entry_sh [CODE]
        EXPORT __rt_entry_li [CODE]
        EXPORT __rt_entry_postsh_1 [CODE]
        EXPORT __rt_entry_main [CODE]
        EXPORT __rt_entry_postli_1 [CODE]
        EXPORT __ddr_init_bsc [CODE]
        EXPORT ||$Ven$XX$L$$__ddr_init|| [CODE]
        EXPORT ||$Ven$XX$L$$__scatterload|| [CODE]
        EXPORT ||$Ven$XX$L$$__rt_lib_init|| [CODE,DYNAMIC]
        EXPORT ||$Ven$XX$L$$main|| [CODE]
        EXPORT ||$Ven$XX$L$$exit|| [CODE,DYNAMIC]
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
        EXPORT __rt_exit [CODE,DYNAMIC]
        EXPORT __rt_exit_ls [CODE]
        EXPORT __rt_exit_prels_1 [CODE]
        EXPORT __rt_exit_exit [CODE]
        EXPORT _fp_init [CODE,DYNAMIC]
        EXPORT ||__semihosting$guard|| [CODE,DYNAMIC]
        EXPORT __use_no_semihosting_swi [CODE]
        EXPORT exit [CODE,DYNAMIC]
        EXPORT __scatterload [CODE]
        EXPORT __scatterload_rt2 [CODE,DYNAMIC]
        EXPORT __scatterload_null [CODE,DYNAMIC]
        EXPORT __scatterload_zeroinit [CODE,DYNAMIC]
        EXPORT CPG_ClearBit [CODE]
        EXPORT CPG_SetBit [CODE]
        EXPORT DMAC_initDescriptorMemory [CODE]
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
        EXPORT I2C_modelConnect [CODE]
        EXPORT I2C_modelDisable [CODE]
        EXPORT I2C_releasePins [CODE]
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
        EXPORT SError_Handler [CODE]
        EXPORT Sim_Delay [CODE]
        EXPORT Sim_Dump [CODE]
        EXPORT Sim_Judge [CODE]
        EXPORT Sim_Stop [CODE]
        EXPORT Synchronous_Handler [CODE]
        EXPORT __ddr_init [CODE]
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
        EXPORT ||$Ven$XX$L$$__rt_entry|| [CODE]
        EXPORT GIC_intHandler [DATA,SIZE=7752]
        EXPORT __ddr_init_sram [DATA,SIZE=8]
        EXPORT pattern [DATA,SIZE=256]
        EXPORT DumpOffset [DATA,SIZE=4]

        KEEP __lit__00000000
        KEEP i2c0InterruptHandler
        KEEP i2c1InterruptHandler
        KEEP masterConfig
        KEEP slaveConfig
        KEEP sendData
        KEEP |symbol_number.53|
        EXPORTAS |symbol_number.53|, masterConfig
        KEEP |symbol_number.54|
        EXPORTAS |symbol_number.54|, slaveConfig
        KEEP |symbol_number.55|
        EXPORTAS |symbol_number.55|, sendData
        KEEP |symbol_number.58|
        EXPORTAS |symbol_number.58|, i2c1InterruptHandler
        KEEP |symbol_number.59|
        EXPORTAS |symbol_number.59|, i2c0InterruptHandler
        KEEP sdmac1ch0InterruptHandler
        KEEP sdmac1ch1InterruptHandler
        KEEP |symbol_number.62|
        EXPORTAS |symbol_number.62|, sendData
        KEEP |symbol_number.63|
        EXPORTAS |symbol_number.63|, masterConfig
        KEEP |symbol_number.65|
        EXPORTAS |symbol_number.65|, slaveConfig
        KEEP checkReg
        KEEP golden
        KEEP |symbol_number.75|
        EXPORTAS |symbol_number.75|, masterConfig
        KEEP |symbol_number.76|
        EXPORTAS |symbol_number.76|, slaveConfig
        KEEP |symbol_number.77|
        EXPORTAS |symbol_number.77|, sendData
        KEEP |symbol_number.80|
        EXPORTAS |symbol_number.80|, masterConfig
        KEEP |symbol_number.81|
        EXPORTAS |symbol_number.81|, slaveConfig
        KEEP |symbol_number.82|
        EXPORTAS |symbol_number.82|, sendData
        KEEP |symbol_number.85|
        EXPORTAS |symbol_number.85|, masterConfig
        KEEP |symbol_number.86|
        EXPORTAS |symbol_number.86|, slaveConfig
        KEEP |symbol_number.87|
        EXPORTAS |symbol_number.87|, sendData
        KEEP |symbol_number.90|
        EXPORTAS |symbol_number.90|, i2c0InterruptHandler
        KEEP |symbol_number.91|
        EXPORTAS |symbol_number.91|, i2c1InterruptHandler
        KEEP |symbol_number.92|
        EXPORTAS |symbol_number.92|, sdmac1ch0InterruptHandler
        KEEP |symbol_number.93|
        EXPORTAS |symbol_number.93|, sdmac1ch1InterruptHandler
        KEEP |symbol_number.94|
        EXPORTAS |symbol_number.94|, sendData
        KEEP |symbol_number.95|
        EXPORTAS |symbol_number.95|, masterConfig
        KEEP |symbol_number.97|
        EXPORTAS |symbol_number.97|, slaveConfig
        KEEP |symbol_number.101|
        EXPORTAS |symbol_number.101|, masterConfig
        KEEP |symbol_number.102|
        EXPORTAS |symbol_number.102|, slaveConfig
        KEEP |symbol_number.103|
        EXPORTAS |symbol_number.103|, sendData
        KEEP |symbol_number.106|
        EXPORTAS |symbol_number.106|, i2c1InterruptHandler
        KEEP |symbol_number.107|
        EXPORTAS |symbol_number.107|, i2c0InterruptHandler
        KEEP |symbol_number.108|
        EXPORTAS |symbol_number.108|, sdmac1ch0InterruptHandler
        KEEP |symbol_number.109|
        EXPORTAS |symbol_number.109|, sdmac1ch1InterruptHandler
        KEEP |symbol_number.111|
        EXPORTAS |symbol_number.111|, masterConfig
        KEEP |symbol_number.112|
        EXPORTAS |symbol_number.112|, sendData
        KEEP |symbol_number.113|
        EXPORTAS |symbol_number.113|, slaveConfig
        KEEP |symbol_number.117|
        EXPORTAS |symbol_number.117|, i2c0InterruptHandler
        KEEP |symbol_number.118|
        EXPORTAS |symbol_number.118|, i2c1InterruptHandler
        KEEP |symbol_number.119|
        EXPORTAS |symbol_number.119|, masterConfig
        KEEP |symbol_number.120|
        EXPORTAS |symbol_number.120|, slaveConfig
        KEEP |symbol_number.121|
        EXPORTAS |symbol_number.121|, sendData
        KEEP |symbol_number.128|
        EXPORTAS |symbol_number.128|, i2c0InterruptHandler
        KEEP |symbol_number.129|
        EXPORTAS |symbol_number.129|, i2c1InterruptHandler
        KEEP |symbol_number.130|
        EXPORTAS |symbol_number.130|, masterConfig
        KEEP |symbol_number.131|
        EXPORTAS |symbol_number.131|, slaveConfig
        KEEP |symbol_number.132|
        EXPORTAS |symbol_number.132|, sendData
        KEEP |symbol_number.138|
        EXPORTAS |symbol_number.138|, i2c0InterruptHandler
        KEEP |symbol_number.139|
        EXPORTAS |symbol_number.139|, i2c1InterruptHandler
        KEEP |symbol_number.140|
        EXPORTAS |symbol_number.140|, masterConfig
        KEEP |symbol_number.141|
        EXPORTAS |symbol_number.141|, slaveConfig
        KEEP |symbol_number.142|
        EXPORTAS |symbol_number.142|, sendData
        KEEP |symbol_number.148|
        EXPORTAS |symbol_number.148|, i2c0InterruptHandler
        KEEP |symbol_number.149|
        EXPORTAS |symbol_number.149|, i2c1InterruptHandler
        KEEP |symbol_number.150|
        EXPORTAS |symbol_number.150|, sdmac1ch0InterruptHandler
        KEEP |symbol_number.151|
        EXPORTAS |symbol_number.151|, sdmac1ch1InterruptHandler
        KEEP |symbol_number.152|
        EXPORTAS |symbol_number.152|, sendData
        KEEP |symbol_number.154|
        EXPORTAS |symbol_number.154|, masterConfig
        KEEP |symbol_number.156|
        EXPORTAS |symbol_number.156|, slaveConfig
        KEEP |symbol_number.160|
        EXPORTAS |symbol_number.160|, i2c0InterruptHandler
        KEEP |symbol_number.161|
        EXPORTAS |symbol_number.161|, i2c1InterruptHandler
        KEEP |symbol_number.162|
        EXPORTAS |symbol_number.162|, masterConfig
        KEEP |symbol_number.163|
        EXPORTAS |symbol_number.163|, slaveConfig
        KEEP |symbol_number.164|
        EXPORTAS |symbol_number.164|, sendData
        KEEP |symbol_number.170|
        EXPORTAS |symbol_number.170|, masterConfig
        KEEP |symbol_number.171|
        EXPORTAS |symbol_number.171|, slaveConfig
        KEEP |symbol_number.172|
        EXPORTAS |symbol_number.172|, sendData
        KEEP |symbol_number.175|
        EXPORTAS |symbol_number.175|, masterConfig
        KEEP |symbol_number.176|
        EXPORTAS |symbol_number.176|, slaveConfig
        KEEP |symbol_number.177|
        EXPORTAS |symbol_number.177|, sendData
        KEEP |symbol_number.181|
        EXPORTAS |symbol_number.181|, i2c0InterruptHandler
        KEEP |symbol_number.182|
        EXPORTAS |symbol_number.182|, i2c1InterruptHandler
        KEEP masterConfig0
        KEEP slaveConfig0
        KEEP masterConfig1
        KEEP |symbol_number.186|
        EXPORTAS |symbol_number.186|, sendData
        KEEP |symbol_number.193|
        EXPORTAS |symbol_number.193|, i2c0InterruptHandler
        KEEP |symbol_number.194|
        EXPORTAS |symbol_number.194|, i2c1InterruptHandler
        KEEP |symbol_number.195|
        EXPORTAS |symbol_number.195|, masterConfig
        KEEP |symbol_number.196|
        EXPORTAS |symbol_number.196|, slaveConfig
        KEEP |symbol_number.197|
        EXPORTAS |symbol_number.197|, sendData
        KEEP |symbol_number.203|
        EXPORTAS |symbol_number.203|, i2c0InterruptHandler
        KEEP |symbol_number.204|
        EXPORTAS |symbol_number.204|, i2c1InterruptHandler
        KEEP |symbol_number.205|
        EXPORTAS |symbol_number.205|, masterConfig
        KEEP |symbol_number.206|
        EXPORTAS |symbol_number.206|, slaveConfig
        KEEP |symbol_number.207|
        EXPORTAS |symbol_number.207|, sendData
        KEEP |symbol_number.213|
        EXPORTAS |symbol_number.213|, masterConfig
        KEEP |symbol_number.214|
        EXPORTAS |symbol_number.214|, slaveConfig
        KEEP |symbol_number.215|
        EXPORTAS |symbol_number.215|, sendData
        KEEP |symbol_number.218|
        EXPORTAS |symbol_number.218|, checkReg
        KEEP |symbol_number.220|
        EXPORTAS |symbol_number.220|, golden
        KEEP |symbol_number.222|
        EXPORTAS |symbol_number.222|, masterConfig
        KEEP |symbol_number.223|
        EXPORTAS |symbol_number.223|, slaveConfig
        KEEP |symbol_number.224|
        EXPORTAS |symbol_number.224|, sendData
        KEEP |symbol_number.227|
        EXPORTAS |symbol_number.227|, i2c0InterruptHandler
        KEEP |symbol_number.228|
        EXPORTAS |symbol_number.228|, i2c1InterruptHandler
        KEEP |symbol_number.229|
        EXPORTAS |symbol_number.229|, sdmac1ch0InterruptHandler
        KEEP |symbol_number.230|
        EXPORTAS |symbol_number.230|, sdmac1ch1InterruptHandler
        KEEP |symbol_number.232|
        EXPORTAS |symbol_number.232|, masterConfig
        KEEP |symbol_number.233|
        EXPORTAS |symbol_number.233|, sendData
        KEEP |symbol_number.234|
        EXPORTAS |symbol_number.234|, slaveConfig
        KEEP |symbol_number.239|
        EXPORTAS |symbol_number.239|, i2c0InterruptHandler
        KEEP |symbol_number.240|
        EXPORTAS |symbol_number.240|, i2c1InterruptHandler
        KEEP |symbol_number.241|
        EXPORTAS |symbol_number.241|, sdmac1ch0InterruptHandler
        KEEP |symbol_number.242|
        EXPORTAS |symbol_number.242|, sdmac1ch1InterruptHandler
        KEEP |symbol_number.244|
        EXPORTAS |symbol_number.244|, masterConfig
        KEEP |symbol_number.245|
        EXPORTAS |symbol_number.245|, sendData
        KEEP |symbol_number.247|
        EXPORTAS |symbol_number.247|, slaveConfig
        KEEP |symbol_number.251|
        EXPORTAS |symbol_number.251|, masterConfig
        KEEP |symbol_number.252|
        EXPORTAS |symbol_number.252|, slaveConfig
        KEEP |symbol_number.253|
        EXPORTAS |symbol_number.253|, sendData
        KEEP |symbol_number.256|
        EXPORTAS |symbol_number.256|, masterConfig
        KEEP |symbol_number.257|
        EXPORTAS |symbol_number.257|, slaveConfig
        KEEP |symbol_number.258|
        EXPORTAS |symbol_number.258|, sendData
        KEEP |symbol_number.263|
        EXPORTAS |symbol_number.263|, masterConfig
        KEEP |symbol_number.264|
        EXPORTAS |symbol_number.264|, slaveConfig
        KEEP |symbol_number.265|
        EXPORTAS |symbol_number.265|, sendData
        KEEP |symbol_number.268|
        EXPORTAS |symbol_number.268|, masterConfig
        KEEP |symbol_number.269|
        EXPORTAS |symbol_number.269|, slaveConfig
        KEEP |symbol_number.270|
        EXPORTAS |symbol_number.270|, sendData
        KEEP |symbol_number.273|
        EXPORTAS |symbol_number.273|, checkReg
        KEEP |symbol_number.275|
        EXPORTAS |symbol_number.275|, golden
        KEEP |symbol_number.277|
        EXPORTAS |symbol_number.277|, masterConfig
        KEEP |symbol_number.278|
        EXPORTAS |symbol_number.278|, slaveConfig
        KEEP |symbol_number.279|
        EXPORTAS |symbol_number.279|, sendData
        KEEP |symbol_number.286|
        EXPORTAS |symbol_number.286|, i2c0InterruptHandler
        KEEP |symbol_number.287|
        EXPORTAS |symbol_number.287|, i2c1InterruptHandler
        KEEP |symbol_number.288|
        EXPORTAS |symbol_number.288|, masterConfig
        KEEP |symbol_number.289|
        EXPORTAS |symbol_number.289|, slaveConfig
        KEEP |symbol_number.290|
        EXPORTAS |symbol_number.290|, sendData
        KEEP sendDataIndex
        KEEP isTransferComplete
        KEEP receivedData
        KEEP receivedDataIndex
        KEEP |symbol_number.56|
        EXPORTAS |symbol_number.56|, receivedData
        KEEP |symbol_number.64|
        EXPORTAS |symbol_number.64|, receivedData
        KEEP |symbol_number.66|
        EXPORTAS |symbol_number.66|, isTransferComplete
        KEEP isAutoTransferComplete
        KEEP result
        KEEP |symbol_number.78|
        EXPORTAS |symbol_number.78|, receivedData
        KEEP |symbol_number.83|
        EXPORTAS |symbol_number.83|, receivedData
        KEEP |symbol_number.88|
        EXPORTAS |symbol_number.88|, receivedData
        KEEP |symbol_number.96|
        EXPORTAS |symbol_number.96|, receivedData
        KEEP |symbol_number.98|
        EXPORTAS |symbol_number.98|, isTransferComplete
        KEEP |symbol_number.99|
        EXPORTAS |symbol_number.99|, isAutoTransferComplete
        KEEP |symbol_number.104|
        EXPORTAS |symbol_number.104|, receivedData
        KEEP |symbol_number.110|
        EXPORTAS |symbol_number.110|, receivedData
        KEEP |symbol_number.114|
        EXPORTAS |symbol_number.114|, isTransferComplete
        KEEP |symbol_number.115|
        EXPORTAS |symbol_number.115|, isAutoTransferComplete
        KEEP |symbol_number.122|
        EXPORTAS |symbol_number.122|, sendDataIndex
        KEEP |symbol_number.123|
        EXPORTAS |symbol_number.123|, isTransferComplete
        KEEP |symbol_number.124|
        EXPORTAS |symbol_number.124|, receivedData
        KEEP |symbol_number.125|
        EXPORTAS |symbol_number.125|, receivedDataIndex
        KEEP |symbol_number.133|
        EXPORTAS |symbol_number.133|, sendDataIndex
        KEEP |symbol_number.134|
        EXPORTAS |symbol_number.134|, isTransferComplete
        KEEP |symbol_number.135|
        EXPORTAS |symbol_number.135|, receivedData
        KEEP |symbol_number.136|
        EXPORTAS |symbol_number.136|, receivedDataIndex
        KEEP |symbol_number.143|
        EXPORTAS |symbol_number.143|, sendDataIndex
        KEEP |symbol_number.144|
        EXPORTAS |symbol_number.144|, isTransferComplete
        KEEP |symbol_number.145|
        EXPORTAS |symbol_number.145|, receivedData
        KEEP |symbol_number.146|
        EXPORTAS |symbol_number.146|, receivedDataIndex
        KEEP currentDataPackageIndex
        KEEP |symbol_number.155|
        EXPORTAS |symbol_number.155|, receivedData
        KEEP |symbol_number.157|
        EXPORTAS |symbol_number.157|, isTransferComplete
        KEEP |symbol_number.158|
        EXPORTAS |symbol_number.158|, isAutoTransferComplete
        KEEP |symbol_number.165|
        EXPORTAS |symbol_number.165|, sendDataIndex
        KEEP |symbol_number.166|
        EXPORTAS |symbol_number.166|, isTransferComplete
        KEEP |symbol_number.167|
        EXPORTAS |symbol_number.167|, receivedData
        KEEP |symbol_number.168|
        EXPORTAS |symbol_number.168|, receivedDataIndex
        KEEP |symbol_number.173|
        EXPORTAS |symbol_number.173|, receivedData
        KEEP |symbol_number.178|
        EXPORTAS |symbol_number.178|, receivedData
        KEEP |symbol_number.187|
        EXPORTAS |symbol_number.187|, sendDataIndex
        KEEP |symbol_number.188|
        EXPORTAS |symbol_number.188|, isTransferComplete
        KEEP |symbol_number.189|
        EXPORTAS |symbol_number.189|, receivedData
        KEEP isMasterLostArbitration
        KEEP |symbol_number.191|
        EXPORTAS |symbol_number.191|, receivedDataIndex
        KEEP |symbol_number.198|
        EXPORTAS |symbol_number.198|, sendDataIndex
        KEEP |symbol_number.199|
        EXPORTAS |symbol_number.199|, isTransferComplete
        KEEP |symbol_number.200|
        EXPORTAS |symbol_number.200|, receivedData
        KEEP |symbol_number.201|
        EXPORTAS |symbol_number.201|, receivedDataIndex
        KEEP |symbol_number.208|
        EXPORTAS |symbol_number.208|, sendDataIndex
        KEEP |symbol_number.209|
        EXPORTAS |symbol_number.209|, isTransferComplete
        KEEP |symbol_number.210|
        EXPORTAS |symbol_number.210|, receivedData
        KEEP |symbol_number.211|
        EXPORTAS |symbol_number.211|, receivedDataIndex
        KEEP |symbol_number.216|
        EXPORTAS |symbol_number.216|, sendDataIndex
        KEEP |symbol_number.219|
        EXPORTAS |symbol_number.219|, result
        KEEP |symbol_number.225|
        EXPORTAS |symbol_number.225|, receivedData
        KEEP |symbol_number.231|
        EXPORTAS |symbol_number.231|, receivedData
        KEEP |symbol_number.235|
        EXPORTAS |symbol_number.235|, isTransferComplete
        KEEP |symbol_number.236|
        EXPORTAS |symbol_number.236|, isAutoTransferComplete
        KEEP |symbol_number.243|
        EXPORTAS |symbol_number.243|, receivedData
        KEEP |symbol_number.246|
        EXPORTAS |symbol_number.246|, currentDataPackageIndex
        KEEP |symbol_number.248|
        EXPORTAS |symbol_number.248|, isTransferComplete
        KEEP |symbol_number.249|
        EXPORTAS |symbol_number.249|, isAutoTransferComplete
        KEEP |symbol_number.254|
        EXPORTAS |symbol_number.254|, receivedData
        KEEP |symbol_number.259|
        EXPORTAS |symbol_number.259|, receivedData
        KEEP |symbol_number.266|
        EXPORTAS |symbol_number.266|, receivedData
        KEEP |symbol_number.271|
        EXPORTAS |symbol_number.271|, receivedData
        KEEP |symbol_number.274|
        EXPORTAS |symbol_number.274|, result
        KEEP |symbol_number.280|
        EXPORTAS |symbol_number.280|, receivedData
        KEEP |symbol_number.291|
        EXPORTAS |symbol_number.291|, sendDataIndex
        KEEP |symbol_number.292|
        EXPORTAS |symbol_number.292|, isTransferComplete
        KEEP |symbol_number.293|
        EXPORTAS |symbol_number.293|, receivedData
        KEEP |symbol_number.294|
        EXPORTAS |symbol_number.294|, receivedDataIndex

        ATTR FILESCOPE
        ATTR SETVALUE Tag_ABI_PCS_wchar_t,4
        ATTR SETVALUE Tag_ABI_enum_size,2
        ATTR SETVALUE Tag_ABI_optimization_goals,4
        ATTR SETVALUE AV,10,1

        ASSERT {ENDIAN} = "little"
        ASSERT {INTER} = {FALSE}
        ASSERT {ROPI} = {FALSE}
        ASSERT {RWPI} = {FALSE}
        ASSERT {IEEE_FULL} = {FALSE}
        ASSERT {IEEE_PART} = {FALSE}
        ASSERT {IEEE_JAVA} = {FALSE}
        END
