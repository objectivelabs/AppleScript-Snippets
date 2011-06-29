(*** Email Prefs ***)
property mySMTP : "pop3.email.server.com"
property myAuthentication : {theusername:"", thePassword:""}
property myFrom : {theName:"Sorting Machine", theEmailAddress:"your@replytoemail.com"}
property myTo : {{theName:"Your Email", theEmailAddress:"you@youremail.com"}} as list
property sendmail : ""

on sendEmail(mybody, mysubject)
	--will send an emial for error reporting
	set therecipients to {}
	repeat with eachRecipient in myTo
		set therecipients to therecipients & {{name:theName of eachRecipient, email address:theEmailAddress of eachRecipient}}
	end repeat
	try
		send email mybody & return & return subject mysubject Â
			from {name:theName of myFrom, email address:theEmailAddress of myFrom} Â
			to therecipients Â
			via host mySMTP --using authentication {kind:plain authentication, user name:theusername of myAuthentication, password:thePassword of myAuthentication} -- Use this parameter if your SMTP server requires authentication.		
	on error err
		log "Error: sendEmail: E-mail could not be sent." & err
	end try
end sendEmail