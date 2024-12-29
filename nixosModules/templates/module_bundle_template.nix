{ pkgs, lib, ... }: {

  imports = [
    ./template.nix
    # ...
  ];

  template.enable = lib.mkDefault true;
}
