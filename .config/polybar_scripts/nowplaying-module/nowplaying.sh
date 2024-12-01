playerctlstatus=$(playerctl status 2> /dev/null)

if [[ $playerctlstatus == "" ]]; then
	echo ""
elif [[ $playerctlstatus =~ "Playing" ]]; then
	echo "󰎇 $(playerctl metadata title) - $(playerctl metadata artist)"
fi
