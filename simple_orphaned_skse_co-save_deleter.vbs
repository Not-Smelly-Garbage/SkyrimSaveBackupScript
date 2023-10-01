Option Explicit
Dim saveLocation
saveLocation = "C:\Users\Hot Smelly Garbage\Documents\My Games\Skyrim Special Edition\Saves"

Dim fso
Set fso = CreateObject("Scripting.FileSystemObject")
Dim saveFolder
Set saveFolder = fso.GetFolder(saveLocation)

Dim essFile
Dim skseFile

For Each skseFile in saveFolder.Files
	if Mid(skseFile.NAME,len(skseFile.NAME)-4,5) = ".skse" then
		if coSaveCanBeDeleted(skseFile) then
			fso.DeleteFile(skseFile)
		end if
	end if
Next

Function coSaveCanBeDeleted(skseFile)
	coSaveCanBeDeleted = true
	For Each essFile in saveFolder.Files
		if Mid(essFile.NAME,len(essFile.NAME)-3,4) = ".ess" then
			if cstr(fso.GetBaseName(skseFile)) = cstr(fso.GetBaseName(essFile)) then
			coSaveCanBeDeleted = false
			end if
		end if
	Next
End Function