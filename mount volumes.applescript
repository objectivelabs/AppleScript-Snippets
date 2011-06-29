set requiredDrives to {{theName:"drive1name", theMountscript:"afp://username:password@ip/drive1name"}, {theName:"drive2name", theMountscript:"afp://username:password@ip/drive2name"}} as list

set theDisks to list disks

repeat with i from 1 to (length of requiredDrives)
	if theDisks does not contain theName of item i of requiredDrives then
		mount volume theMountscript of item i of requiredDrives
	end if
end repeat