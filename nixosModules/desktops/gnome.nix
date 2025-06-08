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
      file-roller
      epiphany
      evince
      gnome-system-monitor
      yelp
    ];

    # Add GNOME packages and extensions
    environment.systemPackages = with pkgs; [
      eyedropper
      gnome-decoder
      gnome-network-displays
      gnome-tweaks
      livecaptions
      papers
      resources
      smile
    ];

    # Remove xserver packages
    services.xserver.excludePackages = with pkgs; [
      xterm
    ];

    # Enable screen rotation
    hardware.sensor.iio.enable = true;    
  };
}
