{ pkgs, lib, ... }: {

  imports = [
    ./services/xremap.nix
    ./programs/nix-helper.nix
    ./programs/onedrive.nix
    ./programs/xilinx.nix
    # ...
  ];

  xremap.enable = lib.mkDefault true;
  nix-helper.enable = lib.mkDefault true;
  onedrive.enable = lib.mkDefault true;
  xilinx.enable = lib.mkDefault true;
}
