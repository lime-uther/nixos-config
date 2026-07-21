{
  inputs = {

    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    uther-nvchad-conf = {
      url = "github:lime-uther/NvChad";
      flake = false;
    };

    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nvchad-starter.follows = "uther-nvchad-conf";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }:
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
