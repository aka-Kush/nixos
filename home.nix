{ config, pkgs, ... }:

{
  imports = [
    ./configs/hyprland.nix
    ./configs/waybar.nix
    ./configs/wlogout.nix
    ./configs/swaylock.nix
    ./configs/git.nix
    ./configs/fish.nix
    ./configs/kitty.nix
    ./configs/dunst.nix
    ./configs/scripts.nix
    ./configs/wofi.nix
  ];

  home.username = "kush";
  home.homeDirectory = "/home/kush";
  home.stateVersion = "25.05"; 
  
  home.sessionPath = [ "$HOME/.local/bin" ];

  programs.home-manager.enable = true;
}
