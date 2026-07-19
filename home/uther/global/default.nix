{ lib, config, ... }: {

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

}
