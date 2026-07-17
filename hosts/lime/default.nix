{ pkgs, inputs, ... }:

{
  imports = [

    ./hardware-configuration.nix
    ../common/global

    ../common/optional/hyprland.nix

    inputs.aagl.nixosModules.default

  ];

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["uther"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  networking.hostName = "lime-nixos";
  networking.firewall.allowedTCPPorts = [ 5900 ];

  services.getty = {
    autologinUser = "uther";
  };

  programs.honkers-railway-launcher.enable = true;

  users.users.uther = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    kitty just wayvnc
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
    ];
  };
  services.xserver.videoDrivers = [ "amdgpu" ];
}

