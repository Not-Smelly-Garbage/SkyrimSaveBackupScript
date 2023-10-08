@echo off

:: Launch Skyrim	
"PATH TO SKSE64_LOADER.EXE"

:: Wait for Skyrim to launch first
timeout /t 90

:: Launch your batch script (Can be edited to autobackup path ig)
cd "%HOMEDRIVE%%HOMEPATH%\Documents\My Games\Skyrim Special Edition\Saves"
AutoBackup.bat

:: Exit the batch script
exit /b