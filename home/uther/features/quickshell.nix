{ config, pkgs, create_symlink, lib, ... }:

let
  dotfile = "quickshell";
in 

{

  home.file.".config/${dotfile}".source = create_symlink "${config.dotfiles}/${dotfile}";

  home.activation.MkQmllsIni = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    : > ${config.dotfiles}/quickshell/.qmlls.ini
  '';

  home.packages = with pkgs; [
    quickshell
  ];

}
