BEGIN {}
/^macro:[:alpha: ]+/ {
    macroLine=""
    # I check every field from the second one (the first one is "macro:")
    for(x=2;x<=NF;x++){
        do{ 
            # I found a keys being kept pressed or just released, I print it as it is
            # This works because (probably) I don't want to keep pressed keys that need to be translated (symbols)
            if(length($x)>1&&(substr($x,1,1)=="+"||substr($x,1,1)=="-")){macroLine=macroLine $x; break;}
            # An upper-case key, I need to press shift to do it. Using the !=toupper I avoid triggering things like ","==tolower(",") and ","==toupper(",") 
            if($x!=tolower($x)){macroLine=macroLine "+lshift," "+" tolower($x) ",-" tolower($x) ",-lshift"; break;}
            if($x=="`"){ macroLine=macroLine "+grave,-grave"; break;}
            if($x=="-"){ macroLine=macroLine "+minus,-minus"; break;}
            if($x=="["){ macroLine=macroLine "+lbrace,-lbrace"; break;}
            if($x=="]"){ macroLine=macroLine "+rbrace,-rbrace"; break;}
            if($x==";"){ macroLine=macroLine "+colon,-colon"; break;}
            if($x=="'"){ macroLine=macroLine "+quote,-quote"; break;}
            if($x=="\\"){ macroLine=macroLine "+bslash_iso,-bslash_iso"; break;}
            if($x==","){ macroLine=macroLine "+comma,-comma"; break;}
            if($x=="."){ macroLine=macroLine "+dot,-dot"; break;}
            if($x=="#"){ macroLine=macroLine "+hash,-hash"; break;}
            if($x=="="){ macroLine=macroLine "+equal,-equal"; break;}
            if($x=="/"){ macroLine=macroLine "+slash,-slash"; break;}
            #if($x=="/"){ macroLine=macroLine "+numslash,-numslash"; break;}
            #if($x=="!"){ macroLine=macroLine "+exclam,-exclam"; break;}
            if($x=="!"){ macroLine=macroLine "+lctrl,+lshift,+u,+0,-0,+0,-0,+2,-2,+1,-1,-u,-lshift,-lctrl"; break;}
            if($x=="?"){ macroLine=macroLine "+lctrl,+lshift,+u,+0,-0,+0,-0,+3,-3,+f,-f,-u,-lshift,-lctrl"; break;}
            if($x=="("){ macroLine=macroLine "+lctrl,+lshift,+u,+0,-0,+0,-0,+2,-2,+8,-8,-u,-lshift,-lctrl"; break;}
            if($x==")"){ macroLine=macroLine "+lctrl,+lshift,+u,+0,-0,+0,-0,+2,-2,+9,-9,-u,-lshift,-lctrl"; break;}
            if($x=="\""){ macroLine=macroLine "+lctrl,+lshift,+u,+2,-2,+0,-0,+1,-1,+c,-c,-u,-lshift,-lctrl"; break;}
            # !"!""£$
            # A normal key, press and release it, catches all the remaining cases
            macroLine=macroLine "+" $x ",-" $x
        }
        while(0)  # 0 means it runs only once instead of endlessly looping in case of errors

        if(x<NF)
        # I add a comma between this key and the next unless I'm at the last one
            macroLine=macroLine ","
        else
        # sending the macro to the output
            print macroLine
        }
}
END {}
