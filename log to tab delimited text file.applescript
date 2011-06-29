on logFile(theFields, logFileName)
	(* 
     this script is intended to be used to write logs to a tab delimited text file
     
     logfilename is a string
     theFields must be a  list
     logfilename is just the name of your log file
     *)
	try
		tell application "Finder"
			if not (file ((path to desktop folder as text) & logFileName) exists) then
				set theLogFile to make file at folder (path to desktop folder as text)
				set the name of theLogFile to logFileName
				set myFile to open for access file ((path to desktop folder as text) & logFileName) with write permission
                else
				set myFile to open for access file ((path to desktop folder as text) & logFileName) with write permission
			end if
			set endOfFile to get eof myFile
			repeat with eachField in theFields
				set theFieldString to theFieldString & item eachField of theFields & tab
			end repeat
			write (theFieldString & return) to myFile starting at (endOfFile + 1)
			close access myFile
		end tell
        on error err
		display dialog "log file error" & err giving up after 5
		try
			close access ((path to desktop folder as text) & logFileName)
		end try
	end try
end logFile
