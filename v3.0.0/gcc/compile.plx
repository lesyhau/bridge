
my $armasmCompiler	= "arm-none-eabi-as";
my $gnuasmCompiler	= "arm-none-eabi-as";
my $cCompiler		= "arm-none-eabi-gcc";
my $cppCompiler		= "arm-none-eabi-gcc";
my $linker			= "arm-none-eabi-ld";
my $imageExtracter	= "arm-none-eabi-objcopy";
my $imageExtracter2	= "arm-none-eabi-objdump";

# compile_armasm($workingDir, @includeDirs, @sourceFiles, @compilerOptions);
sub compile_armasm
{
# 	my $workingDir = shift(@_);
# 	my @includeDirs = @{shift(@_)};
# 	my @sourceFiles = @{shift(@_)};
# 	my @compilerOptions = @{shift(@_)};
# 	push @compilerOptions, "-EL", "-L";

# 	my @sourceFilesBase = getBasename(\@sourceFiles, ".s");
# 	my $Makefile = "$workingDir/Makefile_compile_armasm";

# 	open MAKE, ">$Makefile";

# 	print MAKE <<TXT;
# #******************************************************************************
# #	Automatic generated file. Do not modify!
# #	CT Pattern Builder v3
# #	2082 - Hau Sy Le - hau.le.eb\@renesas.com
# #******************************************************************************
# DEBUG = $workingDir/debug
# COMPILER = $armasmCompiler
# TXT

# 	foreach my $opt (@compilerOptions) { print MAKE "OPTS += $opt\n"; }
# 	foreach my $dir (@includeDirs) { print MAKE "OPTS += -I $dir\n"; }
# 	foreach my $base (@sourceFilesBase) { print MAKE "OBJS += \$(DEBUG)/$base.o\n"; }

# 	print MAKE <<TXT;
# .PHONY: COMPILE
# COMPILE: \$(OBJS)
# TXT


# 	my $i = 0;
# 	foreach my $base (@sourceFilesBase)
# 	{
# 		print MAKE <<TXT;
# \$(DEBUG)/$base.o: $sourceFiles[$i]
# 	\$(COMPILER) \$(OPTS) --list=$base.list $sourceFiles[$i]
# 	mv -f *.o \$(DEBUG)
# 	mv -f *.list \$(DEBUG)
# TXT
# 		$i++;
# 	}

# 	close MAKE;

# 	my $status = system("make -f $Makefile");
	my $status = 0;
	if ($status != 0) { print "[Error] Failed to compile ARM assembly source files\n"; }

	return $status;
}

# compile_gnuasm($workingDir, @includeDirs, @sourceFiles, @compilerOptions);
sub compile_gnuasm
{
	my $workingDir		= shift(@_);
	my @includeDirs		= @{shift(@_)};
	my @sourceFiles		= @{shift(@_)};
	my @compilerOptions	= @{shift(@_)};
	push @compilerOptions, "-EL", "-L";

	my @sourceFilesBase = getBasename(\@sourceFiles, ".src");
	my $Makefile = "$workingDir/Makefile_compile_gnuasm";

	open MAKE, ">$Makefile";

	print MAKE <<TXT;
#******************************************************************************
#	Automatic generated file. Do not modify!
#	CT Pattern Builder v3
#	2082 - Hau Sy Le - hau.le.eb\@renesas.com
#******************************************************************************
DEBUG = $workingDir/debug
COMPILER = $gnuasmCompiler
TXT

	foreach my $opt		(@compilerOptions)	{ print MAKE "OPTS += $opt\n"; }
	foreach my $dir		(@includeDirs)		{ print MAKE "OPTS += -I $dir\n"; }
	foreach my $base	(@sourceFilesBase)	{ print MAKE "OBJS += \$(DEBUG)/$base.o\n"; }

	print MAKE <<TXT;
.PHONY: COMPILE
COMPILE: \$(OBJS)
TXT

	my $i = 0;
	foreach my $base (@sourceFilesBase)
	{
		print MAKE <<TXT;
\$(DEBUG)/$base.o: $sourceFiles[$i]
	\$(COMPILER) \$(OPTS) -al=$base.list -o $base.o $sourceFiles[$i]
	mv -f *.o \$(DEBUG)
	mv -f *.list \$(DEBUG)
TXT
		$i++;
	}

	close MAKE;

	my $status = system("make -f $Makefile");
	if ($status != 0) { print "[Error] Failed to compile GNU assembly source files\n"; }

	return $status;
}

