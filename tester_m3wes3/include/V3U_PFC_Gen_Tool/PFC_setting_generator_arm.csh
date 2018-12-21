#!/bin/csh -f
#**************************************************************
# Script for setting PFC automatically                        *
# Author:   Khang Vu                                          *
# Creation: Jul 20th, 2012                                    *
# Usage:    ./PFC_setting_generator_FN lsi_function_list      *
# Note:     Pull setting is supported                         *
#**************************************************************
if ($2 == "") then
   set file_name  = "PFC_setting_arm"
else 
   set file_name  = $2
endif

if (-e ./$file_name.src) mv $file_name.src $file_name.src_bk
if (-e ./working_list_pfc) rm -f ./working_list_pfc 
if (-e ./working_list_cleaned_pfc) rm -f ./working_list_cleaned_pfc

#set DIR = "/design02/rcarm3nfed_work/99_User/minhle/01_PFC/10.PFC_gen"
set DIR = "/shsv/ip25/PGS/02_User/anthanhtran/PFC_GPIO/02_PFC_Gen_tool/01_V3U_Gen_tool"
set IOFILE = $DIR/u779ahpfc000top0.io
#set IOFILE = $DIR/u779ahpfc100top0.io
#set IOFILE = $DIR/u779ahpfc200top0.io
set PIF = $DIR/latest.csv
set AWK_SCRIPT = $DIR/awk_script.awk
set FIND_COL_SCRIPT = $DIR/find_column.awk

set MUXSUB = `awk -f $FIND_COL_SCRIPT -v COL_NAME="#MUXSUB" $PIF`
set SELECTSUB = `awk -f $FIND_COL_SCRIPT -v COL_NAME="#SELECTSUB" $PIF`
set ACTIVE = `awk -f $FIND_COL_SCRIPT -v COL_NAME="#ACTIVE" $PIF`
set PSELECT = `awk -f $FIND_COL_SCRIPT -v COL_NAME="#PSELECT" $PIF`
set PACTIVE = `awk -f $FIND_COL_SCRIPT -v COL_NAME="#PACTIVE" $PIF`
#set PUPSELECT = `awk -f $FIND_COL_SCRIPT -v COL_NAME="#PUPSELECT" $PIF`
set PIN = `awk -f $FIND_COL_SCRIPT -v COL_NAME="#PIN" $PIF`
set LSI_LIST = $1

echo '     INCLUDE   '$DIR'/V3U_PFC_address.equ' >>! $file_name.src
echo '     INCLUDE   '$DIR'/V3U_PFC_macro.equ' >> $file_name.src
echo '' >> $file_name.src

cat $LSI_LIST | grep  -v '^\s*#\|^\s*;' | sed 's/\s\+/:/g' >! search_list_pfc
set ltog_idx = 0
foreach var (`cat search_list_pfc`)
   set lsiname  = `echo $var | cut -d: -f 1`
   set funcname = `echo $var | cut -d: -f 2`	#function name with suffix
#   set pull_ctrl = `echo $var | cut -d: -f 3`   #pull value (- or p)

#  cat $PIF | grep "\<${lsiname}\>.*\<${funcname}\>" >! working_list_pfc
#  set funcname = `echo $funcname | sed 's/_[A-Z]$//g'`
   cat $PIF | grep "\<${lsiname}\>.*\<${funcname}\>" >! working_list_pfc #tentative
   if ($status == 0) then
#      cat working_list_pfc | awk -F, -v PIN=$PIN -v MUXSUB=$MUXSUB -v SELECTSUB=$SELECTSUB -v ACTIVE=$ACTIVE -v PSELECT=$PSELECT -v PACTIVE=$PACTIVE -v PUPSELECT=$PUPSELECT '{print $PIN","$MUXSUB","$SELECTSUB","$ACTIVE","$PSELECT","$PACTIVE","$PUPSELECT}' >! working_list_cleaned_pfc
#      awk -v FUNCNAME=${funcname} -v PULL_CTRL=${pull_ctrl} -f $AWK_SCRIPT working_list_cleaned_pfc $IOFILE >> $file_name.s 
#      cat working_list_pfc | awk -F, -v PIN=$PIN -v MUXSUB=$MUXSUB -v SELECTSUB=$SELECTSUB -v ACTIVE=$ACTIVE -v PSELECT=$PSELECT -v PACTIVE=$PACTIVE -v PUPSELECT=$PUPSELECT '{print $PIN","$MUXSUB","$SELECTSUB","$ACTIVE","$PSELECT","$PACTIVE","$PUPSELECT}' >! working_list_cleaned_pfc
      cat working_list_pfc | awk -F, -v PIN=$PIN -v MUXSUB=$MUXSUB -v SELECTSUB=$SELECTSUB -v ACTIVE=$ACTIVE -v PSELECT=$PSELECT -v PACTIVE=$PACTIVE '{print $PIN","$MUXSUB","$SELECTSUB","$ACTIVE","$PSELECT","$PACTIVE}' >! working_list_cleaned_pfc
      awk -v FUNCNAME=${funcname} -f $AWK_SCRIPT working_list_cleaned_pfc $IOFILE >> $file_name.src 
#     echo "	.POOL" >> $file_name.src #tentative
      echo " B LTORG_PFC_$ltog_idx" >> $file_name.src
      echo " LTORG"    >> $file_name.src
      echo "LTORG_PFC_$ltog_idx"   >> $file_name.src
      @ ltog_idx ++
   else 
      echo ";;;LSI $lsiname	--->	$funcname" >> $file_name.src
      echo ";;;No search result found" >> $file_name.src
      echo "" >> $file_name.src
   endif
end

rm -f working_list_pfc working_list_cleaned_pfc search_list_pfc
sed -e "s/H'/0X/g" $file_name.src >! $file_name.src_tmp
mv $file_name.src_tmp $file_name.src
echo ""
echo "DONE"
echo ""
echo "OUTPUT: $file_name.src"
echo ""
