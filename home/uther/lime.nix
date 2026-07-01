{ config, pkgs, unstable, ... }:

let
  dotfiles = "${config.home.homeDirectory}/Documents/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    nvim = "nvim";
    "hypr/hyprland.lua" = "hypr/hyprland.lua";
    "uwsm/env" = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
  };
in

{
  home.username = "uther";
  home.homeDirectory = "/home/uther";

  home.stateVersion = "26.05";

  imports = [
    ../features
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "uther4ball@gmail.com";
        name = "uther";
      };
      init.defaultBranch = "main";
      safe.directory = "~/nixos-dotfiles";
    };
  };

  nixpkgs.config.allowUnfree = true;

  programs.bash = {
    enable = true;
    profileExtra = ''
      if uwsm check may-start && [ "$XDG_VTNR" = 1 ]; then
        exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if command -q pokefetch
        pokefetch
      else if command -q fastfetch
        fastfetch
      end

      set fish_greeting #

      alias clear "printf '\033[2J\033[3J\033[1;1H'"
      alias celar "printf '\033[2J\033[3J\033[1;1H'"
      alias claer "printf '\033[2J\033[3J\033[1;1H'"

      set -g fish_key_bindings fish_vi_key_bindings
    '';

   };

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
      background_opacity = 0.8;
      window_padding_width = 5;
    };
   };

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
    })
    configs;

  home.packages = with pkgs; [

    brightnessctl
    playerctl
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    gnumake
    rofi
    awww
    bibata-cursors
    grim
    slurp
    swappy
    wl-clipboard
    gimp
    neovim

    unstable.yazi

    lua-language-server
    bash-language-server
    bash-language-server
    qt6.qtdeclarative

  ];

}
