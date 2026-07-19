{ lib, config, pkgs, ... }: {
  imports = [
    ./tools
    ./home-manager.nix
  ];

  options.dotfiles = lib.mkOption {
    type = lib.types.str;
    example = "path/to/configs";
  };

  config = {
    _module.args = {
      create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    };
  };

  home.pointerCursor = {
    enable = true;

    name = "Bibata-Modern-Ice";
    size = 24;

    package = pkgs.bibata-cursors;

    gtk.enable = true;
    x11.enable = true;
  };
}
