#!/bin/csh -f

#******************************************************************************
#	This file has been generated by Pattern Builder v2
#	2082 - Hau Sy Le - hau.le.eb@renesas.com
#******************************************************************************
#	File name:		cmd_deps.csh
#	Date created:	Sat Jan  5 16:07:40 ICT 2019
#	PC name:		rvc-app07
#	User name:		haule2
#******************************************************************************

setenv ARMLMD_LICENSE_FILE 8224@klcg01,8224@klcg02,8224@klcg03:8224@mlcg01,8224@mlcg02,8224@mlcg03
setenv ARM_TOOL_VARIANT ult
setenv ARM_PRODUCT_PATH /common/appl/ARM/DS500-BN-00019-r5p0-28rel1/sw/mappings
setenv PATH /common/appl/ARM/DS500-BN-00019-r5p0-28rel1/sw/ARMCompiler6.9/bin/:$PATH
setenv PATH /common/appl/gcc-4.5.2-64bit/:$PATH

cd /design01/rcarv3ufed_master/common_rvc/rcarv3u/VNET1/MASTER_TM/I2C_V3U_RTL/ct/i2c0/full_check
make -f makeDeps

