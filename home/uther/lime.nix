{ config, pkgs, create_symlink, ... }:

{

  imports = [
    ./global
    ./features/hyprland.nix
    ./features/shojiwm.nix
    ./features/kitty.nix
    ./features/pokefetch.nix
    ./features/spotify.nix
    ./features/obs.nix
    ./features/matugen.nix
    ./features/zen-browser.nix
  ];

  dotfiles = "${config.home.homeDirectory}/Documents/nixos-dotfiles/config";

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
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };

}
