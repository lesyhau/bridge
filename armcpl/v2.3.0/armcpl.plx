#!/usr/bin/perl
use strict;
use warnings;

my $toolver = "v2.3.0";
my $toolbase = "/mnt/c/Users/lesyh/OneDrive/Documents/Renesas/bridge/armcpl/$toolver";

require "$toolbase/help.plx";
require "$toolbase/notify.plx";

my $date = `date`; chomp $date;
my $pc = `hostname`; chomp $pc;
my $hostIP = "172.29.143.217";
# my $hostName = "rvc-app07";
my $hostName = `hostname`; chomp $hostName;
my $currentHost = `hostname`; chomp $currentHost;
my $user = `whoami`; chomp $user;

my $inDir = `pwd`; chomp $inDir;
my $buildCfg;

my @includePaths;
my $rescusiveSearch = 1;

my @asmFiles;
my @asmFilesBase;
my $asmCPU;
my @asmPredefine;

my @asmGNUFiles;
my @asmGNUFilesBase;
my $asmGNUCPU;
my @asmGNUPredefine;

my @cFiles;
my @cFilesBase;
my $cCPU;
my $cPredefine;
my $cTarget;
my $cOptimizeLevel = 0;

my $scatterFile;
my $firstArea;
my $linkerVia;

my $debug = "$inDir/debug";
my $image = "$inDir/image.bin";

push @includePaths, $inDir;
my $cpuName = "cr52";
my $i;

# Read build configuration file if any
$i = 0;
if (-f "$inDir/build.cfg")
{
	$buildCfg = "$inDir/build.cfg";
    print "[Info] Reading build configuration $buildCfg\n";
	
    open CFG, "<$buildCfg";

    while (<CFG>)
    {
        $i++;

        my @words = split " ", $_;

        if ($words[0] eq "-i")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i, file $buildCfg\n";
                exit;
            }

            $inDir = $words[1]; chomp $inDir;
        }

        elsif ($words[0] eq "-f")
        {
            print "[Warning] -f option will not available from version 2.3.0\n";

            if (! $words[1])
            {
                print "[Error] Syntax error at line $i, file $buildCfg\n";
                exit;
            }

            my $file = $words[1]; chomp $file;
            push @cFiles, $file;
        }

        elsif ($words[0] eq "-cpu")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i, file $buildCfg\n";
                exit;
            }

            $cpuName = $words[1]; chomp $cpuName;
        }

        elsif ($words[0] eq "-optimize")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i, file $buildCfg\n";
                exit;
            }

            $cOptimizeLevel = $words[1]; chomp $cOptimizeLevel;
        }

        elsif ($words[0] eq "-scatter")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i, file $buildCfg\n";
                exit;
            }

            $scatterFile = $words[1]; chomp $scatterFile;
        }

        elsif ($words[0] eq "-include")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i, file $buildCfg\n";
                exit;
            }

            my $includePath = $words[1]; chomp $includePath;
            push @includePaths, $includePath;
        }

        elsif (($words[0] eq "-pd") or ($words[0] eq "--PD"))
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i, file $buildCfg\n";
                exit;
            }

            my $asmPredefine = "";
            for (my $i = 1; $i < (scalar @words); $i++) { $asmPredefine = join " ", $asmPredefine, $words[$i]; }
            push @asmPredefine, $asmPredefine;
        }

        elsif ($words[0] eq "-first")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i, file $buildCfg\n";
                exit;
            }

            $firstArea = $words[1]; chomp $firstArea;
        }

        elsif ($words[0] eq "-via")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i, file $buildCfg\n";
                exit;
            }

            $linkerVia = $words[1]; chomp $linkerVia;
        }

        elsif ($words[0] eq "-roff")
        {
            print "[Warning] Option -roff is currently not supported\n";
            $rescusiveSearch = 0;
        }
    }

    close CFG;
}

