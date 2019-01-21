
# getBasename(\@inputFiles, $surfix)
sub getBasename
{
	my @inputFiles = @{shift(@_)};
	my $surfix = shift(@_);
	my @basenames;

	foreach my $file (@inputFiles)
	{
		my $basename = `basename $file $surfix`;
		chomp $basename;
		push @basenames, $basename;
	}

	return @basenames;
}

# @outputFiles = removeDuplicateFile(\@inputFiles);
sub removeDuplicateFile
{
	my @inputFiles = @{shift(@_)};
	my %hash = map {$_, 1} @inputFiles;
	my @outputFiles = keys %hash;
	return @outputFiles;
}

# getFiles($dir, $surfix, $rescusive);
sub getFiles
{
	my $dir = shift(@_);
	my $surfix = shift(@_);
	my $rescusive = shift(@_);
	my @files;

	print "[Info] Retrieving *.$surfix files in $dir\n";

	opendir DIR, $dir;
	while (my $file = readdir(DIR))
	{
		my $filePath = "$dir/$file";
        next unless (-f $filePath);
        next unless ($file =~ m/\.$surfix$/);
		push @files, File::Spec->rel2abs($filePath);
		print "[Info] File found $filePath\n";
	}

	close DIR;
	print "[Info] Done\n";
	return @files;
}

# gen_files_list($workingDir, \@files, $append);
sub gen_files_list
{
	my $workingDir = shift(@_);
	my @files = @{shift(@_)};
	my $append = shift(@_);

	my $files = "$workingDir/debug/files";
	if ($append == 1) { open FILE, ">>$files"; }
	else { open FILE, ">$files"; }

	foreach my $file (@files) { print FILE $file, "\n"; }

	close FILE;
}

sub clean
{
	my $workingDir = shift(@_);
	my $status = shift(@_);

	`mv -f Makefile* $workingDir/debug`;
	if ($status == 0) { print "**** Build finished successfully ****", "\n"; }
	else { print "**** Build failed ****", "\n"; }
}

return 1;
