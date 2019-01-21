
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
	my $workingDir = shift(@_);
	my @includeDirs = @{shift(@_)};
	my @sourceFiles = @{shift(@_)};
	my @compilerOptions = @{shift(@_)};
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

	foreach my $opt (@compilerOptions) { print MAKE "OPTS += $opt\n"; }
	foreach my $dir (@includeDirs) { print MAKE "OPTS += -I $dir\n"; }
	foreach my $base (@sourceFilesBase) { print MAKE "OBJS += \$(DEBUG)/$base.o\n"; }

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
	my $workingDir = shift(@_);
	my @includeDirs = @{shift(@_)};
	my @sourceFiles = @{shift(@_)};
	my @compilerOptions = @{shift(@_)};
	push @compilerOptions, "-xc", "-c", "-mlittle-endian";

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

	foreach my $opt (@compilerOptions) { print MAKE "OPTS += $opt\n"; }
	foreach my $dir (@includeDirs) { print MAKE "OPTS += -I $dir\n"; }
	foreach my $base (@sourceFilesBase) { print MAKE "OBJS += \$(DEBUG)/$base.o\n"; }

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
	my $workingDir = shift(@_);
	my @includeDirs = @{shift(@_)};
	my @sourceFiles = @{shift(@_)};
	my @compilerOptions = @{shift(@_)};
	push @compilerOptions, "-xc++", "-c", "-mlittle-endian";

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

	foreach my $opt (@compilerOptions) { print MAKE "OPTS += $opt\n"; }
	foreach my $dir (@includeDirs) { print MAKE "OPTS += -I $dir\n"; }
	foreach my $base (@sourceFilesBase) { print MAKE "OBJS += \$(DEBUG)/$base.o\n"; }

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

sub translateArmasmCompilerOptions
{
	my $alias = shift(@_);
	my $rawOption = shift(@_);

	if		($alias eq "arch")	{ return "-march=$rawOption"	; }
	elsif	($alias eq "cpu")	{ return "-mcpu=$rawOption"		; }
	elsif	($alias eq "fpu")	{ return "-mfpu=$rawOption"		; }
	elsif	($alias eq "pd")	{ return "--defsym $rawOption"	; }
}

sub translateGnuasmCompilerOptions
{
	my $alias = shift(@_);
	my $rawOption = shift(@_);

	if		($alias eq "arch")	{ return "-march=$rawOption"	; }
	elsif	($alias eq "cpu")	{ return "-mcpu=$rawOption"		; }
	elsif	($alias eq "fpu")	{ return "-mfpu=$rawOption"		; }
	elsif	($alias eq "pd")	{ return "--defsym $rawOption"	; }
}

# if	($rawOption eq "armv7r"			)	{ return "-march=armv7r"		; }
# elsif	($rawOption eq "armv8a"			)	{ return "-march=armv8a"		; }
# elsif	($rawOption eq "armv8r"			)	{ return "-march=armv8r"		; }
# elsif	($rawOption eq "armv4t"			)	{ return "-march=armv4t"		; }
# elsif	($rawOption eq "armv5t"			)	{ return "-march=armv5t"		; }
# elsif	($rawOption eq "armv5te"		)	{ return "-march=armv5te"		; }
# elsif	($rawOption eq "armv6"			)	{ return "-march=armv6"			; }
# elsif	($rawOption eq "armv6j"			)	{ return "-march=armv6j"		; }
# elsif	($rawOption eq "armv6k"			)	{ return "-march=armv6k"		; }
# elsif	($rawOption eq "armv6kz"		)	{ return "-march=armv6kz"		; }
# elsif	($rawOption eq "armv6t2"		)	{ return "-march=armv6t2"		; }
# elsif	($rawOption eq "armv6z"			)	{ return "-march=armv6z"		; }
# elsif	($rawOption eq "armv6zk"		)	{ return "-march=armv6zk"		; }
# elsif	($rawOption eq "armv7"			)	{ return "-march=armv7"			; }
# elsif	($rawOption eq "armv7-a"		)	{ return "-march=armv7-a"		; }
# elsif	($rawOption eq "armv7ve"		)	{ return "-march=armv7ve"		; }
# elsif	($rawOption eq "armv8-a"		)	{ return "-march=armv8-a"		; }
# elsif	($rawOption eq "armv8.1-a"		)	{ return "-march=armv8.1-a"		; }
# elsif	($rawOption eq "armv8.2-a"		)	{ return "-march=armv8.2-a"		; }
# elsif	($rawOption eq "armv8.3-a"		)	{ return "-march=armv8.3-a"		; }
# elsif	($rawOption eq "armv8.4-a"		)	{ return "-march=armv8.4-a"		; }
# elsif	($rawOption eq "armv8.5-a"		)	{ return "-march=armv8.5-a"		; }
# elsif	($rawOption eq "armv7-r"		)	{ return "-march=armv7-r"		; }
# elsif	($rawOption eq "armv8-r"		)	{ return "-march=armv8-r"		; }
# elsif	($rawOption eq "armv6-m"		)	{ return "-march=armv6-m"		; }
# elsif	($rawOption eq "armv6s-m"		)	{ return "-march=armv6s-m"		; }
# elsif	($rawOption eq "armv7-m"		)	{ return "-march=armv7-m"		; }
# elsif	($rawOption eq "armv7e-m"		)	{ return "-march=armv7e-m"		; }
# elsif	($rawOption eq "iwmmxt"			)	{ return "-march=iwmmxt"		; }
# elsif	($rawOption eq "iwmmxt2"		)	{ return "-march=iwmmxt2"		; }
# elsif	($rawOption eq "armv8-m.base"	)	{ return "-march=armv8-m.base"	; }
# elsif	($rawOption eq "armv8-m.main"	)	{ return "-march=armv8-m.main"	; }

