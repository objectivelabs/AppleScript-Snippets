on checkForEOF(theFile)
	try
		set theFileExtension to getExtension(POSIX path of theFile)
		if theFileExtension is "pdf" or theFileExtension is "PDF" then
			--set lastline to doshellscript("tail -n 1 " & quoted form of (POSIX path of theFile))
			set lastline to doshellscript("ruby -ne 'line = $_; END {puts line}' < " & quoted form of (POSIX path of theFile))
			if lastline ends with "%%EOF" then
				--	logIt(false, false, "", "pdf is complete, continue")
				return true
			else
				--	logIt(false, false, "", "the download is not yet complete or the pdf has errors")
				logIt(false, false, "", "Invalid End of file found. This file will not be moved now but will be checked again shortly: " & POSIX path of theFile & return & return & " Here is the last line of the file: " & return & lastline)
				return false
			end if
		else if theFileExtension is "eps" or theFileExtension is "EPS" then
			set lastline to doshellscript("tail -n 1 " & quoted form of (POSIX path of theFile))
			if lastline ends with "%%Trailer" or lastline ends with "%%EOF" then
				--	logIt(false, false, "", "pdf is complete, continue")
				return true
			else
				--	logIt(false, false, "", "the download is not yet complete or the pdf has errors")
				logIt(false, false, "", "Invalid End of file found. This file will not be moved now but will be checked again shortly: " & POSIX path of theFile & return & return & " Here is the last line of the file: " & return & lastline)
				return false
			end if
		else
			--logIt(false, false, "", "the file is not an eps or pdf - returning true")
			return true
		end if
	on error err
		logIt(false, false, "", "checkforEOF Error: " & err)
		return false
	end try
end checkForEOF

