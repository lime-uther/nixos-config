{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    nvim = "nvim";
  };
in

{

  home.username = "uther";
  home.homeDirectory = "/home/uther";

  home.stateVersion = "26.05";

  programs.git = {
    enable = true;
    userName = "uther";
    userEmail = "uther4ball@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "~/nixos-dotfiles";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  };

  programs.bash = {
    enable = true;
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        uwsm start hyprland-uwctl.desktop
      fi
    '';
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
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
      recursive = true;
    })
    configs;

  home.packages = with pkgs; [
    brightnessctl
    playerctl
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    gnumake
    rofi
    awww
    fastfetch
    bibata-cursors
    grim
    slurp
    swappy
    wl-clipboard
  ];

}
