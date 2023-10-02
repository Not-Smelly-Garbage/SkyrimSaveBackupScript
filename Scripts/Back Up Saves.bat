@echo off
.\simple_orphaned_skse_co-save_deleter.vbs

REM Compare the files in the main directory with the files in the backup directory
setlocal enabledelayedexpansion
set "files_are_same=true"

for %%f in (*.skse *.ess) do (
    fc "%%f" "backup\%%f" > nul
    if errorlevel 1 (
        set "files_are_same=false"
        goto :files_not_same
    )
    if errorlevel 0 (
        set "files_are_same=true"
        goto :files_are_same
    )
)

:files_are_same
if %files_are_same%==true (
    echo Files already backed up
    echo Make some new saves
    timeout /t 5 > nul
    exit
)

:files_not_same
setlocal enabledelayedexpansion

set "source_folder=.\"
set "backup_folder=backup"

cd %source_folder%

REM Check if the files in the main root directory are exactly the same as in "backup"
fc /b "%source_folder%" "%backup_folder%" >nul

REM If the result code is 0 (no differences), wait for 5 seconds and display a message
if %errorlevel% equ 0 (
    echo Files already backed up! Make some new saves!
    timeout /t 5
    exit /b

REM Create the "backup" folder if it doesn't exist
if not exist %backup_folder% mkdir %backup_folder%

REM Create the "old" folder inside "backup" if it doesn't exist
if not exist %backup_folder%\old mkdir %backup_folder%\old

REM Delete old ".skse" and ".ess" files in the "old" folder
for %%i in (%backup_folder%\old\*.skse %backup_folder%\old\*.ess) do (
    del "%%i"
)

REM Move existing ".skse" and ".ess" files from "backup" to "old"
for %%i in (%backup_folder%\*.skse %backup_folder%\*.ess) do (
    move "%%i" %backup_folder%\old\
)

REM Copy the 6 newest ".skse" files to "backup"
setlocal enabledelayedexpansion
set count=0
for /f "delims=" %%f in ('dir /b /a-d /o-d *.skse ^| findstr /n "^"') do (
    set file=%%f
    set /a count+=1
    if !count! leq 6 (
        copy "!file:*:=!" %backup_folder%\
    )
)

REM Copy the 6 newest ".ess" files to "backup"
setlocal enabledelayedexpansion
set count=0
for /f "delims=" %%f in ('dir /b /a-d /o-d *.ess ^| findstr /n "^"') do (
    set file=%%f
    set /a count+=1
    if !count! leq 6 (
        copy "!file:*:=!" %backup_folder%\
    )
)

REM Delete old ".skse" files in the main directory until only 6 newest remain
setlocal enabledelayedexpansion
set count=0
for /f "delims=" %%f in ('dir /b /a-d /o-d *.skse ^| findstr /n "^"') do (
    set file=%%f
    set /a count+=1
    if !count! gtr 6 (
        del "!file:*:=!"
    )
)

REM Delete old ".ess" files in the main directory until only 6 newest remain
setlocal enabledelayedexpansion
set count=0
for /f "delims=" %%f in ('dir /b /a-d /o-d *.ess ^| findstr /n "^"') do (
    set file=%%f
    set /a count+=1
    if !count! gtr 6 (
        del "!file:*:=!"
    )
)
