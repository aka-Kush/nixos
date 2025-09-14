# catppuccin
# gruvbox
# rosepine

{ pkgs, ...}:

let
  themes = import ./themes.nix { inherit pkgs; };
  currentTheme = themes.themes.catppuccin;
in
{
 # Expose the top-level attributes needed by your other configs
  gtkTheme = currentTheme.gtkTheme;
  iconTheme = currentTheme.iconTheme;
  cursorTheme = currentTheme.cursorTheme;
  colors = currentTheme.colors;
  kittyTheme = currentTheme.kittyTheme;
  vscodeTheme = currentTheme.vscodeTheme;
  nvimTheme = currentTheme.nvimTheme;
  lualineTheme = currentTheme.lualineTheme;
  wallpaper = currentTheme.wallpaper;
}