# Get input arguments if any
if (@ARGV)
{
    my $args = @ARGV;
    for (my $i = 0; $i < $args; $i++)
    {
        if ($ARGV[$i] eq "-i")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No input directory path. Please specify a valid path after \"-i\"\n";
                exit;
            }

            $inDir = $ARGV[$i+1]; chomp $inDir;
        }

        if ($ARGV[$i] eq "-f")
        {
            print "[Warning] -f option will not available from version 2.3.0\n";

            if (! $ARGV[$i+1])
            {
                print "[Error] No input file path. Please specify a valid path after \"-f\"\n";
                exit;
            }

            my $file = $ARGV[$i+1]; chomp $file;
            push @cFiles, $file;
        }

        if ($ARGV[$i] eq "-cpu")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No CPU name specified. Please specify a valid CPU name after \"-cpu\"\n";
                exit;
            }

            $cpuName = $ARGV[$i+1]; chomp $cpuName;
        }

        if ($ARGV[$i] eq "-optimize")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No code optimize level specified. Please specify a valid optimize level after \"-optimize\"\n";
                exit;
            }

            $cOptimizeLevel = $ARGV[$i+1]; chomp $cOptimizeLevel;
        }

        if ($ARGV[$i] eq "-scatter")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No scatter file specified. Please specify a valid scatter file after \"-scatter\"\n";
                exit;
            }

            $scatterFile = $ARGV[$i+1]; chomp $scatterFile;
        }

        if ($ARGV[$i] eq "-include")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No directory path specified. Please specify a valid path after \"-include\"\n";
                exit;
            }

            my $includePath = $ARGV[$i+1]; chomp $includePath;
            push @includePaths, $includePath;
        }

        if (($ARGV[$i] eq "-pd") or ($ARGV[$i] eq "--PD"))
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No predefine symbol specified. Please specify a valid predefine symbol after \"-pd\"\n";
                exit;
            }

            my $asmPredefine = $ARGV[$i+1]; chomp $asmPredefine;
            push @asmPredefine, $asmPredefine;
        }

        if ($ARGV[$i] eq "-first")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No first area name specified. Please specify a valid area name after \"-first\"\n";
                exit;
            }

            $firstArea = $ARGV[$i+1]; chomp $firstArea;
        }

        if ($ARGV[$i] eq "-via")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No file path specified. Please specify a valid file path after \"-via\"\n";
                exit;
            }

            $linkerVia = $ARGV[$i+1]; chomp $linkerVia;
        }

        if ($ARGV[$i] eq "-roff")
        {
            print "[Warning] Option -roff is currently not supported\n";
            $rescusiveSearch = 0;
        }
        
        if (($ARGV[$i] eq "-h") or ($ARGV[$i] eq "-help") or ($ARGV[$i] eq "--h") or ($ARGV[$i] eq "--help"))
        {
            display_help();
            exit;
        }
    }
}

# Check input directory path
if (! -e $inDir)
{
    print "[Error] No such directory $inDir\n";
    exit;
}

# Check input C source file
foreach my $cFile (@cFiles)
{
    if (! -f $cFile)
    {
        print "[Error] No such file $cFile\n";
        exit;
    }
}

# Check library path
foreach my $includePath (@includePaths)
{
    if (! -d $includePath)
    {
        print "[Error] No such directory $includePath\n";
        exit;
    }
}

# Check linker option file path
my $linkerViaFound = 0;
if ($linkerVia)
{
    if (-f $linkerVia) { $linkerViaFound = 1; }
    else
    {
        foreach my $includePath (@includePaths)
        {
            if (-f "$includePath/$linkerVia")
            {
                $linkerViaFound = 1;
                last;
            }
        }
    }

    if ($linkerViaFound == 0)
    {
        print "[Error] No such file $linkerVia\n";
        exit;
    }
}

# Check if scatter file is specified or not
if ($scatterFile)
{
    my $scatterFileFound = 0;

    # Check if scatter file is exist in the current directory or not
    if (-f $scatterFile) { $scatterFileFound = 1; }
    else
    {
        # Check if scatter file is exist in the include folders or not
        foreach my $includePath (@includePaths)
        {
        	if (-f "$includePath/$scatterFile")
        	{
        		$scatterFile = "$includePath/$scatterFile";
        		$scatterFileFound = 1;
        		last;
        	}
        }
    }

    # Specified scatter file does not exist
    if ($scatterFileFound == 0)
    {
        print "[Error] No such file $scatterFile\n";
        exit;
    }
}
else
{
    if (! $firstArea)
    {
        print "[Error] No first area name specified while there is no scatter file. Please specify a first area name using -first option.\n";
        exit;
    }

	print "[Warning] No scatter file specified.\n";
    print "[Info] Creating a new scatter file...\n";
    $scatterFile = "$inDir/scatter.scat";

    open SCAT, ">$scatterFile";
    print SCAT <<EOF;

;******************************************************************************
;	This file has been generated by Pattern Builder v2
;	2082 - Hau Sy Le - hau.le.eb\@renesas.com
;******************************************************************************
;	File name:		scatter.scat
;	Date created:	$date
;	PC name:		$pc
;	User name:		$user
;******************************************************************************

LR0 0x00000000 0x07ffffff
{
    ;**************************************************************************
    ; BSC0
    ; Total:    64MB
    ; Start:    0x00000000
    ; End:      0x03ffffff
    ;**************************************************************************

    ER0 0x00000000 0x03ffffff
    {
        *($firstArea, +FIRST)
        *(+RO)
        *(+RW, +ZI)
    }

    ARM_LIB_HEAP +0
    {
    }

    ARM_LIB_STACK 0x04000000 EMPTY -0x400
    {
    }

    ;**************************************************************************
    ; BSC1
    ; Total:    64MB
    ; Start:    0x04000000
    ; End:      0x0fffffff
    ;**************************************************************************

    ER1 0x04000000 0x03ffffff
    {
    }
}

EOF

    close SCAT;

    # Add scatter option into the build configuration file
    if (-f $buildCfg)
    {
        open CFG, ">>$buildCfg";
        print CFG "-scatter $scatterFile\n";
        close CFG;
    }
    else
    {
	    $buildCfg = "$inDir/build.cfg";
        open CFG, ">$buildCfg";
    }
    print CFG "-scatter $scatterFile\n";
    print CFG "-optimize 1\n";
    close CFG;
}

