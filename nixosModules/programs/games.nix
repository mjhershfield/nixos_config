{ pkgs, lib, config, ... }: {

  options = {
    games.enable = 
      lib.mkEnableOption "enables games module";
  };

  config = lib.mkIf config.games.enable {
    environment.systemPackages = with pkgs; [
      bottles
    ];

    programs.steam = {
      enable = true;
    };
  };
  
}
