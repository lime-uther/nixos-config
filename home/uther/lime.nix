{ config, pkgs, create_symlink, inputs, ... }:

{

  imports = [
    ./global
    ./features/hyprland.nix
    ./features/kitty.nix
    ./features/pokefetch.nix
    ./features/spotify.nix
    ./features/obs.nix
  ];

  dotfiles = "${config.home.homeDirectory}/Documents/nixos-dotfiles/config";

  programs.bash = {
    enable = true;
    profileExtra = ''
      export GTK_USE_PORTAL="1"

      if uwsm check may-start && [ "$XDG_VTNR" = 1 ]; then
        exec shoji_wm --tty
      fi
    '';
  };

  xdg.configFile.nvim.source = create_symlink "${config.dotfiles}/nvim";

  home.packages = with pkgs; [

    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    gnumake
    gimp
    neovim
    spotify
    azahar
    texlive.combined.scheme-full


    lua-language-server
    bash-language-server
    typescript-language-server
    qt6.qtdeclarative

    inputs.zennotes.packages.${pkgs.system}.zennotes-desktop
    inputs.zennotes.packages.${pkgs.system}.zennotes-server

  ];

}
