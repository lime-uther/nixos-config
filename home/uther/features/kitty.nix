_: {

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;

    settings = {

      font_family      = "JetBrains Mono Regular";
      bold_font        = "JetBrains Mono Bold";
      italic_font      = "JetBrains Mono Italic";
      bold_italic_font = "Mono Bold Italic";

      font_size = 10;

      cursor_shape = "beam";

      shell = "fish";

      confirm_os_window_close = 0;
      background_opacity      = 1;
      window_padding_width    = 5;

    };
    extraConfig = ''
      background #1e1d2d
      foreground #bfc6d4
      cursor     #bfc6d4

      selection_background #252434
      selection_foreground none

      color0  #282737
      color8  #383747
      color1  #F38BA8
      color9  #F38BA8
      color2  #ABE9B3
      color10 #ABE9B3
      color3  #FAE3B0
      color11 #FAE3B0
      color4  #89B4FA
      color12 #89B4FA
      color5  #CBA6F7
      color13 #CBA6F7
      color6  #89DCEB
      color14 #89DCEB
      color7  #D9E0EE
      color15 #bfc6d4
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

