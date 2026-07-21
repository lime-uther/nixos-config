{ pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
  nvchad = (inputs.nix4nvchad.packages.${system}.default.override {

    extraPackages = with pkgs; [

      ripgrep
      stylua

      nixpkgs-fmt
      nil
      bash-language-server
      typescript-language-server
      lua-language-server
      vscode-langservers-extracted
      kdePackages.qtdeclarative

    ];

  }).overrideAttrs (oldAttrs: {
    dontWrapQtApps = true;
  });
in

{
  home.packages = [ nvchad ];
}
