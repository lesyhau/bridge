#!/usr/bin/perl
use strict;
use warnings;
use File::Spec;

require "/media/electronicdog/Windows/Users/lesyh/OneDrive/Documents/Renesas/bridge/v3.0.0/help.plx";
require "/media/electronicdog/Windows/Users/lesyh/OneDrive/Documents/Renesas/bridge/v3.0.0/utils.plx";
require "/media/electronicdog/Windows/Users/lesyh/OneDrive/Documents/Renesas/bridge/v3.0.0/gcc/gen_dependency.plx";
require "/media/electronicdog/Windows/Users/lesyh/OneDrive/Documents/Renesas/bridge/v3.0.0/gcc/compile.plx";
require "/media/electronicdog/Windows/Users/lesyh/OneDrive/Documents/Renesas/bridge/v3.0.0/gcc/link.plx";
require "/media/electronicdog/Windows/Users/lesyh/OneDrive/Documents/Renesas/bridge/v3.0.0/gcc/extract_image.plx";

my $gcc = 0;

my $workingDir = `pwd`; chomp $workingDir;
my $configDir = "$workingDir/build.cfg";
my $debugDir = "$workingDir/debug";
my $recursiveOn = 0;
my @predefinedSymbols;
my $cpuName = "cr52";
my $optimizeLevel = 1;
my $scatterDir;
my $firstSection;

my @armasmCompilerOptions;
my @gnuasmCompilerOptions;
my @cCompilerOptions;
my @cppCompilerOptions;
my @linkerOptions;
my @includeDirs;
my @sourceDirs;
my @armasmFiles;
my @gnuasmFiles;
my @cFiles;
my @cppFiles;
my $buildStatus = 0;

$buildStatus = readBuildConfig($configDir);
if ($buildStatus != 0) { exit; }

$buildStatus = readCommandLineArgs();
if ($buildStatus != 0) { exit; }

if (! -d $workingDir)
{
	print "[Error] No such directory $workingDir\n";
	exit;
}

if (! -d $debugDir)
{
	$buildStatus = system("mkdir $debugDir");
	if ($buildStatus != 0)
	{
		print "[Error] Failed to create folder $debugDir\n";
		exit;
	}
}

push @includeDirs, $workingDir;
push @sourceDirs, $workingDir;
@includeDirs = removeDuplicateFile(\@includeDirs);
@sourceDirs = removeDuplicateFile(\@sourceDirs);

foreach my $dir (@includeDirs)
{
	if (! -d $dir)
	{
		print "[Error] No such directory $dir\n";
		exit;
	}
}

foreach my $dir (@sourceDirs)
{
	if (! -d $dir)
	{
		print "[Error] No such directory $dir\n";
		exit;
	}
}

push @armasmCompilerOptions, "-march=armv8-r", "-mcpu=cortex-r52", "-mfpu=vfpv3-fp16", "--defsym __arm__=1";
push @gnuasmCompilerOptions, "-march=armv8-r", "-mcpu=cortex-r52", "-mfpu=vfpv3-fp16", "--defsym __arm__=1";
push @cCompilerOptions, "-march=armv8-r", "-mcpu=cortex-r52", "-mfpu=vfpv3-fp16", "-O1", "-D __arm__";
push @cppCompilerOptions, "-march=armv8-r", "-mcpu=cortex-r52", "-mfpu=vfpv3-fp16", "-O1", "-D __arm__";
push @linkerOptions, "-T ./scatter.ld";

foreach my $dir (@sourceDirs) { push @armasmFiles, getFiles($dir, "s", 0); }
foreach my $dir (@sourceDirs) { push @gnuasmFiles, getFiles($dir, "src", 0); }
foreach my $dir (@sourceDirs) { push @cFiles, getFiles($dir, "c", 0); }
foreach my $dir (@sourceDirs) { push @cppFiles, getFiles($dir, "cpp", 0); }

@armasmFiles = removeDuplicateFile(\@armasmFiles);
@gnuasmFiles = removeDuplicateFile(\@gnuasmFiles);
@cFiles = removeDuplicateFile(\@cFiles);
@cppFiles = removeDuplicateFile(\@cppFiles);

