on NumToHex(hexData, stringLength)
	set hexString to {}
	repeat with i from stringLength to 1 by -1
		set hexString to ((hexData mod 16) as string) & hexString
		set hexData to hexData div 16
	end repeat
	return (hexString as string)
end NumToHex
