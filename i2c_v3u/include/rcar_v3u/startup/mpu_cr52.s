
;******************************************************************************
; ARM MPU intialization.
; 2082 - Hau Sy Le - hau.le.eb@renesas.com
;******************************************************************************

; HPRBAR.SH
SH_POS          equ 3
NON_SHAREABLE   equ (0 << SH_POS)
OUT_SHAREABLE   equ (2 << SH_POS)
IN_SHAREABLE    equ (3 << SH_POS)

; HPRBAR.AP
AP_POS          equ 1
RW_EL2          equ (0 << AP_POS)
RW              equ (1 << AP_POS)
RO_EL2          equ (2 << AP_POS)
RO              equ (3 << AP_POS)

; HPRBAR.XN
XN_POS          equ 0
EXECUTE_NEVER   equ (1 << XN_POS)
EXECUTABLE      equ (0 << XN_POS)

; HPRLAR.AttrIndx
AttrIndx_POS    equ 1
ATTR0           equ (0 << AttrIndx_POS)
ATTR1           equ (1 << AttrIndx_POS)
ATTR2           equ (2 << AttrIndx_POS)
ATTR3           equ (3 << AttrIndx_POS)
ATTR4           equ (4 << AttrIndx_POS)
ATTR5           equ (5 << AttrIndx_POS)
ATTR6           equ (6 << AttrIndx_POS)
ATTR7           equ (7 << AttrIndx_POS)
ATTR8           equ (8 << AttrIndx_POS)
ATTR9           equ (9 << AttrIndx_POS)
ATTR30          equ (10 << AttrIndx_POS)
ATTR31          equ (11 << AttrIndx_POS)
ATTR32          equ (12 << AttrIndx_POS)
ATTR33          equ (13 << AttrIndx_POS)
ATTR34          equ (14 << AttrIndx_POS)
ATTR35          equ (15 << AttrIndx_POS)

; HPRLAR.EN
EN_POS          equ 0
REGION_ENABLE   equ (1 << EN_POS)

    area    MPU_INIT, code, readonly
    
    export  __mpu_init
    export  __mpu_init_el1

    entry

