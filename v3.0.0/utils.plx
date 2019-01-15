
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

	print "[Info] Reading directory $dir\n";

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

	return @files;
}

return 1;
