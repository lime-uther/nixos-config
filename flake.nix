{
  inputs = {

    nixpkgs.url = "github:NixOs/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOs/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    shojiwm = {
      url = "github:bea4dev/ShojiWM";
    };

    xwayland-satellite-shojiwm = {
      url = "github:bea4dev/xwayland-satellite/shojiwm";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs-unstable";
        home-manager.follows = "home-manager";
      };
    };

    matugen = {
      url = "github:/InioX/Matugen";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
  let
    forEachSystem = nixpkgs.lib.genAttrs [
      "x86_64-linux"
    ];
    forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

    mkShell = pkgs: pkgs.mkShell {
      packages = [
        pkgs.home-manager
      ];
    };

    mkNixosNew = host:
      nixpkgs.lib.nixosSystem {
        specialArgs = { inherit (self) inputs outputs;};
        modules = [
          ./hosts/${host}
        ];
      };

    mkHomeNew = host: system:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit (self) inputs outputs;
          unstable = nixpkgs-unstable.legacyPackages.${system};
        };
        modules = [
          ./home/uther/${host}.nix
        ];
      };
  in
  {

    devShells = forEachPkgs (pkgs: {
      default = mkShell pkgs;
    });

    nixosConfigurations = {
      lime = mkNixosNew "lime";
    };

    homeConfigurations = {
        "uther" = mkHomeNew "lime" "x86_64-linux";
    };

  };
}