gen_files_list($workingDir, \@armasmFiles, 0);
gen_files_list($workingDir, \@gnuasmFiles, 1);
gen_files_list($workingDir, \@cFiles, 1);
gen_files_list($workingDir, \@cppFiles, 1);

if ($buildStatus == 0) { $buildStatus = gen_armasm_dependency($workingDir, \@includeDirs, \@armasmFiles); }
if ($buildStatus == 0) { $buildStatus = gen_gnuasm_dependency($workingDir, \@includeDirs, \@gnuasmFiles); }
if ($buildStatus == 0) { $buildStatus = gen_c_dependency($workingDir, \@includeDirs, \@cFiles); }
if ($buildStatus == 0) { $buildStatus = gen_cpp_dependency($workingDir, \@includeDirs, \@cppFiles); }
if ($buildStatus == 0) { $buildStatus = compile_armasm($workingDir, \@includeDirs, \@armasmFiles, \@armasmCompilerOptions); }
if ($buildStatus == 0) { $buildStatus = compile_gnuasm($workingDir, \@includeDirs, \@gnuasmFiles, \@gnuasmCompilerOptions); }
if ($buildStatus == 0) { $buildStatus = compile_c($workingDir, \@includeDirs, \@cFiles, \@cCompilerOptions); }
if ($buildStatus == 0) { $buildStatus = compile_cpp($workingDir, \@includeDirs, \@cppFiles, \@cppCompilerOptions); }
if ($buildStatus == 0) { $buildStatus = link_object($workingDir, \@includeDirs, \@armasmFiles, \@gnuasmFiles, \@cFiles, \@cppFiles, \@linkerOptions); }
if ($buildStatus == 0) { $buildStatus = extract_image($workingDir); }

clean($workingDir, $buildStatus);

