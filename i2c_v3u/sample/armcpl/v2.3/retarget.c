
/******************************************************************************
 * Retarget file for non-semihosting target.
 * 2082 - Hau Sy Le - hau.le.eb@renesas.com
 ****************************************************************************/

/* Standard libraries */
#include	<stdio.h>
#include	<rt_misc.h>

void _sys_exit(int return_code)
{
	while(1);
}

void _ttywrch(int ch)
{
	return;
}

char *_sys_command_string(char *cmd, int len)
{
	return (NULL);
}