# compile_c($workingDir, @includeDirs, @sourceFiles, @compilerOptions);
sub compile_c
{
	my $workingDir		= shift(@_);
	my @includeDirs		= @{shift(@_)};
	my @sourceFiles		= @{shift(@_)};
	my @compilerOptions	= @{shift(@_)};
	push @compilerOptions,
		"-xc",
		"-c",
		"-mlittle-endian",
		"-ffunction-sections",
		"-fdata-sections";

	my @sourceFilesBase = getBasename(\@sourceFiles, ".c");
	my $Makefile = "$workingDir/Makefile_compile_c";
	
	open MAKE, ">$Makefile";

	print MAKE <<TXT;
#******************************************************************************
#	Automatic generated file. Do not modify!
#	CT Pattern Builder v3
#	2082 - Hau Sy Le - hau.le.eb\@renesas.com
#******************************************************************************
DEBUG = $workingDir/debug
COMPILER = $cCompiler
TXT

	foreach my $opt		(@compilerOptions)	{ print MAKE "OPTS += $opt\n"; }
	foreach my $dir		(@includeDirs)		{ print MAKE "OPTS += -I $dir\n"; }
	foreach my $base	(@sourceFilesBase)	{ print MAKE "OBJS += \$(DEBUG)/$base.o\n"; }

	print MAKE <<TXT;
.PHONY: COMPILE
COMPILE: \$(OBJS)
TXT

	my $i = 0;
	foreach my $base (@sourceFilesBase)
	{
		print MAKE "\$(DEBUG)/";
		open DEP, "<$workingDir/debug/$base.mk";
		foreach my $line (<DEP>) { print MAKE $line; }
		close DEP;

		print MAKE <<TXT;
	\$(COMPILER) \$(OPTS) -o $base.o $sourceFiles[$i]
	mv -f *.o \$(DEBUG)
TXT
		$i++;
	}

	close MAKE;

	my $status = system("make -f $Makefile");
	if ($status != 0) { print "[Error] Failed to compile C source files\n"; }

	return $status;
}

# compile_cpp($workingDir, \@includeDirs, \@sourceFiles, \@compilerOptions);
sub compile_cpp
{
	my $workingDir		= shift(@_);
	my @includeDirs		= @{shift(@_)};
	my @sourceFiles		= @{shift(@_)};
	my @compilerOptions	= @{shift(@_)};
	push @compilerOptions,
		"-xc++",
		"-c",
		"-mlittle-endian",
		"-ffunction-sections",
		"-fdata-sections",
		"-Wl,--gc-sections";

	my @sourceFilesBase = getBasename(\@sourceFiles, ".cpp");
	my $Makefile = "$workingDir/Makefile_compile_cpp";
	
	open MAKE, ">$Makefile";

	print MAKE <<TXT;
#******************************************************************************
#	Automatic generated file. Do not modify!
#	CT Pattern Builder v3
#	2082 - Hau Sy Le - hau.le.eb\@renesas.com
#******************************************************************************
DEBUG = $workingDir/debug
COMPILER = $cppCompiler
TXT

	foreach my $opt		(@compilerOptions)	{ print MAKE "OPTS += $opt\n"; }
	foreach my $dir		(@includeDirs)		{ print MAKE "OPTS += -I $dir\n"; }
	foreach my $base	(@sourceFilesBase)	{ print MAKE "OBJS += \$(DEBUG)/$base.o\n"; }

	print MAKE <<TXT;
.PHONY: COMPILE
COMPILE: \$(OBJS)
TXT

	my $i = 0;
	foreach my $base (@sourceFilesBase)
	{
		print MAKE "\$(DEBUG)/";
		open DEP, "<$workingDir/debug/$base.mk";
		foreach my $line (<DEP>) { print MAKE $line; }
		close DEP;

		print MAKE <<TXT;
	\$(COMPILER) \$(OPTS) -o $base.o $sourceFiles[$i]
	mv -f *.o \$(DEBUG)
TXT
		$i++;
	}

	close MAKE;

	my $status = system("make -f $Makefile");
	if ($status != 0) { print "[Error] Failed to compile C++ source files\n"; }

	return $status;
}

