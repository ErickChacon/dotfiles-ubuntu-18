#!/bin/sh

monitors=$(xrandr | awk '/ connected/ { print $1}')
monitors_len=$(echo $monitors | wc -w)
resolutions=$(xrandr | awk '/[ \*]\+/ { print $1}')
resolutions_x=$(echo $resolutions | tr " " "\n" | awk 'BEGIN { FS = "x" }; { print $1}')
resolutions_y=$(echo $resolutions | tr " " "\n" | awk 'BEGIN { FS = "x" }; { print $2}')
only_one=${1:-true}
internal=${2:-false}

if [ $internal = "true" ]; then
    main_ix=1; sec_ix=2; main_sc=1.3; sec_sc=1.5;
else
    main_ix=2; sec_ix=1; main_sc=1.5; sec_sc=1.3;
fi

if [ $only_one = "true" ]; then
    sec_sc=0;
fi

main_mon=$(echo $monitors | cut -d " " -f $main_ix)
main_res=$(echo $resolutions | cut -d " " -f $main_ix)
main_res_x=$(echo $resolutions_x | cut -d " " -f $main_ix)
main_res_y=$(echo $resolutions_y | cut -d " " -f $main_ix)
main_sc_aux=$(echo "scale=0; $main_sc*10/1" | bc)
main_pan_x=$(expr $main_res_x \* $main_sc_aux / 10)
main_pan_y=$(expr $main_res_y \* $main_sc_aux / 10)
main_pan=$main_pan_x'x'$main_pan_y+0+0

sec_mon=$(echo $monitors | cut -d " " -f $sec_ix)
sec_res=$(echo $resolutions | cut -d " " -f $sec_ix)
sec_res_x=$(echo $resolutions_x | cut -d " " -f $sec_ix)
sec_res_y=$(echo $resolutions_y | cut -d " " -f $sec_ix)
sec_sc_aux=$(echo "scale=0; $sec_sc*10/1" | bc)
sec_pan_x=$(expr $sec_res_x \* $sec_sc_aux / 10)
sec_pan_y=$(expr $sec_res_y \* $sec_sc_aux / 10)
sec_pan=$sec_pan_x'x'$sec_pan_y+$main_pan_x+0

fb_x=$(($main_pan_x + $sec_pan_x))
fb_y=$(($main_pan_y > $sec_pan_y ? $main_pan_y : $sec_pan_y))
fb=$fb_x'x'$fb_y

if [ $only_one = "true" ]; then

    xrandr --fb $fb \
        --output $sec_mon --off \
        --output $main_mon --mode $main_res --scale $main_sc'x'$main_sc --pos 0x0 \
        --panning $fb+0+0 --primary

else

            # xrandr --fb 5360x1440\
            #     --output DP-1 --mode 3440x1440 --scale 1x1 --pos 0x0 \
            #     --panning 3440x1440+0+0 --primary \
            #     --output eDP-1 --mode 1920x1080 --scale 1x1 --pos 3440x0 \
            #     --panning 1920x1080+3440+0 --verbose


    xrandr --fb $fb \
        --output $main_mon --mode $main_res --scale $main_sc'x'$main_sc \
        --pos 0x0 --panning $main_pan --primary \
        --output $sec_mon --mode $sec_res --scale $sec_sc'x'$sec_sc \
        --pos $main_pan_x'x'0 --panning $sec_pan

    # echo $pan

fi
