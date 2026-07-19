{ pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredictable = _: true;
  };

  programs.home-manager.enable = true;

  home = {
    username = "uther";
    homeDirectory = "/home/uther";
    stateVersion = "26.05";

    pointerCursor = {
      enable = true;

      name = "Bibata-Modern-Ice";
      size = 24;

      package = pkgs.bibata-cursors;

      gtk.enable = true;
      x11.enable = true;
    };
  };

}