print "[Info] Scatter file: $scatterFile\n";

# Decode CPU name
if ($cpuName eq "ca53")
{
    $asmCPU     = "8-A.32";
    $asmGNUCPU  = "cortex-a53";
    $cCPU       = "cortex-a53";
    $cTarget    = "arm-arm-non-eabi";
}
elsif ($cpuName eq "ca57")
{
    $asmCPU     = "cortex-a57";
    $asmGNUCPU  = "cortex-a57";
    $cCPU       = "cortex-a57";
    $cTarget    = "arm-arm-non-eabi";
}
elsif ($cpuName eq "ca76")
{
    $asmCPU     = "cortex-a75";
    $asmGNUCPU  = "cortex-a75";
    $cCPU       = "cortex-a75";
    $cTarget    = "aarch64-arm-non-eabi";
}
elsif ($cpuName eq "enyo_32")
{
    $asmCPU     = "cortex-a75";
    $asmGNUCPU  = "cortex-a75";
    $cCPU       = "cortex-a75";
    $cTarget    = "arm-arm-non-eabi";
}
elsif ($cpuName eq "enyo_64")
{
    $asmCPU     = "cortex-a75";
    $asmGNUCPU  = "cortex-a75";
    $cCPU       = "cortex-a75";
    $cTarget    = "aarch64-arm-non-eabi";
}
elsif ($cpuName eq "cr7")
{
    $asmCPU     = "cortex-r7";
    $asmGNUCPU  = "cortex-r7";
    $cCPU       = "cortex-r7";
    $cTarget    = "arm-arm-non-eabi";
}
elsif ($cpuName eq "cr52")
{
    $asmCPU     = "cortex-r52";
    $asmGNUCPU  = "cortex-r52";
    $cCPU       = "cortex-r52";
    $cTarget    = "arm-arm-non-eabi";
}
else
{
    print "[Error] Not supported CPU name $cpuName\n";
    exit;
}

# Decode C optimize level
if      ($cOptimizeLevel eq "0")     { $cOptimizeLevel = "-O0" }
elsif   ($cOptimizeLevel eq "1")     { $cOptimizeLevel = "-O1" }
elsif   ($cOptimizeLevel eq "2")     { $cOptimizeLevel = "-O2" }
elsif   ($cOptimizeLevel eq "3")     { $cOptimizeLevel = "-O3" }
elsif   ($cOptimizeLevel eq "fast")  { $cOptimizeLevel = "-Ofast" }
elsif   ($cOptimizeLevel eq "s")     { $cOptimizeLevel = "-Os" }
elsif   ($cOptimizeLevel eq "g")     { $cOptimizeLevel = "-Og" }
else
{
    print "[Error] Not supported C optimize level $cOptimizeLevel\n";
    exit;
}

# Get source files
foreach my $includePath (@includePaths) { `ls -R $includePath >> $inDir/files`; }

my $folder;

open FILES, "<$inDir/files";
while (<FILES>)
{
    chomp $_;

    if ($_ =~ /:/)
    {
        my @words = split ":", $_;
        $folder = `readlink -f $words[0]`;
        chomp $folder;
    }

    if (-f "$folder/$_")
    {
        my $file = $_;
        my @words = split (/\./, $file);
        my $ext = pop @words;
        if ($ext eq "c")
        {
            $file = "$folder/$file";
            push @cFiles, $file;
        }
		elsif ($ext eq "s")
        {
            $file = "$folder/$file";

            # Check if the assembly file has AREA directive
            #print "[Info] Checking assembly file $file...\n";

            my $areaFound = 0;
            open ASM, "<$file";

            while (<ASM>)
            {
                if ($_ =~ /area/ or $_ =~ /AREA/)
                {
                    # Split the line by white space to check if the first word is area/AREA
                    my @words = split " ", $_;
                    #print "$words[0]\n";
                    if ($words[0] =~ /\barea/ or $words[0] =~ /\bAREA/)
                    {
                        #print "[Info] AREA directive found\n";
                        $areaFound = 1;
                        last;
                    }
                }
            }

            if ($areaFound == 1) { push @asmFiles, $file; }
        }
		elsif ($ext eq "src")
        {
            $file = "$folder/$file";

            # Check if the assembly file has SECTION directive
            #print "[Info] Checking GNU assembly file $file...\n";

            my $areaFound = 0;
            open ASM, "<$file";

            while (<ASM>)
            {
                if ($_ =~ /section/ or $_ =~ /SECTION/)
                {
                    # Split the line by white space to check if the first word is .section/.SECTION
                    my @words = split " ", $_;
                    if ($words[0] =~ /\.section/ or $words[0] =~ /\.SECTION/)
                    {
                        #print "[Info] SECTION directive found\n";
                        $areaFound = 1;
                        last;
                    }
                }
            }

            if ($areaFound == 1) { push @asmGNUFiles, $file; }
        }
    }
}

