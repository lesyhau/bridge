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
my $debugDir = "$workingDir/debug";
my $recursiveOn = 0;
my $cpu = get_default_cpu();
my $fpu = get_default_fpu();
my $optimize = get_default_optimize();
my $remove = get_default_remove();
my $scatter;
my $entry;

my @armasmPredefinedSymbols;
my @gnuasmPredefinedSymbols;
my @cPredefinedSymbols;
my @cppPredefinedSymbols;
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

$buildStatus = readBuildConfig($workingDir);
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

foreach my $pd (@armasmPredefinedSymbols)	{ push @armasmCompilerOptions, translateArmasmCompilerOptions("pd", $pd); }
foreach my $pd (@gnuasmPredefinedSymbols)	{ push @gnuasmCompilerOptions, translateGnuasmCompilerOptions("pd", $pd); }
foreach my $pd (@cPredefinedSymbols)		{ push @cCompilerOptions, translateCCompilerOptions("pd", $pd); }
foreach my $pd (@cppPredefinedSymbols)		{ push @cppCompilerOptions, translateCppCompilerOptions("pd", $pd); }

push @armasmCompilerOptions,
	translateCompilerOptions("armasm", "cpu", $cpu),
	translateCompilerOptions("armasm", "fpu", $fpu);
push @gnuasmCompilerOptions,
	translateCompilerOptions("gnuasm", "cpu", $cpu),
	translateCompilerOptions("gnuasm", "fpu", $fpu);
push @cCompilerOptions,
	translateCompilerOptions("c", "cpu", $cpu),
	translateCompilerOptions("c", "fpu", $fpu),
	translateCompilerOptions("c", "optimize", $optimize);
push @cppCompilerOptions,
	translateCompilerOptions("cpp", "cpu", $cpu),
	translateCompilerOptions("cpp", "fpu", $fpu),
	translateCompilerOptions("cpp", "optimize", $optimize);

push @linkerOptions, translateLinkerOptions("scatter", $scatter);
if ($remove == 1) { push @linkerOptions, translateLinkerOptions("remove", ""); }

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
	my $workingDir = shift(@_);
	my $configDir = "$workingDir/build.cfg";
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

			elsif ($option eq "--PD")
			{
				if (! $words[1])
				{
					print "[Error] Syntax error at line $i, file $configDir\n";
					$status = 1;
					goto RETURN;
				}

				my $pd = "";
				for (my $i = 1; $i < (scalar @words); $i++) { $pd = join " ", $pd, $words[$i]; }
				push @armasmPredefinedSymbols, $pd;
				push @gnuasmPredefinedSymbols, $pd;
			}

			elsif ($option eq "-pd")
			{
				if (! $words[1])
				{
					print "[Error] Syntax error at line $i, file $configDir\n";
					$status = 1;
					goto RETURN;
				}

				my $pd = "";
				for (my $i = 1; $i < (scalar @words); $i++) { $pd = join " ", $pd, $words[$i]; }
				push @cPredefinedSymbols, $pd;
				push @cppPredefinedSymbols, $pd;
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
				$cpu = $words[1];
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
				$optimize = $words[1];
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
				$scatter = $words[1];
			}

			elsif ($option eq "-entry")
			{
				if (! $words[1])
				{
					print "[Error] Syntax error at line $i, file $configDir\n";
					$status = 1;
					goto RETURN;
				}

				chomp($words[1]);
				$entry = $words[1];
			}

			elsif ($option eq "-remove")
			{
				$remove = 1;
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
				$cpu = $ARGV[$i+1];
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
				$optimize = $ARGV[$i+1];
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
				$scatter = $ARGV[$i+1];
			}

			elsif ($option eq "-entry")
			{
				if (! $ARGV[$i+1])
				{
					print "[Error] Syntax error at argument $option\n";
					$status = 1;
					goto RETURN;
				}

				chomp($ARGV[$i+1]);
				$entry = $ARGV[$i+1];
			}

			elsif ($option eq "-list")
			{
				if (! $ARGV[$i+1])
				{
					print "[Error] Syntax error at argument $option\n";
					$status = 1;
					goto RETURN;
				}

				chomp($ARGV[$i+1]);
				list_available_args($ARGV[$i+1]);
				exit;
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

sub list_available_args
{
	my $option = shift(@_);

	if		($option eq "cpu")		{ list_cpu(); }
	elsif	($option eq "fpu")		{ list_fpu(); }
	elsif	($option eq "optimize")	{ list_optimize(); }
	else	{ print "[Error] Unknown option $option\n"; }
}
