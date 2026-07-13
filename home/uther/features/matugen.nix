{ config, pkgs, inputs, create_symlink, ... }:

{
  home.file.".config/matugen".source = create_symlink "${config.dotfiles}/matugen";

  home.packages = with pkgs; [
    inputs.matugen.packages.${stdenv.hostPlatform.system}.default
  ];
}

