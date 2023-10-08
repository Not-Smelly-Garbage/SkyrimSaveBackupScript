@echo off
cd "%HOMEDRIVE%%HOMEPATH%\Documents\My Games\Skyrim Special Edition\Saves"
set "folderPath=%HOMEDRIVE%%HOMEPATH%\Documents\My Games\Skyrim Special Edition\Saves"

:loop
echo .
echo Monitoring Save Files...
set "fileCount=0"

rem Count the number of .ess files in the folder
for %%f in ("%folderPath%\*.ess") do (
    set /a "fileCount+=1"
)

rem Check if fileCount is greater than or equal to 16
if %fileCount% geq 16 (

    rem Display "Backed Up Saves" with a timecode
    for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /value') do set "dt=%%a"
    set "currentTime=%dt:~0,4%-%dt:~4,2%-%dt:~6,2% %dt:~8,2%:%dt:~10,2%:%dt:~12,2%"
    echo Backed Up Saves at %currentTime%

    rem Run the batch file (EDIT THIS IF NEEDED)
    call "%HOMEDRIVE%%HOMEPATH%\Documents\My Games\Skyrim Special Edition\Saves\Skyrim Save Backuper-er.bat"

    echo .
    echo Monitoring Save Files...
)

rem Check if SkyrimSE.exe is running
tasklist | find /i "SkyrimSE.exe" > nul
  if errorlevel 1 (
    echo SkyrimSE.exe is not running. Exiting script.
    timeout /t 3
    exit /b
 )

timeout /t 60
goto loop
