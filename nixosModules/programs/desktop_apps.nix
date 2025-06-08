{ pkgs, lib, config, ... }: {

  options = {
    desktop_apps.enable = 
      lib.mkEnableOption "enables desktop apps module";
  };

  config = lib.mkIf config.desktop_apps.enable {
    environment.systemPackages = with pkgs; [
      arduino-ide
      chromium
      corefonts
      discord
      gimp
      obsidian
      obs-studio
      onlyoffice-desktopeditors
      rnote
      slack
      teams-for-linux
      webex
    ];

    services.udev.packages = [
      pkgs.android-udev-rules
    ];

    # onlyoffice has trouble with symlinks: https://github.com/ONLYOFFICE/DocumentServer/issues/1859
    # system.userActivationScripts = {
    #   copy-fonts-local-share = {
    #     text = ''
    #       rm -rf ~/.local/share/fonts
    #       mkdir -p ~/.local/share/fonts
    #       cp ${pkgs.corefonts}/share/fonts/truetype/* ~/.local/share/fonts/
    #       chmod 544 ~/.local/share/fonts
    #       chmod 444 ~/.local/share/fonts/*
    #     '';
    #   };
    # }; 

  };
}
