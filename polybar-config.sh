;==========================================================
;
;
;   ██████╗  ██████╗ ██╗  ██╗   ██╗██████╗  █████╗ ██████╗
;   ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
;   ██████╔╝██║   ██║██║   ╚████╔╝ ██████╔╝███████║██████╔╝
;   ██╔═══╝ ██║   ██║██║    ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗
;   ██║     ╚██████╔╝███████╗██║   ██████╔╝██║  ██║██║  ██║
;   ╚═╝      ╚═════╝ ╚══════╝╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
;
;
;   To learn more about how to configure Polybar
;   go to https://github.com/jaagr/polybar
;
;   The README contains alot of information
;
;==========================================================

[colors]
;background = ${xrdb:color0:#222}
background = #222
; background-alt = #444
background-alt = #222
;foreground = ${xrdb:color7:#222}
foreground = #dfdfdf
foreground-alt = #7b7b7b
; foreground-alt = #555
primary = #ffb52a
secondary = #e60053
alert = #bd2c40

[bar/example]
;monitor = ${env:MONITOR:HDMI-1}
; monitor = ${env:MONITOR:}
width = 100%
height = 47
;offset-x = 1%
;offset-y = 1%
radius = 6.0
fixed-center = true
bottom = true

background = ${colors.background}
foreground = ${colors.foreground}

line-size = 3
line-color = #f00

border-size = 4
border-color = #00000000

padding-left = 0
padding-right = 2

module-margin-left = 1
module-margin-right = 2

; font-0 = fixed:pixelsize=20;1
; font-0 = NotoSans-Regular:size=20;0
; font-0 = "Inconsolata for Powerline:size=20;0"
; font-0 = "DroidSansMono Nerd Font Mono:size=20;0"
font-0 = "FontAwesome:size=20;0"
font-1 = "DroidSansMono Nerd Font Mono:size=20;0"
; font-1 = unifont:fontformat=truetype:size=15:antialias=false;0
; font-1 = fontawesome-refular:size=15:0
; font-1 = "DroidSansMono Nerd Font Mono":size=20;0
font-2 = siji:pixelsize=20;1
; font-2 = NotoMono-Regular:size=20;0
; label-active-font = 1

; modules-left = bspwm i3
modules-left = powermenu i3 xwindow
; modules-center = networkspeedup networkspeeddown
modules-center = cpu
; mpd
; modules-right = filesystem xbacklight xkeyboard memory cpu battery temperature date powermenu
modules-right = pulseaudio memory battery wlan temperature date

tray-position = right
tray-padding = 0
;tray-transparent = true
;tray-background = #0063ff
; tray-scale = 0.5
tray-maxsize = 26

;wm-restack = bspwm
;wm-restack = i3

;override-redirect = true

;scroll-up = bspwm-desknext
;scroll-down = bspwm-deskprev

;scroll-up = i3wm-wsnext
;scroll-down = i3wm-wsprev

cursor-click = pointer
cursor-scroll = ns-resize

[module/xwindow]
type = internal/xwindow
; label = %title:0:30:...%
format-foreground = ${colors.foreground-alt}

[module/xkeyboard]
type = internal/xkeyboard
blacklist-0 = num lock

format-prefix = " "
format-prefix-foreground = ${colors.foreground-alt}
format-prefix-underline = ${colors.secondary}

label-layout = %layout%
label-layout-underline = ${colors.secondary}

label-indicator-padding = 2
label-indicator-margin = 1
label-indicator-background = ${colors.secondary}
label-indicator-underline = ${colors.secondary}

[module/filesystem]
type = internal/fs
interval = 25

mount-0 = /

label-mounted = %{F#0a81f5}%mountpoint%%{F-}: %percentage_used%%
label-unmounted = %mountpoint% not mounted
label-unmounted-foreground = ${colors.foreground-alt}

[module/bspwm]
type = internal/bspwm

label-focused = %index%
label-focused-background = ${colors.background-alt}
label-focused-underline= ${colors.primary}
label-focused-padding = 2

label-occupied = %index%
label-occupied-padding = 2

label-urgent = %index%!
label-urgent-background = ${colors.alert}
label-urgent-padding = 2

label-empty = %index%
label-empty-foreground = ${colors.foreground-alt}
label-empty-padding = 2

; Separator in between workspaces
; label-separator = |

[module/i3]
type = internal/i3
format = <label-state> <label-mode>
index-sort = true
wrapping-scroll = false

; Only show workspaces on the same output as the bar
;pin-workspaces = true

label-mode-padding = 2
label-mode-foreground = #000
label-mode-background = ${colors.primary}

; focused = Active workspace on focused monitor
label-focused = %index%
label-focused-background = ${module/bspwm.label-focused-background}
label-focused-underline = ${module/bspwm.label-focused-underline}
label-focused-padding = ${module/bspwm.label-focused-padding}

; unfocused = Inactive workspace on any monitor
label-unfocused = %index%
label-unfocused-padding = ${module/bspwm.label-occupied-padding}

; visible = Active workspace on unfocused monitor
label-visible = %index%
label-visible-background = ${self.label-focused-background}
label-visible-underline = ${self.label-focused-underline}
label-visible-padding = ${self.label-focused-padding}

; urgent = Workspace with urgency hint set
label-urgent = %index%
label-urgent-background = ${module/bspwm.label-urgent-background}
label-urgent-padding = ${module/bspwm.label-urgent-padding}

; Separator in between workspaces
; label-separator = |


[module/mpd]
type = internal/mpd
format-online = <label-song>  <icon-prev> <icon-stop> <toggle> <icon-next>
format-offline =

icon-prev = 
icon-stop = 
icon-play = 
icon-pause = 
icon-next = 

label-song-maxlen = 25
label-song-ellipsis = true

[module/xbacklight]
type = internal/xbacklight

format = <label> <bar>
label = BL

bar-width = 10
bar-indicator = |
bar-indicator-foreground = #fff
bar-indicator-font = 2
bar-fill = ─
bar-fill-font = 2
bar-fill-foreground = #9f78e1
bar-empty = ─
bar-empty-font = 2
bar-empty-foreground = ${colors.foreground-alt}

[module/backlight-acpi]
inherit = module/xbacklight
type = internal/backlight
card = intel_backlight

; [module/cpu]
; type = internal/cpu
; interval = 2
; format-prefix = "CPU "
; format-prefix-foreground = ${colors.foreground-alt}
; format-underline = #f90000
; ; label = CPU %percentage:2%%

[module/cpu]
type = internal/cpu
interval = 0.5
format = <label> <ramp-coreload>
label = 

ramp-coreload-0 = ▁
ramp-coreload-0-font = 2
ramp-coreload-0-foreground = #aaff77
ramp-coreload-1 = ▂
ramp-coreload-1-font = 2
ramp-coreload-1-foreground = #aaff77
ramp-coreload-2 = ▃
ramp-coreload-2-font = 2
ramp-coreload-2-foreground = #aaff77
ramp-coreload-3 = ▄
ramp-coreload-3-font = 2
ramp-coreload-3-foreground = #aaff77
ramp-coreload-4 = ▅
ramp-coreload-4-font = 2
ramp-coreload-4-foreground = #fba922
ramp-coreload-5 = ▆
ramp-coreload-5-font = 2
ramp-coreload-5-foreground = #fba922
ramp-coreload-6 = ▇
ramp-coreload-6-font = 2
ramp-coreload-6-foreground = #ff5555
ramp-coreload-7 = █
ramp-coreload-7-font = 2
ramp-coreload-7-foreground = #ff5555

[module/memory]
type = internal/memory
interval = 2
format-prefix = "RAM "
format-prefix-foreground = ${colors.foreground-alt}
format-underline = #4bffdc
; label = %percentage_used%%

[module/wlan]
type = internal/network
interface = wlp2s0
interval = 3.0

format-connected = <ramp-signal> <label-connected>
format-connected-underline = #9f78e1
label-connected = %downspeed:9%
; label-connected = %essid%

format-disconnected =
;format-disconnected = <label-disconnected>
;format-disconnected-underline = ${self.format-connected-underline}
;label-disconnected = %ifname% disconnected
;label-disconnected-foreground = ${colors.foreground-alt}

ramp-signal-0 = 
; ramp-signal-1 = 
; ramp-signal-2 = 
; ramp-signal-3 = 
; ramp-signal-4 = 
ramp-signal-foreground = ${colors.foreground-alt}

[module/eth]
type = internal/network
interface = 
interval = 3.0

format-connected-underline = #55aa55
format-connected-prefix = " "
format-connected-prefix-foreground = ${colors.foreground-alt}
label-connected = %local_ip%

format-disconnected =
;format-disconnected = <label-disconnected>
;format-disconnected-underline = ${self.format-connected-underline}
;label-disconnected = %ifname% disconnected
;label-disconnected-foreground = ${colors.foreground-alt}

[module/date]
type = internal/date
interval = 5

; date =
date = %b %d -
; date-alt = " %Y-%m-%d"

time = %H:%M
time-alt = %H:%M:%S

format-prefix = 
format-prefix-foreground = ${colors.foreground-alt}
format-underline = #0a6cf5

label = "  %date% %time%"


[module/pulseaudio]
type = internal/pulseaudio

format-volume = <label-volume> <bar-volume>
label-volume =   %percentage%%
label-volume-foreground = ${root.foreground}

label-muted = 
label-muted-foreground = #666

bar-volume-width = 10
bar-volume-foreground-0 = #55aa55
bar-volume-foreground-1 = #55aa55
bar-volume-foreground-2 = #55aa55
bar-volume-foreground-3 = #55aa55
bar-volume-foreground-4 = #55aa55
bar-volume-foreground-5 = #f5a70a
bar-volume-foreground-6 = #ff5555
bar-volume-gradient = false
bar-volume-indicator = |
bar-volume-indicator-font = 2
bar-volume-fill = ─
bar-volume-fill-font = 2
bar-volume-empty = ─
bar-volume-empty-font = 2
bar-volume-empty-foreground = ${colors.foreground-alt}

[module/alsa]
type = internal/alsa

format-volume = <label-volume> <bar-volume>
label-volume = VOL
label-volume-foreground = ${root.foreground}

format-muted-prefix = " "
format-muted-foreground = ${colors.foreground-alt}
label-muted = sound muted

bar-volume-width = 10
bar-volume-foreground-0 = #55aa55
bar-volume-foreground-1 = #55aa55
bar-volume-foreground-2 = #55aa55
bar-volume-foreground-3 = #55aa55
bar-volume-foreground-4 = #55aa55
bar-volume-foreground-5 = #f5a70a
bar-volume-foreground-6 = #ff5555
bar-volume-gradient = false
bar-volume-indicator = |
bar-volume-indicator-font = 2
bar-volume-fill = ─
bar-volume-fill-font = 2
bar-volume-empty = ─
bar-volume-empty-font = 2
bar-volume-empty-foreground = ${colors.foreground-alt}

; [module/battery]
; type = internal/battery
; full-at = 98
;
; format-charging = <animation-charging> <label-charging>
; format-discharging = <ramp-capacity> <label-discharging>
; format-full = <ramp-capacity> <label-full>
;
; ramp-capacity-0 = 
; ramp-capacity-0-foreground = #f53c3c
; ramp-capacity-1 = 
; ramp-capacity-1-foreground = #ffa900
; ramp-capacity-2 = 
; ramp-capacity-3 = 
; ramp-capacity-4 = 
;
; bar-capacity-width = 10
; bar-capacity-format = %{+u}%{+o}%fill%%empty%%{-u}%{-o}
; bar-capacity-fill = █
; bar-capacity-fill-foreground = #ddffffff
; bar-capacity-fill-font = 3
; bar-capacity-empty = █
; bar-capacity-empty-font = 3
; bar-capacity-empty-foreground = #44ffffff
;
; animation-charging-0 = 
; animation-charging-1 = 
; animation-charging-2 = 
; animation-charging-3 = 
; animation-charging-4 = 
; animation-charging-framerate = 750

[module/battery]
type = internal/battery
battery = BAT0
adapter = AC
full-at = 98

format-charging = <animation-charging> <label-charging>
format-charging-underline = #ffb52a

format-discharging = <animation-discharging> <label-discharging>
format-discharging-underline = ${self.format-charging-underline}

format-full-prefix = " "
format-full-prefix-foreground = ${colors.foreground-alt}
format-full-underline = ${self.format-charging-underline}

ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 
ramp-capacity-foreground = ${colors.foreground-alt}


animation-charging-0 = 
animation-charging-foreground = ${colors.foreground-alt}
animation-charging-framerate = 750

animation-discharging-0 = 
animation-discharging-1 = 
animation-discharging-2 = 
animation-discharging-3 = 
animation-discharging-4 = 
animation-discharging-foreground = ${colors.foreground-alt}
animation-discharging-framerate = 750

; label-charging = BATT %percentage%
; label-discharging = BATT %percentage%

[module/temperature]
type = internal/temperature
thermal-zone = 0
warn-temperature = 60

format = <ramp> <label>
format-underline = #f50a4d
format-warn = <ramp> <label-warn>
format-warn-underline = ${self.format-underline}

label = %temperature-c%
label-warn = %temperature-c%
label-warn-foreground = ${colors.secondary}

ramp-0 = 
ramp-1 = 
ramp-2 = 
ramp-foreground = ${colors.foreground-alt}

; [module/hostname]
; type = internal/date
; ; interval = 5
;
; ; date =
; date = %b %d -
; date-alt = " %Y-%m-%d"
;
; time = %H:%M
; time-alt = %H:%M:%S
;
; format-prefix = 
; format-prefix-foreground = ${colors.foreground-alt}
; format-underline = #0a6cf5
;
; label = "  %date% %time%"
; ; label = "  hila"
;
;
; [module/powermenu]
; type = custom/menu
;
; format-padding = 5
;
; label-open = 
; label-close = 
;
; menu-0-0 = Terminate WM
; menu-0-0-foreground = #fba922
; menu-0-0-exec = bspc quit -1
; menu-0-1 = Reboot
; menu-0-1-foreground = #fba922
; menu-0-1-exec = menu_open-1
; menu-0-2 = Power off
; menu-0-2-foreground = #fba922
; menu-0-2-exec = menu_open-2
;
; menu-1-0 = Cancel
; menu-1-0-foreground = #fba922
; menu-1-0-exec = menu_open-0
; menu-1-1 = Reboot
; menu-1-1-foreground = #fba922
; menu-1-1-exec = sudo reboot
;
; menu-2-0 = Power off
; menu-2-0-foreground = #fba922
; menu-2-0-exec = sudo poweroff
; menu-2-1 = Cancel
; menu-2-1-foreground = #fba922
; menu-2-1-exec = menu_open-0



[module/powermenu]
type = custom/menu

expand-right = true

format-spacing = 1

label-open = 
label-open-foreground = ${colors.foreground}
label-close = 
label-close-foreground = ${colors.foreground-alt}
label-separator = |
label-separator-foreground = ${colors.foreground-alt}

menu-0-0 = reboot
menu-0-0-exec = reboot
menu-0-1 = power off
menu-0-1-exec = poweroff
;
; menu-1-0 = cancel
; menu-1-0-exec = menu-open-0
; menu-1-1 = reboot
; menu-1-1-exec = sudo reboot
;
; menu-2-0 = power off
; menu-2-0-exec = sudo poweroff
; menu-2-1 = cancel
; menu-2-1-exec = menu-open-0

[settings]
screenchange-reload = true
;compositing-background = xor
;compositing-background = screen
;compositing-foreground = source
;compositing-border = over
pseudo-transparency = true

[global/wm]
margin-top = 5
margin-bottom = 5

; vim:ft=dosini
