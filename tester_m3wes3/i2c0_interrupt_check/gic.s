	
	MACRO
	GIC_SETTING_CR52 $int_source

	LCLS	src
src	SETS    "$int_source"

	;Read IMP_CBAR -> R2
	;R2: GICD base address
	MRC     p15, 1, R2, c15, c3, 0

	;GICR_WAKER CHECK
	; 1. read
	;  Redistributor page 0
	ADD     R1, R2, #0x100000
	;  Write 0
1               MOV     R0, #0
	STR     R0, [R1,#0x14]
	;  Check
	LDR     R0, [R1,#0x14]
	LDR     R3, =0xFFFFFFFF
	ANDS    R0, R0, R3
	BNE %1
	
	;Priority mask
	MOV R0, #0xFC        ; GICC_PMR
	MCR p15,0,R0,c4,c6,0 ; Write Rt to ICC_PMR

	;Priority set
	LDR     R0, =0x00000400+(($src)/4)*4
	ADD     R1, R2, R0
	LDR     R0, =0x00000000
	STR     R0, [R1]

	;GICD_IGROUPR -> GROUP 1
	LDR     R0, =0x00000080+(($src)/32)*4
	ADD     R1, R2, R0
	LDR     R0, =0x1<<(($src)&0x1F)
	STR     R0, [R1]

	;Enable
	LDR     R0, =0x00000100+(($src)/32)*4
	ADD     R1, R2, R0
	LDR     R0, =0x1<<(($src)&0x1F)
	STR     R0, [R1]

	;Level sensitive
	LDR     R0, =0x00000C00+(($src)/16)*4 ; ICDICFGR
	ADD     R1, R2, R0
	LDR     R0, =0x2<<(($src)&0x0F)*2
	;LDR     R0, =0x0<<(($src)&0x0F)*2 ; For testing
	STR     R0, [R1]
	LDR     R0, [R1]

	;Enable GICD
	LDR     R0, =0x00000000 ; ICCDCR
	ADD     R1, R2, R0
	LDR     R0, =0x00000003
	STR     R0, [R1]

	;Enable GICI

	MRC p15,0,R0,c12,c12,7 ; Read to ICC_IGRPEN1 to R0
	LDR R1, =0x00000003
	ORR R0, R0, R1         ; Set bit[1:0]
	MCR p15,0,R0,c12,c12,7 ; Write Rt to ICC_IGRPEN1

	MEND
	
	MACRO
	GIC_CHECK_CR52 $int_source, $fail_addr

	LCLS    src
src	SETS    "$int_source"
	
	;Read IAR1 to R2
	MRC p15,0,R2,c12,c12,0 ; Read ICC_IAR1 into Rt

	;Dump -> assumpe that R7 content dump address
	STR R2, [R7, #0]
	ADD R7, R7, #4

	;Compare
	LDR     r1, =$src
	CMP     r1, r2
	BNE     $fail_addr

	;EOIR
	MCR p15,0,R2,c12,c12,1 ; Write Rt to ICC_EOIR1

	;Read IMP_CBAR -> R2
	;R2: GICD base address
	MRC     p15, 1, R3, c15, c3, 0

	;Disabale source
	LDR     R0, =0x00000180+(($src)/32)*4
	ADD     R1, R3, R0
	LDR     R0, =0x1<<(($src)&0x1F)
	STR     R0, [R1]

	;Clear pending SPI
	;LDR     R0, =0x00000280+(($src)/32)*4
	;ADD     R1, R3, R0
	;LDR     R0, =0x1<<(($src)&0x1F)
	;STR     R0, [R1]

	;CHECK
	MRC p15,0,R2,c12,c12,0 ; Read ICC_IAR1 into Rt

	LDR     r3, =0x000003FF
	CMP     r3, r2
	BNE     $fail_addr

	MEND

    MACRO
	INT_WAIT_CR52 $int_source
    LCLS    src
src SETS    "$int_source"
    ;R2: GICD base address
3   MRC     p15, 1, R2, c15, c3, 0
    LDR     R0, =0x00000100+(($src)/32)*4
    ADD     R1, R2, R0
    LDR     R0, =0x1<<(($src)&0x1F)
    LDR     R3, [R1]
	AND	R3, R3, R0
	CMP	R0, R3
    BEQ	%3
	MEND


	end
	
