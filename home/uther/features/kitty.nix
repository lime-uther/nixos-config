_: {

  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;

    settings = {
    bold_font = "auto";
    italic_font = "auto";
    bold_italic_font = "auto";
    font_size = 10;

    cursor_shape = "beam";
    cursor_trail = 1;

    shell = "fish";

    confirm_os_window_close = 0;
    background_opacity = 0.9;
    # background_opacity = 0;
    window_padding_width = 5;
    };
  };

}
