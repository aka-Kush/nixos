{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 10;
        spacing = 10;
        background = "#282828";

        "modules-left" = [
          "custom/arch"
          "hyprland/workspaces"
          "custom/separator"
          "hyprland/window"
        ];

        "modules-right" = [
          "pulseaudio"
          "backlight"
          "battery"
          "clock"
          "tray"
          "custom/power"
        ];

        tray = {
          "icon-size" = 21;
          spacing = 10;
          background = "#E5D9B6";
        };

        clock = {
          format = "  {:%I:%M }";
          "format-alt" = "{:%Y-%m-%d}";
        };

        backlight = {
          format = " {percent}% ";
          "format-icons" = [ "" "" ];
          background = "#E5D9B6";
        };

        battery = {
          states = {
            good = 95;
            warning = 20;
            critical = 11;
          };
          "critical-level" = 9;
          "on-critical" = "notify-send 'Battery Low' 'Battery Level is below 15%!' -u critical";
          format = "{icon}  {capacity}% ";
          "format-charging" = " {capacity}%";
          "format-plugged" = "{capacity}%";
          "format-alt" = "{time} ";
          "format-icons" = [ "" "" "" "" "" ];
        };

        pulseaudio = {
          "scroll-step" = 5;
          format = "  {volume}%  {format_source}";
          "format-bluetooth" = " {volume}%  {format_source}";
          "format-bluetooth-muted" = " {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = "{volume}% ";
          "format-source-muted" = "";
          "on-click" = "pavucontrol";
        };

        "custom/separator" = {
          format = "|";
          interval = "once";
          tooltip = false;
        };

        "custom/power" = {
          format = "";
          interval = "once";
          tooltip = false;
          "on-click" = "wlogout";
        };

        "custom/arch" = {
          format = "";
          interval = "once";
          tooltip = false;
          "on-click" = "wofi --show drun --allow-images";
        };
      };
    };

    style = ''
  * {
      border: none;
      font-family: "JetBrainsMono Nerd Font", "Font Awesome 6 Pro";
      font-size: 14px;
      font-weight: 600;
      padding: 1px 2px;
  }

  window#waybar {
      background-color: rgba(40, 40, 40, 0.94); /* #282828 */
  }

  .modules-left,
  .modules-right,
  .modules-center {
      padding: 0 10px;
  }

  #workspaces button {
      color: #ebdbb2; /* fg */
      background: none;
      border: none;
      outline: none;
      padding: 5px;
      border-radius: 0px;
  }

  #workspaces button:hover {
      color: #fe8019; /* orange */
  }

  #workspaces button.active {
      color: #fb4934; /* red */
  }

  #window {
      color: #ebdbb2;
  }

  #clock {
      color: #fabd2f; /* yellow */
  }

  #battery {
      color: #b8bb26; /* green */
      margin-right: 5px;
  }

  #pulseaudio {
      color: #83a598; /* blue */
      margin-right: 10px;
  }

  #backlight {
      color: #d3869b; /* purple */
  }

  #tray {
      color: #8ec07c; /* aqua */
  }

  #custom-power {
      color: #fb4934; /* red */
      font-weight: bold;
      margin: 0 5px;
      font-size: 1.2rem;
  }

  #custom-arch {
      font-weight: bold;
      margin: 0 5px;
      font-size: 1.3rem;
      color: #fabd2f; /* yellow */
  }
'';

  };
}
