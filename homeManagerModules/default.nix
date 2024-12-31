{ pkgs, lib, ... }: {

  imports = [
    ./customization/gnome.nix
    ./programs/git.nix
    ./services/direnv.nix
    # ...
  ];

  gnome_config.enable = lib.mkDefault false;
  direnv.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
}
