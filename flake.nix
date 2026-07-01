{
  inputs = {

    nixpkgs.url = "github:NixOs/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOs/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
  let
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
    nixosConfigurations = {
      lime = mkNixosNew "lime";
    };

    homeConfigurations = {
      "uther" = mkHomeNew "lime" "x86_64-linux";
    };
  };

}
