{ config, pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;         # Important: ensures Qt6 compatibility
    theme = "catppuccin-mocha-mauve";              # Must match the folder name inside the package
  };
}
