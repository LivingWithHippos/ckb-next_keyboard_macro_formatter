# ckb-next_keyboard_macro_formatter
A script to translate text into a macro compatible with [ckb-next.](https://github.com/mattanger/ckb-next)
This is helpful for those without a Corsair keyboard that want to use macro with their mouse since currently macro recording for mices like the Scimitair does not work. 
Please note this is a work in progress and has many bugs probably. Symbols are compatible with the en_uk layout only for now, alphanumerics (a-zA-Z0-9) and modifiers (ctrl,alt) should work anyway.
## How to use

### 1. Prepare your macro
Create a text file with your favourite editor and start writing "macro: " (without quotes) this need to be written on every row you want to be processed as macro. The space after the ":" is also needed.
You can now start to write your macro. Every command need to be separated with a space
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

## Examples

Create the file my_macro.txt in the same folder as this script, open in and write
```
# Cut
macro: +lctrl x -lctrl
# Copy
macro: +lctrl c -lctrl
# Paste
macro: +lctrl v -lctrl
# Some words
macro: H e l l o , space +lshift W o r l d -lshift
```
Save it and open the terminal in this same folder, run `bash macro_script.sh my_macro.txt` and you should obtain an output.txt file. Follow the instructions of Step 3 to import it into ckb-next.