sub readBuildConfig
{
	my $configDir = shift(@_);
	my $status = 0;
	my $i = 0;

	if (! -f $configDir) { exit; }

	print "[Info] Reading build configuration...\n";

	open CFG, "<$configDir";
    while (<CFG>)
    {
        $i++;

        if ($_ =~ /^#/) { goto NEXT_LINE; }

        my @words = split " ", $_;
		my $option = $words[0]; chomp $option;
		
		if ($option =~ /^-/)
		{
			if ($option eq "-dir")
			{
				if (! $words[1])
				{
					print "[Error] Syntax error at line $i, file $configDir\n";
					$status = 1;
					goto RETURN;
				}

				chomp($words[1]);
				$workingDir = $words[1];
				$debugDir = join "/", $workingDir, "debug";
			}

			elsif ($option eq "-include")
			{
				if (! $words[1])
				{
					print "[Error] Syntax error at line $i, file $configDir\n";
					$status = 1;
					goto RETURN;
				}

				chomp($words[1]);
				push @includeDirs, $words[1];
			}

			elsif ($option eq "-source")
			{
				if (! $words[1])
				{
					print "[Error] Syntax error at line $i, file $configDir\n";
					$status = 1;
					goto RETURN;
				}

				chomp($words[1]);
				push @sourceDirs, $words[1];
			}

			elsif ($option eq "-recursive")
			{
				$recursiveOn = 1;
			}

			elsif (($option eq "-pd") or ($option eq "--PD"))
			{
				if (! $words[1])
				{
					print "[Error] Syntax error at line $i, file $configDir\n";
					$status = 1;
					goto RETURN;
				}

				my $pd = "";
				for (my $i = 1; $i < (scalar @words); $i++) { $pd = join " ", $pd, $words[$i]; }
				push @predefinedSymbols, $pd;
			}

			elsif ($option eq "-cpu")
			{
				if (! $words[1])
				{
					print "[Error] Syntax error at line $i, file $configDir\n";
					$status = 1;
					goto RETURN;
				}

				chomp($words[1]);
				$cpuName = $words[1];
			}

			elsif ($option eq "-optimize")
			{
				if (! $words[1])
				{
					print "[Error] Syntax error at line $i, file $configDir\n";
					$status = 1;
					goto RETURN;
				}

				chomp($words[1]);
				$optimizeLevel = $words[1];
			}

			elsif ($option eq "-scatter")
			{
				if (! $words[1])
				{
					print "[Error] Syntax error at line $i, file $configDir\n";
					$status = 1;
					goto RETURN;
				}

				chomp($words[1]);
				$scatterDir = $words[1];
			}

			elsif ($option eq "-first")
			{
				if (! $words[1])
				{
					print "[Error] Syntax error at line $i, file $configDir\n";
					$status = 1;
					goto RETURN;
				}

				chomp($words[1]);
				$firstSection = $words[1];
			}

			else
			{
				print "[Error] Invalid option $option at line $i, file $configDir\n";
				$status = 1;
				goto RETURN;
			}
		}
    }

	RETURN:
	close CFG;
	if ($status == 0) { print "[Info] Done\n"; }
	return $status;
}

sub readCommandLineArgs
{
	my $status = 0;
	my $args = scalar @ARGV;

	print "[Info] Reading command line options...\n";

    for (my $i = 0; $i < $args; $i++)
    {
		my $option = $ARGV[$i]; chomp $option;

		if ($option =~ /^-/)
		{
			if ($option eq "-dir")
			{
				if (! $ARGV[$i+1])
				{
					print "[Error] Syntax error at argument $option\n";
					$status = 1;
					goto RETURN;
				}

				chomp($ARGV[$i+1]);
				$workingDir = $ARGV[$i+1];
				$debugDir = join "/", $workingDir, "debug";
			}

			elsif ($option eq "-include")
			{
				if (! $ARGV[$i+1])
				{
					print "[Error] Syntax error at argument $option\n";
					$status = 1;
					goto RETURN;
				}

				chomp($ARGV[$i+1]);
				push @includeDirs, $ARGV[$i+1];
			}

			elsif ($option eq "-source")
			{
				if (! $ARGV[$i+1])
				{
					print "[Error] Syntax error at argument $option\n";
					$status = 1;
					goto RETURN;
				}

				chomp($ARGV[$i+1]);
				push @sourceDirs, $ARGV[$i+1];
			}

			elsif ($option eq "-recursive")
			{
				$recursiveOn = 1;
			}

			elsif ($option eq "-cpu")
			{
				if (! $ARGV[$i+1])
				{
					print "[Error] Syntax error at argument $option\n";
					$status = 1;
					goto RETURN;
				}

				chomp($ARGV[$i+1]);
				$cpuName = $ARGV[$i+1];
			}

			elsif ($option eq "-optimize")
			{
				if (! $ARGV[$i+1])
				{
					print "[Error] Syntax error at argument $option\n";
					$status = 1;
					goto RETURN;
				}

				chomp($ARGV[$i+1]);
				$optimizeLevel = $ARGV[$i+1];
			}

			elsif ($option eq "-scatter")
			{
				if (! $ARGV[$i+1])
				{
					print "[Error] Syntax error at argument $option\n";
					$status = 1;
					goto RETURN;
				}

				chomp($ARGV[$i+1]);
				$scatterDir = $ARGV[$i+1];
			}

			elsif ($option eq "-first")
			{
				if (! $ARGV[$i+1])
				{
					print "[Error] Syntax error at argument $option\n";
					$status = 1;
					goto RETURN;
				}

				chomp($ARGV[$i+1]);
				$firstSection = $ARGV[$i+1];
			}

			else
			{
				print "[Error] Invalid command line option $option\n";
				$status = 1;
				goto RETURN;
			}
		}
    }

	RETURN:
	close CFG;
	if ($status == 0) { print "[Info] Done\n"; }
	return $status;
}

# -march=
# ‘armv4t’, ‘armv5t’, ‘armv5te’, ‘armv6’, ‘armv6j’,
# ‘armv6k’, ‘armv6kz’, ‘armv6t2’, ‘armv6z’, ‘armv6zk’, ‘armv7’, ‘armv7-a’,
# ‘armv7ve’, ‘armv8-a’, ‘armv8.1-a’, ‘armv8.2-a’, ‘armv8.3-a’, ‘armv8.4-a’,
# ‘armv8.5-a’, ‘armv7-r’, ‘armv8-r’, ‘armv6-m’, ‘armv6s-m’, ‘armv7-m’,
# ‘armv7e-m’, ‘armv8-m.base’, ‘armv8-m.main’, ‘iwmmxt’, ‘iwmmxt2’

# -mcpuName=
# ‘arm7tdmi’, ‘arm7tdmi-s’, ‘arm710t’,
# ‘arm720t’, ‘arm740t’, ‘strongarm’, ‘strongarm110’, ‘strongarm1100’,
# ‘strongarm1110’, ‘arm8’, ‘arm810’, ‘arm9’, ‘arm9e’, ‘arm920’, ‘arm920t’,
# ‘arm922t’, ‘arm946e-s’, ‘arm966e-s’, ‘arm968e-s’, ‘arm926ej-s’, ‘arm940t’,
# ‘arm9tdmi’, ‘arm10tdmi’, ‘arm1020t’, ‘arm1026ej-s’, ‘arm10e’, ‘arm1020e’,
# ‘arm1022e’, ‘arm1136j-s’, ‘arm1136jf-s’, ‘mpcore’, ‘mpcorenovfp’, ‘arm1156t2-s’,
# ‘arm1156t2f-s’, ‘arm1176jz-s’, ‘arm1176jzf-s’,
# ‘generic-armv7-a’, ‘cortex-a5’, ‘cortex-a7’, ‘cortex-a8’, ‘cortex-a9’,
# ‘cortex-a12’, ‘cortex-a15’, ‘cortex-a17’, ‘cortex-a32’, ‘cortex-a35’,
# ‘cortex-a53’, ‘cortex-a55’, ‘cortex-a57’, ‘cortex-a72’, ‘cortex-a73’,
# ‘cortex-a75’, ‘cortex-a76’, ‘ares’, ‘cortex-r4’, ‘cortex-r4f’, ‘cortex-r5’,
# ‘cortex-r7’, ‘cortex-r8’, ‘cortex-r52’, ‘cortex-m0’, ‘cortex-m0plus’,
# ‘cortex-m1’, ‘cortex-m3’, ‘cortex-m4’, ‘cortex-m7’, ‘cortex-m23’,
# ‘cortex-m33’, ‘cortex-m1.small-multiply’, ‘cortex-m0.small-multiply’,
# ‘cortex-m0plus.small-multiply’, ‘exynos-m1’, ‘marvell-pj4’, ‘xscale’,
# ‘iwmmxt’, ‘iwmmxt2’, ‘ep9312’, ‘fa526’, ‘fa626’, ‘fa606te’, ‘fa626te’,
# ‘fmp626’, ‘fa726te’, ‘xgene1’.

# -mfpu=
# ‘auto’, ‘vfpv2’, ‘vfpv3’, ‘vfpv3-fp16’,
# ‘vfpv3-d16’, ‘vfpv3-d16-fp16’, ‘vfpv3xd’, ‘vfpv3xd-fp16’, ‘neon-vfpv3’,
# ‘neon-fp16’, ‘vfpv4’, ‘vfpv4-d16’, ‘fpv4-sp-d16’, ‘neon-vfpv4’, ‘fpv5-d16’,
# ‘fpv5-sp-d16’, ‘fp-armv8’, ‘neon-fp-armv8’, ‘crypto-neon-fp-armv8’

# as has following command-line options for the Renesas (formerly Hitachi) / SuperH SH family
# --little				Generate little endian code.
# --big					Generate big endian code.
# --relax 				Alter jump instructions for long displacements.
# --small				Align sections to 4 byte boundaries, not 16.
# --dsp 				Enable sh-dsp insns, and disable sh3e / sh4 insns.
# --renesas				Disable optimization with section symbol for compatibility with Renesas assembler.
# --allow-reg-prefix	Allow ’$’ as a register name prefix.
# --fdpic 				Generate an FDPIC object file.
# --isa=sh4 | sh4a		Specify the sh4 or sh4a instruction set.
# --isa=dsp				Enable sh-dsp insns, and disable sh3e / sh4 insns.
# --isa=fp 				Enable sh2e, sh3e, sh4, and sh4a insn sets.
# --isa=all				Enable sh1, sh2, sh2e, sh3, sh3e, sh4, sh4a, and sh-dsp insn sets.
# -h-tick-hex			Support H’00 style hex constants in addition to 0x00 style.
