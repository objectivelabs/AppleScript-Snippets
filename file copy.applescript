on fileCopy(theFile, theLocation, overwrite)
	--THIS MOVES THE COMPLETED GIF/PDF TO THE WIN2K BOX FOR WEB PREVIEW	
	try
		if overwrite is "1" or overwrite is "true" or overwrite is true then
			set theOption to "-f "
		else
			set theOption to ""
		end if
		if overwrite is "0" or overwrite is "false" or overwrite is false then
			set itExists to doesThisExist(theFile)
			if itExists is true then
				set thescript to ""
				logIt(false, false, "", theFile & " already exists.")
			else
				set thescript to "cp -p " & theOption & "'" & theFile & "' '" & theLocation & "/'"
			end if
		else
			set thescript to "cp -p " & theOption & "'" & theFile & "' '" & theLocation & "/'"
		end if
		
		logIt(false, false, "", thescript)
		doshellscript(thescript)
	on error err
		logIt(false, false, "", "Error: fileMove: " & err)
	end try
end fileCopy

