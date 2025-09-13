{ config, pkgs, theme, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 10;
        spacing = 10;

        # Waybar's JSON background field (solid). CSS below will apply the alpha.
        background = "transparent";

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
          background = theme.colors.waybar.color1;
        };

        "hyprland/window" = {
            tooltip = false;
        };
        clock = {
          format = "  {:%I:%M }";
          "format-alt" = "{:%Y-%m-%d}";
          "tooltip" = false;
        };

        backlight = {
          format = " {percent}% ";
          "format-icons" = [ "" "" ];
          background = theme.colors.waybar.color1;
          "tooltip" = false;
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
          "tooltip" = false;
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
          "tooltip" = false;
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
          format = "";
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

  /* Use color1 (#1e1e2e for Catppuccin Mocha) with 94% opacity */
  window#waybar {
    background-color: transparent;
  }

  .modules-left,
  .modules-right,
  .modules-center {
    padding: 0 10px;
  }

  #workspaces button {
    color: ${theme.colors.waybar.color2};
    background: none;
    border: none;
    outline: none;
    padding: 5px;
    border-radius: 0px;
  }

  #workspaces button:hover {
    color: ${theme.colors.waybar.color3};
  }

  #workspaces button.active {
    color: ${theme.colors.waybar.color4};
  }

  #window {
    color: ${theme.colors.waybar.color5};
  }

  #clock {
    color: ${theme.colors.waybar.color6};
  }

  #battery {
    color: ${theme.colors.waybar.color7};
    margin-right: 5px;
  }

  #pulseaudio {
    color: ${theme.colors.waybar.color8};
    margin-right: 10px;
  }

  #backlight {
    color: ${theme.colors.waybar.color9};
  }

  #tray {
    color: ${theme.colors.waybar.color10};
  }

  #custom-power {
    color: ${theme.colors.waybar.color4};
    font-weight: bold;
    margin: 0 5px;
    font-size: 1.2rem;
  }

  #custom-arch {
    color: ${theme.colors.waybar.color10};
    font-weight: bold;
    margin: 0 5px;
    font-size: 1.3rem;
  }

  /* The group backgrounds */
  .modules-left,
  .modules-right
 {
    background-color: ${theme.colors.waybar.colorbg};
    padding: 5px 15px;
    border-radius: 10px;
    margin: 0 10px;
  }

'';
  };
}
