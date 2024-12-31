{ pkgs, lib, config, ... }: {

  options = {
    gnome_config.enable = 
      lib.mkEnableOption "enables gnome config module";
  };

  config = lib.mkIf config.gnome_config.enable {

    dconf.settings = {
      "org/gnome/desktop/background" = {
        picture-uri = "file://${pkgs.gnome-backgrounds}/share/backgrounds/gnome/blobs-l.svg";
        picture-uri-dark = "file://${pkgs.gnome-backgrounds}/share/backgrounds/gnome/blobs-d.svg";
        primary-color = "#241f31";
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        accent-color = "blue";
      };
      
      "org/gnome/desktop/screensaver" = {
        picture-uri = "file://${pkgs.gnome-backgrounds}/share/backgrounds/gnome/blobs-l.svg";
        primary-color = "#241f31";
      };

      "org/gnome/mutter" = {
        edge-tiling = true;
        dynamic-workspaces = true;
        enable-hot-corners = false;
        workspaces-only-on-primary = true;
      };

      "org/gnome/shell" = {
        favorite-apps = [
          "firefox.desktop"
          "org.gnome.Nautilus.desktop"
          "org.gnome.Console.desktop"
        ];

        disable-user-extensions = false;
        enabled-extensions = [
          "blur-my-shell@aunetx"
          "xremap@k0kubun.com" 
          "clipboard-indicator@tudmotu.com" 
          "AlphabeticalAppGrid@stuarthayhurst"
          "trayIconsReloaded@selfmade.pl"
        ];
      };
      
      "org/gnome/shell/app-switcher" = {
        current-workspace-only = true;
      };

      "org/gnome/settings-daemon/plugins/color" = {
        night-light-temperature = lib.gvariant.mkUint32 3700;
        night-light-schedule-from = 0.0;
        night-light-schedule-to = 0.0;
      };

    };
  
    home.packages = with pkgs; [
      gnomeExtensions.alphabetical-app-grid
      gnomeExtensions.blur-my-shell
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.tray-icons-reloaded
      gnomeExtensions.xremap
    ];

  };
}
