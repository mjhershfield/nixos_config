{ pkgs, lib, config, ... }: {

  options = {
    helix.enable = 
      lib.mkEnableOption "enables helix module";
  };

  config = lib.mkIf config.helix.enable {
    environment.systemPackages = with pkgs; [
      helix
      markdown-oxide
      svls
    ];
  };
  
}
