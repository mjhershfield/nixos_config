{ pkgs, lib, ... }: {

  imports = [
    ./services/xremap.nix
    ./services/nix.nix
    ./programs/games.nix
    ./programs/nix-helper.nix
    ./programs/onedrive.nix
    ./programs/xilinx.nix
    ./programs/shell.nix
    ./programs/desktop_apps.nix
    ./programs/zen-browser.nix
    ./programs/helix.nix
    ./desktops/gnome.nix
    # ...
  ];

  # Desktop environment configurations
  gnome.enable = lib.mkDefault false;

  # Program configurations
  nix-helper.enable = lib.mkDefault true;
  onedrive.enable = lib.mkDefault true;
  xilinx.enable = lib.mkDefault false;
  shell.enable = lib.mkDefault true;
  desktop_apps.enable = lib.mkDefault true;
  zen-browser.enable = lib.mkDefault true;
  games.enable = lib.mkDefault false;
  helix.enable = lib.mkDefault true;

  # Service configurations
  xremap.enable = lib.mkDefault true;
}
