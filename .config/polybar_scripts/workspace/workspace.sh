WORKSPACE_FILE="/tmp/current_workspace"

if [ ! -f "$WORKSPACE_FILE" ]; then
	echo "1" > "$WORKSPACE_FILE"
fi

CURRENT_WORKSPACE=$(cat "$WORKSPACE_FILE")



if [[ "$1" == "click" ]]; then
	case "$2" in
		1) i3 workspace number 1 ;;
		2) i3 workspace number 2 ;;
		3) i3 workspace number 3 ;;
	esac
elif [[ "$1" == "scroll" ]]; then
	if [[ "$2" == "down" ]]; then
		CURRENT_WORKSPACE=$((CURRENT_WORKSPACE - 1))
		if [[ $CURRENT_WORKSPACE -lt 1 ]]; then
			CURRENT_WORKSPACE=3
		fi
	elif [[ "$2" == "up" ]]; then
		CURRENT_WORKSPACE=$((CURRENT_WORKSPACE + 1))
		if [[ $CURRENT_WORKSPACE -gt 3 ]]; then
			CURRENT_WORKSPACE=1
		fi
	fi

	i3 workspace number $CURRENT_WORKSPACE
	echo "$CURRENT_WORKSPACE" > "$WORKSPACE_FILE"
	
else
	echo "%{A1:$0 click 1:}%{A}  %{A1:$0 click 2:}%{A}  %{A1:$0 click 3:}%{A}"
fi
