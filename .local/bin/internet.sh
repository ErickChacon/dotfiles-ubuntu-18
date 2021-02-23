#!/bin/sh

# Show wifi 直 and percent strength or 睊 if none.
# Show  if connected to ethernet or ❎ if none.

case $BLOCK_BUTTON in
	1) "$TERMINAL" -e nmtui; pkill -RTMIN+4 dwmblocks ;;
	3) notify-send "🌐 Internet module" "\- Click to connect
📡: no wifi connection
📶: wifi connection with quality
❎: no ethernet
🌐: ethernet working
" ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

wifi_state=$(cat /sys/class/net/w*/operstate 2>/dev/null)

if [ $wifi_state = "up" ]; then
    wifiicon="$(awk '/^\s*w/ { print "直 " int($3 * 100 / 70) "%" }' /proc/net/wireless)";
    wifiname=" ("$(nmcli device wifi list | awk -F '[[:space:]][[:space:]]+' '/^\*/ {print $2}')")";
    # $7 signal
elif [ $wifi_state = "down" ]; then
    wifiicon="睊 ";
fi

printf "%s%s%s\n" "$wifiicon$wifiname" "$(sed "s/down//;s/up//" /sys/class/net/e*/operstate 2>/dev/null)"
