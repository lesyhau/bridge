
__dbsc_init

    ldr r0, = 0xe67f0024
    ldr r1, = 1
    str r1, [r0]

    ldr r0, = 0xe6790100
    ldr r1, = 0x1234
    str r1, [r0]

    ldr r0, = 0xe6790108
    ldr r1, = 0x1234
    str r1, [r0]

    ldr r0, = 0xe6798100
    ldr r1, = 0x1234
    str r1, [r0]

    ldr r0, = 0xe6798108
    ldr r1, = 0x1234
    str r1, [r0]

    ldr r0, = 0xe6797400
    ldr r1, = 1
    str r1, [r0]

    ldr r0, = 0xe679f400
    ldr r1, = 1
    str r1, [r0]

    end

