#!/usr/bin/perl
use strict;
use warnings;
use File::Spec;

require "/media/electronicdog/Windows/Users/lesyh/OneDrive/Documents/Renesas/bridge/v3.0.0/utils.plx";
require "/media/electronicdog/Windows/Users/lesyh/OneDrive/Documents/Renesas/bridge/v3.0.0/gen_dependency.plx";
require "/media/electronicdog/Windows/Users/lesyh/OneDrive/Documents/Renesas/bridge/v3.0.0/compile.plx";
require "/media/electronicdog/Windows/Users/lesyh/OneDrive/Documents/Renesas/bridge/v3.0.0/link.plx";

my $workingDir = `pwd`; chomp $workingDir;
my $debug = "$workingDir/debug";

my @armasmCompilerOptions;
my @gnuasmCompilerOptions;
my @cCompilerOptions;
my @cppCompilerOptions;
my @linkerOptions;
my @imageExtracterOptions;

my @includeDirs;
my @armasmFiles;
my @gnuasmFiles;
my @cFiles;
my @cppFiles;

# Get include directories
push @includeDirs, $workingDir;
push @includeDirs, "./include";
push @includeDirs, "./include/rcar_v3u/startup_gnu";
push @includeDirs, "./include/rcar_v3u/drivers";
@includeDirs = removeDuplicateFile(\@includeDirs);

# Get source files
foreach my $dir (@includeDirs) { push @armasmFiles, getFiles($dir, "s", 0); }
foreach my $dir (@includeDirs) { push @gnuasmFiles, getFiles($dir, "src", 0); }
foreach my $dir (@includeDirs) { push @cFiles, getFiles($dir, "c", 0); }
foreach my $dir (@includeDirs) { push @cppFiles, getFiles($dir, "cpp", 0); }

# Remove duplicate files
@armasmFiles = removeDuplicateFile(\@armasmFiles);
@gnuasmFiles = removeDuplicateFile(\@gnuasmFiles);
@cFiles = removeDuplicateFile(\@cFiles);
@cppFiles = removeDuplicateFile(\@cppFiles);

gen_source_files_list($workingDir, \@armasmFiles, 0);
gen_source_files_list($workingDir, \@gnuasmFiles, 1);
gen_source_files_list($workingDir, \@cFiles, 1);
gen_source_files_list($workingDir, \@cppFiles, 1);

# gen_source_files_list($workingDir, \@files, $append);
sub gen_source_files_list
{
	my $workingDir = shift(@_);
	my @files = @{shift(@_)};
	my $append = shift(@_);

	my $sourceFilesList = "$workingDir/sourceFilesList";
	if ($append == 1) { open FILE, ">>$sourceFilesList"; }
	else { open FILE, ">$sourceFilesList"; }

	foreach my $file (@files) { print FILE $file, "\n"; }

	close FILE;
}

# -march=
# ‘armv4t’, ‘armv5t’, ‘armv5te’, ‘armv6’, ‘armv6j’,
# ‘armv6k’, ‘armv6kz’, ‘armv6t2’, ‘armv6z’, ‘armv6zk’, ‘armv7’, ‘armv7-a’,
# ‘armv7ve’, ‘armv8-a’, ‘armv8.1-a’, ‘armv8.2-a’, ‘armv8.3-a’, ‘armv8.4-a’,
# ‘armv8.5-a’, ‘armv7-r’, ‘armv8-r’, ‘armv6-m’, ‘armv6s-m’, ‘armv7-m’,
# ‘armv7e-m’, ‘armv8-m.base’, ‘armv8-m.main’, ‘iwmmxt’, ‘iwmmxt2’

# -mcpu=
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

# Get tool options
push @armasmCompilerOptions, "-march=armv8-r", "-mcpu=cortex-r52", "-mfpu=vfpv3-fp16";
push @gnuasmCompilerOptions, "-march=armv8-r", "-mcpu=cortex-r52", "-mfpu=vfpv3-fp16";
push @cCompilerOptions, "-march=armv8-r", "-mcpu=cortex-r52", "-mfpu=vfpv3-fp16", "-O1", "-D __example__", "-D __another_example__=1";
push @cppCompilerOptions, "-march=armv8-r", "-mcpu=cortex-r52", "-mfpu=vfpv3-fp16", "-O1", "-D __example__", "-D __another_example__=1";
push @linkerOptions, "-T ./scatter.ld";
# push @imageExtracterOptions, "";

gen_armasm_dependency($workingDir, \@includeDirs, \@armasmFiles);
gen_gnuasm_dependency($workingDir, \@includeDirs, \@gnuasmFiles);
gen_c_dependency($workingDir, \@includeDirs, \@cFiles);
gen_cpp_dependency($workingDir, \@includeDirs, \@cppFiles);

# compile_armasm($workingDir, \@includeDirs, \@armasmFiles, \@armasmCompilerOptions);
compile_gnuasm($workingDir, \@includeDirs, \@gnuasmFiles, \@gnuasmCompilerOptions);
compile_c($workingDir, \@includeDirs, \@cFiles, \@cCompilerOptions);
compile_cpp($workingDir, \@includeDirs, \@cppFiles, \@cppCompilerOptions);

link_object($workingDir, \@includeDirs, \@armasmFiles, \@gnuasmFiles, \@cFiles, \@cppFiles, \@linkerOptions);
