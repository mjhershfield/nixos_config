{ pkgs, lib, config, ... }: {

  options = {
    direnv.enable = 
      lib.mkEnableOption "enables direnv module";
  };

  config = lib.mkIf config.direnv.enable {

    programs.bash.enable = lib.mkDefault true;
    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
