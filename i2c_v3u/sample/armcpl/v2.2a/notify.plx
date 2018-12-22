
sub	notify_aug29
{
	print <<EOF;
*******************************************************************************
WARNING:    Code execution from SRAM is currently does not work for V3U (CR52
            core). You will be notified when this feature is available.
            Thank you!
*******************************************************************************
EOF
}

sub	notify_sep10
{
	print <<EOF;
*******************************************************************************
ERROR:      The current version is out-of-date. Please use the latest version:
            /home/u/haule2/tools/armcpl/armcpl.plx
            Thank you!
*******************************************************************************
EOF
}

sub	notify_sep12
{
	print <<EOF;
*******************************************************************************
INFO:       Now you can execute code from SDRAM (DDR memory) with only one
            option -sdram.
            Thank you!
*******************************************************************************
EOF
}

return 1;
