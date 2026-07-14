{ pkgs, lib, ... }:

{
  imports = [
    ./hardware.nix
    ./network.nix
    ./pkgs.nix
  ];

  boot = {
    consoleLogLevel = 3;
    initrd = {
      verbose = false;
      systemd.enable = true;
    };

    kernelParams = [ "quiet" ];

    loader = {
      systemd-boot = {
        enable      =  true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };

  };

  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;

  time.timeZone = "Asia/Manila";

  security.polkit.enable = true;
  security.rtkit.enable  = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "26.05";
}