# if	($rawOption eq "arm7tdmi"		)	{ return "-mcpu=arm7tdmi"		; }
# elsif	($rawOption eq "arm7tdmi-s"		)	{ return "-mcpu=arm7tdmi-s"		; }
# elsif	($rawOption eq "arm710t"		)	{ return "-mcpu=arm710t"		; }
# elsif	($rawOption eq "arm720t"		)	{ return "-mcpu=arm720t"		; }
# elsif	($rawOption eq "arm740t"		)	{ return "-mcpu=arm740t"		; }
# elsif	($rawOption eq "strongarm"		)	{ return "-mcpu=strongarm"		; }
# elsif	($rawOption eq "strongarm110"	)	{ return "-mcpu=strongarm110"	; }
# elsif	($rawOption eq "strongarm1100"	)	{ return "-mcpu=strongarm1100"	; }
# elsif	($rawOption eq "strongarm1110"	)	{ return "-mcpu=strongarm1110"	; }
# elsif	($rawOption eq "arm8"			)	{ return "-mcpu=arm8"			; }
# elsif	($rawOption eq "arm810"			)	{ return "-mcpu=arm810"			; }
# elsif	($rawOption eq "arm9"			)	{ return "-mcpu=arm9"			; }
# elsif	($rawOption eq "arm9e"			)	{ return "-mcpu=arm9e"			; }
# elsif	($rawOption eq "arm920"			)	{ return "-mcpu=arm920"			; }
# elsif	($rawOption eq "arm920t"		)	{ return "-mcpu=arm920t"		; }
# elsif	($rawOption eq "arm922t"		)	{ return "-mcpu=arm922t"		; }
# elsif	($rawOption eq "arm946e-s"		)	{ return "-mcpu=arm946e-s"		; }
# elsif	($rawOption eq "arm966e-s"		)	{ return "-mcpu=arm966e-s"		; }
# elsif	($rawOption eq "arm968e-s"		)	{ return "-mcpu=arm968e-s"		; }
# elsif	($rawOption eq "arm926ej-s"		)	{ return "-mcpu=arm926ej-s"		; }
# elsif	($rawOption eq "arm940t"		)	{ return "-mcpu=arm940t"		; }
# elsif	($rawOption eq "arm9tdmi"		)	{ return "-mcpu=arm9tdmi"		; }
# elsif	($rawOption eq "arm10tdmi"		)	{ return "-mcpu=arm10tdmi"		; }
# elsif	($rawOption eq "arm1020t"		)	{ return "-mcpu=arm1020t"		; }
# elsif	($rawOption eq "arm1026ej-s"	)	{ return "-mcpu=arm1026ej-s"	; }
# elsif	($rawOption eq "arm10e"			)	{ return "-mcpu=arm10e"			; }
# elsif	($rawOption eq "arm1020e"		)	{ return "-mcpu=arm1020e"		; }
# elsif	($rawOption eq "arm1022e"		)	{ return "-mcpu=arm1022e"		; }
# elsif	($rawOption eq "arm1136j-s"		)	{ return "-mcpu=arm1136j-s"		; }
# elsif	($rawOption eq "arm1136jf-s"	)	{ return "-mcpu=arm1136jf-s"	; }
# elsif	($rawOption eq "mpcore"			)	{ return "-mcpu=mpcore"			; }
# elsif	($rawOption eq "mpcorenovfp"	)	{ return "-mcpu=mpcorenovfp"	; }
# elsif	($rawOption eq "arm1156t2-s"	)	{ return "-mcpu=arm1156t2-s"	; }
# elsif	($rawOption eq "arm1156t2f-s"	)	{ return "-mcpu=arm1156t2f-s"	; }
# elsif	($rawOption eq "arm1176jz-s"	)	{ return "-mcpu=arm1176jz-s"	; }
# elsif	($rawOption eq "arm1176jzf-s"	)	{ return "-mcpu=arm1176jzf-s"	; }
# elsif	($rawOption eq "cortex-a5"		)	{ return "-mcpu=cortex-a5"		; }
# elsif	($rawOption eq "cortex-a7"		)	{ return "-mcpu=cortex-a7"		; }
# elsif	($rawOption eq "cortex-a8"		)	{ return "-mcpu=cortex-a8"		; }
# elsif	($rawOption eq "cortex-a9"		)	{ return "-mcpu=cortex-a9"		; }
# elsif	($rawOption eq "cortex-a12"		)	{ return "-mcpu=cortex-a12"		; }
# elsif	($rawOption eq "cortex-a15"		)	{ return "-mcpu=cortex-a15"		; }
# elsif	($rawOption eq "cortex-a17"		)	{ return "-mcpu=cortex-a17"		; }
# elsif	($rawOption eq "cortex-a32"		)	{ return "-mcpu=cortex-a32"		; }
# elsif	($rawOption eq "cortex-a35"		)	{ return "-mcpu=cortex-a35"		; }
# elsif	($rawOption eq "cortex-a53"		)	{ return "-mcpu=cortex-a53"		; }
# elsif	($rawOption eq "cortex-a55"		)	{ return "-mcpu=cortex-a55"		; }
# elsif	($rawOption eq "cortex-a57"		)	{ return "-mcpu=cortex-a57"		; }
# elsif	($rawOption eq "cortex-a72"		)	{ return "-mcpu=cortex-a72"		; }
# elsif	($rawOption eq "cortex-a73"		)	{ return "-mcpu=cortex-a73"		; }
# elsif	($rawOption eq "cortex-a75"		)	{ return "-mcpu=cortex-a75"		; }
# elsif	($rawOption eq "cortex-a76"		)	{ return "-mcpu=cortex-a76"		; }
# elsif	($rawOption eq "ares"			)	{ return "-mcpu=ares"			; }
# elsif	($rawOption eq "cortex-r4"		)	{ return "-mcpu=cortex-r4"		; }
# elsif	($rawOption eq "cortex-r4f"		)	{ return "-mcpu=cortex-r4f"		; }
# elsif	($rawOption eq "cortex-r5"		)	{ return "-mcpu=cortex-r5"		; }
# elsif	($rawOption eq "cortex-r7"		)	{ return "-mcpu=cortex-r7"		; }
# elsif	($rawOption eq "cortex-r8"		)	{ return "-mcpu=cortex-r8"		; }
# elsif	($rawOption eq "cortex-r52"		)	{ return "-mcpu=cortex-r52"		; }
# elsif	($rawOption eq "cortex-m0"		)	{ return "-mcpu=cortex-m0"		; }
# elsif	($rawOption eq "cortex-m0plus"	)	{ return "-mcpu=cortex-m0plus"	; }
# elsif	($rawOption eq "cortex-m1"		)	{ return "-mcpu=cortex-m1"		; }
# elsif	($rawOption eq "cortex-m3"		)	{ return "-mcpu=cortex-m3"		; }
# elsif	($rawOption eq "cortex-m4"		)	{ return "-mcpu=cortex-m4"		; }
# elsif	($rawOption eq "cortex-m7"		)	{ return "-mcpu=cortex-m7"		; }
# elsif	($rawOption eq "cortex-m23"		)	{ return "-mcpu=cortex-m23"		; }
# elsif	($rawOption eq "cortex-m33"		)	{ return "-mcpu=cortex-m33"		; }
# elsif	($rawOption eq "exynos-m1"		)	{ return "-mcpu=exynos-m1"		; }
# elsif	($rawOption eq "marvell-pj4"	)	{ return "-mcpu=marvell-pj4"	; }
# elsif	($rawOption eq "xscale"			)	{ return "-mcpu=xscale"			; }
# elsif	($rawOption eq "iwmmxt"			)	{ return "-mcpu=iwmmxt"			; }
# elsif	($rawOption eq "iwmmxt2"		)	{ return "-mcpu=iwmmxt2"		; }
# elsif	($rawOption eq "ep9312"			)	{ return "-mcpu=ep9312"			; }
# elsif	($rawOption eq "fa526"			)	{ return "-mcpu=fa526"			; }
# elsif	($rawOption eq "fa626"			)	{ return "-mcpu=fa626"			; }
# elsif	($rawOption eq "fa606te"		)	{ return "-mcpu=fa606te"		; }
# elsif	($rawOption eq "fa626te"		)	{ return "-mcpu=fa626te"		; }
# elsif	($rawOption eq "fmp626"			)	{ return "-mcpu=fmp626"			; }
# elsif	($rawOption eq "fa726te"		)	{ return "-mcpu=fa726te"		; }
# elsif	($rawOption eq "xgene1"			)	{ return "-mcpu=xgene1"			; }
# elsif	($rawOption eq "generic-armv7-a"				)	{ return "-mcpu=generic-armv7-a"				; }
# elsif	($rawOption eq "cortex-m1.small-multiply"		)	{ return "-mcpu=cortex-m1.small-multiply"		; }
# elsif	($rawOption eq "cortex-m0.small-multiply"		)	{ return "-mcpu=cortex-m0.small-multiply"		; }
# elsif	($rawOption eq "cortex-m0plus.small-multiply"	)	{ return "-mcpu=cortex-m0plus.small-multiply"	; }

