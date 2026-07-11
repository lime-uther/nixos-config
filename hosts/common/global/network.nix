_: {

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

}
