
my $armasmCompiler	= "arm-none-eabi-as";
my $gnuasmCompiler	= "arm-none-eabi-as";
my $cCompiler		= "arm-none-eabi-gcc";
my $cppCompiler		= "arm-none-eabi-gcc";
my $linker			= "arm-none-eabi-ld";
my $imageExtracter	= "arm-none-eabi-objcopy";
my $imageExtracter2	= "arm-none-eabi-objdump";

# gen_armasm_dependency($workingDir, @includeDirs, @sourceFiles);
sub gen_armasm_dependency
{
	my $workingDir = shift(@_);
	my @includeDirs = @{shift(@_)};
	my @sourceFiles = @{shift(@_)};
# 	my @sourceFilesBase = getBasename(\@sourceFiles, ".s");
	
# 	my $Makefile = "$workingDir/Makefile_gen_armasm_dependency";
# 	open MAKE, ">$Makefile";

# 	print MAKE <<TXT;
# #******************************************************************************
# #	Automatic generated file. Do not modify!
# #	CT Pattern Builder v3
# #	2082 - Hau Sy Le - hau.le.eb\@renesas.com
# #******************************************************************************
# DEBUG = $workingDir/debug
# COMPILER = $armasmCompiler
# OPTS += --MD
# TXT

# 	foreach my $dir (@includeDirs) { print MAKE "OPTS += -I $dir\n"; }
# 	foreach my $base (@sourceFilesBase) { print MAKE "MKS += \$(DEBUG)/$base.mk\n"; }

# 	print MAKE <<TXT;
# .PHONY: GENDEP
# GENDEP: \$(MKS)
# TXT

# 	my $i = 0;
# 	foreach my $base(@sourceFilesBase)
# 	{
# 		print MAKE <<TXT;
# \$(DEBUG)/$base.mk: $sourceFiles[$i]
# 	\$(COMPILER) \$(OPTS) $sourceFiles[$i] \$(DEBUG)/$base.mk
# TXT
# 		$i++;
# 	}

# 	close MAKE;

# 	my $status = system("make -f $Makefile");
	my $status = 0;
	if ($status != 0) { print "[Error] Failed to generate ARM assmembly dependency\n"; }

	return $status;
}

# gen_gnuasm_dependency($workingDir, @includeDirs, @sourceFiles);
sub gen_gnuasm_dependency
{
# 	my $workingDir = shift(@_);
# 	my @includeDirs = @{shift(@_)};
# 	my @sourceFiles = @{shift(@_)};
# 	my @sourceFilesBase = getBasename(\@sourceFiles, ".src");
	
# 	my $Makefile = "$workingDir/Makefile_gen_gnuasm_dependency";
# 	open MAKE, ">$Makefile";

# 	print MAKE <<TXT;
# #******************************************************************************
# #	Automatic generated file. Do not modify!
# #	CT Pattern Builder v3
# #	2082 - Hau Sy Le - hau.le.eb\@renesas.com
# #******************************************************************************
# DEBUG = $workingDir/debug
# COMPILER = $gnuasmCompiler
# OPTS += --MD
# TXT

# 	foreach my $dir (@includeDirs) { print MAKE "OPTS += -I $dir\n"; }
# 	foreach my $base (@sourceFilesBase) { print MAKE "MKS += \$(DEBUG)/$base.mk\n"; }

# 	print MAKE <<TXT;
# .PHONY: GENDEP
# GENDEP: \$(MKS)
# TXT

# 	my $i = 0;
# 	foreach my $base(@sourceFilesBase)
# 	{
# 		print MAKE <<TXT;
# \$(DEBUG)/$base.mk: $sourceFiles[$i]
# 	\$(COMPILER) \$(OPTS) $sourceFiles[$i] \$(DEBUG)/$base.mk
# TXT
# 		$i++;
# 	}

# 	close MAKE;

# 	my $status = system("make -f $Makefile");
	my $status = 0;
	if ($status != 0) { print "[Error] Failed to generate GNU assmembly dependency\n"; }

	return $status;
}

# gen_c_dependency($workingDir, @includeDirs, @sourceFiles);
sub gen_c_dependency
{
	my $workingDir = shift(@_);
	my @includeDirs = @{shift(@_)};
	my @sourceFiles = @{shift(@_)};
	my @sourceFilesBase = getBasename(\@sourceFiles, ".c");
	
	my $Makefile = "$workingDir/Makefile_gen_c_dependency";
	open MAKE, ">$Makefile";

	print MAKE <<TXT;
#******************************************************************************
#	Automatic generated file. Do not modify!
#	CT Pattern Builder v3
#	2082 - Hau Sy Le - hau.le.eb\@renesas.com
#******************************************************************************
DEBUG = $workingDir/debug
COMPILER = $cCompiler
OPTS += -MM
TXT

	foreach my $dir (@includeDirs) { print MAKE "OPTS += -I $dir\n"; }
	foreach my $base (@sourceFilesBase) { print MAKE "MKS += \$(DEBUG)/$base.mk\n"; }

	print MAKE <<TXT;
.PHONY: GENDEP
GENDEP: \$(MKS)
TXT

	my $i = 0;
	foreach my $base(@sourceFilesBase)
	{
		print MAKE <<TXT;
\$(DEBUG)/$base.mk: $sourceFiles[$i]
	\$(COMPILER) \$(OPTS) $sourceFiles[$i] -MF \$(DEBUG)/$base.mk
TXT
		$i++;
	}

	close MAKE;

	my $status = system("make -f $Makefile");
	if ($status != 0) { print "[Error] Failed to generate C dependency\n"; }

	return $status;
}

# gen_cpp_dependency($workingDir, @includeDirs, @sourceFiles);
sub gen_cpp_dependency
{
	my $workingDir = shift(@_);
	my @includeDirs = @{shift(@_)};
	my @sourceFiles = @{shift(@_)};
	my @sourceFilesBase = getBasename(\@sourceFiles, ".cpp");
	
	my $Makefile = "$workingDir/Makefile_gen_cpp_dependency";
	open MAKE, ">$Makefile";

	print MAKE <<TXT;
#******************************************************************************
#	Automatic generated file. Do not modify!
#	CT Pattern Builder v3
#	2082 - Hau Sy Le - hau.le.eb\@renesas.com
#******************************************************************************
DEBUG = $workingDir/debug
COMPILER = $cppCompiler
OPTS += -MM
TXT

	foreach my $dir (@includeDirs) { print MAKE "OPTS += -I $dir\n"; }
	foreach my $base (@sourceFilesBase) { print MAKE "MKS += \$(DEBUG)/$base.mk\n"; }

	print MAKE <<TXT;
.PHONY: GENDEP
GENDEP: \$(MKS)
TXT

	my $i = 0;
	foreach my $base(@sourceFilesBase)
	{
		print MAKE <<TXT;
\$(DEBUG)/$base.mk: $sourceFiles[$i]
	\$(COMPILER) \$(OPTS) $sourceFiles[$i] -MF \$(DEBUG)/$base.mk
TXT
		$i++;
	}

	close MAKE;

	my $status = system("make -f $Makefile");
	if ($status != 0) { print "[Error] Failed to generate C++ dependency\n"; }

	return $status;
}

return 1;
