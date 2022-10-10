#!/usr/bin/bash
# custom bash autostart script for nimdow window manager
# author: deathbystereo

# determine where to place the log file
logfile="/tmp/nimdow_autost.log"

remove_oldlog() {
	# Remove old logfile 
if [[ -e "$logfile" ]]; then rm -f "$logfile"; fi
}

## autostart functions for bar, wallpaper,policykit-agent,compositor
#launch_bar() {
     
  # Launch yabar
    #while pgrep -i yabar; do
	#    pkill yabar
        #sleep 0.5s
    #done
    ##yabar -c "$HOME"/.config/yabar/yabar.conf >/dev/null 2>&1 | tee -a "$logfile" & disown
    #yabar -c "$HOME"/.config/yabar/yabar.conf 2>&1 | tee -a "$logfile" & disown
            
        # Launch umberbar rust compiled
        #.$HOME/.cargo/bin/myumberbar &
    	#Launch i3status-rust via bash script
        #$HOME/.config/dk/scripts/i3status
  # Launch i3status-rust
   #while pgrep -i i3status-rs; do
 	#	pkill i3status-rs
   # 	sleep 0.2s
   #done
   #i3status-rs "$HOME"/.config/i3status-rust/config.toml 2>&1 | tee -a "$logfile" & disown
   # while pgrep -i cnxcustom; do
#	    pkill cnxcustom
#	    sleep 0.2s
#    done
#   ./cnxcustom/target/debug/cnxcustom 2>&1 | tee -a "$logfile" &>/dev/null & disown
#    while prep -i eww; do
#	    pkill eww
#	    sleep 0.2s
#    done
#    (./eww/target/release/eww daemon && ./eww/target/release/eww open bar) 2>&1 | tee -a "$logfile"  
#
#}  

wallpaper() {
 #launch  wallpaper w/ feh
/usr/bin/feh --bg-fill "$HOME"/Pictures/Arch_Linux_Linux_Gentoo_installation-1177780.jpg 2>&1 | tee -a "$logfile" & 
}

launch_compositor() {
 # picom compisitor launch
	if  type -P picom &>/dev/null; then
    		/usr/bin/picom -b --config "$HOME"/.config/picom/picom.conf 2>&1 | tee -a "$logfile" 
	fi
}
		
execute_polkit() {
  ## PolicyKit legacy authentication agent for gui
  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >/dev/null 2>&1 | tee -a --output-error=warn "$logfile" & 
}


main() {
remove_oldlog
#launch_bar
wallpaper
launch_compositor
execute_polkit
}
main

exit 0