close FILES;
`rm -rf $inDir/files`;

# Generate an error if there is no source file
if ((! @cFiles) and (! @asmFiles) and (! @asmGNUFiles))
{
    print "[Error] No source file.\n";
    exit;
}

# Use retarget.c if pattern has C source file and the user doesn't has a retarget file
if (@cFiles)
{
    my $retargetFound = 0;

    foreach my $file (@cFiles)
    {
        if ($file =~ /retarget/)
        {
            $retargetFound = 1;
            last;
        }
    }

    if ($retargetFound == 1) { push @cFiles, "$toolbase/retarget.c"; }
}

# Remove duplicate files
my %hash = map {$_, 1} @cFiles;
@cFiles = keys %hash;

# Remove duplicate files
%hash = map {$_, 1} @asmFiles;
@asmFiles = keys %hash;

# Remove duplicate files
%hash = map {$_, 1} @asmGNUFiles;
@asmGNUFiles = keys %hash;

my $sourceFiles = "$inDir/files.list";
open SRCS, ">$sourceFiles";

foreach my $file (@asmFiles)
{
	my $base = `basename $file .s`; chomp $base;
	push @asmFilesBase, $base;
    print "[Info] Assembly source file: $file\n";
    print SRCS "[Info] Assembly source file: $file\n";
}

foreach my $file (@asmGNUFiles)
{
	my $base = `basename $file .src`; chomp $base;
	push @asmGNUFilesBase, $base;
    print "[Info] GNU assembly source file: $file\n";
    print SRCS "[Info] GNU assembly source file: $file\n";
}

foreach my $file (@cFiles)
{
	my $base = `basename $file .c`; chomp $base;
	push @cFilesBase, $base;
    print "[Info] C source file: $file\n";
    print SRCS "[Info] C source file: $file\n";
}

close SRCS;

# Create debug folder if it does not exist
if (! -d "$debug")
{
    `mkdir $debug`;
    print "[Info] $debug folder has been created\n";
}

#******************************************************************************

open MAKE_DEPS, ">$inDir/makeDeps";

print MAKE_DEPS <<EOF;
#******************************************************************************
#	This file has been generated by Pattern Builder v2
#	2082 - Hau Sy Le - hau.le.eb\@renesas.com
#******************************************************************************
#	File name:		makeDeps
#	Date created:	$date
#	PC name:		$pc
#	User name:		$user
#******************************************************************************

EOF

print MAKE_DEPS <<EOF;
debug = $inDir/debug

EOF

print MAKE_DEPS <<EOF;
cc = arm-none-eabi-gcc
ccOptions += -v

EOF

foreach my $includePath (@includePaths) { print MAKE_DEPS "includePaths += -I $includePath\n"; }
print MAKE_DEPS <<EOF;

EOF

foreach my $fileBase (@cFilesBase) { print MAKE_DEPS "mkfiles += \$(debug)/$fileBase.mk\n"; }
print MAKE_DEPS <<EOF;

EOF

print MAKE_DEPS <<EOF;
.PHONY: gen_mk_files
gen_mk_files: \$(mkfiles)

EOF

$i = 0;
foreach my $fileBase (@cFilesBase)
{
	print MAKE_DEPS <<EOF;
\$(debug)/$fileBase.mk: $cFiles[$i]
	\$(cc) \$(ccOptions) \$(includePaths) $cFiles[$i++] -MM -MF \$(debug)/$fileBase.mk

EOF
}

close MAKE_DEPS;

#******************************************************************************

my $cmdDeps = "$inDir/cmd_deps.csh";
open CMD_DEPS, ">$cmdDeps";

print CMD_DEPS <<EOF;
#!/bin/csh -f

#******************************************************************************
#	This file has been generated by Pattern Builder v2
#	2082 - Hau Sy Le - hau.le.eb\@renesas.com
#******************************************************************************
#	File name:		cmd_deps.csh
#	Date created:	$date
#	PC name:		$pc
#	User name:		$user
#******************************************************************************

EOF

print CMD_DEPS <<EOF;
cd $inDir
make -f makeDeps

EOF

close CMD_DEPS;
`chmod 755 $cmdDeps`;

# Generate mk files
if (@cFiles)
{
    if ($currentHost eq $hostName) { system("$cmdDeps | tee -a $inDir/build.log"); }
    else { system("/usr/bin/ssh $hostIP $cmdDeps | tee -a $inDir/build.log"); }
}

#******************************************************************************

open MAKE, ">$inDir/makeCompile";

print MAKE <<EOF;
#******************************************************************************
#	This file has been generated by Pattern Builder v2
#	2082 - Hau Sy Le - hau.le.eb\@renesas.com
#******************************************************************************
#	File name:		makeCompile
#	Date created:	$date
#	PC name:		$pc
#	User name:		$user
#******************************************************************************

