_: {

  home = {
    username = "uther";
    homeDirectory = "/home/uther";
    stateVersion = "26.05";
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredictable = _: true;
  };

  programs.home-manager.enable = true;

}
