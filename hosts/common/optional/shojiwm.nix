{ inputs, ... }:

{

  imports = [
    inputs.shojiwm.nixosModules.default
  ];

  programs.shojiwm = {
    enable = true;
    initConfig = {
      enable = true;
      users = [ "uther" ];
    };
  };

}
