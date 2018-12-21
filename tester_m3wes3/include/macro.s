
    ; Delay
    macro
    delay   $amount
    ldr r0, = $amount
    ldr r1, = 0
1
    add r1, r1, #1
    cmp r1, r0
    bne %b1
    mend

    ; Dump out x7
    macro
    dump32  $addr
    ldr     r0, = $addr
    ldr     r1, [r0]
    str     r1, [x7]
    add     w7, w7, #4
    mend

    ; Read 32
    macro
    ldr32   $addr
    ldr     r0, = $addr
    ldr     r1, [r0]
    mend

    ; Read 16
    macro
    ldr16   $addr
    ldrh    r0, = $addr
    ldrh    r1, [r0]
    mend

    ; Read 8
    macro
    ldr8    $addr
    ldrb    r0, = $addr
    ldrb    r1, [r0]
    mend

    ; Write 32
    macro
    str32   $addr, $data
    ldr     r0, = $addr
    ldr     r1, = $data
    str     r1, [r0]
    mend

    ; Write 16
    macro
    str16   $addr, $data
    ldr     r0, = $addr
    ldr     r1, = $data
    strh    r1, [r0]
    mend

    ; Write 8
    macro
    str8    $addr, $data
    ldr     r0, = $addr
    ldr     r1, = $data
    strb    r1, [r0]
    mend

    ; Wait
    macro
    wait32  $addr, $data
    ldr     r0, = $addr
    ldr     r2, = $data
1
    ldr     r1, [r0]
    and     r1, r1, r2
    cmp     r1, r2
    bne     %b1
    mend

    ; Set a bit
    macro
    setb    $addr, $bit_pos
    ldr     r0, = $addr
    ldr     r1, [r0]
    ldr     r2, = 1
    lsl     r2, $bit_pos
    orr     r1, r1, r2
    str     r1, [r0]
    mend

    ; Clear a bit
    macro
    clrb    $addr, $bit_pos
    ldr     r0, = $addr
    ldr     r1, [r0]
    ldr     r2, = 1
    lsl     r2, $bit_pos
    mvn     r2, r2
    and     r1, r1, r2
    str     r1, [r0]
    mend

    end
