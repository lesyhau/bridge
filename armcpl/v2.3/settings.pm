package Settings;
use strict;
use warnings;

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw($toolver $toolbase $users $user $userSettings $userToolVer $userInsider $userAutoUpdate GetUserSettings);

my $toolver = "v2.3";
my $toolbase = "/home/u/haule2/tools/armcpl";
my $users = "$toolbase/users";
my $user = `whoami`; chomp $user;
my $userAssess = "$users/$user";

my $userToolVer = $toolver;
my $userInsider = 0;
my $userAutoUpdate = 1;

sub _FirstUseCheck
{
    # Check if the user has an assessment folder
    if (! -d $userAssess)
    {
        print <<EOF;
*******************************************************************************

    CT PATTERN BUILDER

    This is your first use with CT Pattern Builder. There are some sort
    information that you need to know.

    1. rvc-app07 is required
        During the process, you will be asked to log into the rvc-app07 server
        twice if you have logged into a different server. Therefore, you may
        want to log into rvc-app07 in advanced before submit the tool.

    2. -first option is required if your pattern does not have a scatter file
        If your pattern does not have a scatter file, you must use -first
        option to specify the area name that needs to be executed first.
        For example, -first Vectors
        This action is required for the first submition only. From the second
        submition, you don't need to do it any more. But, please be noticed
        that, by using -first option, the tool will generate a simple scatter
        file in your pattern folder with name scatter.scat. You'll see your
        first area name in that scatter file. If you rename your first area
        name in your source code, you must either modify the scatter file or
        delete the scatter file and then use the -first option with your new
        area name.

    3. -first option will be ignored if -scatter is used
        If you use both -first option and -scatter option, the -first option
        will be ignored, so please careful with that.

    4. Full User Guide
        To get more information about CT Pattern Builder, see the User Guide
        at:
        /home/u/haule2/tools/armcpl/docs/CT_Pattern_Builder_User_Guide.pdf

    5. Contact
        If you need support, please make a contact at:
        2082 - Hau Sy Le - hau.le.eb\@renesas.com

    Thank you for using CT Pattern Builder.

*******************************************************************************

EOF

        my $ans;

        # Create the user assesment folder
        print <<EOF;
    USER AGREEMENTS

    Before going more further, CT Pattern Builder needs your confirmation for
    the following items:

EOF

        # Auto update confirmation
        print <<EOF;
    1. Auto update
        CT Pattern Builder will be maintaned and updated continuously to
        improve the quality and the stablization. You might get different
        results from different versions of the tool.

EOF

        AUTO_UPDATE_CONFIRM:
        print "    DO YOU WANT TO GET UPDATES AUTOMATICALLY (y/n)?";
        $ans = <STDIN>; chomp $ans;
        if ($ans eq "y") { $userAutoUpdate = 1; }
        elsif ($ans eq "n") { $userAutoUpdate = 0; }
        else { goto AUTO_UPDATE_CONFIRM; }

        print "\n";

        # Data collect confirmation
        print <<EOF;
    2. Data collect for tool improvement
        There are serveral kind of patterns among a lot of modules. It's hard
        to make CT Pattern Builder catchs up with all kind of patterns without
        your help. Therefore, CT Pattern Builder is asking your permission to
        collect your data for tool improvement. Data that neccessary for tool
        improvement are listed below.
            <pattern>/test.ssc.l
            <pattern>/image.bin
            <pattern>/build.cfg
            <pattern>/debug/build.log
            <pattern>/debug/error.log
            <pattern>/debug/makeDeps
            <pattern>/debug/makeCompile
            <pattern>/debug/image.lst

EOF

        DATA_COLLECT_CONFIRM:
        print "    DO YOU ALLOW CT PATTERN BUILDER TO COLLECT YOUR DATA (y/n)?";
        $ans = <STDIN>; chomp $ans;
        if ($ans eq "y") { $userInsider = 1; }
        elsif ($ans eq "n") { $userInsider = 0; }
        else { goto DATA_COLLECT_CONFIRM; }

        print "\n";

        `mkdir $userAssess`;
        if ($userAutoUpdate == 1) { `touch $userAssess/autoupdate`; }
        if ($userInsider == 1) { `touch $userAssess/insider`; }
    }
}

sub GetUserSettings
{
    _FirstUseCheck;
    exit;

    #if (-f $settings)
    #{
    #    open SETTINGS, "<$settings";
    #    while (<SETTINGS>)
    #    {
    #        my @words = split "=", $_;
    #        if ($words[0] eq /version/)
    #        {
    #            $userToolVer = $words[1];
    #        }
    #        elsif ($words[0] eq /insider/)
    #        {
    #            $userInsider = $words[1];
    #        }
    #        elsif ($words[0] eq /auto_update/)
    #        {
    #            $userAutoUpdate = $words[1];
    #        }
    #    }
    #}
}

#sub SetUserSettings
#{
#    my $version = shift;
#    my $insider = shift;
#    my $autoUpdate = shift;
#
#    open SETTINGS, ">$settings";
#    print SETTINGS "version=$version\n";
#    print SETTINGS "insider=$insider\n";
#}

