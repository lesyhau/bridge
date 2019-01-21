
my $armasmCompiler	= "arm-none-eabi-as";
my $gnuasmCompiler	= "arm-none-eabi-as";
my $cCompiler		= "arm-none-eabi-gcc";
my $cppCompiler		= "arm-none-eabi-gcc";
my $linker			= "arm-none-eabi-ld";
my $imageExtracter	= "arm-none-eabi-objcopy";
my $imageExtracter2	= "arm-none-eabi-objdump";

# link_object($workingDir, \@includeDirs, \@armasmFiles, \@gnuasmFiles, \@cFiles, \@cppFiles, \@linkerOptions);
sub link_object
{
	my $workingDir = shift(@_);
	my @includeDirs = @{shift(@_)};
	my @armasmFiles = @{shift(@_)};
	my @gnuasmFiles = @{shift(@_)};
	my @cFiles = @{shift(@_)};
	my @cppFiles = @{shift(@_)};
	my @linkerOptions = @{shift(@_)};
	push @linkerOptions, "-e 0x0";
	# push @imageExtractererOptions, "";

	my @armasmFilesBase = getBasename(\@armasmFiles, ".s");
	my @gnuasmFilesBase = getBasename(\@gnuasmFiles, ".src");
	my @cFilesBase = getBasename(\@cFiles, ".c");
	my @cppFilesBase = getBasename(\@cppFiles, ".cpp");
	my $Makefile = "$workingDir/Makefile_link_object";

	open MAKE, ">$Makefile";

	print MAKE <<TXT;
#******************************************************************************
#	Automatic generated file. Do not modify!
#	CT Pattern Builder v3
#	2082 - Hau Sy Le - hau.le.eb\@renesas.com
#******************************************************************************
DEBUG = $workingDir/debug
LINKER = $linker
TXT

	foreach my $opt (@linkerOptions) { print MAKE "OPTS += $opt\n"; }
	foreach my $dir (@includeDirs) { print MAKE "OPTS += -I $dir\n"; }
	foreach my $base (@armasmFilesBase) { print MAKE "OBJS += \$(DEBUG)/$base.o\n"; }
	foreach my $base (@gnuasmFilesBase) { print MAKE "OBJS += \$(DEBUG)/$base.o\n"; }
	foreach my $base (@cFilesBase) { print MAKE "OBJS += \$(DEBUG)/$base.o\n"; }
	foreach my $base (@cppFilesBase) { print MAKE "OBJS += \$(DEBUG)/$base.o\n"; }

	print MAKE <<TXT;
.PHONY: LINK
LINK: \$(DEBUG)/image.elf
TXT

	print MAKE <<TXT;
\$(DEBUG)/image.elf: \$(OBJS)
	\$(LINKER) \$(OPTS) \$(OBJS) -o image.elf
	mv -f *.elf \$(DEBUG)
TXT

	close MAKE;

	my $status = system("make -f $Makefile");
	if ($status != 0) { print "[Error] Failed to link object files\n"; }

	return $status;
}

return 1;
