
# bindsym $mod+d exec dmenu_run -nb '$color_11' -nf '$nvim_foreground' -sf '$nvim_background' -sb '$color_10'
# bindsym $mod+d exec dmenu_run -nb '$color_11' -nf '$nvim_background' -sb '$color_14' -sf '$nvim_background' -fn 'NotoMonoRegular:bold:pixelsize=28'

# bindsym $mod+d exec dmenu_run -nb '$nvim_background' -nf '$nvim_foreground' -sb '$color_11' -sf '$nvim_background' -fn 'NotoMonoRegular:pixelsize=28'
bindsym $mod+d exec dmenu_run -nf '$nvim_foreground' -sb '$color_11' -sf '$nvim_background' -fn 'NotoMonoRegular:pixelsize=28'
# bindsym $mod+d exec dmenu_run -nb '$color_11' -nf '$nvim_background' -sb '$nvim_background' -sf '$nvim_foreground' -fn 'NotoMonoRegular:bold:pixelsize=28'

# bindsym $mod+d exec dmenu_run -nb '$color_11' -nf '$nvim_background' -sf '$nvim_background' -sb '$color_14' -fn 'NotoMonoRegular:bold'
# bindsym $mod+d exec --no-startup-id dmenu_run -i -nb '#191919' -nf '#2aa198' -sb '#2aa198' -sf '#191919' -fn 'NotoMonoRegular:bold:pixelsize=24'
# bindsym $mod+d exec dmenu_run -nb '#1e1e1e' -sf '#1e1e1e' -sb '#f4800d' -nf '#F4800d'
# bindsym $mod+d exec dmenu_run -sb '$color_11'

# ######################################
# # class                 border  backgr. text    indicator child_border
# client.focused          #4c7899 #285577 #ffffff #2e9ef4   #285577
# client.focused_inactive #333333 #5f676a #ffffff #484e50   #5f676a
# client.unfocused        #333333 #222222 #888888 #292d2e   #222222
# client.urgent           #2f343a #900000 #ffffff #900000   #900000
# client.placeholder      #000000 #0c0c0c #ffffff #000000   #0c0c0c
# client.background       #ffffff

# class                 border  backgr. text    indicator child_border
# client.focused          #C5423A #C5423A #C5423A #C5423A   #C5423A
# client.focused          $nvim_foreground $nvim_foreground $nvim_foreground $nvim_foreground $nvim_foreground $nvim_foreground
client.focused          $color_11 $color_11 $color_11 $color_11 $color_11 $color_11
# client.focused          $transparent $transparent $transparent $transparent   $transparent
# client.focused_inactive #333333 #5f676a #ffffff #484e50   #5f676a
client.focused_inactive $nvim_background $nvim_background $nvim_background $nvim_background $nvim_background $nvim_background
# client.unfocused        #333333 #222222 #888888 #292d2e   #222222
client.unfocused        $nvim_background $nvim_background $nvim_background $nvim_background $nvim_background $nvim_background
# client.urgent           #2f343a #900000 #ffffff #900000   #900000
# client.placeholder      #000000 #0c0c0c #ffffff #000000   #0c0c0c
# client.background       #ffffff