__mpu_init

    ; Define memory regions attribute
    ; Attribute 0: 0xff Normal, Outer write-back non-transient, RW allocate, Inner write-back non-transient
    ; Attribute 1: 0x04 Device, nGnRE
    ; Attribute 2: 0x44 Normal, Outer non-cacheable, Inner non-cacheable
    ; Attribute 3: 0x00 Device, nGnRnE
    mov  r0, #0x04ff
    movt r0, #0x0044
    mcr p15, 4, r0, c10, c2, 0
    mov  r0, #0xbb00
    movt r0, #0xddee
    mcr p15, 4, r0, c10, c2, 1

    ; BSC
    mov r0, #0
    mcr p15, 4, r0, c6, c2, 1
    mov  r0, #(((0x00000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) :and: 0x0000ffff)
    movt r0, #(((0x00000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) >> 16)
    mcr p15, 4, r0, c6, c3, 0
    mov  r0, #(((0x07ffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) :and: 0x0000ffff)
    movt r0, #(((0x07ffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) >> 16)
    mcr p15, 4, r0, c6, c3, 1

    ; RPC
    mov r0, #1
    mcr p15, 4, r0, c6, c2, 1
    mov  r0, #(((0x08000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) :and: 0x0000ffff)
    movt r0, #(((0x08000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) >> 16)
    mcr p15, 4, r0, c6, c3, 0
    mov  r0, #(((0x0fffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) :and: 0x0000ffff)
    movt r0, #(((0x0fffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) >> 16)
    mcr p15, 4, r0, c6, c3, 1

    ; BSC
    mov r0, #2
    mcr p15, 4, r0, c6, c2, 1
    mov  r0, #(((0x10000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) :and: 0x0000ffff)
    movt r0, #(((0x10000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) >> 16)
    mcr p15, 4, r0, c6, c3, 0
    mov  r0, #(((0x1fffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) :and: 0x0000ffff)
    movt r0, #(((0x1fffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) >> 16)
    mcr p15, 4, r0, c6, c3, 1

    ; RPC
    mov r0, #3
    mcr p15, 4, r0, c6, c2, 1
    mov  r0, #(((0x20000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) :and: 0x0000ffff)
    movt r0, #(((0x20000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) >> 16)
    mcr p15, 4, r0, c6, c3, 0
    mov  r0, #(((0x3fffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) :and: 0x0000ffff)
    movt r0, #(((0x3fffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) >> 16)
    mcr p15, 4, r0, c6, c3, 1

    ; SDRAM
    mov r0, #4
    mcr p15, 4, r0, c6, c2, 1
    mov  r0, #(((0x40000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) :and: 0x0000ffff)
    movt r0, #(((0x40000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) >> 16)
    mcr p15, 4, r0, c6, c3, 0
    mov  r0, #(((0xbfffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) :and: 0x0000ffff)
    movt r0, #(((0xbfffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) >> 16)
    mcr p15, 4, r0, c6, c3, 1

    ; PCIE
    mov r0, #5
    mcr p15, 4, r0, c6, c2, 1
    mov  r0, #(((0xc0000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) :and: 0x0000ffff)
    movt r0, #(((0xc0000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) >> 16)
    mcr p15, 4, r0, c6, c3, 0
    mov  r0, #(((0xdfffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) :and: 0x0000ffff)
    movt r0, #(((0xdfffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) >> 16)
    mcr p15, 4, r0, c6, c3, 1

    ; Peripheral
    mov r0, #6
    mcr p15, 4, r0, c6, c2, 1
    mov  r0, #(((0xe0000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) :and: 0x0000ffff)
    movt r0, #(((0xe0000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) >> 16)
    mcr p15, 4, r0, c6, c3, 0
    mov  r0, #(((0xe62fffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR3 :or: REGION_ENABLE) :and: 0x0000ffff)
    movt r0, #(((0xe62fffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR3 :or: REGION_ENABLE) >> 16)
    mcr p15, 4, r0, c6, c3, 1

    ; SRAM
    mov r0, #7
    mcr p15, 4, r0, c6, c2, 1
    mov  r0, #(((0xe6300000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) :and: 0x0000ffff)
    movt r0, #(((0xe6300000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) >> 16)
    mcr p15, 4, r0, c6, c3, 0
    mov  r0, #(((0xe63fffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) :and: 0x0000ffff)
    movt r0, #(((0xe63fffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) >> 16)
    mcr p15, 4, r0, c6, c3, 1

    ; Peripheral
    mov r0, #8
    mcr p15, 4, r0, c6, c2, 1
    mov  r0, #(((0xe6400000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) :and: 0x0000ffff)
    movt r0, #(((0xe6400000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) >> 16)
    mcr p15, 4, r0, c6, c3, 0
    mov  r0, #(((0xeb0fffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR3 :or: REGION_ENABLE) :and: 0x0000ffff)
    movt r0, #(((0xeb0fffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR3 :or: REGION_ENABLE) >> 16)
    mcr p15, 4, r0, c6, c3, 1

    ; SecROM
    mov r0, #9
    mcr p15, 4, r0, c6, c2, 1
    mov  r0, #(((0xeb100000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) :and: 0x0000ffff)
    movt r0, #(((0xeb100000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) >> 16)
    mcr p15, 4, r0, c6, c3, 0
    mov  r0, #(((0xeb3fffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) :and: 0x0000ffff)
    movt r0, #(((0xeb3fffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) >> 16)
    mcr p15, 4, r0, c6, c3, 1

    ; Peripheral
    mov r0, #10
    mcr p15, 4, r0, c6, c2, 1
    mov  r0, #(((0xeb400000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) :and: 0x0000ffff)
    movt r0, #(((0xeb400000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) >> 16)
    mcr p15, 4, r0, c6, c3, 0
    mov  r0, #(((0xecffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR3 :or: REGION_ENABLE) :and: 0x0000ffff)
    movt r0, #(((0xecffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR3 :or: REGION_ENABLE) >> 16)
    mcr p15, 4, r0, c6, c3, 1

    ; IMP RAM
    mov r0, #11
    mcr p15, 4, r0, c6, c2, 1
    mov  r0, #(((0xed000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) :and: 0x0000ffff)
    movt r0, #(((0xed000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) >> 16)
    mcr p15, 4, r0, c6, c3, 0
    mov  r0, #(((0xedffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) :and: 0x0000ffff)
    movt r0, #(((0xedffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE) >> 16)
    mcr p15, 4, r0, c6, c3, 1

    ; Peripheral
    mov r0, #12
    mcr p15, 4, r0, c6, c2, 1
    mov  r0, #(((0xee000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) :and: 0x0000ffff)
    movt r0, #(((0xee000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW) >> 16)
    mcr p15, 4, r0, c6, c3, 0
    mov  r0, #(((0xffffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR3 :or: REGION_ENABLE) :and: 0x0000ffff)
    movt r0, #(((0xffffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR3 :or: REGION_ENABLE) >> 16)
    mcr p15, 4, r0, c6, c3, 1

    ; Enable EL2 MPU
    mrc p15, 4, r0, c1, c0, 0
    orr r0, r0, #0x1
    dsb
    mcr p15, 4, r0, c1, c0, 0
    isb

    bx  lr

__mpu_init_el1

