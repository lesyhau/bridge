#!/usr/bin/perl
use strict;
use warnings;

my $toolver = "v2.2.4b";
my $toolbase = "/mnt/c/Users/lesyh/OneDrive/Documents/Renesas/bridge/i2c_v3u/sample/armcpl/$toolver";

require "$toolbase/help.plx";
require "$toolbase/notify.plx";

my $date = `date`; chomp $date;
my $pc = `hostname`; chomp $pc;
my $hostIP = "172.29.143.217";
# my $hostName = "rvc-app07";
my $hostName = `hostname`; chomp $hostName;
my $currentHost = `hostname`; chomp $currentHost;
print "[Info] Current host: $currentHost\n";
my $user = `whoami`; chomp $user;

my $inDir = `pwd`; chomp $inDir;
my $cfg = "";
my $scatter;
my $scatterFound = 0;
my $first;
my $via;
my $viaFound = 0;
my $rescusive = 1;

my @asmFiles;
my @asmFilesBase;
my $asmCPU;

my @asmGNUFiles;
my @asmGNUFilesBase;
my $asmGNUCPU;

my @cFiles;
my @cFilesBase;
my $cCPU;

my @incs;
my $cTarget;
my $cOptimize = 0;
my @pds;

my $debug;
my $image;

my $i;

push @incs, $inDir;
my $cpu = "cr52";

# Get build configuration file
$i = 0;
if (-f "$inDir/build.cfg")
{
	$cfg = "$inDir/build.cfg";
    print "[Info] Reading build configuration $cfg\n";
	
    open CFG, "<$cfg";
    while (<CFG>)
    {
        $i++;

        my @words = split " ", $_;

        if ($words[0] eq "-i")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i\n";
                exit;
            }

            $inDir = $words[1]; chomp $inDir;
        }
        elsif ($words[0] eq "-f")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i\n";
                exit;
            }

            my $file = $words[1]; chomp $file;
            push @cFiles, $file;
        }
        elsif ($words[0] eq "-cpu")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i\n";
                exit;
            }

            $cpu = $words[1]; chomp $cpu;
        }
        elsif ($words[0] eq "-optimize")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i\n";
                exit;
            }

            $cOptimize = $words[1]; chomp $cOptimize;
        }
        elsif ($words[0] eq "-scatter")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i\n";
                exit;
            }

            $scatter = $words[1]; chomp $scatter;
        }
        elsif ($words[0] eq "-include")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i\n";
                exit;
            }

            my $inc = $words[1]; chomp $inc;
            push @incs, $inc;
        }
        elsif (($words[0] eq "-pd") or ($words[0] eq "--PD"))
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i\n";
                exit;
            }

            my $pd = "";
            for (my $i = 1; $i < (scalar @words); $i++) { $pd = join " ", $pd, $words[$i]; }
            push @pds, $pd;
        }
        elsif ($words[0] eq "-first")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i\n";
                exit;
            }

            $first = $words[1]; chomp $first;
        }
        elsif ($words[0] eq "-via")
        {
            if (! $words[1])
            {
                print "[Error] Syntax error at line $i\n";
                exit;
            }

            $via = $words[1]; chomp $via;
        }
        elsif ($words[0] eq "-roff")
        {
            print "[Warning] Option -roff is currently not supported\n";
            $rescusive = 0;
        }
    }
}

