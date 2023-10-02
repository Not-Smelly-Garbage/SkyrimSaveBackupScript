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
