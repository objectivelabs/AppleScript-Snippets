(* 
This script is intended to be in your script menu, or run as an applet. 
It will ask you to choose a path to a folder that you want to clear out
files older then X days.  It runs very fast because it uses the do shell 
script command rather than the finder to get the time stamp of the
file. It's safe to use on network drives as well.
*)

try
	set myFolder to (choose folder)
	set myTime to display dialog "Delete files older than how many days?" default answer "60"
	set myWildcard to display dialog "Enter a wildcard search string." default answer "PV*.txt"
	set myscript to "find \"" & POSIX path of myFolder & "\" -type f -name \"" & text returned of myWildcard & "\" -mtime +" & text returned of myTime & " -exec rm {} \\;"
	do shell script myscript
	display dialog "Deletion completed successfully"
on error err
	display dialog err
end try