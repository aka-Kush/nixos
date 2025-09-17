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


        API_KEY=$(cat ~/.config/wallhaven_key.txt)
                        SEARCH_QUERY="${theme.wallpaper}"

                        WALL_PATH="/home/$USER/.config/wall.jpg"

                        # Fetch random wallpaper URL from Wallhaven API
                        search_url="https://wallhaven.cc/api/v1/search?q=$SEARCH_QUERY&categories=100&purity=100&resolutions=1920x1080&sorting=random&per_page=1"

                        response=$(curl -s -H "Authorization: Bearer $API_KEY" "$search_url")
                        url=$(echo "$response" | jq -r '.data[0].path')

                        if [ -z "$url" ] || [ "$url" = "null" ]; then
                          # Fallback: use local random wallpaper from directory as before
                          DIR="/home/$USER/Pictures/${theme.wallpaper}"
                          WAL="$(ls "$DIR"/*.{png,jpg} 2>/dev/null | shuf -n1)"
                          cp "$WAL" "$WALL_PATH"
                        else
                          # Download wallpaper from Wallhaven API to config path
                          curl -s -o "$WALL_PATH" "$url"
                        fi

                        # Set the wallpaper using swaybg for the eDP-1 output
                        swaybg -o eDP-1 -i "$WALL_PATH" --mode fill
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
