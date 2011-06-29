(* This script will convert anything in the finder to text, and then sort that text. Procedure is to copy an item. Run this script from the script menu, then paste.
 *)
 set the clipboard to list_to_string(ASCII_Sort(string_to_list(«class ktxt» of ((the clipboard as text) as record), return)), return)
 
on ASCII_Sort(my_list)
	--from apple
	set the index_list to {}
	set the sorted_list to {}
	repeat (the number of items in my_list) times
		set the low_item to ""
		repeat with i from 1 to (number of items in my_list)
			if i is not in the index_list then
				set this_item to item i of my_list as text
				if the low_item is "" then
					set the low_item to this_item
					set the low_item_index to i
                    else if this_item comes before the low_item then
					set the low_item to this_item
					set the low_item_index to i
				end if
			end if
		end repeat
		set the end of sorted_list to the low_item
		set the end of the index_list to the low_item_index
	end repeat
	return the sorted_list
end ASCII_Sort
 
 
on snr(the_string, search_string, replace_string)
	return my list_to_string((my list_to_string(the_string, search_string)), replace_string)
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
	set Applescript's text item delimiters to the_delim
end atid