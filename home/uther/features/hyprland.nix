{ config, pkgs, create_symlink, ... }:

let
  dotfile = "hypr/hyprland.lua";
in 

{

  home.file.".config/${dotfile}".source = create_symlink "${config.dotfiles}/${dotfile}";

  home.packages = with pkgs; [
    brightnessctl
    playerctl

    grim
    slurp
    swappy
    wl-clipboard

    rofi
    awww
    yazi
  ];

}
