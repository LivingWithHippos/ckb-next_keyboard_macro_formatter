#!/bin/sh

MACROFILE=$1
AWK=./awk_languages/filter_en_uk.awk
OUT=./output.txt
macros=$(awk -f $AWK $MACROFILE > $OUT)
echo $macros
