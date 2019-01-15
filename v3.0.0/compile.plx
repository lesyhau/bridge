
my $armasmCompiler	= "arm-none-eabi-as";
my $gnuasmCompiler	= "arm-none-eabi-as";
my $cCompiler		= "arm-none-eabi-gcc";
my $cppCompiler		= "arm-none-eabi-gcc";
my $linker			= "arm-none-eabi-ld";
my $imageExtracter	= "arm-none-eabi-objcopy";

# compile_armasm($workingDir, @includeDirs, @sourceFiles, @compilerOptions);
sub compile_armasm
{
	my $workingDir = shift(@_);
	my @includeDirs = @{shift(@_)};
	my @sourceFiles = @{shift(@_)};
	my @compilerOptions = @{shift(@_)};
	push @compilerOptions, "-EL";

	my @sourceFilesBase = getBasename(\@sourceFiles, ".s");
	my $Makefile = "$workingDir/Makefile_compile_armasm";

	open MAKE, ">$Makefile";

	print MAKE <<TXT;
# Automatic generated file. Do not modify!
DEBUG = $workingDir/debug
COMPILER = $armasmCompiler
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
	\$(COMPILER) \$(OPTS) --list=$base.list $sourceFiles[$i]
	mv -f *.o \$(DEBUG)
	mv -f *.list \$(DEBUG)
TXT
		$i++;
	}

	close MAKE;

	# system("make -f $Makefile");
}

# compile_gnuasm($workingDir, @includeDirs, @sourceFiles, @compilerOptions);
sub compile_gnuasm
{
	my $workingDir = shift(@_);
	my @includeDirs = @{shift(@_)};
	my @sourceFiles = @{shift(@_)};
	my @compilerOptions = @{shift(@_)};
	push @compilerOptions, "-EL";

	my @sourceFilesBase = getBasename(\@sourceFiles, ".src");
	my $Makefile = "$workingDir/Makefile_compile_gnuasm";

	open MAKE, ">$Makefile";

	print MAKE <<TXT;
# Automatic generated file. Do not modify!
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

	system("make -f $Makefile");
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
# Automatic generated file. Do not modify!
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

	system("make -f $Makefile");
}

# compile_cpp($workingDir, \@includeDirs, \@sourceFiles, \@compilerOptions);
sub compile_cpp
{
	my $workingDir = shift(@_);
	my @includeDirs = @{shift(@_)};
	my @sourceFiles = @{shift(@_)};
	my @compilerOptions = @{shift(@_)};
	push @compilerOptions, "-xc", "-c", "-mlittle-endian";

	my @sourceFilesBase = getBasename(\@sourceFiles, ".cpp");
	my $Makefile = "$workingDir/Makefile_compile_cpp";
	
	open MAKE, ">$Makefile";

	print MAKE <<TXT;
# Automatic generated file. Do not modify!
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

	system("make -f $Makefile");
}

return 1;