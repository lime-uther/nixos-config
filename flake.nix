{
  description = "Lime on NixOs";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.lime-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.uther = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