EOF

# Outputs
print MAKE <<EOF;
# Outputs
debug = $debug
image.bin = $image

EOF

# # armasm options
# print MAKE <<EOF;
# # Assembler options
# asmc = arm-none-eabi-as
# asmcOptions += -mlittle-endian
# asmcOptions += -mcpu=$asmCPU
# EOF
# foreach my $includePath (@includePaths) { print MAKE "asmcOptions += -I $includePath\n"; }
# foreach my $asmPredefine (@asmPredefine) { print MAKE "asmcOptions += --defsym $asmPredefine\n"; }
# print MAKE <<EOF;

# EOF

# armasmGNU options
print MAKE <<EOF;
# GNU Assembler options
asmGNUc = arm-none-eabi-as
asmGNUcOptions += -mlittle-endian
asmGNUcOptions += -mcpu=$asmCPU
asmGNUcOptions += -mfpu=vfpv3-d16
EOF
foreach my $includePath (@includePaths) { print MAKE "asmGNUcOptions += -I $includePath\n"; }
foreach my $asmPredefine (@asmPredefine) { print MAKE "asmGNUcOptions += --defsym $asmPredefine\n"; }
print MAKE <<EOF;

EOF

# armclang options
print MAKE <<EOF;
# C compiler options
cc = arm-none-eabi-gcc
ccOptions += -mlittle-endian
ccOptions += -v
ccOptions += -c
ccOptions += -mcpu=$cCPU
ccOptions += $cOptimizeLevel
EOF
foreach my $includePath (@includePaths) { print MAKE "ccOptions += -I $includePath\n"; }
foreach my $asmPredefine (@asmPredefine) { print MAKE "ccOptions += -D $asmPredefine\n"; }
print MAKE <<EOF;

EOF

# # armlink options
# print MAKE <<EOF;
# # Linker options
# linker = arm-none-eabi-ld
# lopts += --map
# lopts += --remove
# lopts += --info=unused
# lopts += --datacompressor off
# lopts += --entry=0x00000000
# lopts += --scatter=$scatterFile
# lopts += --errors=error.log
# EOF
# if ($linkerViaFound) { print MAKE "lopts += --via=$linkerVia\n"; }
# print MAKE <<EOF;

# EOF

# # fromelf options
# print MAKE <<EOF;
# # Image extracting options
# fromelf = arm-none-eabi-readelf
# elfbinopts += --m32
# elflstopts += --text
# elflstopts += -cdvtgsw
# elfasmcOptions += --disassemble
# elfasmcOptions += --cpu=$asmCPU

# EOF

# Object files
print MAKE <<EOF;
# Object files
EOF
foreach my $fileBase (@cFilesBase) { print MAKE "oFiles += \$(debug)/$fileBase.o\n"; }
# foreach my $fileBase (@asmFilesBase) { print MAKE "oFiles += \$(debug)/$fileBase.o\n"; }
foreach my $fileBase (@asmGNUFilesBase) { print MAKE "oFiles += \$(debug)/$fileBase.o\n"; }
print MAKE <<EOF;

EOF

# Run all rules
print MAKE <<EOF;
# All rules will be called here
.PHONY: build
#build: \$(debug) \$(oFiles) \$(debug)/image.elf image.bin \$(debug)/image.lst \$(debug)/image.asm clean
build: \$(debug) \$(oFiles) clean

EOF

# Remove debug folder and image.bin if the scatter file changes
print MAKE <<EOF;
# Remove debug folder and image.bin if the scatter file changes
\$(debug): \\
  $scatterFile
	rm -rf \$(debug)
	rm -rf \$(image.bin)
	\@echo [Info] \$(debug) and \$(image.bin) has been removed because your scatter file has been changed.
	mkdir \$(debug)
	\@echo [Info] \$(debug) folder has been created.
    
EOF

# # Compile asm source file
# $i = 0;
# foreach my $fileBase (@asmFilesBase)
# {
# 	print MAKE <<EOF;
# \$(debug)/$fileBase.o: \\
#  $asmFiles[$i] \\
#  $buildCfg
# 	\@echo [Info] Compiling $asmFiles[$i]...
# 	\$(asmc) \$(asmcOptions) -alms=$asmFilesBase[$i].list  $asmFiles[$i]
# 	\@echo [Info] Collecting object file $asmFilesBase[$i++].o...
# 	mv -f *.o \$(debug)
# 	mv -f *.list \$(debug)

# EOF
# }

# Compile asmGNU source file
$i = 0;
foreach my $fileBase (@asmGNUFilesBase)
{
	print MAKE <<EOF;
\$(debug)/$fileBase.o: \\
 $asmGNUFiles[$i] \\
 $buildCfg
	\@echo [Info] Compiling $asmGNUFiles[$i]...
	\$(asmGNUc) \$(asmGNUcOptions) -alms=$asmGNUFilesBase[$i].list -o $asmGNUFilesBase[$i].o $asmGNUFiles[$i]
	\@echo [Info] Collecting object file $asmGNUFilesBase[$i++].o...
	mv -f *.o \$(debug)
	mv -f *.list \$(debug)

EOF
}

