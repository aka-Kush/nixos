{ config, pkgs, theme, ... }:
{
  _module.args = { inherit theme; };
  imports = [

# general configs
    ./configs/hyprland.nix
    ./configs/wlogout.nix
    ./configs/swaylock.nix
    ./configs/git.nix
    ./configs/fish.nix
    ./configs/scripts.nix
    ./configs/battery.nix
    ./configs/wofi.nix
    ./configs/gtk.nix
    ./configs/waybar.nix
    ./configs/kitty.nix
    ./configs/vscodium.nix
    ./configs/dunst.nix
  ];

  home.username = "kush";
  home.homeDirectory = "/home/kush";
  home.stateVersion = "25.05"; 
  
  home.sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    GTK_THEME = theme.gtkTheme.name;
    ICON_THEME = theme.iconTheme.name;
  };

  programs.home-manager.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Web browser
      "x-scheme-handler/http" = "brave-browser.desktop";
      "x-scheme-handler/https" = "brave-browser.desktop";
      "text/html" = "brave-browser.desktop";

      # Terminal
      "x-scheme-handler/terminal" = "kitty.desktop";

      # File manager
      "inode/directory" = "thunar.desktop";
      "x-directory/normal" = "thunar.desktop";

      # Image viewer
      "image/png" = "viewnior.desktop";
      "image/jpeg" = "viewnior.desktop";
      "image/jpg" = "viewnior.desktop";
      "image/gif" = "viewnior.desktop";
      "image/bmp" = "viewnior.desktop";
      "image/webp" = "viewnior.desktop";
      "image/svg+xml" = "viewnior.desktop";

      # Audio files
      "audio/mpeg" = "mpv.desktop";  # MP3
      "audio/mp4" = "mpv.desktop";
      "audio/x-wav" = "mpv.desktop";
      "audio/x-flac" = "mpv.desktop";

      # Video files
      "video/mp4" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";  # MKV
      "video/webm" = "mpv.desktop";
      "video/x-msvideo" = "mpv.desktop";  # AVI
      "video/quicktime" = "mpv.desktop";
    };
  };
}
