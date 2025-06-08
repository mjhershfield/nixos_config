{ pkgs, lib, config, ... }: {

  options = {
    helix.enable = 
      lib.mkEnableOption "enables helix module";
  };

  config = lib.mkIf config.helix.enable {
    environment.systemPackages = with pkgs; [
      helix
      wl-clipboard
      markdown-oxide
      verible
      verilator
      # (callPackage ./sv-lang.nix {})
      # (callPackage ./veridian.nix {sv-lang = (callPackage ./sv-lang.nix {});})
    ];

    environment.sessionVariables = {
      WAYLAND_DISPLAY = "";
    };
  };
  
}
