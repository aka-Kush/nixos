{ pkgs, ...}:

let
  themes = import ./themes.nix { inherit pkgs; };
  currentTheme = themes.themes.rosepine;
in
{
  # Expose the top-level attributes needed by your other configs
  gtkTheme = currentTheme.gtkTheme;
  iconTheme = currentTheme.iconTheme;
  cursorTheme = currentTheme.cursorTheme;
  colors = currentTheme.colors;
  kittyTheme = currentTheme.kittyTheme;
  wallpaper = currentTheme.wallpaper;
}