# Get input arguments
if (@ARGV)
{
    my $args = @ARGV;
    for (my $i = 0; $i < $args; $i++)
    {
        # Get input directory path
        if ($ARGV[$i] eq "-i")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No input directory path. Please specify a valid path after \"-i\"\n";
                exit;
            }

            $inDir = $ARGV[$i+1]; chomp $inDir;
        }

        # Get input file path
        if ($ARGV[$i] eq "-f")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No input file path. Please specify a valid path after \"-f\"\n";
                exit;
            }

            my $file = $ARGV[$i+1]; chomp $file;
            push @cFiles, $file;
        }

        # Get CPU name
        if ($ARGV[$i] eq "-cpu")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No CPU name specified. Please specify a valid CPU name after \"-cpu\"\n";
                exit;
            }

            $cpu = $ARGV[$i+1]; chomp $cpu;
        }

        # Get code optimizing level
        if ($ARGV[$i] eq "-optimize")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No code optimize level specified. Please specify a valid optimize level after \"-optimize\"\n";
                exit;
            }

            $cOptimize = $ARGV[$i+1]; chomp $cOptimize;
        }

        # Get scatter file
        if ($ARGV[$i] eq "-scatter")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No scatter file specified. Please specify a valid scatter file after \"-scatter\"\n";
                exit;
            }

            $scatter = $ARGV[$i+1]; chomp $scatter;
        }

        # Get library path
        if ($ARGV[$i] eq "-include")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No directory path specified. Please specify a valid path after \"-include\"\n";
                exit;
            }

            my $inc = $ARGV[$i+1]; chomp $inc;
            push @incs, $inc;
        }

        if (($ARGV[$i] eq "-pd") or ($ARGV[$i] eq "--PD"))
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No directory path specified. Please specify a valid path after \"-pd\"\n";
                exit;
            }

            my $pd = $ARGV[$i+1]; chomp $pd;
            push @pds, $pd;
        }

        # Display help
        if (($ARGV[$i] eq "-h") or ($ARGV[$i] eq "-help") or ($ARGV[$i] eq "--h") or ($ARGV[$i] eq "--help"))
        {
            display_help();
            exit;
        }

        # Get first area name
        if ($ARGV[$i] eq "-first")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No area name specified. Please specify a valid area name after \"-first\"\n";
                exit;
            }

            $first = $ARGV[$i+1]; chomp $first;
        }

        # Get additional linker option
        if ($ARGV[$i] eq "-via")
        {
            if (! $ARGV[$i+1])
            {
                print "[Error] No file path specified. Please specify a valid file path after \"-via\"\n";
                exit;
            }

            $via = $ARGV[$i+1]; chomp $via;
        }

        # Disable rescusive searching
        if ($ARGV[$i] eq "-roff")
        {
            print "[Warning] Option -roff is currently not supported\n";
            $rescusive = 0;
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
foreach my $inc (@incs)
{
    if (! -d $inc)
    {
        print "[Error] No such directory $inc\n";
        exit;
    }
}

# Check linker option file path
if ($via)
{
    if (-f $via)
    {
        $viaFound = 1;
    }
    else
    {
        foreach my $inc (@incs)
        {
            if (-f "$inc/$via")
            {
                $viaFound = 1;
                last;
            }
        }
    }

    if ($viaFound == 0)
    {
        print "[Error] No such file $via\n";
        exit;
    }
}

# Check if scatter file is specified or not
if ($scatter)
{
    # Check if scatter file is exist in the current directory or not
    if (-f $scatter)
    {
        $scatterFound = 1;
    }
    else
    {
        # Check if scatter file is exist in the include folders or not
        foreach my $inc (@incs)
        {
        	if (-f "$inc/$scatter")
        	{
        		$scatter = "$inc/$scatter";
        		$scatterFound = 1;
        		last;
        	}
        }
    }

    # Specified scatter file does not exist
    if ($scatterFound == 0)
    {
        print "[Error] No such file $scatter\n";
        exit;
    }
}
else
{
    if (! $first)
    {
        print "[Error] No first area name specified while there is no scatter file. Please specify a first area name using -first <name> option.\n";
        exit;
    }

	print "[Warning] No scatter file specified.\n";
    print "[Info] Creating a new scatter file...\n";
    $scatter = "$inDir/scatter.scat";

    open SCAT, ">$scatter";
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
        *($first, +FIRST)
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
    if (-f $cfg)
    {
        open CFG, ">>$cfg";
        print CFG "-scatter $scatter\n";
        close CFG;
    }
    else
    {
	    $cfg = "$inDir/build.cfg";
        open CFG, ">$cfg";
    }
    print CFG "-scatter $scatter\n";
    close CFG;
}

print "[Info] Scatter file: $scatter\n";

# Decode CPU name
if ($cpu eq "ca53")
{
    $asmCPU = "8-A.32";
    $asmGNUCPU = "cortex-a53";
    $cCPU = "cortex-a53";
    $cTarget = "arm-arm-non-eabi";
}
elsif ($cpu eq "ca57")
{
    $asmCPU = "cortex-a57";
    $asmGNUCPU = "cortex-a57";
    $cCPU = "cortex-a57";
    $cTarget = "arm-arm-non-eabi";
}
elsif ($cpu eq "ca76")
{
    $asmCPU = "cortex-a75";
    $asmGNUCPU = "cortex-a75";
    $cCPU = "cortex-a75";
    $cTarget = "aarch64-arm-non-eabi";
}
elsif ($cpu eq "enyo_32")
{
    $asmCPU = "cortex-a75";
    $asmGNUCPU = "cortex-a75";
    $cCPU = "cortex-a75";
    $cTarget = "arm-arm-non-eabi";
}
elsif ($cpu eq "enyo_64")
{
    $asmCPU = "cortex-a75";
    $asmGNUCPU = "cortex-a75";
    $cCPU = "cortex-a75";
    $cTarget = "aarch64-arm-non-eabi";
}
elsif ($cpu eq "cr7")
{
    $asmCPU = "cortex-r7";
    $asmGNUCPU = "cortex-r7";
    $cCPU = "cortex-r7";
    $cTarget = "arm-arm-non-eabi";
}
elsif ($cpu eq "cr52")
{
    $asmCPU = "cortex-r52";
    $asmGNUCPU = "cortex-r52";
    $cCPU = "cortex-r52";
    $cTarget = "arm-arm-non-eabi";
}
else
{
    print "[Error] Not supported CPU name $cpu\n";
    exit;
}

# Decode C optimize level
if      ($cOptimize eq "0")     { $cOptimize = "-O0" }
elsif   ($cOptimize eq "1")     { $cOptimize = "-O1" }
elsif   ($cOptimize eq "2")     { $cOptimize = "-O2" }
elsif   ($cOptimize eq "3")     { $cOptimize = "-O3" }
elsif   ($cOptimize eq "fast")  { $cOptimize = "-Ofast" }
elsif   ($cOptimize eq "s")     { $cOptimize = "-Os" }
elsif   ($cOptimize eq "g")     { $cOptimize = "-Og" }
else
{
    print "[Error] Not supported C optimize level $cOptimize\n";
    exit;
}

# Get source files
foreach my $inc (@incs) { `ls -R $inc >> $inDir/files`; }

my $folder;
my $file;;

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
        $file = $_;
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

            if ($areaFound == 1)
            {
                push @asmFiles, $file;
            }
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
                    if ($words[0] =~ /\b\.section/ or $words[0] =~ /\b\.SECTION/)
                    {
                        #print "[Info] SECTION directive found\n";
                        $areaFound = 1;
                        last;
                    }
                }
            }

            if ($areaFound == 1)
            {
                push @asmGNUFiles, $file;
            }
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

