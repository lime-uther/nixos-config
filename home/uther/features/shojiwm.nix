{ config, lib, pkgs, create_symlink, osConfig, ... }:

{

  home.file.".config/shojiwm".source = create_symlink "${config.dotfiles}/shojiwm";

  home.activation.linkShojiNodeModules = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p "${config.dotfiles}/shojiwm/node_modules/"
    ln -sfn "${osConfig.programs.shojiwm.package}/lib/shojiwm/node_modules/shoji_wm" "${config.dotfiles}/shojiwm/node_modules/shoji_wm"
  '';

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
