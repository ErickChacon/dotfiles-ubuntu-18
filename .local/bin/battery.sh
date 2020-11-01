#!/bin/sh

# Prints all batteries, their percentage remaining and an emoji corresponding
# to charge status (🔌 for plugged up, 🔋 for discharging on battery, etc.).

case $BLOCK_BUTTON in
	3) notify-send "🔋 Battery module" "🔋: discharging
🛑: not charging
♻: stagnant charge
🔌: charging
⚡: charged
❗: battery very low!
- Scroll to change adjust xbacklight." ;;
	4) xbacklight -inc 10 ;;
	5) xbacklight -dec 10 ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

# Loop through all attached batteries.
for battery in /sys/class/power_supply/BAT?
do
    # Get its remaining capacity and charge status.
    capacity=$(cat "$battery"/capacity 2>/dev/null) || break
    capacity_label=$(expr $capacity / 10)
    # status=$(sed "s/[Dd]ischarging/🔋/;s/[Nn]ot charging/🛑/;s/[Cc]harging/🔌/;s/[Uu]nknown/♻️/;s/[Ff]ull/⚡/" "$battery"/status)
    status=$(cat "$battery"/status)

    if [ $status = "Discharging" ]; then
        case "$capacity_label" in
            "0") icon="" ;;
            "1") icon="" ;;
            "2") icon="" ;;
            "3") icon="" ;;
            "4") icon="" ;;
            "5") icon="" ;;
            "6") icon="" ;;
            "7") icon="" ;;
            "8") icon="" ;;
            "9") icon="" ;;
            "10") icon="" ;;
        esac
    elif [ $status = "Charging" ]; then
        case "$capacity_label" in
            "0") icon="" ;;
            "1") icon="" ;;
            "2") icon="" ;;
            "3") icon="" ;;
            "4") icon="" ;;
            "5") icon="" ;;
            "6") icon="" ;;
            "7") icon="" ;;
            "8") icon="" ;;
            "9") icon="" ;;
            "10") icon="" ;;
        esac
    elif [ $status = "Not charging" ]; then
        icon="";
    elif [ $status = "Unknown" ]; then
        icon="";
    elif [ $status = "Full" ]; then
        icon="";
    fi

	printf "%s%s%% " "$icon " "$capacity"
done | sed 's/ *$//'
