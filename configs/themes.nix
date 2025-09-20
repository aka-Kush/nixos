# available themes
# catppuccin
# gruvbox
# rosepine

{ pkgs, ... }:

let
  mkTheme =
    {
      name,
      wallpaper,
      gtkTheme,
      iconTheme,
      cursorTheme,
      kittyTheme,
      vscodeTheme,
      nvimTheme,
      lualineTheme,
      colors,
    }:
    {
      inherit
        name
        wallpaper
        gtkTheme
        iconTheme
        cursorTheme
        kittyTheme
        vscodeTheme
        nvimTheme
        lualineTheme
        colors
        ;
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
      vscodeTheme = "Catppuccin Mocha";
      nvimTheme = "catppuccin";
      lualineTheme = "dracula";

      colors = {
        waybar = {
          colorbg = "rgba(30, 30, 46, 0.9)";
          color1 = "#1e1e2e"; # red
          color2 = "#fab387"; # peach
          color3 = "#f9e2af"; # yellow
          color4 = "#a6e3a1"; # green
          color5 = "#94e2d5"; # teal
          color6 = "#89b4fa"; # blue
          color7 = "#cba6f7"; # mauve
          color8 = "#f2d5cf"; # flamingo
          color9 = "#eba0ac"; # pink
          color10 = "#cdd6f4"; # text
        };
        hypr = {
          active = "rgb(a6da95)";
          inactive = "rgb(6e738d)";
        };
        dunst = {
          background = "#1e1e2e";
          foreground = "#cdd6f4";
          frame_color = "#89b4fa";
          separator_color = "auto";

          urgency_critical = {
            background = "#f38ba8"; # red
            foreground = "#1e1e2e";
            frame_color = "#f38ba8";
            highlight = "#fab387"; # peach
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
      vscodeTheme = "Gruvbox Material Dark";
      nvimTheme = "gruvbox";
      lualineTheme = "gruvbox_dark";

      colors = {
        waybar = {
          colorbg = "rgba(40, 40, 40, 0.9)";
          color1 = "#282828"; # bg
          color2 = "#fe8019"; # orange
          color3 = "#fabd2f"; # yellow
          color4 = "#b8bb26"; # green
          color5 = "#8ec07c"; # aqua
          color6 = "#83a598"; # blue
          color7 = "#d3869b"; # purple
          color8 = "#ebdbb2"; # fg (light text)
          color9 = "#fb4934"; # red
          color10 = "#928374"; # gray
        };

        hypr = {
          active = "rgb(d79921)";
          inactive = "rgb(92837d)";
        };

        dunst = {
          background = "#282828";
          foreground = "#ebdbb2";
          frame_color = "#d79921";
          separator_color = "auto";

          urgency_critical = {
            background = "#cc241d"; # red
            foreground = "#fbf1c7"; # light text
            frame_color = "#cc241d";
            highlight = "#fe8019"; # orange
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
        name = "rose-pine";
        package = pkgs.rose-pine-icon-theme;
      };

      cursorTheme = {
        name = "WhiteSur-cursors";
        package = pkgs.whitesur-cursors;
        size = 24;
      };

      kittyTheme = "rose-pine";
      vscodeTheme = "Rosé Pine";
      nvimTheme = "rose-pine";
      lualineTheme = "palenight";

      colors = {
        waybar = {
          colorbg = "rgba(40, 42, 54, 0.9)"; # rosepine base bg with some opacity
          color1 = "#191724"; # base
          color2 = "#eb6f92"; # rose pine pink (red)
          color3 = "#f6c177"; # pine (yellow/orange)
          color4 = "#9ccfd8"; # foam (blue)
          color5 = "#31748f"; # iris (darker blue)
          color6 = "#c4a7e7"; # lavender (purple)
          color7 = "#ebbcba"; # rose (light pink)
          color8 = "#6e6a86"; # surface2 (grayish)
          color9 = "#f2d5cf"; # flamingo (light coral)
          color10 = "#e0def4"; # text (off-white)
        };

        hypr = {
          active = "rgb(eb6f92)";
          inactive = "rgb(6e6a86)";
        };

        dunst = {
          background = "#191724";
          foreground = "#e0def4";
          frame_color = "#c4a7e7";
          separator_color = "auto";

          urgency_critical = {
            background = "#eb6f92"; # rose pine pink (red)
            foreground = "#191724";
            frame_color = "#eb6f92";
            highlight = "#f6c177"; # pine (yellow/orange)
          };
        };
      };
    };

    rosepine-dawn = mkTheme {
      name = "Rose Pine Dawn";
      wallpaper = "rosepine";

      gtkTheme = {
        name = "rose-pine-dawn";
        package = pkgs.rose-pine-gtk-theme;
      };

      iconTheme = {
        name = "rose-pine-dawn";
        package = pkgs.rose-pine-icon-theme;
      };

      cursorTheme = {
        name = "WhiteSur-cursors";
        package = pkgs.whitesur-cursors;
        size = 24;
      };

      kittyTheme = "rose-pine-dawn";
      vscodeTheme = "Rosé Pine Dawn";
      nvimTheme = "rose-pine-dawn";
      lualineTheme = "rose-pine";

      colors = {
        waybar = {
          colorbg = "rgba(244, 238, 232, 0.95)"; # slightly more opaque light background for clarity
          color1 = "#575279"; # darker base text for visibility
          color2 = "#b74651"; # deeper rose pink for strong contrast
          color3 = "#bc553e"; # richer orange/pine color for highlights
          color4 = "#4a5e7a"; # stronger muted blue for visibility
          color5 = "#708ba3"; # medium blue with good contrast
          color6 = "#a178c5"; # lavender but slightly deeper, visible on light bg
          color7 = "#d1a3a9"; # warm rose pink, noticeable but not too bright
          color8 = "#8c94bb"; # surface grayish blue, moderate contrast
          color9 = "#c66f59"; # flamingo coral, clear on light
          color10 = "#423c66"; # dark text/off-white replacement for crispness
        };

        hypr = {
          active = "rgb(183,70,81)"; # stronger rose pink
          inactive = "rgb(140,148,187)"; # medium muted surface blue
        };

        dunst = {
          background = "#faf4ed"; # base light background
          foreground = "#423c66"; # darker text for readability
          frame_color = "#b74651"; # rose tone frame for alerts
          separator_color = "auto";

          urgency_critical = {
            background = "#b74651"; # vivid rose pink background
            foreground = "#faf4ed"; # light text on dark bg
            frame_color = "#b74651";
            highlight = "#bc553e"; # warm highlight for urgent alerts
          };
        };
      };
    };

    dracula = mkTheme {
      name = "Dracula";
      wallpaper = "dracula";
      gtkTheme = {
        name = "Dracula";
        package = pkgs.dracula-theme;
      };
      iconTheme = {
        name = "Dracula";
        package = pkgs.dracula-icon-theme;
      };
      cursorTheme = {
        name = "WhiteSur-cursors";
        package = pkgs.whitesur-cursors;
        size = 24;
      };
      kittyTheme = "Dracula";
      vscodeTheme = "Dracula Theme";
      nvimTheme = "dracula";
      lualineTheme = "dracula";
      colors = {
        waybar = {
          colorbg = "rgba(40, 42, 54, 0.9)"; # Dracula background
          color1 = "#282a36"; # background base
          color2 = "#ff79c6"; # pink
          color3 = "#f1fa8c"; # yellow
          color4 = "#50fa7b"; # green
          color5 = "#8be9fd"; # cyan
          color6 = "#6272a4"; # selection/grey-blue
          color7 = "#bd93f9"; # purple
          color8 = "#ffb86c"; # orange
          color9 = "#ff5555"; # red
          color10 = "#f8f8f2"; # foreground text
        };
        hypr = {
          active = "rgb(80,250,123)";
          inactive = "rgb(98,114,164)";
        };
        dunst = {
          background = "#282a36";
          foreground = "#f8f8f2";
          frame_color = "#bd93f9";
          separator_color = "auto";
          urgency_critical = {
            background = "#ff5555";
            foreground = "#282a36";
            frame_color = "#ff5555";
            highlight = "#ff79c6";
          };
        };
      };

    };

    everforest = mkTheme {
      name = "everforest";
      wallpaper = "everforest";
      gtkTheme = {
        name = "Everforest-Dark-BL";
        package = pkgs.everforest-gtk-theme;
      };
      iconTheme = {
        name = "Qogir-Dark";
        package = pkgs.qogir-icon-theme;
      };
      cursorTheme = {
        name = "WhiteSur-cursors";
        package = pkgs.whitesur-cursors;
        size = 24;
      };
      kittyTheme = "everforest_dark_hard";
      vscodeTheme = "Dracula Theme";
      nvimTheme = "everforest";
      lualineTheme = "everforest";
      colors = {
        waybar = {
          colorbg = "rgba(77, 89, 96, 0.9)";
          color1 = "#2b3939"; # Everforest base background
          color2 = "#d5c67a"; # Muted yellow accent
          color3 = "#9caf65"; # Muted green
          color4 = "#7fbbb3"; # Muted teal/cyan
          color5 = "#b2b5b1"; # Light grey for selection
          color6 = "#94b1a0"; # Soft greenish-grey
          color7 = "#d79921"; # Orange accent
          color8 = "#e67e80"; # Muted red
          color9 = "#a7c080"; # Light green
          color10 = "#d3c6aa"; # Foreground text soft cream
        };
        hypr = {
          active = "rgb(156,175,101)"; # Everforest green active
          inactive = "rgb(75,95,75)"; # Darkened green inactive
        };
        dunst = {
          background = "#2b3939";
          foreground = "#d3c6aa";
          frame_color = "#9caf65";
          separator_color = "auto";
          urgency_critical = {
            background = "#e67e80";
            foreground = "#2b3939";
            frame_color = "#e67e80";
            highlight = "#d5c67a";
          };
        };

      };
    };

    adwaita = mkTheme {
      name = "adwaita";
      wallpaper = "adwaita";
      gtkTheme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      cursorTheme = {
        name = "WhiteSur-cursors";
        package = pkgs.whitesur-cursors;
        size = 24;
      };
      kittyTheme = "adwaita_dark";
      vscodeTheme = "Dracula Theme";
      nvimTheme = "adwaita";
      lualineTheme = "adwaita";
      colors = {
        waybar = {
          colorbg = "rgba(33, 33, 33, 0.9)";
          color1 = "#2e3436";
          color2 = "#729fcf";
          color3 = "#8ae234";
          color4 = "#34e2e2";
          color5 = "#eeeeec";
          color6 = "#888a85";
          color7 = "#f57900";
          color8 = "#ef2929";
          color9 = "#4e9a06";
          color10 = "#eeeeec";
        };
        hypr = {
          active = "rgb(138,226,52)";
          inactive = "rgb(85,87,83)";
        };
        dunst = {
          background = "#2e3436";
          foreground = "#eeeeec";
          frame_color = "#8ae234";
          separator_color = "auto";
          urgency_critical = {
            background = "#ef2929";
            foreground = "#2e3436";
            frame_color = "#ef2929";
            highlight = "#f57900";
          };
        };
      };
    };
  };
in
{
  inherit themes;
}
