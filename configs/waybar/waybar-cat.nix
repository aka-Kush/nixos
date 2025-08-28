{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 10;
        spacing = 10;
        background = "#E5D9B6";

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
          background-color: rgba(30, 30, 46, 0.94);
      }

      .modules-left,
      .modules-right,
      .modules-center {
          padding: 0 10px;
      }

      #workspaces button {
          color: #a5adce;
          background: none;
          border: none;
          outline: none;
          padding: 5px;
          border-radius: 0px;
      }

      #workspaces button:hover {
          border: none;
          outline: none;
          color: #a6d189;
      }

      #workspaces button.active {
          color: #e78284;
      }

      #window {
          color: #f2d5cf;
      }

      #clock {
          color: #e5c890;
      }

      #battery {
          color: #babbf1;
          margin-right: 5px;
      }

      #pulseaudio {
          color: #81c8be;
          margin-right: 10px;
      }

      #backlight {
          color: #ca9ee6;
      }

      #tray {
          color: #838ba7;
      }

      #custom-power {
          color: #e64553;
          font-weight: bold;
          margin: 0 5px;
          font-size: 1.2rem;
      }

      #custom-arch {
          font-weight: bold;
          margin: 0 5px;
          font-size: 1.3rem;
      }
    '';
  };
}
