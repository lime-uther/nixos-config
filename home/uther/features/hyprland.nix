{ config, pkgs, unstable, create_symlink, ... }:

{

  home.file.".config/hypr/hyprland.lua".source = create_symlink "${config.dotfiles}/hypr/hyprland.lua";

  home.packages = with pkgs; [
    brightnessctl
    playerctl

    grim
    slurp
    swappy
    wl-clipboard

    rofi
    awww
    unstable.yazi
  ];

}
