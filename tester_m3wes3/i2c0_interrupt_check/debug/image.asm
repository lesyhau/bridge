        ARM
        PRESERVE8

        AREA ER0, CODE, READONLY, ALIGN=2

vector_start                  ; Alternate entry point
        LDR      pc,|L1.32|
        LDR      pc,|L1.36|
        LDR      pc,|L1.40|
        LDR      pc,|L1.44|
        LDR      pc,|L1.48|
        NOP      
        LDR      pc,|L1.52|
|L1.28|
        B        |L1.28|
|L1.32|
        DCD      0x00000038
|L1.36|
        DCD      0x000004d8
|L1.40|
        DCD      0x000004e0
|L1.44|
        DCD      0x000004e8
|L1.48|
        DCD      0x000004f0
|L1.52|
        DCD      0x000004f8
Reset_Handler                  ; Alternate entry point
vector_end                  ; Alternate entry point
        LDR      r0,|L1.604|
        MCR      p15,#0x4,r0,c10,c2,#0
        LDR      r0,|L1.608|
        MCR      p15,#0x4,r0,c10,c2,#1
        MOV      r0,#0
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#2
        MCR      p15,#0x4,r0,c6,c3,#0
        LDR      r0,|L1.612|
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#1
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#0x8000002
        MCR      p15,#0x4,r0,c6,c3,#0
        LDR      r0,|L1.616|
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#2
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#0x10000002
        MCR      p15,#0x4,r0,c6,c3,#0
        LDR      r0,|L1.620|
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#3
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#0x20000002
        MCR      p15,#0x4,r0,c6,c3,#0
        MVN      r0,#0xc000003e
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#4
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#0x40000002
        MCR      p15,#0x4,r0,c6,c3,#0
        MVN      r0,#0x4000003e
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#5
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#0xc0000002
        MCR      p15,#0x4,r0,c6,c3,#0
        LDR      r0,|L1.624|
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#6
        MCR      p15,#0x4,r0,c6,c2,#1
        MOV      r0,#0xe0000002
        MCR      p15,#0x4,r0,c6,c3,#0
        LDR      r0,|L1.628|
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#7
        MCR      p15,#0x4,r0,c6,c2,#1
        LDR      r0,|L1.632|
        MCR      p15,#0x4,r0,c6,c3,#0
        LDR      r0,|L1.636|
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#8
        MCR      p15,#0x4,r0,c6,c2,#1
        LDR      r0,|L1.640|
        MCR      p15,#0x4,r0,c6,c3,#0
        LDR      r0,|L1.644|
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#9
        MCR      p15,#0x4,r0,c6,c2,#1
        LDR      r0,|L1.648|
        MCR      p15,#0x4,r0,c6,c3,#0
        LDR      r0,|L1.652|
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#0xa
        MCR      p15,#0x4,r0,c6,c2,#1
        LDR      r0,|L1.656|
        MCR      p15,#0x4,r0,c6,c3,#0
        LDR      r0,|L1.660|
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#0xb
        MCR      p15,#0x4,r0,c6,c2,#1
        LDR      r0,|L1.664|
        MCR      p15,#0x4,r0,c6,c3,#0
        LDR      r0,|L1.668|
        MCR      p15,#0x4,r0,c6,c3,#1
        MOV      r0,#0xc
        MCR      p15,#0x4,r0,c6,c2,#1
        LDR      r0,|L1.672|
        MCR      p15,#0x4,r0,c6,c3,#0
        MVN      r0,#0x38
        MCR      p15,#0x4,r0,c6,c3,#1
        MRC      p15,#0x4,r0,c1,c0,#0
        ORR      r0,r0,#1
        DSB      
        MCR      p15,#0x4,r0,c1,c0,#0
        ISB      
        LDR      r0,|L1.676|
        MOV      r1,#1
        STR      r1,[r0,#0]
        LDR      r0,|L1.680|
        MOV      r1,#0x1234
        STR      r1,[r0,#0]
        LDR      r0,|L1.684|
        MOV      r1,#0x1234
        STR      r1,[r0,#0]
        LDR      r0,|L1.688|
        MOV      r1,#0x1234
        STR      r1,[r0,#0]
        LDR      r0,|L1.692|
        MOV      r1,#0x1234
        STR      r1,[r0,#0]
        LDR      r0,|L1.696|
        MOV      r1,#1
        STR      r1,[r0,#0]
        LDR      r0,|L1.700|
        MOV      r1,#1
        STR      r1,[r0,#0]
        LDR      r0,|L1.704|
        LDR      r1,|L1.708|
        SUB      r1,r1,r0
        LDR      r2,|L1.712|
|L1.504|
        LDM      r0!,{r4-r7}
        STM      r2!,{r4-r7}
        SUBS     r1,r1,#0x10
        BHI      |L1.504|
        LDR      r0,|L1.716|
        LDR      r1,|L1.720|
        SUB      r1,r1,r0
        LDR      r2,|L1.712|
        ADD      r2,r2,r0
|L1.540|
        LDM      r0!,{r4-r7}
        STM      r2!,{r4-r7}
        SUBS     r1,r1,#0x10
        BHI      |L1.540|
        LDR      r0,|L1.724|
        LDR      r1,|L1.728|
        SUB      r1,r1,r0
        LDR      r2,|L1.712|
        ADD      r2,r2,r0
        MOV      r3,r2
|L1.580|
        LDM      r0!,{r4-r7}
        STM      r2!,{r4-r7}
        SUBS     r1,r1,#0x10
        BHI      |L1.580|
        MOV      pc,r3
main_start                  ; Alternate entry point
        B        |L1.732|
|L1.604|
        DCD      0x004404ff
|L1.608|
        DCD      0xddeebb00
|L1.612|
        DCD      0x07ffffc1
|L1.616|
        DCD      0x0fffffc1
|L1.620|
        DCD      0x1fffffc1
|L1.624|
        DCD      0xdfffffc1
|L1.628|
        DCD      0xe62fffc7
|L1.632|
        DCD      0xe6300002
|L1.636|
        DCD      0xe63fffc1
|L1.640|
        DCD      0xe6400002
|L1.644|
        DCD      0xeb0fffc7
|L1.648|
        DCD      0xeb100002
|L1.652|
        DCD      0xeb3fffc1
|L1.656|
        DCD      0xeb400002
|L1.660|
        DCD      0xecffffc7
|L1.664|
        DCD      0xed000002
|L1.668|
        DCD      0xedffffc1
|L1.672|
        DCD      0xee000002
|L1.676|
        DCD      0xe67f0024
|L1.680|
        DCD      0xe6790100
|L1.684|
        DCD      0xe6790108
|L1.688|
        DCD      0xe6798100
|L1.692|
        DCD      0xe6798108
|L1.696|
        DCD      0xe6797400
|L1.700|
        DCD      0xe679f400
|L1.704|
        DCD      0x00000000
|L1.708|
        DCD      0x00000038
|L1.712|
        DCD      0xe6300000
|L1.716|
        DCD      0x000004d8
|L1.720|
        DCD      0x00000520
|L1.724|
        DCD      0x00000258
|L1.728|
        DCD      0x000004d8
|L1.732|
        MOV      r0,#0x334
        MOVT     r0,#0xe617
        MOV      r1,#0
        MOVT     r1,#0xe630
        STR      r1,[r0,#0]
        ORR      r1,r1,#0x10
        STR      r1,[r0,#0]
        CPSIE    i
        MRC      p15,#0x1,r2,c15,c3,#0
        ADD      r1,r2,#0x100000
|L1.772|
        MOV      r0,#0
        STR      r0,[r1,#0x14]
        LDR      r0,[r1,#0x14]
        MVN      r3,#0
        ANDS     r0,r0,r3
        BNE      |L1.772|
        MOV      r0,#0xfc
        MCR      p15,#0x0,r0,c4,c6,#0
        MOV      r0,#0x50c
        ADD      r1,r2,r0
        MOV      r0,#0
        STR      r0,[r1,#0]
        MOV      r0,#0xa0
        ADD      r1,r2,r0
        MOV      r0,#0x4000
        STR      r0,[r1,#0]
        MOV      r0,#0x120
        ADD      r1,r2,r0
        MOV      r0,#0x4000
        STR      r0,[r1,#0]
        MOV      r0,#0xc40
        ADD      r1,r2,r0
        MOV      r0,#0x20000000
        STR      r0,[r1,#0]
        LDR      r0,[r1,#0]
        MOV      r0,#0
        ADD      r1,r2,r0
        MOV      r0,#3
        STR      r0,[r1,#0]
        MRC      p15,#0x0,r0,c12,c12,#7
        MOV      r1,#3
        ORR      r0,r0,r1
        MCR      p15,#0x0,r0,c12,c12,#7
        MOV      r7,#0x4000000
        MOV      r1,#0xfffc
        MVN      r2,r1
        LDR      r0,|L1.1180|
        STR      r2,[r0,#0]
        LDR      r0,|L1.1184|
        STR      r1,[r0,#0]
        LDR      r10,|L1.1188|
        LDR      r0,|L1.1192|
        MOV      r1,#0x1e
        STR      r1,[r0,#0]
        LDR      r0,|L1.1196|
        MOV      r1,#0x12
        STR      r1,[r0,#0]
        LDR      r0,|L1.1200|
        MOV      r1,#0
        STR      r1,[r0,#0]
        LDR      r0,|L1.1192|
        MOV      r1,#0x1e
        STR      r1,[r0,#0]
        LDR      r0,|L1.1204|
        MOV      r1,#0x40
        STR      r1,[r0,#0]
        LDR      r0,|L1.1208|
        MOV      r1,#1
        STR      r1,[r0,#0]
        LDR      r0,|L1.1212|
        MOV      r1,#6
        STR      r1,[r0,#0]
        LDR      r0,|L1.1216|
        MOV      r1,#0
        STR      r1,[r0,#0]
        LDR      r0,|L1.1220|
        MOV      r1,#0x1e
        STR      r1,[r0,#0]
        LDR      r0,|L1.1224|
        MOV      r1,#0x89
        STR      r1,[r0,#0]
        MOV      r8,#0
        MOV      r9,#1
|L1.1064|
        CMP      r8,r9
        BNE      |L1.1064|
        LDR      r10,|L1.1228|
        MOV      r1,#0xfffc
        MVN      r1,r1
        MVN      r2,r1
        LDR      r0,|L1.1180|
        STR      r2,[r0,#0]
        LDR      r0,|L1.1184|
        STR      r1,[r0,#0]
        MOV      r0,#0xa
        MOV      r1,#0
|L1.1112|
        ADD      r1,r1,#1
        CMP      r1,r0
        BNE      |L1.1112|
        STR      r4,[r7,#0]
        ADD      r7,r7,#4
        LDR      r4,|L1.1232|
        STR      r4,[r7,#0]
        ADD      r7,r7,#4
        MOV      r0,#0xa
        MOV      r1,#0
|L1.1152|
        ADD      r1,r1,#1
        CMP      r1,r0
        BNE      |L1.1152|
        LDR      r0,|L1.1236|
        STR      r0,[r0,#0]
|L1.1172|
        B        |L1.1172|
        B        UndefinedInstruction_Handler
|L1.1180|
        DCD      0xe6050800
|L1.1184|
        DCD      0xe6050900
|L1.1188|
        DCD      0xa55a0101
|L1.1192|
        DCD      0xe6500018
|L1.1196|
        DCD      0xe6500020
|L1.1200|
        DCD      0xe650000c
|L1.1204|
        DCD      0xe6500014
|L1.1208|
        DCD      0xe650801c
|L1.1212|
        DCD      0xe6508000
|L1.1216|
        DCD      0xe6508008
|L1.1220|
        DCD      0xe6508018
|L1.1224|
        DCD      0xe6500004
|L1.1228|
        DCD      0xa55a0000
|L1.1232|
        DCD      0x12345678
|L1.1236|
        DCD      0x070003f0
UndefinedInstruction_Handler                  ; Alternate entry point
exc_start                  ; Alternate entry point
main_end                  ; Alternate entry point
        B        UndefinedInstruction_Handler
        ERET     
SupervisorCall_Handler                  ; Alternate entry point
        B        SupervisorCall_Handler
        ERET     
PrefetchAbort_Handler                  ; Alternate entry point
        B        PrefetchAbort_Handler
        ERET     
DataAbort_Handler                  ; Alternate entry point
        B        DataAbort_Handler
        ERET     
IRQ_Handler                  ; Alternate entry point
        MRC      p15,#0x0,r0,c12,c12,#0
        MOVW     r1,#0x10e
        CMP      r1,r0
        BNE      |L1.1292|
        MOV      r4,r0
|L1.1292|
        MCR      p15,#0x0,r0,c12,c12,#1
        MOV      r8,#1
        ERET     
        B        |L1.1308|
|L1.1308|
        NOP      
exc_end

        AREA ARM_LIB_STACK, DATA, NOINIT, ALIGN=0

        %        1024

        KEEP vector_start
        KEEP Reset_Handler
        KEEP vector_end
        KEEP main_start
        KEEP UndefinedInstruction_Handler
        KEEP exc_start
        KEEP main_end
        KEEP SupervisorCall_Handler
        KEEP PrefetchAbort_Handler
        KEEP DataAbort_Handler
        KEEP IRQ_Handler
        KEEP exc_end

        ATTR FILESCOPE
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