# Use retarget.c if pattern has C source file
# and the user doesn't has a retarget file
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

foreach my $file (@asmFiles)
{
	my $base = `basename $file .s`; chomp $base;
	push @asmFilesBase, $base;
    print "[Info] Assembly source file: $file\n";
}

foreach my $file (@asmGNUFiles)
{
	my $base = `basename $file .src`; chomp $base;
	push @asmGNUFilesBase, $base;
    print "[Info] GNU assembly source file: $file\n";
}

foreach my $file (@cFiles)
{
	my $base = `basename $file .c`; chomp $base;
	push @cFilesBase, $base;
    print "[Info] C source file: $file\n";
}

$debug = "$inDir/debug";
$image = "$inDir/image.bin";

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
cc = gcc
copts += -v
copts += -mlittle-endian
copts += $cOptimize
copts += --target=$cTarget
copts += -mcpu=$cCPU
copts += -c

EOF

foreach my $inc (@incs) { print MAKE_DEPS "incs += -I $inc\n"; }
print MAKE_DEPS <<EOF;

EOF

foreach my $fileBase (@cFilesBase) { print MAKE_DEPS "mkfiles += \$(debug)/$fileBase.mk\n"; }
print MAKE_DEPS <<EOF;

EOF

print MAKE_DEPS <<EOF;
.PHONY: gen_mk_files
gen_mk_files: \$(debug) \$(mkfiles)

EOF

print MAKE_DEPS <<EOF;
\$(debug):
	mkdir \$(debug)
	\@echo [Info] \$(debug) has been created.

