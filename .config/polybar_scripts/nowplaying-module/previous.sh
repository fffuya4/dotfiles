playerctlstatus=$(playerctl status 2> /dev/null)

if [[ $playerctlstatus == "" ]]; then
	echo ""
elif [[ $playerctlstatus =~ "Playing" ]]; then
	echo "%{A1:playerctl previous:}󰒮%{A}"
else
	echo "%{A1:playerctl previous:}󰒮%{A}"
fi
