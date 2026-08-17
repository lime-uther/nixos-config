{ config, pkgs, inputs, ... }:

{

  imports = [
    ./global
    ./features/hyprland.nix
    ./features/kitty.nix
    ./features/pokefetch.nix
    ./features/obs.nix
    ./features/zen-browser.nix
    ./features/quickshell.nix
    ./features/neovim.nix
    ./features/dolphin.nix
  ];

  dotfiles = "${config.home.homeDirectory}/Projects/nixos-dotfiles/config";

  programs.bash = {
    enable = true;
    profileExtra = ''
      export GTK_USE_PORTAL="1"

      if uwsm check may-start && [ "$XDG_VTNR" = 1 ]; then
        exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };

  home.packages = with pkgs; [
    gimp
    azahar
    gowall
    spotify

    inputs.prismlauncher.packages.${stdenv.hostPlatform.system}.default
    jdk25
    kdePackages.kamoso

    discord-ptb
  ];

}
