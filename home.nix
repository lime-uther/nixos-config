{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    nvim = "nvim";
    kitty = "kitty";
    fish = "fish";
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
  programs.bash.enable = true;

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    gnumake
    fish
  ];

}
