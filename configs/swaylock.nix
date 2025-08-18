{ pkgs, ... }:

{
  # Use the home-manager module for swaylock
  programs.swaylock = {
    enable = true;

    # Configure swaylock settings
    settings = {
      # Hide the authentication indicator
      indicator = false;
      
      # Use the specified background image
      image = "~/.config/wall.jpg";

      # Lock screen text and colors
      text-color = "a6e3a1"; # Green (Sapphire)
      text-clear-color = "f5c2e7"; # Pink (Lavender)
      text-ver-color = "94e2d5"; # Teal (Teal)
      text-wrong-color = "f38ba8"; # Red (Red)

      # Lock screen background colors
      ring-color = "1e1e2e"; # Background (Base)
      ring-clear-color = "f5c2e7"; # Pink (Lavender)
      ring-ver-color = "94e2d5"; # Teal (Teal)
      ring-wrong-color = "f38ba8"; # Red (Red)

      # Key and line colors
      key-hl-color = "f9e2af"; # Yellow (Yellow)
      line-color = "1e1e2e"; # Background (Base)
      line-clear-color = "cba6f7"; # Purple (Mauve)
      line-ver-color = "94e2d5"; # Teal (Teal)
      line-wrong-color = "f38ba8"; # Red (Red)
    };
  };
}