# Installation:
Put both files in
\Documents\My Games\Skyrim Special Edition\Saves

# What it does:

- Runs [SKSE Co-Save Cleaner](https://www.nexusmods.com/skyrimspecialedition/mods/17377) at the beginning, deleting excess skse co-saves.
- Checks if everything is already backed up from the script
- Creates a "backup" folder along with "old" inside of it.
- Copies the 6 newest saves  to the "backup" folder.
- Deletes old saves the "old" folder.
- Moves existing saves from the "backup" folder to the "old" folder.
- **It then _DELETES_ the oldest saves until only the** _**6 newest remain**_ **in the main folder.**


To disable that last bit just delete the last chunk, its all anotated.
You could also change the max save numbers and whatnot to whatever, I just keep it lower

# Installation:

After installing [SKSE Co-Save Cleaner](https://www.nexusmods.com/skyrimspecialedition/mods/17377) properly simply run the .bat file from anywhere on your computer (except like system32 or sumn idk, just put it on ur desktop or sumn)

Do NOT rename [SKSE Co-Save Cleaner's](https://www.nexusmods.com/skyrimspecialedition/mods/17377) vbs file unless you plan on editing my script


# Optional Files:

Here's the readme from the optional file to see if you even wanna download it



This script can also be ran from anywhere.

If you keep "Skyrim Save Backuper-er.bat" in another folder than your save folder you will have to edit the path in "AutoBackup.bat"
under "rem Run the batch file" to match the location of "Skyrim Save Backuper-er.bat"

for example:

    rem Run the batch file
    call "C:\Users\YourUsername\Downloads\Skyrim Save Backuper-er.bat"

    OR (My Choice)

    rem Run the batch file
    call "%HOMEDRIVE%%HOMEPATH%\Documents\My Games\Skyrim Special Edition\Saves\Skyrim Save Backuper-er.bat"


I keep "AutoBackup.bat" in my Skyrim folder and use "SKSE+AutoBackup.bat" to open skyrim, then the script
keeping it 100% automated and simple.
If you want to use that too you'd have to edit the SKSE launcher path and the path to "Autobackup.bat"

I'd recommend leaving "AutoBackup.bat" and "Skyrim Save Backuper-er.bat" In your skyrim save folder
for the least amount of file editing.
