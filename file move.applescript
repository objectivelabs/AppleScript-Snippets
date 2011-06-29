on isFileBusy(thePath)
    --Tests to see if a file is in use
	try
		set myscript to "if ( lsof -Fp " & thePath & " | grep -q p[0-9]* ) then echo 'file is busy'; else echo 'not busy';fi"
		set myResult to do shell script myscript
		if myResult is "file is busy" then
			return true
            else
			return false
		end if
        on error err
		Display Dialog ("Error: isFileBusy " & err) giving up after 5
	end try
end isFileBusy