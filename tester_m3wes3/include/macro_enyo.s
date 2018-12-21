
    ; Delay
    macro
    delay   $amount
    ldr x0, = $amount
    ldr x1, = 0
1
    add x1, x1, #1
    cmp x1, x0
    bne %b1
    mend

    ; Dump out x7
    macro
    dump32  $addr
    ldr     w0, = $addr
    ldr     w1, [x0]
    str     w1, [x7]
    add     w7, w7, #4
    mend

    ; Read 32
    macro
    ldr32   $addr
    ldr     w0, = $addr
    ldr     w1, [x0]
    mend

    ; Read 16
    macro
    ldr16   $addr
    ldrh    w0, = $addr
    ldrh    w1, [x0]
    mend

    ; Read 8
    macro
    ldr8    $addr
    ldrb    w0, = $addr
    ldrb    w1, [x0]
    mend

    ; Write 32
    macro
    str32   $addr, $data
    ldr     w0, = $addr
    ldr     w1, = $data
    str     w1, [x0]
    mend

    ; Write 16
    macro
    str16   $addr, $data
    ldr     w0, = $addr
    ldr     w1, = $data
    strh    w1, [x0]
    mend

    ; Write 8
    macro
    str8    $addr, $data
    ldr     w0, = $addr
    ldr     w1, = $data
    strb    w1, [x0]
    mend

    ; Wait
    macro
    wait32  $addr, $data
    ldr     w0, = $addr
    ldr     w2, = $data
1
    ldr     w1, [x0]
    and     w1, w1, w2
    cmp     w1, w2
    bne     %b1
    mend

    ; Set a bit
    macro
    setb    $addr, $bit_pos
    ldr     w0, = $addr
    ldr     w1, [x0]
    ldr     w2, = 1
    lsl     w2, $bit_pos
    orr     w1, w1, w2
    str     w1, [x0]
    mend

    ; Clear a bit
    macro
    clrb    $addr, $bit_pos
    ldr     w0, = $addr
    ldr     w1, [x0]
    ldr     w2, = 1
    lsl     x2, $bit_pos
    mvn     w2, x2
    and     w1, w1, w2
    str     w1, [x0]
    mend

    end
