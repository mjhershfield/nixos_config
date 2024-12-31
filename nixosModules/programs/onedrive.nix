{ pkgs, lib, config, ... }: {

  options = {
    onedrive.enable = 
      lib.mkEnableOption "enables onedrive module";
  };

  config = lib.mkIf config.onedrive.enable {
    environment.systemPackages = with pkgs; [
      # onedrive
      # onedrivegui
      onedriver
    ];
  };
  
}
