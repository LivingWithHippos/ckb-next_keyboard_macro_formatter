# ckb-next_keyboard_macro_formatter
A script to translate text into a macro compatible with [ckb-next.](https://github.com/mattanger/ckb-next)
This is helpful for those without a Corsair keyboard that want to use macro with their mouse since currently macro recording for Corsair's mices ([supported mice list here](https://github.com/mattanger/ckb-next#device-support)) does not work. 
Please note this is a work in progress and has many bugs probably. Symbols are compatible with the English (en_uk), Italian (it), and German (de) layouts only for now, alphanumerics (a-zA-Z0-9) and modifiers (ctrl,alt) should work anyway (except for the French numbers).

## How to use

### 1. Prepare your macro
Create a text file with your favourite editor and start writing "macro: " (without quotes) this need to be written on every row you want to be processed as macro. The space after the ":" is also needed.
You can now start to write your macro. **Every command need to be separated with a space**
* Single letters or symbols: write them once 
* Keys that need to be kept pressed: type them starting with a plus when you want to start pressing (+lctrl for the left control key) and release them when you need to with a minus (-lctrl). 
See the table below for some useful keys names. Remember to save your file. 

### 2. Run the script
Open your terminal in the script folder and run `bash macro_script.sh ./path_to_your_macro` 
This creates an output.txt file with the formatted macro. Open it and copy its content.

### 3. Import it into ckb-next
Open ckb, select the Binding tab on the top, choose on the drawing the mouse button you want to associate the macro to, select the Binding tab on the bottom, click the last Tab, "Macro", and paste your saved macro in the "Macro Key Actions" field. Add a title and description if you want to **and then click on Apply**. Your macro should now work.

## Some useful keys' names
Original Key | Macro Key Name
------------ | ----------
Left Ctrl | lctrl
Right Ctrl | rctrl
Left Alt | lalt
Right Alt | ralt
Shift | lshift and rshift
Escape | esc
Space Bar | space
Tab | tab
Caps lock | caps
f1,f2... | f1,f2...
Enter | enter

See [the complete list here](https://github.com/LivingWithHippos/ckb-next_keyboard_macro_formatter/blob/master/keys_names.md) or [the list for the Corsair Scimitar here.](https://github.com/LivingWithHippos/ckb-next_keyboard_macro_formatter/blob/master/keys_names_scimitair.md)

## Examples

Create the file my_macro.txt in the same folder as this script, open in and write
```
# Cut
macro: +lctrl x -lctrl
# Copy
macro: +lctrl c -lctrl
# Paste
macro: +lctrl v -lctrl
# Hello, WORLD!
macro: H e l l o , space +lshift w o r l d -lshift !
```             

Save it and open the terminal in this same folder, run `bash macro_script.sh my_macro.txt` and you should obtain an output.txt file. Follow the instructions of Step 3 to import it into ckb-next.

### Advanced Example

You can insert every UNICODE symbol using the key combination
`+lctrl +lshift +u UNICODE_CODE -u -lshift -lctrl`
For example © has 00A9 as code so the correct sequence is 
`+lctrl +lshift +u 0 0 a 9 -u -lshift -lctrl`
letters must be written in lower case because you are already pressing shift. You can see a list of codes on [this Wikipedia article.](https://en.wikipedia.org/wiki/List_of_Unicode_characters)
This is not working 100%, I think It would be solved using some delay between presses.
 
## Using other layouts
You can switch between languages for this script by opening [the macro main script](https://github.com/LivingWithHippos/ckb-next_keyboard_macro_formatter/blob/master/macro_script.sh) an modifying the line `AWK=./filter_en_uk.awk` to your needs.

## Creating you own language script
You can now use [the automated awk filter creator](https://github.com/LivingWithHippos/ckb-next_keyboard_macro_formatter/blob/master/automated_layout_filter_creator.sh) to create your own script. Run it and follow the instruction on the screen. The idea is that you can create a new filter if you have a keyboard with a standard QWERTY layout: 
1. A first row with a symbol key under esc on the left of "1", ten numbers and 2 other symbols keys
2. A row below it starting with TAB, with two symbols keys on the left of ENTER
3. A row below it starting with CAPS LOCK, with three symbols keys on the left of Enter
4. Another row below it starting with LEFT SHIFT with a symbol key on its right and three symbols keys on the left of RIGHT SHIFT

This describes a lot of keyboard but more customization is coming. Run this script, give a name (like your language) as first input and then you'll be asked to press all these symbols keys, from the top left to the bottom right, pressing them first normally and then with the SHIFT key (numbers key need to be pressed only with SHIFT). If your keyboard doesn't have a symbol avaiable on that SHIFT+key you can just skip it by pressing ENTER. You don't need to escape \ and ". It's much easier to do than to explain ;P Remember to change the name in the macro_script.sh at the end.
