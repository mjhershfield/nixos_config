{ pkgs, lib, config, ... }: {

  options = {
    desktop_apps.enable = 
      lib.mkEnableOption "enables desktop apps module";
  };

  config = lib.mkIf config.desktop_apps.enable {
    environment.systemPackages = with pkgs; [
      corefonts
      discord
      obsidian
      onlyoffice-desktopeditors
      slack
      teams-for-linux
      webex
      zoom-us
    ];

  # xdg.portal.enable = true;
  
  };
  
}
