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

  services = {
    xserver.enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  system.stateVersion = "26.05";
}
