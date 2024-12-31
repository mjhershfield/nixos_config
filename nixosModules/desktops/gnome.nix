{ pkgs, lib, config, ... }: {

  options = {
    gnome.enable = 
      lib.mkEnableOption "enables GNOME module";
  };

  config = lib.mkIf config.gnome.enable {
    
    services.xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      desktopManager.gnome = {
        enable = true;
        extraGSettingsOverridePackages = [ pkgs.mutter ];
        extraGSettingsOverrides = ''
          [org.gnome.mutter]
          experimental-features=['scale-monitor-framebuffer']
        '';
      };
    };

    # Exclude GNOME packages
    environment.gnome.excludePackages = with pkgs; [
      epiphany
      gnome-system-monitor
      yelp
    ];

    # Add GNOME packages and extensions
    environment.systemPackages = with pkgs; [
      resources
      smile
    ];

    # Remove xserver packages
    services.xserver.excludePackages = with pkgs; [
      xterm
    ];
    
  };
}
