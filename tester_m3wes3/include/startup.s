;
; --------------------------------------------------------------------------------
; Start up code for ARM CPU cores
; FED1/PER/TIMER/HauLe2
; hau.le.eb@rvc.renesas.com
;--------------------------------------------------------------------------------
;
RAM0_LOWER	EQU	0x00000000
RAM0_UPPER	EQU	0x03FFFFFF
RAM1_LOWER	EQU	0x04000000
RAM1_UPPER	EQU	0x07FFFFFF

FIQ_STACK_SIZE	EQU	0xFF
IRQ_STACK_SIZE	EQU	0xFF
ABT_STACK_SIZE	EQU	0xFF
UND_STACK_SIZE	EQU	0xFF
SYS_STACK_SIZE	EQU	0xFF
SVC_STACK_SIZE	EQU	0xFF

CPSR_USR_MODE	EQU	0x10
CPSR_FIQ_MODE	EQU	0x11
CPSR_IRQ_MODE	EQU	0x12
CPSR_SVC_MODE	EQU	0x13
CPSR_MON_MODE	EQU	0x16
CPSR_ABT_MODE	EQU	0x17
CPSR_HYP_MODE	EQU	0x1A
CPSR_UND_MODE	EQU	0x1B
CPSR_SYS_MODE	EQU	0x1F

	;---------------------------------------------------------------------------
	; Start up code
	;---------------------------------------------------------------------------
	
	AREA	START_UP, CODE, READONLY
	ENTRY

Vector_Table
	LDR	PC, RST_ADDR
	LDR	PC, UND_ADDR
	LDR	PC, SVC_ADDR
	LDR	PC, PABT_ADDR
	LDR	PC, DABT_ADDR
	NOP
	LDR	PC, IRQ_ADDR
FIQ_Handler
	; FIQ handler code (max size: 4kB)

RST_ADDR	DCD	Reset_Handler
UND_ADDR	DCD	Undef_Handler
SVC_ADDR	DCD	SVC_Handler
PABT_ADDR	DCD	P_Abort_Handler
DABT_ADDR	DCD	D_Abort_Handler
IRQ_ADDR	DCD	IRQ_Handler
	
;-------------------------------------------------------------------------------
; Reset handler
;-------------------------------------------------------------------------------
Reset_Handler
	
	; Initialize unbanked registers
	LDR	R0, = 0
	LDR	R1, = 0
	LDR	R2, = 0
	LDR	R3, = 0
	LDR	R4, = 0
	LDR	R5, = 0
	LDR	R6, = 0
	LDR	R7, = 0
	
	; Initialize banked registers
	LDR	R8, = 0
	LDR	R9, = 0
	LDR	R10, = 0
	LDR	R11, = 0
	LDR	R12, = 0
	
	;; Enter FIQ mode
	;; Initialize banked registers in FIQ mode
	;; Initialize stack pointer in FIQ mode
	;MSR	CPSR_cxsf, #CPSR_FIQ_MODE
	;LDR	R8, = 0
	;LDR	R9, = 0
	;LDR	R10, = 0
	;LDR	R11, = 0
	;LDR	R12, = 0
	;LDR	SP, = RAM1_UPPER - FIQ_STACK_SIZE
	;
	;; Enter IRQ mode, disable IRQ interrupt
	;; Initialize stack pointer in IRQ mode
	;MSR	CPSR_cxsf, #CPSR_IRQ_MODE
	;LDR	SP, = RAM1_UPPER - FIQ_STACK_SIZE - IRQ_STACK_SIZE
	;
	;; Enter ABT mode
	;; Initialize stack pointer in ABT mode
	;MSR	CPSR_cxsf, #CPSR_ABT_MODE
	;LDR	SP, = RAM1_UPPER - FIQ_STACK_SIZE - IRQ_STACK_SIZE - ABT_STACK_SIZE
	;
	;; Enter UND mode
	;; Initialize stack pointer in UND mode
	;MSR	CPSR_cxsf, #CPSR_UND_MODE
	;LDR	SP, = RAM1_UPPER - FIQ_STACK_SIZE - IRQ_STACK_SIZE - ABT_STACK_SIZE - UND_STACK_SIZE
	;
	;; Enter SVC mode
	;; Initialize stack pointer in SVC mode
	;MSR	CPSR_cxsf, #CPSR_SVC_MODE
	;LDR	SP, = RAM1_UPPER - FIQ_STACK_SIZE - IRQ_STACK_SIZE - ABT_STACK_SIZE - UND_STACK_SIZE - SVC_STACK_SIZE
	
    ; Initialize MPU
    ;INCLUDE mpu_init.s

    ; Initialize LBSC
    ;INCLUDE lbsc_init.s

	; Jump to main function
	B	Main
	
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	
;-------------------------------------------------------------------------------
; Undefined instruction handler
;-------------------------------------------------------------------------------
Undef_Handler
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	BX	LR
	NOP
	
;-------------------------------------------------------------------------------
; Super visor call handler
;-------------------------------------------------------------------------------
SVC_Handler
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	BX	LR
	NOP
	
;-------------------------------------------------------------------------------
; Prefetch abort handler
;-------------------------------------------------------------------------------
P_Abort_Handler
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	BX	LR
	NOP
	
;-------------------------------------------------------------------------------
; Data abort handler
;-------------------------------------------------------------------------------
D_Abort_Handler
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	BX	LR
	NOP
	
;-------------------------------------------------------------------------------
; Interrupt request handler
;-------------------------------------------------------------------------------
IRQ_Handler

	; Jump to 0x00005000
	LDR	R0, = 0x00005000
	MOV	PC, R0
	
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	BX	LR
	NOP
	
;-------------------------------------------------------------------------------
; Main function
;-------------------------------------------------------------------------------
Main
	
;    ; Copy MAIN by using DMAC
;    INCLUDE dmac.s
;    
;    ; Source address
;    LDR R0, = DMASAR_16
;    LDR R1, = 0x00040000
;    STR R1, [R0]
;    
;    ; Destination address
;    LDR R0, = DMADAR_16
;    LDR R1, = 0xE6340000
;    STR R1, [R0]
;    
;    ; Transfer count
;    LDR R0, = DMATCR_16
;    LDR R1, = 0x03EC
;    STR R1, [R0]
;    
;    ; Channel control (transfer size = 0001 = 2 bytes, source/destination address is increasement, enable DE)
;    LDR R0, = DMACHCR_16
;    LDR R1, = 0x00005409
;    STR R1, [R0]
;    
;    ; Start to transfer data
;    LDR R0, = DMAOR_1
;    LDR R1, = 0x0001
;    STR R1, [R0]
;
;    ; Wait until the transfer finish
;    LDR R0, = DMACHCR_16
;    LDR R2, = 0x00000002
;WAIT_TE
;    LDR R1, [R0]
;    AND R1, R1, R2
;    CMP R1, R2
;    BNE WAIT_TE
;
;    NOP
;    NOP
;    NOP
;    NOP
;    NOP
;    NOP
;    NOP
;    NOP
;    NOP
;    NOP
;
;	; Jump to 0xE6340000
;	LDR	R0, = 0xE6340000
;	MOV	PC, R0
	
	; Jump to 0x00040000
	LDR	R0, = 0x00040000
	MOV	PC, R0
	
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	BX	LR
	NOP
	
	END
	
