{
  services.dunst = {
  enable = true;

  settings = {
    global = {
      font = "JetBrainsMono Nerd Font 10";
      allow_markup = true;
      format = "<b>%s</b>\n%b";
      alignment = "left";
      show_age_threshold = 60;
      word_wrap = true;
      ignore_newline = false;
      transparency = 10;
      separator_height = 2;
      padding = 10;
      horizontal_padding = 10;
      frame_width = 2;
      corner_radius = 8;
      gap_size = 6;
      icon_position = "left";
      max_icon_size = 64;
      min_icon_size = 32;
      ellipsize = "middle";

      # Catppuccin Mocha unified styling
      background = "#1e1e2e";
      foreground = "#cdd6f4";
      frame_color = "#89b4fa";
      separator_color = "auto";

      # Icons
      icon_theme = "Papirus";
      enable_recursive_icon_lookup = true;

      # Positioning
      geometry = "300x5-20+50";
      layer = "top";
      shrink = true;
      follow = "mouse";
      sticky_history = true;

      # Behavior
      startup_notification = false;
      indicate_hidden = true;
      idle_threshold = 120;
      history_length = 100;
      show_indicators = true;
      timeout = 8;
      fullscreen = "show";

      # Markup
      markup = "full";
    };
    urgency_critical = {
        timeout = 0;  # Persistent until dismissed
        background = "#f38ba8";  # Catppuccin red
        foreground = "#1e1e2e";  # Dark text to contrast red
        frame_color = "#f38ba8";
        highlight = "#fab387";   # Optional accent (Catppuccin peach)
      };
  };
};

}
