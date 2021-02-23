#!/bin/sh

cpus=$(mpstat 1 1 -P ALL | awk '/^Average/ && $2 ~ /^[0-9]+$/ { print $3}')
cpus_len=$(echo $cpus | wc -w)
output=""

for cpu in $cpus; do
    cpu_use=$(awk "function ceil(x, y){y=int(x); return(x>y?y+1:y)} BEGIN {print ceil($cpu / (100 / 8))}")
    case "$cpu_use" in
        "0") icon="▁" ;;
        "1") icon="▁" ;;
        "2") icon="▂" ;;
        "3") icon="▃" ;;
        "4") icon="▄" ;;
        "5") icon="▅" ;;
        "6") icon="▆" ;;
        "7") icon="▇" ;;
        "8") icon="█" ;;
    esac
    # output="${output}　${icon}"
    output="${output} ${icon}"
    # output="${output} ${icon}"
    # output=$output"\s"$icon
    # output=$output"a　b\u2000"$icon
done
# output="h${output}h"
# output="this is  a al a  f　d　s　a　f　d　s　afds s"
# output="thh hjjj i　s　s　s　s　s　s　s　s　sddd"
# output="thh hjjj i s s s s s s s s sddd"
# output="a b c d e f g h i j k l m n"

# printf "%s %40s" "hola" "$output"
# /usr/bin/printf "%s %b bla" "hola" "$output"
# printf $output
# printf $output
echo " "$output
