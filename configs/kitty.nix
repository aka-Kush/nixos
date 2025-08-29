{ config, pkgs, theme, ... }:

{
    programs.kitty = {
        enable = true;
        font = {
        name = "JetBrainsMono Nerd Font";
        size = 13.0;
        };
        settings = {
        confirm_os_window_close = "0";
        };

        themeFile = theme.kittyTheme;
    };
}