# Compile C source file
$i = 0;
foreach my $fileBase (@cFilesBase)
{
	print MAKE "\$(debug)/";
	open DEP, "<$inDir/debug/$fileBase.mk";
	while (<DEP>)
	{
		chomp $_;
		my @words = split /\\/, $_;
		print MAKE <<EOF;
$words[0] \\
EOF
	}
	print MAKE <<EOF;
  $buildCfg
	\@echo [Info] Compiling $cFiles[$i]...
	\$(cc) \$(ccOptions) $cFiles[$i]
	\@echo [Info] Collecting object file $cFilesBase[$i++].o...
	mv -f *.o \$(debug)

EOF
}

## Linking
#print MAKE <<EOF;
## Link object files into a sigle image
#\$(debug)/image.elf: \\
#  \$(oFiles) \\
#  $buildCfg \\
#  $scatterFile
#	\@echo [Info] Linking object files...
#	\$(linker) \$(lopts) \$(oFiles) --output=image.elf
#	\@echo [Info] Object files has been linked successfully.
#	mv -f image.elf \$(debug)
#
#EOF
#
## Create binary file
#if ($cTarget eq "arm-arm-non-eabi")
#{
#	print MAKE <<EOF;
## Generate binary file
#image.bin: \\
#  \$(debug)/image.elf
#	\@echo [Info] Creating binary file...
#	\$(fromelf) \$(elfbinopts) \$(debug)/image.elf --output=image.bin
#	\@echo [Info] Binary file has been generated successfully.
#
#EOF
#}
#elsif ($cTarget eq "aarch64-arm-non-eabi")
#{
#	print MAKE <<EOF;
## Generate binary file
#image.bin: \\
#  \$(debug)/image.elf
#	\@echo [Info] Generating binary file...
#	objcopy --srec-forceS3 -I elf64-little -O srec \$(debug)/image.elf image.bin
#	\@echo [Info] Binary file has been generated successfully.
#
#EOF
#}
#
## Create memory map
#print MAKE <<EOF;
## Generate memory map file
#\$(debug)/image.lst: \\
#  \$(debug)/image.elf
#	\@echo [Info] Listing memory map...
#	\$(fromelf) \$(elflstopts) \$(debug)/image.elf --output=image.lst
#	\@echo [Info] Memory map has been listed successfully.
#	mv -f *.lst \$(debug)
#
#EOF
#
## Disassembling
#print MAKE <<EOF;
## Disassembling
#\$(debug)/image.asm: \\
#  \$(debug)/image.elf
#	\@echo [Info] Disassembling...
#	\$(fromelf) \$(elfasmcOptions) \$(debug)/image.elf --output=image.asm
#	\@echo [Info] Disassembled successfully.
#	mv -f *.asm \$(debug)
#
#EOF

# Cleaning
print MAKE <<EOF;
# Clean temporary files
.PHONY: clean
clean:
	\@echo [Info] Cleanning temporary files...
	mv -f make* \$(debug)
	mv -f *.csh \$(debug)
	mv -f *.log \$(debug)
	date
	\@echo [Info] '**** Build finished successfully ****'
EOF

close MAKE;

#******************************************************************************

my $cmdCompile = "$inDir/cmd_compile.csh";
open CMD_COMPILE, ">$cmdCompile";

print CMD_COMPILE <<EOF;
#!/bin/csh -f

#******************************************************************************
#	This file has been generated by C Pattern Builder v2
#	2082 - Hau Sy Le - hau.le.eb\@renesas.com
#******************************************************************************
#	File name:		cmd_compile.csh
#	Date created:	$date
#	PC name:		$pc
#	User name:		$user
#******************************************************************************

# setenv ARMLMD_LICENSE_FILE 8224\@klcg01,8224\@klcg02,8224\@klcg03:8224\@mlcg01,8224\@mlcg02,8224\@mlcg03
# setenv ARM_TOOL_VARIANT ult
# setenv ARM_PRODUCT_PATH /common/appl/ARM/DS500-BN-00019-r5p0-28rel1/sw/mappings
# setenv PATH /common/appl/ARM/DS500-BN-00019-r5p0-28rel1/sw/ARMCompiler6.9/bin/:\$PATH
# setenv PATH /common/appl/gcc-4.5.2-64bit/:\$PATH

EOF

print CMD_COMPILE <<EOF;
cd $inDir
make -f makeCompile

EOF

close CMD_COMPILE;

`chmod 755 $cmdCompile`;

if ($currentHost eq $hostName) { exec("$cmdCompile | tee -a $inDir/build.log"); }
else { exec("/usr/bin/ssh $hostIP $cmdCompile | tee -a $inDir/build.log"); }

#******************************************************************************

