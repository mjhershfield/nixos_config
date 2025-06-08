{ pkgs, lib, config, ... }: {

  options = {
    kicad.enable = 
      lib.mkEnableOption "enables kicad module";
  };

  config = lib.mkIf config.kicad.enable {
    environment.systemPackages = with pkgs; [
      kicad
    ];

  };
  
}
