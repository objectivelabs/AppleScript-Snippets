(**** Example ****)
-- this example will find the word "work" in the string "Bob went to work." and replace it with "the beach".
set myResult to snr("Bob went to work.", "work", "the beach")
display dialog myResult
--

(**** fast search and replace methods ****)
on snr(the_string, search_string, replace_string)
	return my list_to_string((my string_to_list(the_string, search_string)), replace_string)
end snr

on list_to_string(the_list, the_delim)
	my atid(the_delim)
	set the_string to (every text item of the_list) as string
	my atid("")
	return the_string
end list_to_string

on string_to_list(the_string, the_delim)
	my atid(the_delim)
	set the_list to (every text item of the_string) as list
	my atid("")
	return the_list
end string_to_list

on atid(the_delim)
	set AppleScript's text item delimiters to the_delim
end atid