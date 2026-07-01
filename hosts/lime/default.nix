{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common/global
  ];

  systemd.services.NetworkManager-wait-online.enable = false;

  networking.hostName = "lime-nixos";
  networking.networkmanager.enable = true;

  services.getty.autologinUser = "uther";
  services.power-profiles-daemon.enable = false;

  services.printing = {
    enable = true;
    drivers = [
      pkgs.gutenprint
      pkgs.hplip
      pkgs.canon-cups-ufr2
      pkgs.epson-escpr
      pkgs.epson-escpr2
      pkgs.gutenprint 
      pkgs.ghostscript
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 80;

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  users.users.uther = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  programs.firefox.enable = true;

  environment = {
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
    };

    systemPackages = with pkgs; [

      tree
      acpi
      vim
      wget
      git
      kitty

      home-manager
      just

    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}

