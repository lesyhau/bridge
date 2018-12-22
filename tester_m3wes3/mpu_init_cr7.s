
;******************************************************************************
; Cortex R7 MPU intialization.
; 2082 - Hau Sy Le - hau.le.eb@renesas.com
;******************************************************************************

REGION_SIZE_256B    EQU 0x0e
REGION_SIZE_512B    EQU 0x10
REGION_SIZE_1KB     EQU 0x12
REGION_SIZE_2KB     EQU 0x14
REGION_SIZE_4KB     EQU 0x16
REGION_SIZE_8KB     EQU 0x18
REGION_SIZE_16KB    EQU 0x1a
REGION_SIZE_32KB    EQU 0x1c
REGION_SIZE_64KB    EQU 0x1e
REGION_SIZE_128KB   EQU 0x20
REGION_SIZE_256KB   EQU 0x22
REGION_SIZE_512KB   EQU 0x24
REGION_SIZE_1MB     EQU 0x26
REGION_SIZE_2MB     EQU 0x28
REGION_SIZE_4MB     EQU 0x2a
REGION_SIZE_8MB     EQU 0x2c
REGION_SIZE_16MB    EQU 0x2e
REGION_SIZE_32MB    EQU 0x30
REGION_SIZE_64MB    EQU 0x32
REGION_SIZE_128MB   EQU 0x34
REGION_SIZE_256MB   EQU 0x36
REGION_SIZE_512MB   EQU 0x38
REGION_SIZE_1GB     EQU 0x3a
REGION_SIZE_2GB     EQU 0x3c
REGION_SIZE_4GB     EQU 0x3e

REGION_ENABLE       EQU 0x1

AP_NA_NA            EQU 0x000
AP_RW_NA            EQU 0x100
AP_RW_RO            EQU 0x200
AP_RW_RW            EQU 0x300
AP_UNP_UNP          EQU 0x400
AP_RO_NA            EQU 0x500
AP_RO_RO            EQU 0x600
AP_UNP_UNP_2        EQU 0x700