sub translateCompilerOptions
{
	my $language	= shift(@_);
	my $alias		= shift(@_);
	my $rawOption	= shift(@_);

	if ($language eq "armasm")
	{
		if		($alias eq "cpu")		{ return "-mcpu=$rawOption"		; }
		elsif	($alias eq "fpu")		{ return "-mfpu=$rawOption"		; }
		elsif	($alias eq "pd")		{ return "--defsym $rawOption"	; }
	}

	elsif ($language eq "gnuasm")
	{
		if		($alias eq "cpu")		{ return "-mcpu=$rawOption"		; }
		elsif	($alias eq "fpu")		{ return "-mfpu=$rawOption"		; }
		elsif	($alias eq "pd")		{ return "--defsym $rawOption"	; }
	}
	
	elsif ($language eq "c")
	{
		if		($alias eq "cpu")		{ return "-mcpu=$rawOption"		; }
		elsif	($alias eq "fpu")		{ return "-mfpu=$rawOption"		; }
		elsif	($alias eq "pd")		{ return "-D $rawOption"		; }
		elsif	($alias eq "optimize")	{ return "-O$rawOption"			; }
	}
	
	elsif ($language eq "cpp")
	{
		if		($alias eq "cpu")		{ return "-mcpu=$rawOption"		; }
		elsif	($alias eq "fpu")		{ return "-mfpu=$rawOption"		; }
		elsif	($alias eq "pd")		{ return "-D $rawOption"		; }
		elsif	($alias eq "optimize")	{ return "-O$rawOption"			; }
	}
}

sub list_cpu
{
	print <<TXT;

	List of supported ARM CPUs:
		arm7tdmi
		arm7tdmi-s
		arm710t
		arm720t
		arm740t
		strongarm
		strongarm110
		strongarm1100
		strongarm1110
		arm8
		arm810
		arm9
		arm9e
		arm920
		arm920t
		arm922t
		arm946e-s
		arm966e-s
		arm968e-s
		arm926ej-s
		arm940t
		arm9tdmi
		arm10tdmi
		arm1020t
		arm1026ej-s
		arm10e
		arm1020e
		arm1022e
		arm1136j-s
		arm1136jf-s
		mpcore
		mpcorenovfp
		arm1156t2-s
		arm1156t2f-s
		arm1176jz-s
		arm1176jzf-s
		generic-armv7-a
		cortex-a5
		cortex-a7
		cortex-a8
		cortex-a9
		cortex-a12
		cortex-a15
		cortex-a17
		cortex-a32
		cortex-a35
		cortex-a53
		cortex-a55
		cortex-a57
		cortex-a72
		cortex-a73
		cortex-a75
		cortex-a76
		ares
		cortex-r4
		cortex-r4f
		cortex-r5
		cortex-r7
		cortex-r8
		cortex-r52
		cortex-m0
		cortex-m0plus
		cortex-m1
		cortex-m3
		cortex-m4
		cortex-m7
		cortex-m23
		cortex-m33
		cortex-m1.small-multiply
		cortex-m0.small-multiply
		cortex-m0plus.small-multiply
		exynos-m1
		marvell-pj4
		xscale
		iwmmxt
		iwmmxt2
		ep9312
		fa526
		fa626
		fa606te
		fa626te
		fmp626
		fa726te
		xgene1

TXT
}

sub list_fpu
{
	print <<TXT;

	List of supported FPUs:
		auto
		vfpv2
		vfpv3
		vfpv3-fp16
		vfpv3-d16
		vfpv3-d16-fp16
		vfpv3xd
		vfpv3xd-fp16
		neon-vfpv3
		neon-fp16
		vfpv4
		vfpv4-d16
		fpv4-sp-d16
		neon-vfpv4
		fpv5-d16
		fpv5-sp-d16
		fp-armv8
		neon-fp-armv8
		crypto-neon-fp-armv8

TXT
}

sub list_optimize
{
	print <<TXT;

	List of supported code optimize level:
		0	No optimized
		1	Slightly optimized (default)
		2	Moderate optimized
		3	Highly optimized
		s	Optimize for code side
		fast	Optimize for code speed
		g	Optimize for debugging experience

TXT
}

sub get_default_cpu
{
	return "cortex-r52";
}

sub get_default_fpu
{
	return "vfpv3-fp16";
}

sub get_default_optimize
{
	return 1;
}

return 1;

# as has following command-line options for the Renesas (formerly Hitachi) / SuperH SH family
# --little				Generate little endian code.
# --big					Generate big endian code.
# --relax 				Alter jump instructions for long displacements.
# --small				Align sections to 4 byte boundaries, not 16.
# --dsp 				Enable sh-dsp insns, and disable sh3e / sh4 insns.
# --renesas				Disable optimization with section symbol for compatibility with Renesas assembler.
# --allow-reg-prefix	Allow $ as a register name prefix.
# --fdpic 				Generate an FDPIC object file.
# --isa=sh4 | sh4a		Specify the sh4 or sh4a instruction set.
# --isa=dsp				Enable sh-dsp insns, and disable sh3e / sh4 insns.
# --isa=fp 				Enable sh2e, sh3e, sh4, and sh4a insn sets.
# --isa=all				Enable sh1, sh2, sh2e, sh3, sh3e, sh4, sh4a, and sh-dsp insn sets.
# -h-tick-hex			Support H00 style hex constants in addition to 0x00 style.
