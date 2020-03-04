#!/bin/bash

PICTURE=/tmp/i3lock.png
SCREENSHOT="scrot $PICTURE"

# BLUR="5x4"
BLUR="10x8"
# BLUR="20x16"

$SCREENSHOT
convert $PICTURE -blur $BLUR $PICTURE

# convert $PICTURE -background red -fill $(sed -n '1p' ~/Documents/.nvim_colors.vim) \
#   -pointsize 72 \
#   -border 10 \
#   -bordercolor $(sed -n '1p' ~/Documents/.nvim_colors.vim) \
#   -font Droid-Sans-Mono-Nerd-Font-Complete \
#   -gravity north  -annotate +0+200 ' |  |  | R |  |  |   |  | '\
#   $PICTURE

  # label:'|  |  |  | R |  |  |  |   |  |  |' miff:- | \

# convert -font Droid-Sans-Mono-Nerd-Font-Complete -pointsize 72 \
#   -border 4 -bordercolor $(sed -n '13p' ~/Documents/.nvim_colors.vim) \
#   -background $(sed -n '1p' ~/Documents/.nvim_colors.vim) \
#   -fill $(sed -n '2p' ~/Documents/.nvim_colors.vim) \
#   label:' ' miff:- | \
#   composite -gravity north -geometry +0+200 \
#   - $PICTURE $PICTURE
i3lock -i $PICTURE
rm $PICTURE
