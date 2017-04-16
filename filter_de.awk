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
            if ($x == "^") {
                macroLine = macroLine "+grave,-grave";
                break;
            }
            if ($x == "°") {
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
            if ($x == "²") {
                macroLine = macroLine "+ralt,+2,-2,-ralt";
                break;
            }
            if ($x == "§") {
                macroLine = macroLine "+lshift,+3,-3,-lshift";
                break;
            }
            if ($x == "³") {
                macroLine = macroLine "+ralt,+3,-3,-ralt";
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
            if ($x == "&") {
                macroLine = macroLine "+lshift,+6,-6,-lshift";
                break;
            }
            if ($x == "/") {
                macroLine = macroLine "+lshift,+7,-7,-lshift";
                break;
            }
            if ($x == "{") {
                macroLine = macroLine "+ralt,+7,-7,-ralt";
                break;
            }
            if ($x == "(") {
                macroLine = macroLine "+lshift,+8,-8,-lshift";
                break;
            }
            if ($x == "[") {
                macroLine = macroLine "+ralt,+8,-8,-ralt";
                break;
            }
            if ($x == ")") {
                macroLine = macroLine "+lshift,+9,-9,-lshift";
                break;
            }
            if ($x == "]") {
                macroLine = macroLine "+ralt,+9,-9,-ralt";
                break;
            }
            if ($x == "=") {
                macroLine = macroLine "+lshift,+0,-0,-lshift";
                break;
            }
            if ($x == "}") {
                macroLine = macroLine "+ralt,+0,-0,-ralt";
                break;
            }
            if ($x == "ß") {
                macroLine = macroLine "+minus,-minus";
                break;
            }
            if ($x == "?") {
                macroLine = macroLine "+lshift,+minus,-minus,-lshift";
                break;
            }
            if ($x == "´") {
                macroLine = macroLine "+equal,-equal";
                break;
            }
            if ($x == "`") {
                macroLine = macroLine "+lshift,+equal,-equal,-lshift";
                break;
            }
            if ($x == "@") {
                macroLine = macroLine "+ralt,+q,-q,-ralt";
                break;
            }
            if ($x == "€") {
                macroLine = macroLine "+ralt,+e,-e,-ralt";
                break;
            }
            if ($x == "z") {
                macroLine = macroLine "+y,-y";
                break;
            }
            if ($x == "Z") {
                macroLine = macroLine "+lshift,+y,-y,-lshift";
                break;
            }
            if ($x == "ü") {
                macroLine = macroLine "+lbrace,-lbrace";
                break;
            }
            if ($x == "Ü") {
                macroLine = macroLine "+lshift,+lbrace,-lbrace,-lshift";
                break;
            }
            if ($x == "+") {
                macroLine = macroLine "+rbrace,-rbrace";
                break;
            }
            if ($x == "*") {
                macroLine = macroLine "+lshift,+rbrace,-rbrace,-lshift";
                break;
            }
            if ($x == "~") {
                macroLine = macroLine "+ralt,+rbrace,-rbrace,-ralt";
                break;
            }
            if ($x == "#") {
                macroLine = macroLine "+hash,-hash";
                break;
            }
            if ($x == "'") {
                macroLine = macroLine "+lshift,+hash,-hash,-lshift";
                break;
            }
            if ($x == "ö") {
                macroLine = macroLine "+colon,-colon";
                break;
            }
            if ($x == "Ö") {
                macroLine = macroLine "+lshift,+colon,-colon,-lshift";
                break;
            }
            if ($x == "ä") {
                macroLine = macroLine "+quote,-quote";
                break;
            }
            if ($x == "Ä") {
                macroLine = macroLine "+lshift,+quote,-quote,-lshift";
                break;
            }
            if ($x == ",") {
                macroLine = macroLine "+comma,-comma";
                break;
            }
            if ($x == ";") {
                macroLine = macroLine "+lshift,+comma,-comma,-lshift";
                break;
            }
            if ($x == "<") {
                macroLine = macroLine "+bslash_iso,-bslash_iso";
                break;
            }
            if ($x == ">") {
                macroLine = macroLine "+lshift,+bslash_iso,-bslash_iso,-lshift";
                break;
            }
            if ($x == "|") {
                macroLine = macroLine "+ralt,+bslash_iso,-bslash_iso,-ralt";
                break;
            }
            if ($x == "y") {
                macroLine = macroLine "+z,-z";
                break;
            }
            if ($x == "Y") {
                macroLine = macroLine "+lshift,+z,-z,-lshift";
                break;
            }
            if ($x == "µ") {
                macroLine = macroLine "+ralt,+z,-z,-ralt";
                break;
            }
            if ($x == ".") {
                macroLine = macroLine "+dot,-dot";
                break;
            }
            if ($x == ":") {
                macroLine = macroLine "+lshift,+dot,-dot,-lshift";
                break;
            }
            if ($x == "-") {
                macroLine = macroLine "+slash,-slash";
                break;
            }
            if ($x == "_") {
                macroLine = macroLine "+lshift,+slash,-slash,-lshift";
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