# if	($rawOption eq "auto"			)	{ return "-mfpu=auto"			; }
# elsif	($rawOption eq "vfpv2"			)	{ return "-mfpu=vfpv2"			; }
# elsif	($rawOption eq "vfpv3"			)	{ return "-mfpu=vfpv3"			; }
# elsif	($rawOption eq "vfpv3-fp16"		)	{ return "-mfpu=vfpv3-fp16"		; }
# elsif	($rawOption eq "vfpv3-d16"		)	{ return "-mfpu=vfpv3-d16"		; }
# elsif	($rawOption eq "vfpv3-d16-fp16"	)	{ return "-mfpu=vfpv3-d16-fp16"	; }
# elsif	($rawOption eq "vfpv3xd"		)	{ return "-mfpu=vfpv3xd"		; }
# elsif	($rawOption eq "vfpv3xd-fp16"	)	{ return "-mfpu=vfpv3xd-fp16"	; }
# elsif	($rawOption eq "neon-vfpv3"		)	{ return "-mfpu=neon-vfpv3"		; }
# elsif	($rawOption eq "neon-fp16"		)	{ return "-mfpu=neon-fp16"		; }
# elsif	($rawOption eq "vfpv4"			)	{ return "-mfpu=vfpv4"			; }
# elsif	($rawOption eq "vfpv4-d16"		)	{ return "-mfpu=vfpv4-d16"		; }
# elsif	($rawOption eq "fpv4-sp-d16"	)	{ return "-mfpu=fpv4-sp-d16"	; }
# elsif	($rawOption eq "neon-vfpv4"		)	{ return "-mfpu=neon-vfpv4"		; }
# elsif	($rawOption eq "fpv5-d16"		)	{ return "-mfpu=fpv5-d16"		; }
# elsif	($rawOption eq "fpv5-sp-d16"	)	{ return "-mfpu=fpv5-sp-d16"	; }
# elsif	($rawOption eq "fp-armv8"		)	{ return "-mfpu=fp-armv8"		; }
# elsif	($rawOption eq "neon-fp-armv8"	)	{ return "-mfpu=neon-fp-armv8"	; }
# elsif	($rawOption eq "crypto-neon-fp-armv8"	)	{ return "-mfpu=crypto-neon-fp-armv8"	; }

return 1;