;    ; Define memory regions attribute
;    ; Attribute 0: 0xff Normal, Outer write-back non-transient, RW allocate, Inner write-back non-transient
;    ; Attribute 1: 0x04 Device, nGnRE
;    ; Attribute 2: 0x44 Normal, Outer non-cacheable, Inner non-cacheable
;    ldr r0, = 0x444404ff
;    mcr p15, 4, r0, c10, c2, 0
;    ldr r0, = 0xddeebb00
;    mcr p15, 4, r0, c10, c2, 1
;
;    ; BSC
;    mov r0, #0
;    mcr p15, 0, r0, c6, c2, 1
;    ldr r0, = (0x00000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW
;    mcr p15, 0, r0, c6, c3, 0
;    ldr r0, = (0x07ffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE
;    mcr p15, 0, r0, c6, c3, 1
;
;    ; RPC
;    mov r0, #1
;    mcr p15, 0, r0, c6, c2, 1
;    ldr r0, = (0x08000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW
;    mcr p15, 0, r0, c6, c3, 0
;    ldr r0, = (0x0fffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE
;    mcr p15, 0, r0, c6, c3, 1
;
;    ; BSC
;    mov r0, #2
;    mcr p15, 0, r0, c6, c2, 1
;    ldr r0, = (0x10000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW
;    mcr p15, 0, r0, c6, c3, 0
;    ldr r0, = (0x1fffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE
;    mcr p15, 0, r0, c6, c3, 1
;
;    ; RPC
;    mov r0, #3
;    mcr p15, 0, r0, c6, c2, 1
;    ldr r0, = (0x20000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW
;    mcr p15, 0, r0, c6, c3, 0
;    ldr r0, = (0x3fffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE
;    mcr p15, 0, r0, c6, c3, 1
;
;    ; SDRAM
;    mov r0, #4
;    mcr p15, 0, r0, c6, c2, 1
;    ldr r0, = (0x40000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW
;    mcr p15, 0, r0, c6, c3, 0
;    ldr r0, = (0xbfffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE
;    mcr p15, 0, r0, c6, c3, 1
;
;    ; PCIE
;    mov r0, #5
;    mcr p15, 0, r0, c6, c2, 1
;    ldr r0, = (0xc0000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW
;    mcr p15, 0, r0, c6, c3, 0
;    ldr r0, = (0xdfffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE
;    mcr p15, 0, r0, c6, c3, 1
;
;    ; Peripheral
;    mov r0, #6
;    mcr p15, 0, r0, c6, c2, 1
;    ldr r0, = (0xe0000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW
;    mcr p15, 0, r0, c6, c3, 0
;    ldr r0, = (0xe62fffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR3 :or: REGION_ENABLE
;    mcr p15, 0, r0, c6, c3, 1
;
;    ; SRAM
;    mov r0, #7
;    mcr p15, 0, r0, c6, c2, 1
;    ldr r0, = (0xe6300000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW
;    mcr p15, 0, r0, c6, c3, 0
;    ldr r0, = (0xe63fffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE
;    mcr p15, 0, r0, c6, c3, 1
;
;    ; Peripheral
;    mov r0, #8
;    mcr p15, 0, r0, c6, c2, 1
;    ldr r0, = (0xe6400000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW
;    mcr p15, 0, r0, c6, c3, 0
;    ldr r0, = (0xeb0fffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR3 :or: REGION_ENABLE
;    mcr p15, 0, r0, c6, c3, 1
;
;    ; SecROM
;    mov r0, #9
;    mcr p15, 0, r0, c6, c2, 1
;    ldr r0, = (0xeb100000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW
;    mcr p15, 0, r0, c6, c3, 0
;    ldr r0, = (0xeb3fffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE
;    mcr p15, 0, r0, c6, c3, 1
;
;    ; Peripheral
;    mov r0, #10
;    mcr p15, 0, r0, c6, c2, 1
;    ldr r0, = (0xeb400000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW
;    mcr p15, 0, r0, c6, c3, 0
;    ldr r0, = (0xecffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR3 :or: REGION_ENABLE
;    mcr p15, 0, r0, c6, c3, 1
;
;    ; IMP RAM
;    mov r0, #11
;    mcr p15, 0, r0, c6, c2, 1
;    ldr r0, = (0xed000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW
;    mcr p15, 0, r0, c6, c3, 0
;    ldr r0, = (0xedffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR0 :or: REGION_ENABLE
;    mcr p15, 0, r0, c6, c3, 1
;
;    ; Peripheral
;    mov r0, #12
;    mcr p15, 0, r0, c6, c2, 1
;    ldr r0, = (0xee000000 :and: (:not:(0x1 << 5))) :or: NON_SHAREABLE :or: RW
;    mcr p15, 0, r0, c6, c3, 0
;    ldr r0, = (0xffffffff :and: (:not:(0x3f) :and: (:not:(0x3 << 4)))) :or: ATTR3 :or: REGION_ENABLE
;    mcr p15, 0, r0, c6, c3, 1
;
;    ; Enable EL2 MPU
;    mrc p15, 0, r0, c1, c0, 0
;    orr r0, r0, #0x1
;    dsb
;    mcr p15, 0, r0, c1, c0, 0
;    isb

    bx  lr

    end

