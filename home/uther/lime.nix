{ config, pkgs, ... }:

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
  ];

}
