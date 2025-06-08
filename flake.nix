{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    xremap-flake = {
      url = "github:xremap/nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-xilinx = {
      url = "gitlab:doronbehar/nix-xilinx";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager?ref=release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    waveforms = {
      url = "github:liff/waveforms-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-xilinx, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      "matthew-potato" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
            ./hosts/matthew-potato/configuration.nix
            ./nixosModules
        ];
      };

      "matthew-ultrabook" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/matthew-ultrabook/configuration.nix
          ./nixosModules/default.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