EOF

$i = 0;
foreach my $fileBase (@cFilesBase)
{
	print MAKE_DEPS <<EOF;
\$(debug)/$fileBase.mk: $cFiles[$i]
	\$(cc) \$(copts) \$(incs) $cFiles[$i++] -MM -MF \$(debug)/$fileBase.mk

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

# setenv ARMLMD_LICENSE_FILE 8224\@klcg01,8224\@klcg02,8224\@klcg03:8224\@mlcg01,8224\@mlcg02,8224\@mlcg03
# setenv ARM_TOOL_VARIANT ult
# setenv ARM_PRODUCT_PATH /common/appl/ARM/DS500-BN-00019-r5p0-28rel1/sw/mappings
# setenv PATH /common/appl/ARM/DS500-BN-00019-r5p0-28rel1/sw/ARMCompiler6.9/bin/:\$PATH
# setenv PATH /common/appl/gcc-4.5.2-64bit/:\$PATH

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

exit;

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

# armasm options
print MAKE <<EOF;
# Assembler options
asmc = armasm
asmopts += -m
asmopts += --littleend
asmopts += --cpu=$asmCPU
EOF
foreach my $inc (@incs) { print MAKE "asmopts += -I $inc\n"; }
foreach my $pd (@pds) { print MAKE "asmopts += --predefine $pd\n"; }
print MAKE <<EOF;

EOF

# armasmGNU options
print MAKE <<EOF;
# Assembler options
asmGNUc = armclang
asmGNUopts += --verbose
asmGNUopts += -mlittle-endian
asmGNUopts += $cOptimize
asmGNUopts += --target=$cTarget
asmGNUopts += -mcpu=$asmGNUCPU
asmGNUopts += -c
asmGNUopts += -xassembler
EOF
foreach my $inc (@incs) { print MAKE "asmGNUopts += -I $inc\n"; }
print MAKE <<EOF;

EOF

# armclang options
print MAKE <<EOF;
# C compiler options
cc = armclang
copts += --verbose
copts += -mlittle-endian
copts += -c
copts += $cOptimize
copts += --target=$cTarget
copts += -mcpu=$cCPU
EOF
foreach my $inc (@incs) { print MAKE "copts += -I $inc\n"; }
print MAKE <<EOF;

EOF

# armlink options
print MAKE <<EOF;
# Linker options
linker = armlink
lopts += --map
lopts += --remove
lopts += --info=unused
lopts += --datacompressor off
lopts += --entry=0x00000000
lopts += --scatter=$scatter
lopts += --errors=error.log
EOF
if ($viaFound) { print MAKE "lopts += --via=$via\n"; }
print MAKE <<EOF;

EOF

# fromelf options
print MAKE <<EOF;
# Image extracting options
fromelf = fromelf
elfbinopts += --m32
elflstopts += --text
elflstopts += -cdvtgsw
elfasmopts += --disassemble
elfasmopts += --cpu=$asmCPU

EOF

# Object files
print MAKE <<EOF;
# Object files
EOF
foreach my $fileBase (@cFilesBase) { print MAKE "oFiles += \$(debug)/$fileBase.o\n"; }
foreach my $fileBase (@asmFilesBase) { print MAKE "oFiles += \$(debug)/$fileBase.o\n"; }
foreach my $fileBase (@asmGNUFilesBase) { print MAKE "oFiles += \$(debug)/$fileBase.o\n"; }
print MAKE <<EOF;

EOF

# Run all rules
print MAKE <<EOF;
# All rules will be called here
.PHONY: build
build: \$(debug) \$(oFiles) \$(debug)/image.elf image.bin \$(debug)/image.lst \$(debug)/image.asm clean

EOF

# Remove debug folder and image.bin if the scatter file changes
print MAKE <<EOF;
# Remove debug folder and image.bin if the scatter file changes
\$(debug): \\
  $scatter
	rm -rf \$(debug)
	rm -rf \$(image.bin)
	\@echo [Info] \$(debug) and \$(image.bin) has been removed because your scatter file has been changed.
	mkdir \$(debug)
	\@echo [Info] \$(debug) folder has been created.
    
EOF

# Compile asm source file
$i = 0;
foreach my $fileBase (@asmFilesBase)
{
	print MAKE <<EOF;
\$(debug)/$fileBase.o: \\
  $asmFiles[$i] \\
  $cfg
	\@echo [Info] Compiling $asmFiles[$i]...
	\$(asmc) \$(asmopts) --list=$asmFilesBase[$i].list  $asmFiles[$i]
	\@echo [Info] Collecting object files $asmFilesBase[$i++].o...
	mv -f *.o \$(debug)
	mv -f *.list \$(debug)

EOF
}

# Compile asmGNU source file
$i = 0;
foreach my $fileBase (@asmGNUFilesBase)
{
	print MAKE <<EOF;
\$(debug)/$fileBase.o: \\
  $asmGNUFiles[$i] \\
  $cfg
	\@echo [Info] Compiling $asmGNUFiles[$i]...
	\$(asmGNUc) \$(asmGNUopts) -o $asmGNUFilesBase[$i].o $asmGNUFiles[$i]
	\@echo [Info] Collecting object files $asmGNUFilesBase[$i++].o...
	mv -f *.o \$(debug)

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
  $cfg
	\@echo [Info] Compiling $cFiles[$i]...
	\$(cc) \$(copts) $cFiles[$i]
	\@echo [Info] Collecting object files $cFilesBase[$i++].o...
	mv -f *.o \$(debug)

EOF
}

# Linking
print MAKE <<EOF;
# Link object files into a sigle image
\$(debug)/image.elf: \\
  \$(oFiles) \\
  $cfg \\
  $scatter
	\@echo [Info] Linking object files...
	\$(linker) \$(lopts) \$(oFiles) --output=image.elf
	\@echo [Info] Object files has been linked successfully.
	mv -f image.elf \$(debug)

EOF

# Create binary file
if ($cTarget eq "arm-arm-non-eabi")
{
	print MAKE <<EOF;
# Generate binary file
image.bin: \\
  \$(debug)/image.elf
	\@echo [Info] Creating binary file...
	\$(fromelf) \$(elfbinopts) \$(debug)/image.elf --output=image.bin
	\@echo [Info] Binary file has been generated successfully.

EOF
}
elsif ($cTarget eq "aarch64-arm-non-eabi")
{
	print MAKE <<EOF;
# Generate binary file
image.bin: \\
  \$(debug)/image.elf
	\@echo [Info] Generating binary file...
	objcopy --srec-forceS3 -I elf64-little -O srec \$(debug)/image.elf image.bin
	\@echo [Info] Binary file has been generated successfully.

EOF
}

# Create memory map
print MAKE <<EOF;
# Generate memory map file
\$(debug)/image.lst: \\
  \$(debug)/image.elf
	\@echo [Info] Listing memory map...
	\$(fromelf) \$(elflstopts) \$(debug)/image.elf --output=image.lst
	\@echo [Info] Memory map has been listed successfully.
	mv -f *.lst \$(debug)

EOF

# Disassembling
print MAKE <<EOF;
# Disassembling
\$(debug)/image.asm: \\
  \$(debug)/image.elf
	\@echo [Info] Disassembling...
	\$(fromelf) \$(elfasmopts) \$(debug)/image.elf --output=image.asm
	\@echo [Info] Disassembled successfully.
	mv -f *.asm \$(debug)

EOF

# Cleaning
print MAKE <<EOF;
# Clean temporary files
.PHONY: clean
clean:
	\@echo [Info] Cleanning temporary files...
	mv -f make* \$(debug)
	mv -f *.csh \$(debug)
	mv -f *.log \$(debug)
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

setenv ARMLMD_LICENSE_FILE 8224\@klcg01,8224\@klcg02,8224\@klcg03:8224\@mlcg01,8224\@mlcg02,8224\@mlcg03
setenv ARM_TOOL_VARIANT ult
setenv ARM_PRODUCT_PATH /common/appl/ARM/DS500-BN-00019-r5p0-28rel1/sw/mappings
setenv PATH /common/appl/ARM/DS500-BN-00019-r5p0-28rel1/sw/ARMCompiler6.9/bin/:\$PATH
setenv PATH /common/appl/gcc-4.5.2-64bit/:\$PATH

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