STRONGLY_ORDERED    EQU 0x00
SHAREABLE_DEVICE    EQU 0x01
NORMAL_NC           EQU 0x08
NORMAL_NC_SHARE     EQU 0x0c
NORMAL_WBWA         EQU 0x0b
NORMAL_WBWA_SHARE   EQU 0x0f
NONSHAREABLE_DEVICE EQU 0x10

    ; Region 0: All, 4GB
    mov r0, #0
    mcr p15, 0, r0, c6, c2, 0
    mov r0, #0x0
    mcr p15, 0, r0, c6, c1, 0
    mcr p15, 0, r0, c6, c1, 1
    mov r0, #REGION_SIZE_4GB :OR: REGION_ENABLE
    mcr p15, 0, r0, c6, c1, 2
    mcr p15, 0, r0, c6, c1, 3
    mov r0, #AP_RW_RW :OR: NORMAL_WBWA_SHARE
    mcr p15, 0, r0, c6, c1, 4
    mcr p15, 0, r0, c6, c1, 5

    ; BSC
    ; 0x00000000 - 0x07ffffff, 128MB
    mov r0, #1
    mcr p15, 0, r0, c6, c2, 0
    mov r0, #0x0
    mcr p15, 0, r0, c6, c1, 0
    mcr p15, 0, r0, c6, c1, 1
    mov r0, #REGION_SIZE_128MB :OR: REGION_ENABLE
    mcr p15, 0, r0, c6, c1, 2
    mcr p15, 0, r0, c6, c1, 3
    mov r0, #AP_RW_RW :OR: NORMAL_WBWA
    mcr p15, 0, r0, c6, c1, 4
    mcr p15, 0, r0, c6, c1, 5

    ; RPC
    ; 0x08000000 - 0x0fffffff, 128MB
    mov r0, #2
    mcr p15, 0, r0, c6, c2, 0
    mov     r0, #0x0
    movt    r0, #0x0800
    mcr p15, 0, r0, c6, c1, 0
    mcr p15, 0, r0, c6, c1, 1
    mov r0, #REGION_SIZE_128MB :OR: REGION_ENABLE
    mcr p15, 0, r0, c6, c1, 2
    mcr p15, 0, r0, c6, c1, 3
    mov r0, #AP_RW_RW :OR: NORMAL_WBWA
    mcr p15, 0, r0, c6, c1, 4
    mcr p15, 0, r0, c6, c1, 5

    ; BSC
    ; 0x10000000 - 0x1fffffff, 256MB
    mov r0, #3
    mcr p15, 0, r0, c6, c2, 0
    mov     r0, #0x0
    movt    r0, #0x1000
    mcr p15, 0, r0, c6, c1, 0
    mcr p15, 0, r0, c6, c1, 1
    mov r0, #REGION_SIZE_256MB :OR: REGION_ENABLE
    mcr p15, 0, r0, c6, c1, 2
    mcr p15, 0, r0, c6, c1, 3
    mov r0, #AP_RW_RW :OR: NORMAL_WBWA_SHARE
    mcr p15, 0, r0, c6, c1, 4
    mcr p15, 0, r0, c6, c1, 5

    ; RPC
    ; 0x20000000 - 0x3fffffff, 512MB
    mov r0, #4
    mcr p15, 0, r0, c6, c2, 0
    mov     r0, #0x0
    movt    r0, #0x0800
    mcr p15, 0, r0, c6, c1, 0
    mcr p15, 0, r0, c6, c1, 1
    mov r0, #REGION_SIZE_512MB :OR: REGION_ENABLE
    mcr p15, 0, r0, c6, c1, 2
    mcr p15, 0, r0, c6, c1, 3
    mov r0, #AP_RW_RW :OR: NORMAL_WBWA_SHARE
    mcr p15, 0, r0, c6, c1, 4
    mcr p15, 0, r0, c6, c1, 5

    ; SDRAM
    ; 0x40000000 - 0xbfffffff, 2GB
    mov r0, #5
    mcr p15, 0, r0, c6, c2, 0
    mov     r0, #0x0
    movt    r0, #0x4000
    mcr p15, 0, r0, c6, c1, 0
    mcr p15, 0, r0, c6, c1, 1
    mov r0, #REGION_SIZE_2GB :OR: REGION_ENABLE
    mcr p15, 0, r0, c6, c1, 2
    mcr p15, 0, r0, c6, c1, 3
    mov r0, #AP_RW_RW :OR: NORMAL_WBWA_SHARE
    mcr p15, 0, r0, c6, c1, 4
    mcr p15, 0, r0, c6, c1, 5

    ; PCIE
    ; 0xc0000000 - 0xdfffffff, 512MB
    mov r0, #6
    mcr p15, 0, r0, c6, c2, 0
    mov     r0, #0x0
    movt    r0, #0xc000
    mcr p15, 0, r0, c6, c1, 0
    mcr p15, 0, r0, c6, c1, 1
    mov r0, #REGION_SIZE_512MB :OR: REGION_ENABLE
    mcr p15, 0, r0, c6, c1, 2
    mcr p15, 0, r0, c6, c1, 3
    mov r0, #AP_RW_RW :OR: NORMAL_WBWA_SHARE
    mcr p15, 0, r0, c6, c1, 4
    mcr p15, 0, r0, c6, c1, 5

    ; Peripheral
    ; 0xe0000000 - 0xe62fffff, 99kB
    mov r0, #7
    mcr p15, 0, r0, c6, c2, 0
    mov     r0, #0x0
    movt    r0, #0xe000
    mcr p15, 0, r0, c6, c1, 0
    mcr p15, 0, r0, c6, c1, 1
    mov r0, #REGION_SIZE_128MB :OR: REGION_ENABLE
    mcr p15, 0, r0, c6, c1, 2
    mcr p15, 0, r0, c6, c1, 3
    mov r0, #AP_RW_RW :OR: SHAREABLE_DEVICE
    mcr p15, 0, r0, c6, c1, 4
    mcr p15, 0, r0, c6, c1, 5

    ; SRAM
    ; 0xe6300000 - 0xe635ffff, 384kB
    mov r0, #8
    mcr p15, 0, r0, c6, c2, 0
    mov     r0, #0x0
    movt    r0, #0xe630
    mcr p15, 0, r0, c6, c1, 0
    mcr p15, 0, r0, c6, c1, 1
    mov r0, #REGION_SIZE_512KB :OR: REGION_ENABLE
    mcr p15, 0, r0, c6, c1, 2
    mcr p15, 0, r0, c6, c1, 3
    mov r0, #AP_RW_RW :OR: NORMAL_WBWA_SHARE
    mcr p15, 0, r0, c6, c1, 4
    mcr p15, 0, r0, c6, c1, 5

    ; Peripheral
    ; 0xe6400000 - 0xeb0fffff, 77MB
    mov r0, #9
    mcr p15, 0, r0, c6, c2, 0
    mov     r0, #0x0
    movt    r0, #0xe6400
    mcr p15, 0, r0, c6, c1, 0
    mcr p15, 0, r0, c6, c1, 1
    mov r0, #REGION_SIZE_128MB :OR: REGION_ENABLE
    mcr p15, 0, r0, c6, c1, 2
    mcr p15, 0, r0, c6, c1, 3
    mov r0, #AP_RW_RW :OR: SHAREABLE_DEVICE
    mcr p15, 0, r0, c6, c1, 4
    mcr p15, 0, r0, c6, c1, 5

    ; SecROM
    ; 0xeb100000 - 0xeb3fffff, 48MB
    mov r0, #10
    mcr p15, 0, r0, c6, c2, 0
    mov     r0, #0x0
    movt    r0, #0xeb10
    mcr p15, 0, r0, c6, c1, 0
    mcr p15, 0, r0, c6, c1, 1
    mov r0, #REGION_SIZE_64MB :OR: REGION_ENABLE
    mcr p15, 0, r0, c6, c1, 2
    mcr p15, 0, r0, c6, c1, 3
    mov r0, #AP_RW_RW :OR: NORMAL_WBWA_SHARE
    mcr p15, 0, r0, c6, c1, 4
    mcr p15, 0, r0, c6, c1, 5

    ; Peripheral
    ; 0xeb400000 - 0xecffffff, 28MB
    mov r0, #11
    mcr p15, 0, r0, c6, c2, 0
    mov     r0, #0x0
    movt    r0, #0xeb40
    mcr p15, 0, r0, c6, c1, 0
    mcr p15, 0, r0, c6, c1, 1
    mov r0, #REGION_SIZE_32MB :OR: REGION_ENABLE
    mcr p15, 0, r0, c6, c1, 2
    mcr p15, 0, r0, c6, c1, 3
    mov r0, #AP_RW_RW :OR: SHAREABLE_DEVICE
    mcr p15, 0, r0, c6, c1, 4
    mcr p15, 0, r0, c6, c1, 5

    ; IMP RAM
    ; 0xed000000 - 0xedffffff, 16MB
    mov r0, #12
    mcr p15, 0, r0, c6, c2, 0
    mov     r0, #0x0
    movt    r0, #0xed00
    mcr p15, 0, r0, c6, c1, 0
    mcr p15, 0, r0, c6, c1, 1
    mov r0, #REGION_SIZE_16MB :OR: REGION_ENABLE
    mcr p15, 0, r0, c6, c1, 2
    mcr p15, 0, r0, c6, c1, 3
    mov r0, #AP_RW_RW :OR: NORMAL_WBWA_SHARE
    mcr p15, 0, r0, c6, c1, 4
    mcr p15, 0, r0, c6, c1, 5

    ; Peripheral
    ; 0xee000000 - 0xffffffff, 288MB
    mov r0, #13
    mcr p15, 0, r0, c6, c2, 0
    mov     r0, #0x0
    movt    r0, #0xee00
    mcr p15, 0, r0, c6, c1, 0
    mcr p15, 0, r0, c6, c1, 1
    mov r0, #REGION_SIZE_512MB :OR: REGION_ENABLE
    mcr p15, 0, r0, c6, c1, 2
    mcr p15, 0, r0, c6, c1, 3
    mov r0, #AP_RW_RW :OR: SHAREABLE_DEVICE
    mcr p15, 0, r0, c6, c1, 4
    mcr p15, 0, r0, c6, c1, 5

    ; Enable MPU
    mrc p15, 0, r0, c1, c0, 0
    orr r0, r0, #0x1
    dsb
    mcr p15, 0, r0, c1, c0, 0
    isb

    end
