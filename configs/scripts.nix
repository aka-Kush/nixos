{ pkgs, theme, ... }:
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

        DIR="/home/$USER/Pictures/${theme.wallpaper}"
        WAL="$(ls "$DIR"/*.{png,jpg} 2>/dev/null | shuf -n1)"
        cp "$WAL" "/home/$USER/.config/wall.jpg"
        swaybg -o eDP-1 -i /home/$USER/.config/wall.jpg --mode fill
      '';
    };

    "local/bin/hypr-window-switcher.sh" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash

        selected=$(hyprctl clients -j | jq -r '.[] | "\(.address) \(.class) - \(.title)"' | wofi --dmenu --prompt "Windows")

        [ -z "$selected" ] && exit 0  # if nothing selected

        addr=$(echo "$selected" | awk '{print $1}')
        hyprctl dispatch focuswindow address:$addr
      '';
    };
  };
}
