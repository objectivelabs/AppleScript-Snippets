on renameMe(theFile, theNewName)
	try
		set myscript to "mv '" & theFile & "' '" & theNewName & "'"
		if theFile does not contain ".log" then
			logIt(false, false, "", myscript)
		end if
		doshellscript(myscript)
	on error err
		logIt(false, false, "", "renameMe error: " & err)
	end try
end renameMe