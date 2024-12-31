{ pkgs, lib, config, ... }: {

  options = {
    nix-helper.enable = 
      lib.mkEnableOption "enables nix-helper module";
  };

  config = lib.mkIf config.nix-helper.enable {
    programs.nh = {
      enable = true;
    };

    environment.variables = {
      FLAKE = "/home/matthew/nixos_config";
    };
  };
  
}
