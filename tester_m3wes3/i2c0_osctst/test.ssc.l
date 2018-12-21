
 = qq_md6   1
 = qq_md7   1

ml image.bin/ER00
ml image.bin/ER10

bbs 07f00000
bbe

reset

max 500000

run

md  0x04000000 0x040003ff result.rtl.l

q

