{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
# Use snake_case keys as per Home Manager docs
    settings = {
      show_icons = true;
      allow_markup = true;
      width = 600;
      height = 500;
      border_radius = 12;
      line_height = 40;
      display-drun = "Applications:";
      background = "rgba(30, 30, 46, 0.95)";             # Catppuccin Base, 95% opacity
        foreground = "#CDD6F4";                            # Text color
        highlight = "#89B4FA";                             # Blue highlight
        highlighted_background = "rgba(49, 50, 68, 0.9)";  # Surface0
        selected_background = "#89DCEB";                   # Sky
        selected_foreground = "#1E1E2E";                   # Base
    };
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 14px;
      }

      window {
        margin: 10px;
        border-radius: 12px;
        padding: 10px;
        background-color: rgba(30, 30, 46, 0.85); /* Base */
      }

      #input {
        margin: 10px;
        border: none;
        padding: 10px;
        border-radius: 8px;
        background-color: rgba(49, 50, 68, 0.6); /* Surface0 */
        color: #CDD6F4; /* Text */
      }

      #entry {
        padding: 8px;
        border-radius: 8px;
      }

      #entry:selected {
        background-color: #89B4FA; /* Blue */
        color: #1E1E2E;            /* Base */
      }

      #text {
        color: #CDD6F4; /* Text */
      }

      #text:selected {
        color: #1E1E2E; /* Base */
      }

      #img {
        margin-right: 8px;
      }
    '';
  };
}

