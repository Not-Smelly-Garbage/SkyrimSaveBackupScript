$folderPath = "$env:HOMEDRIVE$env:HOMEPATH\Documents\My Games\Skyrim Special Edition\Saves"

Write-Host ""
Write-Host "Monitoring Save Files..."
Write-Host ""

$lastFileCount = -1

while ($true) {

    $fileCount = (Get-ChildItem -Path $folderPath -Filter "*.ess").Count

    if ($fileCount -ne $lastFileCount) {
        Write-Host "$fileCount Saves Detected"
	    Write-Host ""
        $lastFileCount = $fileCount
    }
	
    if ($fileCount -ge 12) {
		
        $currentTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Write-Host "Backed Up Saves at $currentTime" -BackgroundColor Green -ForegroundColor Black
		Write-Host ""
		
        Start-Process -FilePath "$folderPath\Skyrim Save Backuper-er.bat" -WindowStyle Minimized
        Start-Sleep -Seconds 5

		Write-Host "- - - - - - - - - - - - - - - - - - - -"
        Write-Host "Monitoring Save Files..."
		Write-Host ""
    }
	
    $process = Get-Process | Where-Object { $_.Name -eq "SkyrimSE" }

    if ($null -eq $process) {
        Write-Host "SkyrimSE.exe is not running. Exiting script."
        Start-Sleep -Seconds 4
        break
    }

    Start-Sleep -Seconds 60
}
