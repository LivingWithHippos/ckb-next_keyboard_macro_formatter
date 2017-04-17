#!/bin/bash

# Check for string length >0, \ and " that need to be escaped
function cleanInput {

    if [ -z "$1" ]; then return 0; fi;

    if [ $1 == "\\" ]; then printf "%s" "\\\\"; return 1; fi;

    if [ "$1" == "\"" ]; then printf "%s" "\\\""; return 1; fi;
 
    printf "%s" "$1"      
}

echo -n "Enter your desired language: "
read -r language
language=$(cleanInput $language)
AWK=./filter_$language.awk

printf "BEGIN {}
/^macro:[:alpha: ]+/ {
    macroLine = \"\"
    for (x = 2; x <= NF; x++) {

        do {
            if (length(\$x) > 1 && (substr(\$x, 1, 1) == \"+\" || substr(\$x, 1, 1) == \"-\")) {
                macroLine = macroLine \$x;
                break;
            }
            if (\$x != tolower(\$x)) {
                macroLine = macroLine \"+lshift,+\" tolower(\$x) \",-\" tolower(\$x) \",-lshift\";
                break;
            }\\n\\n">$AWK

echo -n "Press the key on the left of the number one: "
read -r grave
grave=$(cleanInput $grave)
if [ -n "$grave" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+grave,-grave\";
                break;
            }\\n" "$grave">>$AWK; fi;

echo -n "Press it again with SHIFT: "
read -r shiftgrave
shiftgrave=$(cleanInput $shiftgrave)
if [ -n "$shiftgrave" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+grave,-grave,-lshift\";
                break;
            }\\n" "$shiftgrave">>$AWK; fi;

echo -n "Press 1 with SHIFT: "
read -r shift1
shift1=$(cleanInput $shift1)
if [ -n "$shift1" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+1,-1,-lshift\";
                break;
            }\\n" "$shift1">>$AWK; fi;

echo -n "Press 2 with SHIFT: "
read -r shift2
shift2=$(cleanInput $shift2)
if [ -n "$shift2" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+2,-2,-lshift\";
                break;
            }\\n" "$shift2">>$AWK; fi;

echo -n "Press 3 with SHIFT: "
read -r shift3
shift3=$(cleanInput $shift3)
if [ -n "$shift3" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+3,-3,-lshift\";
                break;
            }\\n" "$shift3">>$AWK; fi;

echo -n "Press 4 with SHIFT: "
read -r shift4
shift4=$(cleanInput $shift4)
if [ -n "$shift4" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+4,-4,-lshift\";
                break;
            }\\n" "$shift4">>$AWK; fi;

echo -n "Press 5 with SHIFT: "
read -r shift5
shift5=$(cleanInput $shift5)
if [ -n "$shift5" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+5,-5,-lshift\";
                break;
            }\\n" "$shift5">>$AWK; fi;

echo -n "Press 6 with SHIFT: "
read -r shift6
shift6=$(cleanInput $shift6)
if [ -n "$shift6" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+6,-6,-lshift\";
                break;
            }\\n" "$shift6">>$AWK; fi;

echo -n "Press 7 with SHIFT: "
read -r shift7
shift7=$(cleanInput $shift7)
if [ -n "$shift7" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+7,-7,-lshift\";
                break;
            }\\n" "$shift7">>$AWK; fi;

echo -n "Press 8 with SHIFT: "
read -r shift8
shift8=$(cleanInput $shift8)
if [ -n "$shift8" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+8,-8,-lshift\";
                break;
            }\\n" "$shift8">>$AWK; fi;

echo -n "Press 9 with SHIFT: "
read -r shift9
shift9=$(cleanInput $shift9)
if [ -n "$shift9" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+9,-9,-lshift\";
                break;
            }\\n" "$shift9">>$AWK; fi;

echo -n "Press 0 with SHIFT: "
read -r shift0
shift0=$(cleanInput $shift0)
if [ -n "$shift0" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+0,-0,-lshift\";
                break;
            }\\n" "$shift0">>$AWK; fi;

echo -n "Press the key on the right of 0: "
read -r minus
minus=$(cleanInput $minus)
if [ -n "$minus" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+minus,-minus\";
                break;
            }\\n" "$minus">>$AWK; fi;

echo -n "Press it with SHIFT: "
read -r shiftminus
shiftminus=$(cleanInput $shiftminus)
if [ -n "$shiftminus" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+minus,-minus,-lshift\";
                break;
            }\\n" "$shiftminus">>$AWK; fi;

echo -n "Press the key on its right: "
read -r equal
equal=$(cleanInput $equal)
if [ -n "$equal" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+equal,-equal\";
                break;
            }\\n" "$equal">>$AWK; fi;

echo -n "Press it with SHIFT: "
read -r shiftequal
shiftequal=$(cleanInput $shiftequal)
if [ -n "$shiftequal" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+equal,-equal,-lshift\";
                break;
            }\\n" "$shiftequal">>$AWK; fi;

echo -n "Press on the row below the first symbol key from the left between TAB and ENTER: "
read -r lbrace
lbrace=$(cleanInput $lbrace)
if [ -n "$lbrace" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lbrace,-lbrace\";
                break;
            }\\n" "$lbrace">>$AWK; fi;

echo -n "Press it with SHIFT: "
read -r shiftlbrace
shiftlbrace=$(cleanInput $shiftlbrace)
if [ -n "$shiftlbrace" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+lbrace,-lbrace,-lshift\";
                break;
            }\\n" "$shiftlbrace">>$AWK; fi;

echo -n "Press the one on its right: "
read -r rbrace
rbrace=$(cleanInput $rbrace)
if [ -n "$rbrace" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+rbrace,-rbrace\";
                break;
            }\\n" "$rbrace">>$AWK; fi;

echo -n "Press it with SHIFT: "
read -r shiftrbrace
shiftrbrace=$(cleanInput $shiftrbrace)
if [ -n "$shiftrbrace" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+rbrace,-rbrace,-lshift\";
                break;
            }\\n" "$shiftrbrace">>$AWK; fi;

echo -n "Press on the row below the first symbol key from the left between CAPS LOCK and ENTER: "
read -r colon
colon=$(cleanInput $colon)
if [ -n "$colon" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+colon,-colon\";
                break;
            }\\n" "$colon">>$AWK; fi;

echo -n "Press it with SHIFT: "
read -r shiftcolon
shiftcolon=$(cleanInput $shiftcolon)
if [ -n "$shiftcolon" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+colon,-colon,-lshift\";
                break;
            }\\n" "$shiftcolon">>$AWK; fi;

echo -n "Press the one on its right: "
read -r quote
quote=$(cleanInput $quote)
if [ -n "$quote" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+quote,-quote\";
                break;
            }\\n" "$quote">>$AWK; fi;

echo -n "Press it with SHIFT: "
read -r shiftquote
shiftquote=$(cleanInput $shiftquote)
if [ -n "$shiftquote" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+quote,-quote,-lshift\";
                break;
            }\\n" "$shiftquote">>$AWK; fi;

echo -n "Press the one on its right: "
read -r _hash
_hash=$(cleanInput $_hash)
if [ -n "$_hash" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+hash,-hash\";
                break;
            }\\n" "$_hash">>$AWK; fi;

echo -n "Press it with SHIFT: "
read -r shifthash
shifthash=$(cleanInput $shifthash)
if [ -n "$shifthash" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+hash,-hash,-lshift\";
                break;
            }\\n" "$shifthash">>$AWK; fi;

echo -n "Press the symbol key on the row below on the right of the left SHIFT: "
read -r bslash_iso
bslash_iso=$(cleanInput $bslash_iso)
if [ -n "$bslash_iso" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+bslash_iso,-bslash_iso\";
                break;
            }\\n" "$bslash_iso">>$AWK; fi;

echo -n "Press it with SHIFT: "
read -r shiftbslash_iso
shiftbslash_iso=$(cleanInput $shiftbslash_iso)
if [ -n "$shiftbslash_iso" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+bslash_iso,-bslash_iso,-lshift\";
                break;
            }\\n" "$shiftbslash_iso">>$AWK; fi;

echo -n "Press the first symbol key on its right: "
read -r comma
comma=$(cleanInput $comma)
if [ -n "$comma" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+comma,-comma\";
                break;
            }\\n" "$comma">>$AWK; fi;

echo -n "Press it with SHIFT: "
read -r shiftcomma
shiftcomma=$(cleanInput $shiftcomma)
if [ -n "$shiftcomma" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+comma,-comma,-lshift\";
                break;
            }\\n" "$shiftcomma">>$AWK; fi;

echo -n "Press the one on its right: "
read -r dot
dot=$(cleanInput $dot)
if [ -n "$dot" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+dot,-dot\";
                break;
            }\\n" "$dot">>$AWK; fi;

echo -n "Press it with SHIFT: "
read -r shiftdot
shiftdot=$(cleanInput $shiftdot)
if [ -n "$shiftdot" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+dot,-dot,-lshift\";
                break;
            }\\n" "$shiftdot">>$AWK; fi;

echo -n "Press the one on its right: "
read -r slash
slash=$(cleanInput $slash)
if [ -n "$slash" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+slash,-slash\";
                break;
            }\\n" "$slash">>$AWK; fi;

echo -n "Press it with SHIFT: "
read -r shiftslash
shiftslash=$(cleanInput $shiftslash)
if [ -n "$shiftslash" ]; then printf "            if (\$x == \"%s\") {
                macroLine = macroLine \"+lshift,+slash,-slash,-lshift\";
                break;
            }\\n" "$shiftslash">>$AWK; fi;

echo -n "            macroLine = macroLine \"+\" \$x \",-\" \$x
        }
        while (0)

        if (x < NF)
            macroLine = macroLine \",\"
        else
            print macroLine
    }
}
END {}">>$AWK
echo "Recording complete, generated file $AWK"
