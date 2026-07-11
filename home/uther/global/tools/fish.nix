_: {

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if command -q pokefetch
        pokefetch
      else if command -q fastfetch
        fastfetch
      end

      set fish_greeting #

      set -g fish_key_bindings fish_vi_key_bindings
    '';
   };

}

