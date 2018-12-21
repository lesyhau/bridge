# Sim with Default mode
 = qq_md20 1
 = qq_md15 0
# = qq_md14 0
# = qq_md13 0
# = qq_md12 0
# = qq_md11 0
# = qq_md10 0
# 1:xtal
# = qq_md9 0
# LBSC 16bit
 = qq_md8 1
# md[7:6]: 2'b00 CA15, 2'b01 CA7, 2'b10 32bit SHX, 2'b11 29bit SHX
# = qq_md9 0
# = qq_md8 1
# = qq_md5 0
# = qq_md4 0
# = qq_md3 0
# = qq_md2 0
# = qq_md1 0
# = qq_md0 0
#md[7:6]: 10 SHX
 = qq_md7 1
 = qq_md6 1

# = qq_test1 0
# = qq_test2 0
# = qq_mpmd 1
# = qq_bsmode 0

ml startup.m32.l
ml main.bin

bbs 070003f0
bbe

reset

max 500000

run

md 00010000 000100ff result.rtl.l

q

