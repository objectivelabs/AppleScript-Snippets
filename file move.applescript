on fileMove(theFile, theLocation, overwrite)
	try
		if overwrite is "1" or overwrite is "true" or overwrite is true then
			set theOption to "-f "
		else
			set theOption to "-n "
		end if
		if overwrite is "0" or overwrite is "false" or overwrite is false then
			set itExists to doesThisExist(theFile)
			if itExists is true then
				set thescript to ""
				logIt(false, false, "", theFile & " already exists.")
			else
				set thescript to "mv " & theOption & "'" & theFile & "' '" & theLocation & "/'"
			end if
		else
			set thescript to "mv " & theOption & "'" & theFile & "' '" & theLocation & "/'"
		end if
		set thescript to snr(thescript, "//", "/")
		logIt(false, true, "", theName of myFrom & " " & thescript)
		--logIt(false, false, "", theScript)
		doshellscript(thescript)
	on error err
		logIt(false, false, "", "Error: fileMove: " & err)
	end try
end fileMove