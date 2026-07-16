{ pkgs, ... }: 

{

  hardware.enableRedistributableFirmware = true;
  services.fwupd.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = { main = { capslock = "overload(control, esc)"; }; };
      };
    };
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      epson-escpr
      epson-escpr2
      ghostscript
      cups-filters
      cups-browsed
    ];
  };

  services.power-profiles-daemon.enable = false;
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

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

}
