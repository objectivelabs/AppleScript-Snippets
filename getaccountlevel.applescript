on getaccountlevel(thefile)
	-- this method queries the textbackup table to see of this is a stg or prod file
	try
		set thelevel to do shell script "curl http://xserve1.stc.mrll.com/getaccountlevel.php?filename=" & thefile
		if thelevel contains "prod" then
			return "prod"
		else if thelevel contains "stg" then
			return "stg"
		else
			return "stg"
		end if
	on error
		return "prod"
	end try
end getaccountlevel