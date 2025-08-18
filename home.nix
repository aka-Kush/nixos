{ config, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
  ];

  home.username = "kush";
  home.homeDirectory = "/home/kush";
  home.stateVersion = "25.05"; 
  
  home.sessionPath = [ "$HOME/.local/bin" ];

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    fish
  ];

  programs.fish = {
    enable = true;
    shellInit = ''
      set -U fish_greeting ""
    '';
    shellAliases = {
      ls = "lsd -l";
      lsa = "lsd -al";
    };
  };
  
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13.0;
    };
    settings = {
      confirm_os_window_close = "0";
    };

    themeFile = "Catppuccin-Mocha";
  };

  programs.wofi = {
    enable = true;

    settings = {
      "general.font" = "JetBrainsMono Nerd Font 12";
      "general.show-icons" = "true";
      "colors.background" = "#2E3440";
      "colors.foreground" = "#D8DEE9";
      "colors.highlight" = "#81A1C1";
      "colors.highlighted-background" = "#3B4252";
      "colors.selected-background" = "#5E81AC";
      "colors.selected-foreground" = "#D8DEE9";

      "window.width" = "800";
      "window.height" = "500";
      "window.border-radius" = "0";

      "behavior.line-height" = "42";
    };
  };

  programs.git = {
    enable = true;
    userName = "Shivansh Kush";
    userEmail = "kushivansh27@gmail.com";
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = 235;
        height = 290;
        origin = "top-right";
        offset = "15x40";
        scale = 0;
        notification_limit = 0;

        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;

        indicate_hidden = true;
        transparency = 15;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 0;

        frame_width = 2;
        frame_color = "#D0885D";
        gap_size = 3;
        separator_color = "frame";
        sort = true;

        font = "JetBrains Mono Nerd Font 11";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "center";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;

        icon_position = "left";
        min_icon_size = 0;
        max_icon_size = 32;
        icon_path = "/usr/share/icons/Papirus/32x32/apps/:/usr/share/icons/Papirus/32x32/devices/";

        sticky_history = true;
        history_length = 20;

        dmenu = "/usr/bin/dmenu -p dunst:";
        browser = "/usr/bin/xdg-open";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";

        corner_radius = 12;
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;

        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };

      experimental = {
        per_monitor_dpi = false;
      };

      urgency_low = {
        background = "#222222";
        foreground = "#888888";
        timeout = 3;
      };

      urgency_normal = {
        background = "#23283b";
        foreground = "#ffffff";
        timeout = 3;
      };

      urgency_critical = {
        background = "#900000";
        foreground = "#ffffff";
        frame_color = "#ff0000";
        timeout = 0;
      };
    };
  };

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
