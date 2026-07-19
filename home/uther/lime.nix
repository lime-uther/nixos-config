{ config, pkgs, create_symlink, ... }:

{

  imports = [
    ./global
    ./features/hyprland.nix
    ./features/kitty.nix
    ./features/pokefetch.nix
    ./features/obs.nix
    ./features/zen-browser.nix
    ./features/quickshell.nix
  ];

  dotfiles = "${config.home.homeDirectory}/Projects/nixos-dotfiles/config";

  xdg.configFile.nvim.source = create_symlink "${config.dotfiles}/nvim";

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

    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    yarn
    gcc
    gnumake
    gimp
    neovim
    azahar
    gowall
    spotify

    lua-language-server
    bash-language-server
    typescript-language-server
    qt6.qtdeclarative
  ];

}
