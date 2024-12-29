{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    xremap-flake.url = "github:xremap/nix-flake";
    # nix-xilinx.url = "gitlab:doronbehar/nix-xilinx";
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations."matthew-potato" = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
          ./hosts/matthew-potato/configuration.nix
          ./nixosModules
          # inputs.home-manager.nixosModules.default
      ];
    };
  };
}
