# available themes
# catppuccin
# gruvbox
# rosepine

{ pkgs, ... }:

let
  mkTheme = { name, wallpaper, gtkTheme, iconTheme, cursorTheme, kittyTheme, colors }: {
    inherit name wallpaper gtkTheme iconTheme cursorTheme kittyTheme colors;
  };

  themes = {
    catppuccin = mkTheme {
      name = "Catppuccin Mocha";
      wallpaper = "catppuccin";

      gtkTheme = {
        name = "catppuccin-frappe-blue-standard";
        package = pkgs.catppuccin-gtk.override { variant = "mocha"; };
      };

      iconTheme = {
        name = "Zafiro-icons-Dark";
        package = pkgs.zafiro-icons;
      };

      cursorTheme = {
        name = "WhiteSur-cursors";
        package = pkgs.whitesur-cursors;
        size = 24;
      };

      kittyTheme = "Catppuccin-Mocha";

      colors = {
        waybar = {
          colorbg = "rgba(30, 30, 46, 0.9)";
          color1  = "#1e1e2e"; # red
          color2  = "#fab387"; # peach
          color3  = "#f9e2af"; # yellow
          color4  = "#a6e3a1"; # green
          color5  = "#94e2d5"; # teal
          color6  = "#89b4fa"; # blue
          color7  = "#cba6f7"; # mauve
          color8  = "#f2d5cf"; # flamingo
          color9  = "#eba0ac"; # pink
          color10 = "#cdd6f4"; # text
        };
        hypr = {
          active = "rgb(a6da95)";
          inactive = "rgb(6e738d)";
        };
        dunst = {
          background   = "#1e1e2e";
          foreground   = "#cdd6f4";
          frame_color  = "#89b4fa";
          separator_color = "auto";

          urgency_critical = {
            background  = "#f38ba8"; # red
            foreground  = "#1e1e2e";
            frame_color = "#f38ba8";
            highlight   = "#fab387"; # peach
          };
        };
      };
    };

    gruvbox = mkTheme {
      name = "Gruvbox";
      wallpaper = "gruvbox";

      gtkTheme = {
        name = "gruvbox-dark";
        package = pkgs.gruvbox-dark-gtk;
      };

      iconTheme = {
        name = "Gruvbox-Plus-Dark";
        package = pkgs.gruvbox-dark-gtk; # adjust if you have a proper icon pkg
      };

      cursorTheme = {
        name = "WhiteSur-cursors";
        package = pkgs.whitesur-cursors;
        size = 24;
      };

      kittyTheme = "gruvbox-dark-hard";

      colors = {
        waybar = {
          colorbg = "rgba(40, 40, 40, 0.9)";
          color1  = "#282828"; # bg
          color2  = "#fe8019"; # orange
          color3  = "#fabd2f"; # yellow
          color4  = "#b8bb26"; # green
          color5  = "#8ec07c"; # aqua
          color6  = "#83a598"; # blue
          color7  = "#d3869b"; # purple
          color8  = "#ebdbb2"; # fg (light text)
          color9  = "#fb4934"; # red
          color10 = "#928374"; # gray
        };

        hypr = {
          active = "rgb(d79921)";
          inactive = "rgb(92837d)";
        };

        dunst = {
          background   = "#282828";
          foreground   = "#ebdbb2";
          frame_color  = "#d79921";
          separator_color = "auto";

          urgency_critical = {
            background  = "#cc241d"; # red
            foreground  = "#fbf1c7"; # light text
            frame_color = "#cc241d";
            highlight   = "#fe8019"; # orange
          };
        };
      };
    };

    rosepine = mkTheme {
      name = "Rose Pine";
      wallpaper = "rosepine";

      gtkTheme = {
        name = "rose-pine";
        package = pkgs.rose-pine-gtk-theme;
      };

      iconTheme = {
        name = "Zafiro-icons-Dark";
        package = pkgs.zafiro-icons;
      };

      cursorTheme = {
        name = "WhiteSur-cursors";
        package = pkgs.whitesur-cursors;
        size = 24;
      };

      kittyTheme = "rose-pine";

      colors = {
        waybar = {
          colorbg = "rgba(40, 42, 54, 0.9)"; # rosepine base bg with some opacity
          color1  = "#191724"; # base
          color2  = "#eb6f92"; # rose pine pink (red)
          color3  = "#f6c177"; # pine (yellow/orange)
          color4  = "#9ccfd8"; # foam (blue)
          color5  = "#31748f"; # iris (darker blue)
          color6  = "#c4a7e7"; # lavender (purple)
          color7  = "#ebbcba"; # rose (light pink)
          color8  = "#6e6a86"; # surface2 (grayish)
          color9  = "#f2d5cf"; # flamingo (light coral)
          color10 = "#e0def4"; # text (off-white)
        };

        hypr = {
          active = "rgb(eb6f92)";
          inactive = "rgb(6e6a86)";
        };

        dunst = {
          background   = "#191724";
          foreground   = "#e0def4";
          frame_color  = "#c4a7e7";
          separator_color = "auto";

          urgency_critical = {
            background  = "#eb6f92"; # rose pine pink (red)
            foreground  = "#191724";
            frame_color = "#eb6f92";
            highlight   = "#f6c177"; # pine (yellow/orange)
          };
        };
      };
    };
  };
in
{
  inherit themes;
}
