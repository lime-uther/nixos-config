{ inputs, pkgs, ... }:

{

  imports = [
    inputs.shojiwm.nixosModules.default
  ];

  programs.shojiwm = {
    enable = true;
    xwaylandSatellite.package = inputs.xwayland-satellite-shojiwm.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };

}
