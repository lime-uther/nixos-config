{ config, pkgs, create_symlink, ... }:

let
  dotfile = "hypr/hyprland.lua";
in 

{

  imports = [
    ./rofi.nix
  ];

  home.file.".config/${dotfile}".source = create_symlink "${config.dotfiles}/${dotfile}";

  home.packages = with pkgs; [
    brightnessctl
    playerctl

    grim
    slurp
    swappy
    wl-clipboard

    awww
    yazi
  ];

}
