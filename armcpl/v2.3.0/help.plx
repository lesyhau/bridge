
# ------------------------------------------------------------------------------
# Display help
sub	display_help
{
	print <<EOF;
-   
-   Compiler v2
-   2082 - Hau Sy Le - hau.le.eb\@rvc.renesas.com
-   
-   How to use:
-   armcpl.plx [options]
-   
-   Available options:
-       -f      Specify an input C source file.
-       -inc    Specify a folder containing user header file(s).
-       -optimize   Specify code optimize level.
-               Available code optimze level:
-                   0: No optimized (default)
-                   1: Slightly optimized
-                   2: Medium optimized
-                   3: Maximum optimized
-       -cpu    Specify a target ARM CPU core.
-               Available ARM CPU core:
-                   ca53: Cortex-A53
-                   ca57: Cortex-A57
-                   cr7: Cortex-R7
-                   cr52: Cortex-R52 (default)
-                   enyo_32: Cortex-A76 32-bits mode
-                   enyo_64: Cortex-A76 64-bits mode
-       -scatter    Specify a scatter file
-       -pd     Specify a predefined symbol
-       -h      Display this help.
-   
-   Revision history:
-   1.0	2018/08/27  First release
-   1.1	2018/09/11  Fix issues related to code execution from SRAM (CR52)
-                   Update CPU startup code
-                   Add new simulation utility functions
-                   Change default code optimize level to 0
-   1.2 2018/09/19  Minor maintenance
-   2.0 2018/10/12  Version upgraded
-                       Cortex-A76 (Enyo) is now supported with option ca76
-   2.1 2018/10/20  Additional features added
-                       Detect C source files (.c), ARM assembly source file (.s)
-                       and GNU assembly source file (.src) automatically
-   
EOF
}

return 1;
