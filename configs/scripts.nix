{
  home.file = {
    "local/bin/reload-waybar.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash

        pkill -x .waybar-wrapped
        sleep 1
        waybar &
      '';
    };

    "local/bin/wallpaper-changer.sh" = {
      executable = true;
      text = ''
        #!/bin/sh

        DIR="/home/$USER/Pictures/catppuccin"
        WAL="$(ls "$DIR"/*.{png,jpg} 2>/dev/null | shuf -n1)"
        cp "$WAL" "/home/$USER/.config/wall.jpg"
        swaybg -o eDP-1 -i /home/$USER/.config/wall.jpg --mode fill
      '';
    };
  };
}