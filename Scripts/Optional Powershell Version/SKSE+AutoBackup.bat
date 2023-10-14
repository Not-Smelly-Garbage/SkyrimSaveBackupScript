@echo off

:: Launch Skyrim	
"Path to skse64_launcher"

:: Wait for Skyrim to launch first
timeout /t 90

:: Launch AutoBackup
powershell -Command "Start-Process -Verb RunAs powershell -ArgumentList '-ExecutionPolicy Bypass -File ""%HOMEDRIVE%%HOMEPATH%\Documents\My Games\Skyrim Special Edition\Saves\AutoBackup.ps1""'"


:: Exit the batch script
exit /b