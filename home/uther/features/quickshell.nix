{ config, pkgs, create_symlink, lib, ... }:

{

  home.file.".config/quickshell".source = create_symlink "${config.dotfiles}/quickshell";

  home.activation.MkQmllsIni = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    : > ${config.dotfiles}/quickshell/.qmlls.ini
  '';

  home.packages = with pkgs; [
    quickshell
  ];

}
