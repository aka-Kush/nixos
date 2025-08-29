{ config, pkgs, theme, ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      show_icons = true;
      allow_markup = true;
      width = 600;
      height = 500;
      border_radius = 12;
      line_height = 40;
      display-drun = "Applications:";
      background = theme.colors.waybar.colorbg;             # background
      foreground = theme.colors.waybar.color10;             # text
      highlight = theme.colors.waybar.color6;               # blue
      highlighted_background = theme.colors.waybar.color6;
      selected_background = theme.colors.waybar.color5;     # teal
      selected_foreground = theme.colors.waybar.color1;     # base
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
        background-color: ${theme.colors.waybar.colorbg};
      }

      #input {
        margin: 10px;
        border: none;
        padding: 10px;
        border-radius: 8px;
        background-color: ${theme.colors.waybar.colorbg};
        color: ${theme.colors.waybar.color10};
      }

      #entry {
        padding: 8px;
        border-radius: 8px;
      }

      #entry:selected {
        background-color: ${theme.colors.waybar.color6};
        color: ${theme.colors.waybar.color1};
      }

      #text {
        color: ${theme.colors.waybar.color10};
      }

      #text:selected {
        color: ${theme.colors.waybar.colorbg};
        background: transparent;
      }

      #img {
        margin-right: 8px;
      }

      #img:selected {
        background-color: transparent;
      }
    '';
  };
}
