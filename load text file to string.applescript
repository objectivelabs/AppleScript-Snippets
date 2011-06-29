(* The purpose of this handler is to load a text file from a posix path to a string*)
 
on loadTextFile(thepath)
	try
		set thestring to ""
		set thescript to ("cat " & "'" & thepath & "'")
		set thestring to do shell script thescript
		return thestring
        on error err
		log ("Cat text file error: " & err)
	end try
end loadTextFile