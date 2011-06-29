(*
 The purpose of the is handler is to accept a file name as a parameter and return the filename without the dot 3 name extension (eg on removeExtension("filename.txt") returns the string "filename")
 *)
on removeExtension(theString)
	set N to count of characters of theString
	if (N > 3) and character (N - 3) of theString is "." then
		set theString to characters 1 thru (N - 4) of theString
		set theString to theString as text
        else
		--there isn't an extension
	end if
	return theString
end removeExtension