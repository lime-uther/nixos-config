{ inputs, ... }:

{
  imports = [inputs.textfox.homeManagerModules.default ];

  programs.firefox.enable = true;

  textfox = {
    enable = true;
    profiles = ["default"];
    config = {
      border = {
        width = "2px";
        transition = "0.2s ease";
        radius = "12px";
      };
      tabs = {
        horizontal.enable = false;
      };
      displayWindowControls = false;
      displayNavButtons = true;
      displayUrlbarIcons = true;
      displaySidebarTools = false;
      displayTitles = false;
      newtabLogo = "   __            __  ____          A   / /____  _  __/ /_/ __/___  _  __A  / __/ _ \\| |/_/ __/ /_/ __ \\| |/_/A / /_/  __/>  </ /_/ __/ /_/ />  <  A \\__/\\___/_/|_|\\__/_/  \\____/_/|_|  ";
    };
  };
}
