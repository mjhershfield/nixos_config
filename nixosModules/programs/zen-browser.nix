{ pkgs, lib, config, inputs, ... }: {

  options = {
    zen-browser.enable = 
      lib.mkEnableOption "enables zen-browser module";
  };

  config = lib.mkIf config.zen-browser.enable {
    environment.systemPackages = [
      inputs.zen-browser.packages.${pkgs.system}.default
    ];
  };
  
}
