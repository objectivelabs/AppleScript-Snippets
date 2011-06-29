on textfilelog(logarray)
	try
		set theLine to (do shell script ("date +'%b %d, %Y %r'" as string)) & tab & list_to_string(logarray, tab)
		do shell script "echo " & quoted form of theLine & " >> " & quoted form of theTextLogPath
	end try
end textfilelog