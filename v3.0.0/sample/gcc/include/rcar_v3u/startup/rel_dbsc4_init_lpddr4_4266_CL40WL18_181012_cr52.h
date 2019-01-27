
   // MSTP settings for DBQ and DBL
   //   Control register MSTPCR4 (0xE6152D10), bit 3,4
   //   Status  register MSTPSR4 (0xE6152E10), bit 3,4
   //MSTPCR4   EQU  0xE6152D10
   //MSTPSR4   EQU  0xE6152E10
   //CPG_LOCK  EQU  0xE6150000

   LDR   R0, =0xE6152E10  // MSTPSR4
   LDR   R1, [R0]
   AND   R1, #0xFFFFFFE7  // bit 3,4 are 0
   MVN   R2, R1
   LDR   R0, =0xE6150000
   STR   R2, [R0]
   LDR   R0, =0xE6152D10  // MSTPCR4
   STR   R1, [R0]

   LDR   R0, =0xE6152E10  // MSTPSR4
   LDR   R1, [R0]

   LDR   R0, =0x10
wait_mstp_setting_end:
   SUB   R0, R0, #0x1
   CMP   R0, #0x0
   BNE   wait_mstp_setting_end


   //// Original is /design01/rcarh3fed_master/common/utility/SIM_TOOLS/DDR_init/ARM/DDR4/rel_dbsc4_init_lpddr4_3200_CL32WL14_160526_es2_arm.h //
   //// copy on Fri Jun  3 14:15:41 JST 2016
   //// run at  /design03/rcarh3fed_user6/work/mochizhi/1chipSim/TP_ES2/H3ES2_arm_ddr_ca53_3200_command_combination_inttest
   //// run by  mochizhi
   //// Script is /svhome/mochizhi/mytools/filecopy 
   //// History
   //// Rev001   2017/09/25   HIENG/Y.Tamura    Copy form Ver20161207 "rel_dbsc4_init_lpddr4_3200_CL32WL14_161207_arm.h"
   ////                                         modefy for R-CarM3N CT-Sim and Tester-Sim.
   ////                                         New file name "rel_dbsc4_init_lpddr4_3200_CL32WL14_170925_arm.h"

   //-------------------------------------------
   .macro MYWRITE addr, data
   ldr	r0, = \data
   ldr	r1, = \addr
   str	r0, [r1] // 

   .endm
   //-------------------------------------------
   //-------------------------------------------
   .macro PHYWRITE addr, data
   ldr	r0, = \addr
   ldr	r1, =0xe6790624
   str	r0, [r1,#0x00] // 
   str	r0, [r1,#0x40] // 
   str	r0, [r1,#0x80] // 
   str	r0, [r1,#0xc0] // 
   ldr	r0, = \data
   ldr	r1, =0xe6790628
   str	r0, [r1,#0x00] // 
   str	r0, [r1,#0x40] // 
   str	r0, [r1,#0x80] // 
   str	r0, [r1,#0xc0] // 
   .endm
   //-------------------------------------------

   B END_INIT_SUBROUTINE
   NOP
   //--------------------------------------------------------------------------------------------
   // Write DDR_PHY Register Subroutine
   //   R0[IN]  : Register Data
   //   R1[IN]  : Register Address
   //   R2[IN]  : Access Address for Register Address
   //   R3[IN]  : Access Address for Register Data
   //   R4[--]  : Work Use
   //--------------------------------------------------------------------------------------------
SUB_WRITE_PHY_REG:
   LDR  R4, = 0x00003FFF   // Clear py_t_state/read access of Register Address
   AND  R1, R1, R4
   STR  R1, [R2]                   // Write Register Address
   STR  R0, [R3]                   // Write Register Data
LOOP_PHY_ACCESS:
   LDR  R0, [R2]                   // Read Register Address
   LDR  R4, = 0x00008000   // Check py_t_state of Register Address
   AND  R0, R0, R4
   CMPS R0, R4
   BNE  LOOP_PHY_ACCESS  // Loop Until Write access OK
   ORR  R1, R1, R4                 // Set py_t_state_clear of Register Address
   STR  R1, [R2]                   // Write Register Address
   BX   LR                                 // Return
   // END SUB_WRITE_PHY_REG
   //--------------------------------------------------------------------------------------------
END_INIT_SUBROUTINE:

   //-------------------------------------------
   .macro MACRO_WRITE_PHY_REG add,dat
   ldr    r2,=0xE6790624 //;DBPDRGA0
   ldr    r3,=0xE6790628 //;DBPDRGD0
   ldr    r1,= \add
   ldr    r0,= \dat
   BL  SUB_WRITE_PHY_REG
   nop
   .endm
   //-------------------------------------------

   //;=======================================================================
   //; For DBS0
   //;=======================================================================
   //; ADD H3ES2
   MYWRITE   0xE6790100,0x00001234//DBSYSCNT0 REGROCK enable
   MYWRITE   0xE6790108,0x00001234//DBSYSCNT0A REGROCKA enable
   //;; WAIT
   MYWRITE   0xE6790020,0x0000000a//dbkind	ddcg=a(lpddr4)
   MYWRITE   0xE6790024,0x0000000a//dbkinda	ddcga=a(lpddr4)
   //;   MYWRITE   0xE6790030,0x0e030a02;memconf00(ch0/rank0), 4Gbit
   MYWRITE   0xE6790030,0x0e030a01//memconf00(ch0/rank0), 2Gbit
   MYWRITE   0xE6790070,0x0e030a01//memconf00a(ch0/rank0), 2Gbit (clk_axim)
   MYWRITE   0xE6790034,0x0e030a01//memconf01(ch0/rank1), 2Gbit
   MYWRITE   0xE6790074,0x0e030a01//memconf01a(ch0/rank1), 2Gbit (clk_axim)
   MYWRITE   0xE6790040,0x0e030a01//memconf10(ch1/rank0), 2Gbit
   MYWRITE   0xE6790080,0x0e030a01//memconf10a(ch1/rank0), 2Gbit (clk_axim)
   MYWRITE   0xE6790044,0x0e030a01//memconf11(ch1/rank1), 2Gbit
   MYWRITE   0xE6790084,0x0e030a01//memconf11a(ch1/rank1), 2Gbit (clk_axim)
   MYWRITE   0xE6790050,0x0e030a01//memconf00(ch2/rank0), 2Gbit
   MYWRITE   0xE6790090,0x0e030a01//memconf00a(ch2/rank0), 2Gbit (clk_axim)
   MYWRITE   0xE6790054,0x0e030a01//memconf01(ch2/rank1), 2Gbit
   MYWRITE   0xE6790094,0x0e030a01//memconf01a(ch2/rank1), 2Gbit (clk_axim)
   MYWRITE   0xE6790060,0x0e030a01//memconf10(ch3/rank0), 2Gbit
   MYWRITE   0xE67900a0,0x0e030a01//memconf10a(ch3/rank0), 2Gbit (clk_axim)
   MYWRITE   0xE6790064,0x0e030a01//memconf11(ch3/rank1), 2Gbit
   MYWRITE   0xE67900a4,0x0e030a01//memconf11a(ch3/rank1), 2Gbit (clk_axim)
   //;   MYWRITE   0xE6790050,0x0e030a02;memconf20(ch2/rank0), 4Gbit
   //;   MYWRITE   0xE6790054,0x0e030a02;memconf21(ch2/rank1), 4Gbit
   //;   MYWRITE   0xE6790060,0x0e030a02;memconf30(ch3/rank0), 4Gbit
   //;   MYWRITE   0xE6790064,0x0e030a02;memconf31(ch3/rank1), 4Gbit
   MYWRITE   0xE6790104,0x00000000//dbsyscnt1       
   MYWRITE   0xE6790010,0x00000001//DBPHYCONF0 01:DFI
   //;        .pool
   MYWRITE   0xE6790300,0x00000028//dbtr0	cl=40
   MYWRITE   0xE6790304,0x00000012//dbtr1	cwl=14
   //;   MYWRITE   0xE6790308,0x00000000;dbtr2	al=0
   MYWRITE   0xE679030C,0x00000027//dbtr3	trcd=39
   MYWRITE   0xE6790310,0x002D0027//dbtr4	trpa=45	trp=39
   MYWRITE   0xE6790314,0x00000087//dbtr5	trc=135
   MYWRITE   0xE6790318,0x0000005A//dbtr6	tras=90
   MYWRITE   0xE679031C,0x00100010//dbtr7 	trrd_s=16 trrd=16
   MYWRITE   0xE6790320,0x00000040//dbtr8 	tfaw=64
   MYWRITE   0xE6790324,0x00000010//dbtr9	trdpr=16
   MYWRITE   0xE6790328,0x00000029//dbtr10	twr=41
   MYWRITE   0xE679032C,0x00000029//dbtr11 	trdwr>=41 ;; PHY may have restriction of this value.
   MYWRITE   0xE6790330,0x00310031//dbtr12	twrrd_s>=49 twrrd>=49 ;; PHY may restriction of this value.
   MYWRITE   0xE6790334,0x00000116//dbtr13	trfcpb=0(W/A) trfc=278(2Gbit/ch)
   MYWRITE   0xE6790338,0x00130013//dbtr14	tckehdll=19 tckeh=19
   MYWRITE   0xE679033C,0x00200010//dbtr15	tckesr=32 tckel=16
   MYWRITE   0xE6790340,0x0d400a0e//dbtr16	latency?  CWL=13 CL=32 New dbsc ;; Please refer PHY manual. 0427
   MYWRITE   0xE6790344,0x081E0000//dbtr17	tmodrd=8  tmod=30
   MYWRITE   0xE6790350,0x01290129//dbtr20	txsdll=txs=297 txs=trfcab+7.5ns+3nCK(W/A)=297
   MYWRITE   0xE6790354,0x00080008//dbtr21	tccd_s=8 tccd=8
   MYWRITE   0xE6790358,0x08550040//dbtr22	tzqcal=2133 tzqlat=48
   MYWRITE   0xE679035C,0x00000003//dbtr23
   MYWRITE   0xE6790400,0x00000002//dbbl		dbbl=2(BL16)(LPDDR4)
   MYWRITE   0xE6790404,0x00000002//dbbla	dbbla=2(BL16)(LPDDR4)
   //;   MYWRITE   0xE6790430,0x00000000;dbrnk0	No odt for DQ exists in LPDDR4(N.Honda).
   //;   MYWRITE   0xE6790434,0x00000000;dbrnk1	Don't need to set it cause we use all-rank refresh.
   MYWRITE   0xE6790438,0x00004444//dbrnk2	rkrr = 4 (Are there any info ?)
   MYWRITE   0xE679043C,0x00004444//dbrnk3	rkrw = 4 (Are there any info ?)
   MYWRITE   0xE6790440,0x00004444//dbrnk4	rkwr = 4 (Are there any info ?)
   MYWRITE   0xE6790444,0x00004444//dbrnk5	rkww = 4 (Are there any info ?)
   //;   MYWRITE   0xE6790448,0x00000000;dbrnk6	use all-rank/all-bank refresh
   //;   MYWRITE   0xE6790500,0x00000000;dbadj0	currently, no optional setting exists.
   //;   MYWRITE   0xE6790508,0x00000000;dbadj2	currently, no optional setting exists.
   //;   MYWRITE   0xE6790900,0x00000000;dbcam0cnf0	inoen=0, actually it is not used.
   MYWRITE   0xE6790904,0x00104214//dbcam0cnf1	wbkwait=8, wbkmdhi=32, wbkmdlo=16
   MYWRITE   0xE6790908,0x000001c4//dbcam0cnf2	scexp=8192
   MYWRITE   0xE679090C,0x00000003//dbcam0cnf3       

   MYWRITE   0xE6791000,0x000f0037//dbschcnt0
   MYWRITE   0xE6791004,0x00001010//dbschcnt1
   MYWRITE   0xE6791010,0x00000001//dbschsz0
   MYWRITE   0xE6791020,0xf7311111//dbschrw0
   MYWRITE   0xE6791024,0x00001834//dbschrw1
   MYWRITE   0xE6791030,0xffffffff//dbschqos00 QoS = 00_00 doesn't come from AXI
   MYWRITE   0xE6791034,0x00000480//dbschqos01
   MYWRITE   0xE6791038,0x00000300//dbschqos02
   MYWRITE   0xE679103C,0x00000180//dbschqos03
   //;   MYWRITE   0xE6791030,0x00000600;dbschqos00	QoS = 00_00 doesn't come from AXI
   //;   MYWRITE   0xE6791034,0x00000480;dbschqos01
   //;   MYWRITE   0xE6791038,0x00000300;dbschqos02
   //;   MYWRITE   0xE679103C,0x00000180;dbschqos03
   //;   MYWRITE   0xE6791040,0x00000600;dbschqos10	QoS = 00_01 doesn't come from AXI
   //;   MYWRITE   0xE6791044,0x00000480;dbschqos11
   //;   MYWRITE   0xE6791048,0x00000300;dbschqos12
   //;   MYWRITE   0xE679104C,0x00000180;dbschqos13
   //;   MYWRITE   0xE6791050,0x00000600;dbschqos20	QoS = 00_10 doesn't come from AXI
   //;   MYWRITE   0xE6791054,0x00000480;dbschqos21
   //;   MYWRITE   0xE6791058,0x00000300;dbschqos22
   //;   MYWRITE   0xE679105C,0x00000180;dbschqos23
   //;   MYWRITE   0xE6791060,0x00000600;dbschqos30	QoS = 00_11 doesn't come from AXI
   //;   MYWRITE   0xE6791064,0x00000480;dbschqos31
   //;   MYWRITE   0xE6791068,0x00000300;dbschqos32
   //;   MYWRITE   0xE679106C,0x00000180;dbschqos33
   MYWRITE   0xE6791070,0x00000600//dbschqos40
   MYWRITE   0xE6791074,0x00000480//dbschqos41
   MYWRITE   0xE6791078,0x00000300//dbschqos42
   MYWRITE   0xE679107C,0x00000180//dbschqos43
   //;   MYWRITE   0xE6791080,0x00000400;dbschqos50	QoS = 01_01 doesn't come from AXI
   //;   MYWRITE   0xE6791084,0x00000300;dbschqos51
   //;   MYWRITE   0xE6791088,0x00000200;dbschqos52
   //;   MYWRITE   0xE679108C,0x00000100;dbschqos53
   //;   MYWRITE   0xE6791090,0x00000400;dbschqos60	QoS = 01_10 doesn't come from AXI
   //;   MYWRITE   0xE6791094,0x00000300;dbschqos61
   //;   MYWRITE   0xE6791098,0x00000200;dbschqos62
   //;   MYWRITE   0xE679109C,0x00000100;dbschqos63
   //;   MYWRITE   0xE67910A0,0x00000400;dbschqos70	QoS = 01_11 doesn't come from AXI
   //;   MYWRITE   0xE67910A4,0x00000300;dbschqos71
   //;   MYWRITE   0xE67910A8,0x00000200;dbschqos72
   //;   MYWRITE   0xE67910AC,0x00000100;dbschqos73
   //;   MYWRITE   0xE67910B0,0x00000400;dbschqos80	QoS = 10_00 doesn't come from AXI
   //;   MYWRITE   0xE67910B4,0x00000300;dbschqos81
   //;   MYWRITE   0xE67910B8,0x00000200;dbschqos82
   //;   MYWRITE   0xE67910BC,0x00000100;dbschqos83
   MYWRITE   0xE67910C0,0x00000400//dbschqos90
   MYWRITE   0xE67910C4,0x00000300//dbschqos91
   MYWRITE   0xE67910C8,0x00000200//dbschqos92
   MYWRITE   0xE67910CC,0x00000100//dbschqos93
   //;   MYWRITE   0xE67910D0,0x00000300;dbschqos100	QoS = 10_10 doesn't come from AXI
   //;   MYWRITE   0xE67910D4,0x00000240;dbschqos101
   //;   MYWRITE   0xE67910D8,0x00000180;dbschqos102
   //;   MYWRITE   0xE67910DC,0x000000c0;dbschqos103
   //;   MYWRITE   0xE67910E0,0x00000300;dbschqos110	QoS = 10_11 doesn't come from AXI
   //;   MYWRITE   0xE67910E4,0x00000240;dbschqos111
   //;   MYWRITE   0xE67910E8,0x00000180;dbschqos112
   //;   MYWRITE   0xE67910EC,0x000000c0;dbschqos113
   //;   MYWRITE   0xE67910F0,0x00000300;dbschqos120	QoS = 11_00 doesn't come from AXI
   //;   MYWRITE   0xE67910F4,0x00000240;dbschqos121
   //;   MYWRITE   0xE67910F8,0x00000180;dbschqos122
   //;   MYWRITE   0xE67910FC,0x000000c0;dbschqos123
   MYWRITE   0xE6791100,0x00000300//dbschqos130
   MYWRITE   0xE6791104,0x00000240//dbschqos131
   MYWRITE   0xE6791108,0x00000180//dbschqos132
   MYWRITE   0xE679110C,0x000000c0//dbschqos133
   MYWRITE   0xE6791110,0x00000200//dbschqos140
   MYWRITE   0xE6791114,0x00000180//dbschqos141
   MYWRITE   0xE6791118,0x00000100//dbschqos142
   MYWRITE   0xE679111C,0x00000080//dbschqos143
   MYWRITE   0xE6791120,0x00000100//dbschqos150
   MYWRITE   0xE6791124,0x000000c0//dbschqos151
   MYWRITE   0xE6791128,0x00000080//dbschqos152
   MYWRITE   0xE679112C,0x00000040//dbschqos153

   MYWRITE   0xE6791700,0x220E110A//dbschfctst0 scactact=34, scrdact=14, scwract=17, scpreact=10
   MYWRITE   0xE6791708,0x0B0D0A0C//dbschfctst1 scrdwr=11, scwrrd=13, scactrdwr=10, scasyncofs=12
   MYWRITE   0xE679170C,0x111f1fff//dbschfctst2 wrperi3=1, wrperi2=1, wrperi1=1, wrperi0=15, rdperi3=1, rdperi2=15, rdperi1=15, rdperi0=15

   MYWRITE   0xE6790000,0x00000001//dbsysconf0	rg_pch=2, rg_mch=2.
   MYWRITE   0xE6790004,0x00000002//dbsysconf1	freqratio=2.
   MYWRITE   0xE6790008,0x00000002//dbsysconf1a	freqratioa=2.
   MYWRITE   0xE679000c,0x00000001//dbsysconf2	schmd=1 (2ch mode).
   MYWRITE   0xE6790014,0x00000041//dbsysconf2a	chpos=8(256Byte channel interleave), schmda=1 (2ch mode).

   //;        .pool
   //;   MYWRITE   0xE6790604,0x00000010;dbdficnt0
   //;   MYWRITE   0xE6790644,0x00000010;dbdficnt1
   //;   MYWRITE   0xE6790684,0x00000010;dbdficnt2
   //;   MYWRITE   0xE67906C4,0x00000010;dbdficnt3
   //; wait init_complete
   //;   MYWRITE   0xE6790904,0x00044020;
   //;   MYWRITE   0xE6790908,0x00000008;

   //; FOR 1212B
   //;   MYWRITE   0xE6790904,0x0004140c;
   //;   MYWRITE   0xE6790908,0x00000008;
   //;   MYWRITE   0xE6791010,0x00000003;
   //;   MYWRITE   0xE6791024,0x001a0080;

   //; FOR 1213A
   //   MYWRITE   0xE6790904,0x00040C04;
   //   MYWRITE   0xE6790908,0x00000108;
   //   MYWRITE   0xE6791010,0x00000003;
   //   MYWRITE   0xE6791024,0x001a0080;

   //; Add 2015/07/29 M.Sano
   //; Remove comment by mochi for H3 ;; Comment Out 2015/07/29 M.Sano
   MYWRITE   0xE6790604,0x00000011//dbdficnt0 freq_ratio = 01 (2:1)init_start =1 
   MYWRITE   0xE6790644,0x00000011//dbdficnt1 freq_ratio = 01 (2:1)init_start =1 
   MYWRITE   0xE6790684,0x00000011//dbdficnt2 freq_ratio = 01 (2:1)init_start =1 
   MYWRITE   0xE67906C4,0x00000011//dbdficnt3 freq_ratio = 01 (2:1)init_start =1 

   MYWRITE   0xE679061C,0x0000CF01//dll_rst_n0 -> 1
   MYWRITE   0xE679065C,0x0000CF01//dll_rst_n0 -> 1
   MYWRITE   0xE679069C,0x0000CF01//dll_rst_n0 -> 1
   MYWRITE   0xE67906DC,0x0000CF01//dll_rst_n0 -> 1


   ldr   r6, =0x00000001

wait_init_complete:
   ldr   r0, =0xE6790600
   ldr   r7, [r0,#0x0]
   and   r7, r6, r7
   cmp   r6, r7
   bne   wait_init_complete

   ldr   r0, =0xE6790640
   ldr   r7, [r0,#0x0]
   and   r7, r6, r7
   cmp   r6, r7
   bne   wait_init_complete

   //; Remove comment by mochi for H3 ;; Comment Out 2015/07/29 M.Sano
   ldr   r0, =0xE6790680
   ldr   r7, [r0,#0x0]
   and   r7, r6, r7
   cmp   r6, r7
   bne   wait_init_complete

   ldr   r0, =0xE67906C0
   ldr   r7, [r0,#0x0]
   and   r7, r6, r7
   cmp   r6, r7
   bne   wait_init_complete

   ldr r0, =0xE6790000

   //;MRR,MRW
   MYWRITE   0xE6790208,0x08840000//	PDE ch0 rk0
   MYWRITE   0xE6790208,0x08840001//	PDX ch0 rk0
   MYWRITE   0xE6790208,0x01840001//	RSX ch0 rk0
   MYWRITE   0xE6790208,0x0e840aff//	MRW ch0 rk0 0a:ff ZQCinit
   //; test 0427    MYWRITE   0xE6790208,0x0e8401d4;	MRW ch0 rk0 01:43 DeviceFeature1(010, 011(nWR=30,BL8))
   MYWRITE   0xE6790208,0x0e840154//	MRW ch0 rk0 01:43 DeviceFeature1(010, 011(nWR=30,BL8))
   MYWRITE   0xE6790208,0x0e84022e//	MRW ch0 rk0 02:24 DeviceFeature2(0,0,1,1010(WLSetA,RL32,WL14))

   MYWRITE   0xE6790208,0x0d84004F//     MPC chA rkA 4F (ZQCAL start)
   MYWRITE   0xE6790208,0x0d840051//     MPC chA rkA 51 (ZQCAL latch)

   //
   MYWRITE   0xE6790804,0x70000100//dbbus0cnf1
   MYWRITE   0xE6790800,0x18010001//dbbus0cnf
   //;   MYWRITE   0xE6790410,0x000000000;dbrfcnf0	refthf=0 This parameter is obsolete, no real effect.
   MYWRITE   0xE6790414,0x00081860//dbrfcnf1	refpmax=8 refint=6240
   MYWRITE   0xE6790418,0x00010000//dbrfcnf2	refpmin=1 refints=0
   MYWRITE   0xE6790204,0x00000001//dbrfen
   //; PHY reg patch 
   //   MYWRITE   0xE6790620,0x0000A55A;	Unlock 
   //      MYWRITE   0xE6790624,0x0000042A;	
   //      MYWRITE   0xE6790628,0x01000005;   Original = 0x00000005;	add write_path_lat_0 0 -> 1
   //      MYWRITE   0xE6790624,0x00000408;	
   //      MYWRITE   0xE6790628,0x31516100;   Original = 0x31514100;	adjust PHY_DQ_OE TIMING start =1/2 tck , end 2tck -> end 3tck 
   //      MYWRITE   0xE6790624,0x00000488;	
   //      MYWRITE   0xE6790628,0x31516100;   Original = 0x31514100;	adjust PHY_DQ_OE TIMING start =1/2 tck , end 2tck -> end 3tck 
   //      MYWRITE   0xE6790624,0x00000508;	
   //      MYWRITE   0xE6790628,0x31516100;   Original = 0x31514100;	adjust PHY_DQ_OE TIMING start =1/2 tck , end 2tck -> end 3tck 
   //      MYWRITE   0xE6790624,0x00000588;	
   //      MYWRITE   0xE6790628,0x31516100;   Original = 0x31514100;	adjust PHY_DQ_OE TIMING start =1/2 tck , end 2tck -> end 3tck 
   //      MYWRITE   0xE6790624,0x0000040a;	
   //      MYWRITE   0xE6790628,0x01315061;	Original = 0x01315041;	adjust PHY_DQS_OE TIMING start =1/2 tck , end 2tck -> end 3tck 
   //      MYWRITE   0xE6790624,0x0000048a;	
   //      MYWRITE   0xE6790628,0x01315061;	Original = 0x01315041;	adjust PHY_DQS_OE TIMING start =1/2 tck , end 2tck -> end 3tck 
   //      MYWRITE   0xE6790624,0x0000050a;	
   //      MYWRITE   0xE6790628,0x01315061;	Original = 0x01315041;	adjust PHY_DQS_OE TIMING start =1/2 tck , end 2tck -> end 3tck 
   //      MYWRITE   0xE6790624,0x0000058a;	
   //      MYWRITE   0xE6790628,0x01315061;	Original = 0x01315041;	adjust PHY_DQS_OE TIMING start =1/2 tck , end 2tck -> end 3tck 

   MYWRITE   0xE6790620,0x0000A55A//	Unlock 
   MYWRITE   0xE6790660,0x0000A55A//	Unlock 
   MYWRITE   0xE67906a0,0x0000A55A//	Unlock 
   MYWRITE   0xE67906e0,0x0000A55A//	Unlock 
   //;   PHYWRITE  0x0000061f , 0x00000355;   Original = #H'00030055;	Change phy_adrY_clk_wr_slave_delay 300->3 (half_cycle_shift)
   //;   PHYWRITE  0x00000620 , 0x00030003;   Original = #H'03000300;	Change phy_adrY_clk_wr_slave_delay 300->3 (half_cycle_shift)
   //;   PHYWRITE  0x00000621 , 0x00030003;   Original = #H'03000300;	Change phy_adrY_clk_wr_slave_delay 300->3 (half_cycle_shift)
   //;   PHYWRITE  0x00000622 , 0x00000003;   Original = #H'00000300;	Change phy_adrY_clk_wr_slave_delay 300->3 (half_cycle_shift)
   //;   PHYWRITE  0x0000069d , 0x00000300;   Original = #H'03000300;	Change phy_adrY_clk_wr_slave_delay 300->3 (half_cycle_shift)
   //;   PHYWRITE  0x0000069e , 0x00030003;   Original = #H'03000300;	Change phy_adrY_clk_wr_slave_delay 300->3 (half_cycle_shift)
   //;   PHYWRITE  0x0000069f , 0x00000003;   Original = #H'00000300;	Change phy_adrY_clk_wr_slave_delay 300->3 (half_cycle_shift)

   MYWRITE   0xE6790200,0x00000001//dbacen
   //;        .pool

   MYWRITE   0xE67F0024,0x00000001// ; V3U DN2 (test mode)
   //   MYWRITE   0xE67F0054,0x00010000;
   //   MYWRITE   0xE67F0018,0x00000001;
   MYWRITE   0xE67F0018,0x00000000// ; V3U DN2 (test mode)


   //;=======================================================================
   //; For DBS1
   //;=======================================================================
   //; ADD H3ES2
   MYWRITE   0xE6798100,0x00001234//DBSYSCNT0 REGROCK enable
   MYWRITE   0xE6798108,0x00001234//DBSYSCNT0A REGROCKA enable
   //;; WAIT
   MYWRITE   0xE6798020,0x0000000a//dbkind	ddcg=a(lpddr4)
   MYWRITE   0xE6798024,0x0000000a//dbkinda	ddcga=a(lpddr4)
   //;   MYWRITE   0xE6798030,0x0e030a02;memconf00(ch0/rank0), 4Gbit
   MYWRITE   0xE6798030,0x0e030a01//memconf00(ch0/rank0), 2Gbit
   MYWRITE   0xE6798070,0x0e030a01//memconf00a(ch0/rank0), 2Gbit (clk_axim)
   MYWRITE   0xE6798034,0x0e030a01//memconf01(ch0/rank1), 2Gbit
   MYWRITE   0xE6798074,0x0e030a01//memconf01a(ch0/rank1), 2Gbit (clk_axim)
   MYWRITE   0xE6798040,0x0e030a01//memconf10(ch1/rank0), 2Gbit
   MYWRITE   0xE6798080,0x0e030a01//memconf10a(ch1/rank0), 2Gbit (clk_axim)
   MYWRITE   0xE6798044,0x0e030a01//memconf11(ch1/rank1), 2Gbit
   MYWRITE   0xE6798084,0x0e030a01//memconf11a(ch1/rank1), 2Gbit (clk_axim)
   MYWRITE   0xE6798050,0x0e030a01//memconf00(ch2/rank0), 2Gbit
   MYWRITE   0xE6798090,0x0e030a01//memconf00a(ch2/rank0), 2Gbit (clk_axim)
   MYWRITE   0xE6798054,0x0e030a01//memconf01(ch2/rank1), 2Gbit
   MYWRITE   0xE6798094,0x0e030a01//memconf01a(ch2/rank1), 2Gbit (clk_axim)
   MYWRITE   0xE6798060,0x0e030a01//memconf10(ch3/rank0), 2Gbit
   MYWRITE   0xE67980a0,0x0e030a01//memconf10a(ch3/rank0), 2Gbit (clk_axim)
   MYWRITE   0xE6798064,0x0e030a01//memconf11(ch3/rank1), 2Gbit
   MYWRITE   0xE67980a4,0x0e030a01//memconf11a(ch3/rank1), 2Gbit (clk_axim)
   //;   MYWRITE   0xE6798050,0x0e030a02;memconf20(ch2/rank0), 4Gbit
   //;   MYWRITE   0xE6798054,0x0e030a02;memconf21(ch2/rank1), 4Gbit
   //;   MYWRITE   0xE6798060,0x0e030a02;memconf30(ch3/rank0), 4Gbit
   //;   MYWRITE   0xE6798064,0x0e030a02;memconf31(ch3/rank1), 4Gbit
   MYWRITE   0xE6798104,0x00000000//dbsyscnt1       
   MYWRITE   0xE6798010,0x00000001//DBPHYCONF0 01:DFI
   //;        .pool
   MYWRITE   0xE6798300,0x00000028//dbtr0	cl=40
   MYWRITE   0xE6798304,0x00000012//dbtr1	cwl=14
   //;   MYWRITE   0xE6798308,0x00000000;dbtr2	al=0
   MYWRITE   0xE679830C,0x00000027//dbtr3	trcd=39
   MYWRITE   0xE6798310,0x002D0027//dbtr4	trpa=45	trp=39
   MYWRITE   0xE6798314,0x00000087//dbtr5	trc=135
   MYWRITE   0xE6798318,0x0000005A//dbtr6	tras=90
   MYWRITE   0xE679831C,0x00100010//dbtr7 	trrd_s=16 trrd=16
   MYWRITE   0xE6798320,0x00000040//dbtr8 	tfaw=64
   MYWRITE   0xE6798324,0x00000010//dbtr9	trdpr=16
   MYWRITE   0xE6798328,0x00000029//dbtr10	twr=41
   MYWRITE   0xE679832C,0x00000029//dbtr11 	trdwr>=41 ;; PHY may have restriction of this value.
   MYWRITE   0xE6798330,0x00310031//dbtr12	twrrd_s>=49 twrrd>=49 ;; PHY may restriction of this value.
   MYWRITE   0xE6798334,0x00000116//dbtr13	trfcpb=0(W/A) trfc=278(2Gbit/ch)
   MYWRITE   0xE6798338,0x00130013//dbtr14	tckehdll=19 tckeh=19
   MYWRITE   0xE679833C,0x00200010//dbtr15	tckesr=32 tckel=16
   MYWRITE   0xE6798340,0x0d400a0e//dbtr16	latency?  CWL=13 CL=32 New dbsc ;; Please refer PHY manual. 0427
   MYWRITE   0xE6798344,0x081E0000//dbtr17	tmodrd=8  tmod=30
   MYWRITE   0xE6798350,0x01290129//dbtr20	txsdll=txs=297 txs=trfcab+7.5ns+3nCK(W/A)=297
   MYWRITE   0xE6798354,0x00080008//dbtr21	tccd_s=8 tccd=8
   MYWRITE   0xE6798358,0x08550040//dbtr22	tzqcal=2133 tzqlat=48
   MYWRITE   0xE679835C,0x00000003//dbtr23
   MYWRITE   0xE6798400,0x00000002//dbbl		dbbl=2(BL16)(LPDDR4)
   MYWRITE   0xE6798404,0x00000002//dbbla	dbbla=2(BL16)(LPDDR4)
   //;   MYWRITE   0xE6798430,0x00000000;dbrnk0	No odt for DQ exists in LPDDR4(N.Honda).
   //;   MYWRITE   0xE6798434,0x00000000;dbrnk1	Don't need to set it cause we use all-rank refresh.
   MYWRITE   0xE6798438,0x00004444//dbrnk2	rkrr = 4 (Are there any info ?)
   MYWRITE   0xE679843C,0x00004444//dbrnk3	rkrw = 4 (Are there any info ?)
   MYWRITE   0xE6798440,0x00004444//dbrnk4	rkwr = 4 (Are there any info ?)
   MYWRITE   0xE6798444,0x00004444//dbrnk5	rkww = 4 (Are there any info ?)
   //;   MYWRITE   0xE6798448,0x00000000;dbrnk6	use all-rank/all-bank refresh
   //;   MYWRITE   0xE6798500,0x00000000;dbadj0	currently, no optional setting exists.
   //;   MYWRITE   0xE6798508,0x00000000;dbadj2	currently, no optional setting exists.
   //;   MYWRITE   0xE6798900,0x00000000;dbcam0cnf0	inoen=0, actually it is not used.
   MYWRITE   0xE6798904,0x00104214//dbcam0cnf1	wbkwait=8, wbkmdhi=32, wbkmdlo=16
   MYWRITE   0xE6798908,0x000001c4//dbcam0cnf2	scexp=8192
   MYWRITE   0xE679890C,0x00000003//dbcam0cnf3       

   MYWRITE   0xE6799000,0x000f0037//dbschcnt0
   MYWRITE   0xE6799004,0x00001010//dbschcnt1
   MYWRITE   0xE6799010,0x00000001//dbschsz0
   MYWRITE   0xE6799020,0xf7311111//dbschrw0
   MYWRITE   0xE6799024,0x00001834//dbschrw1
   MYWRITE   0xE6799030,0xffffffff//dbschqos00 QoS = 00_00 doesn't come from AXI
   MYWRITE   0xE6799034,0x00000480//dbschqos01
   MYWRITE   0xE6799038,0x00000300//dbschqos02
   MYWRITE   0xE679903C,0x00000180//dbschqos03
   //;   MYWRITE   0xE6799030,0x00000600;dbschqos00	QoS = 00_00 doesn't come from AXI
   //;   MYWRITE   0xE6799034,0x00000480;dbschqos01
   //;   MYWRITE   0xE6799038,0x00000300;dbschqos02
   //;   MYWRITE   0xE679903C,0x00000180;dbschqos03
   //;   MYWRITE   0xE6799040,0x00000600;dbschqos10	QoS = 00_01 doesn't come from AXI
   //;   MYWRITE   0xE6799044,0x00000480;dbschqos11
   //;   MYWRITE   0xE6799048,0x00000300;dbschqos12
   //;   MYWRITE   0xE679904C,0x00000180;dbschqos13
   //;   MYWRITE   0xE6799050,0x00000600;dbschqos20	QoS = 00_10 doesn't come from AXI
   //;   MYWRITE   0xE6799054,0x00000480;dbschqos21
   //;   MYWRITE   0xE6799058,0x00000300;dbschqos22
   //;   MYWRITE   0xE679905C,0x00000180;dbschqos23
   //;   MYWRITE   0xE6799060,0x00000600;dbschqos30	QoS = 00_11 doesn't come from AXI
   //;   MYWRITE   0xE6799064,0x00000480;dbschqos31
   //;   MYWRITE   0xE6799068,0x00000300;dbschqos32
   //;   MYWRITE   0xE679906C,0x00000180;dbschqos33
   MYWRITE   0xE6799070,0x00000600//dbschqos40
   MYWRITE   0xE6799074,0x00000480//dbschqos41
   MYWRITE   0xE6799078,0x00000300//dbschqos42
   MYWRITE   0xE679907C,0x00000180//dbschqos43
   //;   MYWRITE   0xE6799080,0x00000400;dbschqos50	QoS = 01_01 doesn't come from AXI
   //;   MYWRITE   0xE6799084,0x00000300;dbschqos51
   //;   MYWRITE   0xE6799088,0x00000200;dbschqos52
   //;   MYWRITE   0xE679908C,0x00000100;dbschqos53
   //;   MYWRITE   0xE6799090,0x00000400;dbschqos60	QoS = 01_10 doesn't come from AXI
   //;   MYWRITE   0xE6799094,0x00000300;dbschqos61
   //;   MYWRITE   0xE6799098,0x00000200;dbschqos62
   //;   MYWRITE   0xE679909C,0x00000100;dbschqos63
   //;   MYWRITE   0xE67990A0,0x00000400;dbschqos70	QoS = 01_11 doesn't come from AXI
   //;   MYWRITE   0xE67990A4,0x00000300;dbschqos71
   //;   MYWRITE   0xE67990A8,0x00000200;dbschqos72
   //;   MYWRITE   0xE67990AC,0x00000100;dbschqos73
   //;   MYWRITE   0xE67990B0,0x00000400;dbschqos80	QoS = 10_00 doesn't come from AXI
   //;   MYWRITE   0xE67990B4,0x00000300;dbschqos81
   //;   MYWRITE   0xE67990B8,0x00000200;dbschqos82
   //;   MYWRITE   0xE67990BC,0x00000100;dbschqos83
   MYWRITE   0xE67990C0,0x00000400//dbschqos90
   MYWRITE   0xE67990C4,0x00000300//dbschqos91
   MYWRITE   0xE67990C8,0x00000200//dbschqos92
   MYWRITE   0xE67990CC,0x00000100//dbschqos93
   //;   MYWRITE   0xE67990D0,0x00000300;dbschqos100	QoS = 10_10 doesn't come from AXI
   //;   MYWRITE   0xE67990D4,0x00000240;dbschqos101
   //;   MYWRITE   0xE67990D8,0x00000180;dbschqos102
   //;   MYWRITE   0xE67990DC,0x000000c0;dbschqos103
   //;   MYWRITE   0xE67990E0,0x00000300;dbschqos110	QoS = 10_11 doesn't come from AXI
   //;   MYWRITE   0xE67990E4,0x00000240;dbschqos111
   //;   MYWRITE   0xE67990E8,0x00000180;dbschqos112
   //;   MYWRITE   0xE67990EC,0x000000c0;dbschqos113
   //;   MYWRITE   0xE67990F0,0x00000300;dbschqos120	QoS = 11_00 doesn't come from AXI
   //;   MYWRITE   0xE67990F4,0x00000240;dbschqos121
   //;   MYWRITE   0xE67990F8,0x00000180;dbschqos122
   //;   MYWRITE   0xE67990FC,0x000000c0;dbschqos123
   MYWRITE   0xE6799100,0x00000300//dbschqos130
   MYWRITE   0xE6799104,0x00000240//dbschqos131
   MYWRITE   0xE6799108,0x00000180//dbschqos132
   MYWRITE   0xE679910C,0x000000c0//dbschqos133
   MYWRITE   0xE6799110,0x00000200//dbschqos140
   MYWRITE   0xE6799114,0x00000180//dbschqos141
   MYWRITE   0xE6799118,0x00000100//dbschqos142
   MYWRITE   0xE679911C,0x00000080//dbschqos143
   MYWRITE   0xE6799120,0x00000100//dbschqos150
   MYWRITE   0xE6799124,0x000000c0//dbschqos151
   MYWRITE   0xE6799128,0x00000080//dbschqos152
   MYWRITE   0xE679912C,0x00000040//dbschqos153

   MYWRITE   0xE6799700,0x220E110A//dbschfctst0 scactact=34, scrdact=14, scwract=17, scpreact=10
   MYWRITE   0xE6799708,0x0B0D0A0C//dbschfctst1 scrdwr=11, scwrrd=13, scactrdwr=10, scasyncofs=12
   MYWRITE   0xE679970C,0x111f1fff//dbschfctst2 wrperi3=1, wrperi2=1, wrperi1=1, wrperi0=15, rdperi3=1, rdperi2=15, rdperi1=15, rdperi0=15

   MYWRITE   0xE6798000,0x00000001//dbsysconf0	rg_pch=2, rg_mch=2.
   MYWRITE   0xE6798004,0x00000002//dbsysconf1	freqratio=2.
   MYWRITE   0xE6798008,0x00000002//dbsysconf1a	freqratioa=2.
   MYWRITE   0xE679800c,0x00000001//dbsysconf2	schmd=1 (2ch mode).
   MYWRITE   0xE6798014,0x00000041//dbsysconf2a	chpos=8(256Byte channel interleave), schmda=1 (2ch mode).

   //;        .pool
   //;   MYWRITE   0xE6798604,0x00000010;dbdficnt0
   //;   MYWRITE   0xE6798644,0x00000010;dbdficnt1
   //;   MYWRITE   0xE6798684,0x00000010;dbdficnt2
   //;   MYWRITE   0xE67986C4,0x00000010;dbdficnt3
   //; wait init_complete
   //;   MYWRITE   0xE6798904,0x00044020;
   //;   MYWRITE   0xE6798908,0x00000008;

   //; FOR 1212B
   //;   MYWRITE   0xE6798904,0x0004140c;
   //;   MYWRITE   0xE6798908,0x00000008;
   //;   MYWRITE   0xE6799010,0x00000003;
   //;   MYWRITE   0xE6799024,0x001a0080;

   //; FOR 1213A
   //   MYWRITE   0xE6798904,0x00040C04;
   //   MYWRITE   0xE6798908,0x00000108;
   //   MYWRITE   0xE6799010,0x00000003;
   //   MYWRITE   0xE6799024,0x001a0080;

   //; Add 2015/07/29 M.Sano
   //; Remove comment by mochi for H3 ;; Comment Out 2015/07/29 M.Sano
   MYWRITE   0xE6798604,0x00000011//dbdficnt0 freq_ratio = 01 (2:1)init_start =1 
   MYWRITE   0xE6798644,0x00000011//dbdficnt1 freq_ratio = 01 (2:1)init_start =1 
   MYWRITE   0xE6798684,0x00000011//dbdficnt2 freq_ratio = 01 (2:1)init_start =1 
   MYWRITE   0xE67986C4,0x00000011//dbdficnt3 freq_ratio = 01 (2:1)init_start =1 

   MYWRITE   0xE679861C,0x0000CF01//dll_rst_n0 -> 1
   MYWRITE   0xE679865C,0x0000CF01//dll_rst_n0 -> 1
   MYWRITE   0xE679869C,0x0000CF01//dll_rst_n0 -> 1
   MYWRITE   0xE67986DC,0x0000CF01//dll_rst_n0 -> 1


   ldr   r6, =0x00000001

wait_init_complete_DBS1:
   ldr   r0, =0xE6798600
   ldr   r7, [r0,#0x0]
   and   r7, r6, r7
   cmp   r6, r7
   bne   wait_init_complete_DBS1

   ldr   r0, =0xE6798640
   ldr   r7, [r0,#0x0]
   and   r7, r6, r7
   cmp   r6, r7
   bne   wait_init_complete_DBS1

   //; Remove comment by mochi for H3 ;; Comment Out 2015/07/29 M.Sano
   ldr   r0, =0xE6798680
   ldr   r7, [r0,#0x0]
   and   r7, r6, r7
   cmp   r6, r7
   bne   wait_init_complete_DBS1

   ldr   r0, =0xE67986C0
   ldr   r7, [r0,#0x0]
   and   r7, r6, r7
   cmp   r6, r7
   bne   wait_init_complete_DBS1

   ldr r0, =0xE6798000

   //;MRR,MRW
   MYWRITE   0xE6798208,0x08840000//	PDE ch0 rk0
   MYWRITE   0xE6798208,0x08840001//	PDX ch0 rk0
   MYWRITE   0xE6798208,0x01840001//	RSX ch0 rk0
   MYWRITE   0xE6798208,0x0e840aff//	MRW ch0 rk0 0a:ff ZQCinit
   //; test 0427    MYWRITE   0xE6798208,0x0e8401d4;	MRW ch0 rk0 01:43 DeviceFeature1(010, 011(nWR=30,BL8))
   MYWRITE   0xE6798208,0x0e840154//	MRW ch0 rk0 01:43 DeviceFeature1(010, 011(nWR=30,BL8))
   MYWRITE   0xE6798208,0x0e84022e//	MRW ch0 rk0 02:24 DeviceFeature2(0,0,1,1010(WLSetA,RL32,WL14))

   MYWRITE   0xE6798208,0x0d84004F//     MPC chA rkA 4F (ZQCAL start)
   MYWRITE   0xE6798208,0x0d840051//     MPC chA rkA 51 (ZQCAL latch)

   //
   MYWRITE   0xE6798804,0x70000100//dbbus0cnf1
   MYWRITE   0xE6798800,0x18010001//dbbus0cnf
   //;   MYWRITE   0xE6798410,0x000000000;dbrfcnf0	refthf=0 This parameter is obsolete, no real effect.
   MYWRITE   0xE6798414,0x00081860//dbrfcnf1	refpmax=8 refint=6240
   MYWRITE   0xE6798418,0x00010000//dbrfcnf2	refpmin=1 refints=0
   MYWRITE   0xE6798204,0x00000001//dbrfen
   //; PHY reg patch 
   //   MYWRITE   0xE6798620,0x0000A55A;	Unlock 
   //      MYWRITE   0xE6798624,0x0000042A;	
   //      MYWRITE   0xE6798628,0x01000005;   Original = 0x00000005;	add write_path_lat_0 0 -> 1
   //      MYWRITE   0xE6798624,0x00000408;	
   //      MYWRITE   0xE6798628,0x31516100;   Original = 0x31514100;	adjust PHY_DQ_OE TIMING start =1/2 tck , end 2tck -> end 3tck 
   //      MYWRITE   0xE6798624,0x00000488;	
   //      MYWRITE   0xE6798628,0x31516100;   Original = 0x31514100;	adjust PHY_DQ_OE TIMING start =1/2 tck , end 2tck -> end 3tck 
   //      MYWRITE   0xE6798624,0x00000508;	
   //      MYWRITE   0xE6798628,0x31516100;   Original = 0x31514100;	adjust PHY_DQ_OE TIMING start =1/2 tck , end 2tck -> end 3tck 
   //      MYWRITE   0xE6798624,0x00000588;	
   //      MYWRITE   0xE6798628,0x31516100;   Original = 0x31514100;	adjust PHY_DQ_OE TIMING start =1/2 tck , end 2tck -> end 3tck 
   //      MYWRITE   0xE6798624,0x0000040a;	
   //      MYWRITE   0xE6798628,0x01315061;	Original = 0x01315041;	adjust PHY_DQS_OE TIMING start =1/2 tck , end 2tck -> end 3tck 
   //      MYWRITE   0xE6798624,0x0000048a;	
   //      MYWRITE   0xE6798628,0x01315061;	Original = 0x01315041;	adjust PHY_DQS_OE TIMING start =1/2 tck , end 2tck -> end 3tck 
   //      MYWRITE   0xE6798624,0x0000050a;	
   //      MYWRITE   0xE6798628,0x01315061;	Original = 0x01315041;	adjust PHY_DQS_OE TIMING start =1/2 tck , end 2tck -> end 3tck 
   //      MYWRITE   0xE6798624,0x0000058a;	
   //      MYWRITE   0xE6798628,0x01315061;	Original = 0x01315041;	adjust PHY_DQS_OE TIMING start =1/2 tck , end 2tck -> end 3tck 

   MYWRITE   0xE6798620,0x0000A55A//	Unlock 
   MYWRITE   0xE6798660,0x0000A55A//	Unlock 
   MYWRITE   0xE67986a0,0x0000A55A//	Unlock 
   MYWRITE   0xE67986e0,0x0000A55A//	Unlock 
   //;   PHYWRITE  0x0000061f , 0x00000355;   Original = #H'00030055;	Change phy_adrY_clk_wr_slave_delay 300->3 (half_cycle_shift)
   //;   PHYWRITE  0x00000620 , 0x00030003;   Original = #H'03000300;	Change phy_adrY_clk_wr_slave_delay 300->3 (half_cycle_shift)
   //;   PHYWRITE  0x00000621 , 0x00030003;   Original = #H'03000300;	Change phy_adrY_clk_wr_slave_delay 300->3 (half_cycle_shift)
   //;   PHYWRITE  0x00000622 , 0x00000003;   Original = #H'00000300;	Change phy_adrY_clk_wr_slave_delay 300->3 (half_cycle_shift)
   //;   PHYWRITE  0x0000069d , 0x00000300;   Original = #H'03000300;	Change phy_adrY_clk_wr_slave_delay 300->3 (half_cycle_shift)
   //;   PHYWRITE  0x0000069e , 0x00030003;   Original = #H'03000300;	Change phy_adrY_clk_wr_slave_delay 300->3 (half_cycle_shift)
   //;   PHYWRITE  0x0000069f , 0x00000003;   Original = #H'00000300;	Change phy_adrY_clk_wr_slave_delay 300->3 (half_cycle_shift)

   MYWRITE   0xE6798200,0x00000001//dbacen
   //;        .pool

   MYWRITE   0xE67F0024,0x00000001// ; V3U DN2 (test mode)
   //   MYWRITE   0xE67F0054,0x00010000;
   //   MYWRITE   0xE67F0018,0x00000001;
   MYWRITE   0xE67F0018,0x00000000// ; V3U DN2 (test mode)

   B SKIP_DBSCINIT
   .pool
SKIP_DBSCINIT:
   //;        .pool

   .END
