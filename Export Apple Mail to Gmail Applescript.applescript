(* 

This script will automate the forwarding of your Mail.app email messages to your
gmail account. Keep in mind that it will take 2 seconds per email so make sure you 
allow yourself enough time. For more information on the gml.py necessary for this 
script, go to http://www.marklyon.org/gmail/.

Make sure you've downloaded the python source code from
http://www.marklyon.org/gmail/gml.tar and placed it on your desktop. chmod the
file to 755 if you have permission problems.


Disclaimer: This script was written in a few minutes so there could
be some problems with it, and it could use a bit of error trapping.
Here it is with no guarantee it wont burn your house down and destroy
all your email messages, but I'd be very surprised if it did.

*)


-- Your Gmail email address
property myGMailAddress : "youremail@gmail.com"

-- Path to your Mailboxes
property mymailboxpath : "/Users/yourusername/Library/Mail/Mailboxes/"

--Path to the downloaded gml.py file
property gmlFilePath : "/Users/yourusername/Desktop/gml.py"

--Exclude mailboxes that contain any of these words add any words you like
property myExcludedMailboxesList : {"cache", "junk", "deleted", "drafts", "sent", "outbox", "info.plist", ".DS_Store"}

-- Don't change this unless you know what you're doing
property alternateSMTPServer : "gsmtp171.google.com"



try
	set myMailBoxes to (list folder (mymailboxpath as POSIX file))
	set finalMBoxList to {}
	repeat with eachMbox in myMailBoxes
		set exclude to false
		repeat with eachExclusion in myExcludedMailboxesList
			if eachMbox contains eachExclusion then
				set exclude to true
			else if eachMbox does not contain ".mbox" then
				set exclude to true
			end if
		end repeat
		if exclude is false then set finalMBoxList to finalMBoxList & eachMbox
	end repeat
	
	repeat with eachMbox in finalMBoxList
		set gmlCommand to "/usr/bin/env python '" & gmlFilePath & "' mbox '" & mymailboxpath & eachMbox & "/mbox' " & myGMailAddress & " " & alternateSMTPServer
		tell application "Terminal"
			do script gmlCommand
		end tell
	end repeat
on error err
	display dialog err giving up after 20
end try