# armasm --cpu=list
# The following arguments to option 'cpu' can be selected:
#  --cpu=6-M
#  --cpu=6S-M
#  --cpu=7-A
#  --cpu=7-R
#  --cpu=7-M
#  --cpu=7E-M
#  --cpu=7-A.security
#  --cpu=8-R
#  --cpu=8-R.no_neon
#  --cpu=8-R.crypto
#  --cpu=8-M.Base
#  --cpu=8-M.Main
#  --cpu=8-M.Main.dsp
#  --cpu=8-A.32
#  --cpu=8-A.32.no_neon
#  --cpu=8-A.64
#  --cpu=8-A.32.crypto
#  --cpu=8-A.64.crypto
#  --cpu=8.1-A.32
#  --cpu=8.1-A.64
#  --cpu=8.1-A.32.crypto
#  --cpu=8.1-A.64.crypto
#  --cpu=8.2-A.32
#  --cpu=8.2-A.64
#  --cpu=8.2-A.32.crypto
#  --cpu=8.2-A.64.crypto
#  --cpu=8.2-A.32.dotprod
#  --cpu=8.2-A.64.dotprod
#  --cpu=8.2-A.32.crypto.dotprod
#  --cpu=8.2-A.64.crypto.dotprod
#  --cpu=8.3-A.32
#  --cpu=8.3-A.64
#  --cpu=8.3-A.32.crypto
#  --cpu=8.3-A.64.crypto
#  --cpu=8.3-A.32.dotprod
#  --cpu=8.3-A.64.dotprod
#  --cpu=8.3-A.32.crypto.dotprod
#  --cpu=8.3-A.64.crypto.dotprod
#  --cpu=Cortex-M0
#  --cpu=Cortex-M0plus
#  --cpu=SC000
#  --cpu=Cortex-M1
#  --cpu=Cortex-M1.os_extension
#  --cpu=Cortex-M1.no_os_extension
#  --cpu=Cortex-M3
#  --cpu=Cortex-M3-rev0
#  --cpu=SC300
#  --cpu=Cortex-M4
#  --cpu=Cortex-M4.no_fp
#  --cpu=Cortex-M7
#  --cpu=Cortex-M7.fp.sp
#  --cpu=Cortex-M7.no_fp
#  --cpu=Cortex-M23
#  --cpu=Cortex-M33
#  --cpu=Cortex-M33.no_fp
#  --cpu=Cortex-M33.no_dsp
#  --cpu=Cortex-M33.no_dsp.no_fp
#  --cpu=Cortex-R4
#  --cpu=Cortex-R4F
#  --cpu=Cortex-R5
#  --cpu=Cortex-R5.sp
#  --cpu=Cortex-R5.no_vfp
#  --cpu=Cortex-R7
#  --cpu=Cortex-R7.no_vfp
#  --cpu=Cortex-R8
#  --cpu=Cortex-R8.no_vfp
#  --cpu=Cortex-R52
#  --cpu=Cortex-R52.no_neon
#  --cpu=Cortex-R52.no_ras
#  --cpu=Cortex-R52.no_neon.no_ras
#  --cpu=Cortex-R52.crypto
#  --cpu=Cortex-R52.crypto.no_ras
#  --cpu=Cortex-A5
#  --cpu=Cortex-A5.no_neon
#  --cpu=Cortex-A5.no_neon.no_vfp
#  --cpu=Cortex-A7
#  --cpu=Cortex-A7.no_neon
#  --cpu=Cortex-A7.no_neon.no_vfp
#  --cpu=Cortex-A8
#  --cpu=Cortex-A8.no_neon
#  --cpu=Cortex-A8NoNEON
#  --cpu=Cortex-A9
#  --cpu=Cortex-A9.no_neon
#  --cpu=Cortex-A9.no_neon.no_vfp
#  --cpu=Cortex-A12
#  --cpu=Cortex-A12.no_neon.no_vfp
#  --cpu=Cortex-A15
#  --cpu=Cortex-A15.no_neon
#  --cpu=Cortex-A15.no_neon.no_vfp
#  --cpu=Cortex-A17
#  --cpu=Cortex-A17.no_neon.no_vfp

# armclang --cTarget=arm-arm-non-eabi -mcpu=list
# The following arguments to option 'mcpu' can be selected:
#   -mcpu=cortex-a5
#   -mcpu=cortex-a7
#   -mcpu=cortex-a8
#   -mcpu=cortex-a9
#   -mcpu=cortex-a12
#   -mcpu=cortex-a15
#   -mcpu=cortex-a17
#   -mcpu=cortex-a32
#   -mcpu=cortex-a35
#   -mcpu=cortex-a53
#   -mcpu=cortex-a55
#   -mcpu=cortex-a57
#   -mcpu=cortex-a72
#   -mcpu=cortex-a73
#   -mcpu=cortex-a75
#   -mcpu=cortex-m0
#   -mcpu=cortex-m0plus
#   -mcpu=cortex-m1
#   -mcpu=cortex-m3
#   -mcpu=cortex-m4
#   -mcpu=cortex-m7
#   -mcpu=cortex-m23
#   -mcpu=cortex-m33
#   -mcpu=cortex-r4
#   -mcpu=cortex-r4f
#   -mcpu=cortex-r5
#   -mcpu=cortex-r7
#   -mcpu=cortex-r8
#   -mcpu=cortex-r52
#   -mcpu=sc000
#   -mcpu=sc300

