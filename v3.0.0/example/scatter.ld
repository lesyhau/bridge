
MEMORY
{
	BSC0	(rwx)	: ORIGIN = 0x00000000, LENGTH = 0x03f00000
	BSC1	(rwx)	: ORIGIN = 0x04000000, LENGTH = 0x03f00000
	DDR		(rwx)	: ORIGIN = 0x40000000, LENGTH = 0x7fffffff
	SysRAM	(rwx)	: ORIGIN = 0xe6300000, LENGTH = 0x00ffffff
}

SECTIONS
{
	.text :
	{
		*(.text*)
		*(.rodata*)
	} > BSC0

	.bss :
	{
		*(.bss*)
	} > SysRAM

	.data :
	{
		*(.data*)
	} > SysRAM

	.stack (COPY) :
	{
		*(.stack*)
	} > SysRAM

	__stack_top = ORIGIN(SysRAM) + LENGTH(SysRAM);
	__stack_limit = __stack_top - SIZEOF(.stack);
	PROVIDE(__stack__ = __stack_top);
}
