
my $armasmCompiler	= "arm-none-eabi-as";
my $gnuasmCompiler	= "arm-none-eabi-as";
my $cCompiler		= "arm-none-eabi-gcc";
my $cppCompiler		= "arm-none-eabi-gcc";
my $linker			= "arm-none-eabi-ld";
my $imageExtracter	= "arm-none-eabi-objcopy";
my $imageExtracter2	= "arm-none-eabi-objdump";

sub extract_image
{
	my $workingDir	= shift(@_);
	my $image		= "$workingDir/debug/image.elf";
	my $imageBinary	= "$workingDir/debug/image.bin";
	my $imageList	= "$workingDir/debug/image.lst";

	my @binOptions	= ("--output-target=srec");
	my @listOptions = ("--disassemble", "--endian=little", "--reloc");

	my $Makefile = "$workingDir/Makefile_extract_image";

	open MAKE, ">$Makefile";

	print MAKE <<TXT;
#******************************************************************************
#	Automatic generated file. Do not modify!
#	CT Pattern Builder v3
#	2082 - Hau Sy Le - hau.le.eb\@renesas.com
#******************************************************************************
DEBUG = $workingDir/debug
BIN = $imageExtracter
LIST = $imageExtracter2
TXT

	foreach my $binOpt		(@binOptions)	{ print MAKE "BINOPTS += $binOpt\n"; }
	foreach my $listOopt	(@listOptions)	{ print MAKE "LISTOPTS += $listOopt\n"; }

	print MAKE <<TXT;
.PHONY: EXTRACT
EXTRACT: image.bin \$(DEBUG)/image.lst
TXT

	print MAKE <<TXT;
image.bin: \$(DEBUG)/image.elf
	\$(BIN) \$(BINOPTS) \$(DEBUG)/image.elf image.bin
TXT

	print MAKE <<TXT;
\$(DEBUG)/image.lst: \$(DEBUG)/image.elf
	\$(LIST) \$(LISTOPTS) \$(DEBUG)/image.elf > image.lst
	mv -f *.lst \$(DEBUG)
TXT

	close MAKE;

	my $status = system("make -f $Makefile");
	if ($status != 0) { print "[Error] Failed to extract image\n"; }

	return $status;
}
