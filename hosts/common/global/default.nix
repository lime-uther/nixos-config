{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./network.nix
    ./pkgs.nix
  ];

  boot.loader = {
    systemd-boot = {
      enable      =  true;
      consoleMode = "max";
    };
    efi.canTouchEfiVariables = true;
  };

  time.timeZone = "Asia/Manila";

  security.polkit.enable = true;
  security.rtkit.enable  = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "26.05";
}
