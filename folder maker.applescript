on folderMaker(thePath, NameOnly)
	(*
     thePath is the path to the folder you want the folder to be created in
     NameOnly is the name you want to give the folder
     
     both handler inputs should be strings
     *)
	tell application "Finder"
		if (folder (thePath & NameOnly) exists) is not true then
			try
				make new folder at folder (thePath) with properties {name:NameOnly}
                on error the_error
				display dialog the_error giving up after 10
			end try
		end if
	end tell
end folderMaker