(*
The purpose of the is handler is to accept a file name as a parameter and return the filename without the dot 3 name extension (eg on removeExtension("filename.txt") returns the string "filename")
*)
on removeExtension(thestring)
	set N to count of characters of thestring
	if (N > 3) and character (N - 3) of thestring is "." then
		set thestring to characters 1 thru (N - 4) of thestring
		set thestring to thestring as text
	else
		--there isn't an extension
	end if
	return thestring
end removeExtension