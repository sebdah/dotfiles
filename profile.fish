if status --is-login
	if test -z "$DISPLAY" -a $XDG_VTNR = 1
		startx /usr/bin/i3
	end
end
