BEGIN {}
/^macro:[:alpha: ]+/ {
    macroLine = ""
    # I check every field from the second one(the first one is "macro:")
    for (x = 2; x <= NF; x++) {
        do {
            # I found a keys being kept pressed or just released, I print it as it is
            # This works because (probably) I don't want to keep pressed keys that need to be translated such as symbols
            if (length($x) > 1 && (substr($x, 1, 1) == "+" || substr($x, 1, 1) == "-")) {
                macroLine = macroLine $x;
                break;
            }
            # An upper-case key, I need to press shift to do it. Using the != toupper I avoid triggering things like "," == tolower(",") and "," == toupper(",")
            if ($x != tolower($x)) {
                macroLine = macroLine "+lshift,+" tolower($x) ",-" tolower($x) ",-lshift";
                break;
            }
            if ($x == "`") {
                macroLine = macroLine "+grave,-grave";
                break;
            }
            if ($x == "-") {
                macroLine = macroLine "+minus,-minus";
                break;
            }
            if ($x == "[") {
                macroLine = macroLine "+lbrace,-lbrace";
                break;
            }
            if ($x == "]") {
                macroLine = macroLine "+rbrace,-rbrace";
                break;
            }
            if ($x == ";") {
                macroLine = macroLine "+colon,-colon";
                break;
            }
            if ($x == "'") {
                macroLine = macroLine "+quote,-quote";
                break;
            }
            if ($x == "\\") {
                macroLine = macroLine "+bslash_iso,-bslash_iso";
                break;
            }
            if ($x == ",") {
                macroLine = macroLine "+comma,-comma";
                break;
            }
            if ($x == ".") {
                macroLine = macroLine "+dot,-dot";
                break;
            }
            if ($x == "#") {
                macroLine = macroLine "+hash,-hash";
                break;
            }
            if ($x == "=") {
                macroLine = macroLine "+equal,-equal";
                break;
            }
            if ($x == "/") {
                macroLine = macroLine "+slash,-slash";
                break;
            }
            if ($x == "¬") {
                macroLine = macroLine "+lshift,+grave,-grave,-lshift";
                break;
            }
            if ($x == "!") {
                macroLine = macroLine "+lshift,+1,-1,-lshift";
                break;
            }
            if ($x == "\"") {
                macroLine = macroLine "+lshift,+2,-2,-lshift";
                break;
            }
            if ($x == "£") {
                macroLine = macroLine "+lshift,+3,-3,-lshift";
                break;
            }
            if ($x == "$") {
                macroLine = macroLine "+lshift,+4,-4,-lshift";
                break;
            }
            if ($x == "%") {
                macroLine = macroLine "+lshift,+5,-5,-lshift";
                break;
            }
            if ($x == "^") {
                macroLine = macroLine "+lshift,+6,-6,-lshift";
                break;
            }
            if ($x == "&") {
                macroLine = macroLine "+lshift,+7,-7,-lshift";
                break;
            }
            if ($x == "*") {
                macroLine = macroLine "+lshift,+8,-8,-lshift";
                break;
            }
            if ($x == "(") {
                macroLine = macroLine "+lshift,+9,-9,-lshift";
                break;
            }
            if ($x == ")") {
                macroLine = macroLine "+lshift,+0,-0,-lshift";
                break;
            }
            if ($x == "_") {
                macroLine = macroLine "+lshift,+minus,-minus,-lshift";
                break;
            }
            if ($x == "<") {
                macroLine = macroLine "+lshift,+comma,-comma,-lshift";
                break;
            }
            if ($x == ">") {
                macroLine = macroLine "+lshift,+dot,-dot,-lshift";
                break;
            }
            if ($x == "?") {
                macroLine = macroLine "+lshift,+slash,-slash,-lshift";
                break;
            }
            if ($x == ":") {
                macroLine = macroLine "+lshift,+colon,-colon,-lshift";
                break;
            }
            if ($x == "@") {
                macroLine = macroLine "+lshift,+quote,-quote,-lshift";
                break;
            }
            if ($x == "~") {
                macroLine = macroLine "+lshift,+hash,-hash,-lshift";
                break;
            }
            if ($x == "{") {
                macroLine = macroLine "+lshift,+lbrace,-lbrace,-lshift";
                break;
            }
            if ($x == "}") {
                macroLine = macroLine "+lshift,+rbrace,-rbrace,-lshift";
                break;
            }

            # A normal key, press and release it, catches all the remaining cases
            macroLine = macroLine "+" $x ",-" $x
        }
        while (0)
        # 0 means it runs only once instead of endlessly looping in case of errors
        
        # I add a comma between this key and the next unless I 'm at the last one
        if (x < NF)
            macroLine = macroLine ","
        else
            # Finished reading the macro, sending it macro to the output
            print macroLine
    }
}
END {}
