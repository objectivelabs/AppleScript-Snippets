(*
 This handler is intended to accept a string input, and remove the contents of a specific tag within that sting input. This is great for getting string contents out of xml or html files. For example, if you want to get the title of an html document you call
 tagParse(yourFileContents, "")
 
 it would return the text between the two title tags. 
 *)
on tagParse(thisText, openTag, closeTag)
	set new_text to ""
	set strlen to the length of thisText
	set taglen to (the length of openTag) - 1
	set closeTagLen to (the length of closeTag) - 1
	set stridx to 1
	repeat until (stridx + taglen) is greater than strlen
		set thisString to the contents of characters stridx through (stridx + taglen) of thisText as text
		log thisString
		if thisString is openTag then
			set firstChar to stridx + taglen + 1
			--display dialog "the title text starts at character " & firstChar
			repeat until (stridx + closeTagLen) is greater than strlen
				set thisString to the contents of characters stridx through (stridx + closeTagLen) of thisText as text
				log thisString
				if thisString is closeTag then
					return the contents of characters firstChar through (stridx - 1) of thisText as text
				end if
				set stridx to stridx + 1
			end repeat
		end if
		set stridx to stridx + 1
	end repeat
	return "Error:: tag " & openTag & " not found."
end tagParse