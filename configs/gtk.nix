{ config, pkgs, theme, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = theme.gtkTheme.name;
      package = theme.gtkTheme.package;
    };
    iconTheme = {
      name = theme.iconTheme.name;
      package = theme.iconTheme.package;
    };
    cursorTheme = {
      name = theme.cursorTheme.name;
      package = theme.cursorTheme.package;
      size = theme.cursorTheme.size;
    };
    };
}
