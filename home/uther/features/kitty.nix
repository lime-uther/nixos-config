_: {

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;

    settings = {

      font_family      = "JetBrains Mono Regular";
      bold_font        = "JetBrains Mono Bold";
      italic_font      = "JetBrains Mono Italic";
      bold_italic_font = "Mono Bold Italic";

      font_size = 11;

      cursor_shape = "beam";
      cursor_trail = 1;

      shell = "fish";

      confirm_os_window_close = 0;
      background_opacity      = 1;
      window_padding_width    = 5;

    };
    extraConfig = ''
      background #1d2021
      foreground #d4be98
      cursor     #d4be98

      selection_background #1d2021
      selection_foreground none

      color0  #504945
      color8  #504945
      color1  #fb4934
      color9  #fb4934
      color2  #b8bb26
      color10 #b8bb26
      color3  #fabd2f
      color11 #fabd2f
      color4  #83a598
      color12 #83a598
      color5  #d3869b
      color13 #d3869b
      color6  #8ec07c
      color14 #8ec07c
      color7  #ebdbb2
      color15 #ebdbb2
    '';
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''

      set fish_greeting #

      set -g fish_key_bindings fish_vi_key_bindings
    '';
   };
}

