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
    # ./programs/zen-browser.nix
    ./programs/helix.nix
    ./programs/quartus.nix
    ./programs/zoom.nix
    ./programs/kicad.nix
    ./programs/vscode.nix
    ./programs/waveforms.nix
    ./programs/virtualbox.nix
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
  # zen-browser.enable = lib.mkDefault true;
  games.enable = lib.mkDefault false;
  helix.enable = lib.mkDefault true;
  quartus.enable = lib.mkDefault false;
  kicad.enable = lib.mkDefault false;
  zoom.enable = lib.mkDefault true;
  vscode.enable = lib.mkDefault true;
  waveforms.enable = lib.mkDefault true;
  vbox.enable = lib.mkDefault false;

  # Service configurations
  xremap.enable = lib.mkDefault true;
}