# armclang --cTarget=aarch64-arm-non-eabi -mcpu=list
# The following arguments to option 'mcpu' can be selected:
#   -mcpu=cortex-a35
#   -mcpu=cortex-a53
#   -mcpu=cortex-a55
#   -mcpu=cortex-a57
#   -mcpu=cortex-a72
#   -mcpu=cortex-a73
#   -mcpu=cortex-a75

# fromelf --cpu=list
# The following arguments to option 'cpu' can be selected:
#  --cpu=6-M
#  --cpu=6S-M
#  --cpu=7-A
#  --cpu=7-R
#  --cpu=7-M
#  --cpu=7E-M
#  --cpu=7-A.security
#  --cpu=8-R
#  --cpu=8-R.no_neon
#  --cpu=8-R.crypto
#  --cpu=8-M.Base
#  --cpu=8-M.Main
#  --cpu=8-M.Main.dsp
#  --cpu=8-A.32
#  --cpu=8-A.32.no_neon
#  --cpu=8-A.64
#  --cpu=8-A.32.crypto
#  --cpu=8-A.64.crypto
#  --cpu=8.1-A.32
#  --cpu=8.1-A.64
#  --cpu=8.1-A.32.crypto
#  --cpu=8.1-A.64.crypto
#  --cpu=8.2-A.32
#  --cpu=8.2-A.64
#  --cpu=8.2-A.32.crypto
#  --cpu=8.2-A.64.crypto
#  --cpu=8.2-A.32.dotprod
#  --cpu=8.2-A.64.dotprod
#  --cpu=8.2-A.32.crypto.dotprod
#  --cpu=8.2-A.64.crypto.dotprod
#  --cpu=8.3-A.32
#  --cpu=8.3-A.64
#  --cpu=8.3-A.32.crypto
#  --cpu=8.3-A.64.crypto
#  --cpu=8.3-A.32.dotprod
#  --cpu=8.3-A.64.dotprod
#  --cpu=8.3-A.32.crypto.dotprod
#  --cpu=8.3-A.64.crypto.dotprod
#  --cpu=Cortex-M0
#  --cpu=Cortex-M0plus
#  --cpu=SC000
#  --cpu=Cortex-M1
#  --cpu=Cortex-M1.os_extension
#  --cpu=Cortex-M1.no_os_extension
#  --cpu=Cortex-M3
#  --cpu=Cortex-M3-rev0
#  --cpu=SC300
#  --cpu=Cortex-M4
#  --cpu=Cortex-M4.no_fp
#  --cpu=Cortex-M7
#  --cpu=Cortex-M7.fp.sp
#  --cpu=Cortex-M7.no_fp
#  --cpu=Cortex-M23
#  --cpu=Cortex-M33
#  --cpu=Cortex-M33.no_fp
#  --cpu=Cortex-M33.no_dsp
#  --cpu=Cortex-M33.no_dsp.no_fp
#  --cpu=Cortex-R4
#  --cpu=Cortex-R4F
#  --cpu=Cortex-R5
#  --cpu=Cortex-R5.sp
#  --cpu=Cortex-R5.no_vfp
#  --cpu=Cortex-R7
#  --cpu=Cortex-R7.no_vfp
#  --cpu=Cortex-R8
#  --cpu=Cortex-R8.no_vfp
#  --cpu=Cortex-R52
#  --cpu=Cortex-R52.no_neon
#  --cpu=Cortex-R52.no_ras
#  --cpu=Cortex-R52.no_neon.no_ras
#  --cpu=Cortex-R52.crypto
#  --cpu=Cortex-R52.crypto.no_ras
#  --cpu=Cortex-A5
#  --cpu=Cortex-A5.no_neon
#  --cpu=Cortex-A5.no_neon.no_vfp
#  --cpu=Cortex-A7
#  --cpu=Cortex-A7.no_neon
#  --cpu=Cortex-A7.no_neon.no_vfp
#  --cpu=Cortex-A8
#  --cpu=Cortex-A8.no_neon
#  --cpu=Cortex-A8NoNEON
#  --cpu=Cortex-A9
#  --cpu=Cortex-A9.no_neon
#  --cpu=Cortex-A9.no_neon.no_vfp
#  --cpu=Cortex-A12
#  --cpu=Cortex-A12.no_neon.no_vfp
#  --cpu=Cortex-A15
#  --cpu=Cortex-A15.no_neon
#  --cpu=Cortex-A15.no_neon.no_vfp
#  --cpu=Cortex-A17
#  --cpu=Cortex-A17.no_neon.no_vfp
# 
