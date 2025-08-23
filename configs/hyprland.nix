{
    services.hyprpaper = {
        enable = true;
        settings = {
            preload = [ "/home/kush/.config/wall.jpg" ];
            wallpaper = [ "eDP-1,/home/kush/.config/wall.jpg" ];
        };
    };

    wayland.windowManager.hyprland = {
        enable = true;
        # withUWSM = true;
        systemd.enable = true;
        settings = {
            monitor = "eDP-1,1920x1080@144,0x0,1";

            "$terminal" = "kitty";
            "$fileManager" = "thunar";
            "$menu" = "wofi --show drun";
            "$mainMod" = "SUPER";

            env = [
                "XCURSOR_SIZE,24"
                "HYPRCURSOR_SIZE,24"
                "LIBVA_DRIVER_NAME,nvidia"
                "__GLX_VENDOR_LIBRARY_NAME,nvidia"
                "NVD_BACKEND,direct"
                "GDK_SCALE,1"
                "GDK_DPI_SCALE,1"
                "QT_QPA_PLATFORM,wayland"
                "QT_AUTO_SCREEN_SCALE_FACTOR,0"
                "QT_SCALE_FACTOR,1"
            ];

            exec-once = [
                "waybar"
 		"wl-paste --type text --watch cliphist store"
                "wl-paste --type image --watch cliphist store"
                "hyprctl setcursor macOS 24"
                "nm-applet &"
                #"waybar &"
                "swaybg -o eDP-1 -i .config/wall.jpg --mode fill &" 
                "systemctl --user start hyprpolkitagent"
                "wl-clip-persist --clipboard regular"
                "wl-paste --type text --watch cliphist store"
                "wl-paste --type image --watch cliphist store"
            ];

            general = {
                gaps_in = 3;
                gaps_out = 5;
                border_size = 2;
                "col.active_border" = "rgb(eebebe)";
                "col.inactive_border" = "rgb(949cbb)";
                resize_on_border = true;
                allow_tearing = false;
                layout = "master";
            };

            decoration = {
                rounding = 0;
                rounding_power = 0;
                active_opacity = 0.98;
                inactive_opacity = 0.9;
                shadow = {
                    enabled = true;
                    range = 4;
                    render_power = 3;
                    color = "rgba(1a1a1aee)";
                };
                blur = {
                    enabled = true;
                    size = 5;
                    passes = 2;
                    vibrancy = 0.1;
                };
            };

            animations = {
                enabled = "yes, please :)";

                bezier = [
                    "easeOutQuint,0.23,1,0.32,1"
                    "easeInOutCubic,0.65,0.05,0.36,1"
                    "linear,0,0,1,1"
                    "almostLinear,0.5,0.5,0.75,1.0"
                    "quick,0.15,0,0.1,1"
                ];
		
		animation = [
                  "global, 1, 10, default"
                  "border, 1, 5.39, easeOutQuint"
                  "windows, 1, 4.79, easeOutQuint"
                  "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
                  "windowsOut, 1, 1.49, linear, popin 87%"
                  "fadeIn, 1, 1.73, almostLinear"
                  "fadeOut, 1, 1.46, almostLinear"
                  "fade, 1, 3.03, quick"
                  "layers, 1, 3.81, easeOutQuint"
                  "layersIn, 1, 4, easeOutQuint, fade"
                  "layersOut, 1, 1.5, linear, fade"
                  "fadeLayersIn, 1, 1.79, almostLinear"
                  "fadeLayersOut, 1, 1.39, almostLinear"
                  "workspaces, 1, 1.94, almostLinear, fade"
                  "workspacesIn, 1, 1.21, almostLinear, fade"
                  "workspacesOut, 1, 1.94, almostLinear, fade"
                ];
            };

            input = {
                kb_layout = "us";
                follow_mouse = 1;
                sensitivity = 0;
                touchpad = {
                    natural_scroll = true;
                };
            };

            gestures = {
                workspace_swipe = true;
            };

            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            master = {
                new_status = "slave";
                new_on_top = true;
            };

            misc = {
                force_default_wallpaper = 0;
                disable_hyprland_logo = true;
            };

            device = {
                name = "epic-mouse-v1";
                sensitivity = -0.5;
            };

            bind = [
                #$mainMod = SUPER # Sets "Windows" key as main modifier

                "$mainMod, return, exec, $terminal"
                "$mainMod, Q, killactive"
                "$mainMod, M, exit"
                "$mainMod, E, exec, $fileManager"
                "$mainMod, V, togglefloating,"
                "$mainMod, space, exec, $menu"
                "$mainMod, P, pseudo,"
                "$mainMod, J, togglesplit,"
                "$mainMod, F, fullscreen"
                "CONTROL_ALT, b, exec, wal"
                "$mainMod SHIFT, R, exec, ~/local/bin/reload-waybar.sh"
                "CONTROL_ALT, b, exec, ~/local/bin/wallpaper-changer.sh"
                "$mainMod SHIFT, X, exec, wlogout"

                # Applications
                "ALT SHIFT, W, exec, brave"
                "ALT SHIFT, I, exec, brave --incognito"
                "ALT SHIFT, S, exec, spotify"
                "ALT SHIFT, D, exec, discord"
                "ALT SHIFT, F, exec, thunar"
                "ALT SHIFT, C, exec, code"
                "ALT SHIFT, P, exec, pavucontrol"

                # screenshot
                ", Print, exec, grim -g \"$(slurp)\" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-\$(date +%F_%T).png | dunstify 'Screenshot of the region taken' -t 1000" # screenshot of a region
                "SHIFT, Print, exec, grim - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-\$(date +%F_%T).png | dunstify 'Screenshot of whole screen taken' -t 1000" # screenshot of the whole screen

                # clipboard history
                "SUPER_CTRL, V, exec, cliphist list | wofi -dmenu | cliphist decode | wl-copy"

                # Move focus with mainMod + arrow keys
                "$mainMod, left, movefocus, l"
                "$mainMod, right, movefocus, r"
                "$mainMod, up, movefocus, u"
                "$mainMod, down, movefocus, d"

                # Switch workspaces with mainMod + [0-9]
                "$mainMod, 1, workspace, 1"
                "$mainMod, 2, workspace, 2"
                "$mainMod, 3, workspace, 3"
                "$mainMod, 4, workspace, 4"
                "$mainMod, 5, workspace, 5"
                "$mainMod, 6, workspace, 6"
                "$mainMod, 7, workspace, 7"
                "$mainMod, 8, workspace, 8"
                "$mainMod, 9, workspace, 9"
                "$mainMod, 0, workspace, 10"

                # Move active window to a workspace with mainMod + SHIFT + [0-9]
                "$mainMod SHIFT, 1, movetoworkspace, 1"
                "$mainMod SHIFT, 2, movetoworkspace, 2"
                "$mainMod SHIFT, 3, movetoworkspace, 3"
                "$mainMod SHIFT, 4, movetoworkspace, 4"
                "$mainMod SHIFT, 5, movetoworkspace, 5"
                "$mainMod SHIFT, 6, movetoworkspace, 6"
                "$mainMod SHIFT, 7, movetoworkspace, 7"
                "$mainMod SHIFT, 8, movetoworkspace, 8"
                "$mainMod SHIFT, 9, movetoworkspace, 9"
                "$mainMod SHIFT, 0, movetoworkspace, 10"

                # Scroll through existing workspaces with mainMod + scroll
                "$mainMod, mouse_down, workspace, e+1"
                "$mainMod, mouse_up, workspace, e-1"
  
            ];

            bindm = [
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
                "SUPER_CTRL, mouse:272, resizewindow" # Mouse binding (resize with mouse)
            ];

            bindel = [
                ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
                ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
                ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
                ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
            ];

            bindl = [
                ",XF86AudioNext, exec, playerctl next"
                ",XF86AudioPause, exec, playerctl play-pause"
                ",XF86AudioPlay, exec, playerctl play-pause"
                ",XF86AudioPrev, exec, playerctl previous"
            ];

            windowrulev2 = [
                "suppressevent maximize, class:.*"
                "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
	        ];
        };
    };
}
