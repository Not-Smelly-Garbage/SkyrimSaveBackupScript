@echo off
cd "%HOMEDRIVE%%HOMEPATH%\Documents\My Games\Skyrim Special Edition\Saves"
set "folderPath=%HOMEDRIVE%%HOMEPATH%\Documents\My Games\Skyrim Special Edition\Saves"

echo[
echo Monitoring Save Files...
echo[

:loop
set "fileCount=0"

rem Count the number of .ess files in the folder
for %%f in ("%folderPath%\*.ess") do (
    set /a "fileCount+=1"
)

echo %fileCount% Saves Detected
echo[

rem Check if fileCount is greater than or equal to 12
if %fileCount% geq 12 (

    rem Display "Backed Up Saves" with a timecode
    for /f "tokens=2 delims==" %%a in ('wmic os get localdatetime /value') do set "dt=%%a"
    set "currentTime=%dt:~0,4%-%dt:~4,2%-%dt:~6,2% %dt:~8,2%:%dt:~10,2%:%dt:~12,2%"
    color 20
    echo Backed Up Saves at %currentTime%
    color
    echo[

    rem Run the batch file
    call "%HOMEDRIVE%%HOMEPATH%\Documents\My Games\Skyrim Special Edition\Saves\Skyrim Save Backuper-er.bat"
    timeout /t 5

)

rem Check if SkyrimSE.exe is running
tasklist | find /i "SkyrimSE.exe" > nul
  if errorlevel 1 (
    echo SkyrimSE.exe is not running. Exiting script.
    timeout /t 4
    exit /b
 )

timeout /t 60
goto loop
