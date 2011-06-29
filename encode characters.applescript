on encode_char(this_char)
	--this will convert ascii text to hex numbers used in URLs
	--it will return a URL encoded string
	set the ASCII_num to (the ASCII number this_char)
	set the hex_list to Â
		{"0", "1", "2", "3", "4", "5", "6", "7", "8", Â
			"9", "A", "B", "C", "D", "E", "F"}
	set x to item ((ASCII_num div 16) + 1) of the hex_list
	set y to item ((ASCII_num mod 16) + 1) of the hex_list
	return ("%" & x & y) as string
end encode_char

on encode_text(this_text)
	--this is a filter used pre encode_char to determine
	--what characters in a string need to be encoded
	set the standard_characters to Â
		"abcdefghijklmnopqrstuvwxyz0123456789"
	set the blocked_characters to "'"
	set the acceptable_characters to the standard_characters
	set the encoded_text to ""
	repeat with this_char in this_text
		if this_char is in the acceptable_characters then
			set the encoded_text to Â
				(the encoded_text & this_char)
		else if this_char is in the blocked_characters then
		else
			set the encoded_text to Â
				(the encoded_text & encode_char(this_char)) as string
		end if
	end repeat
	return the encoded_text
end encode_text
