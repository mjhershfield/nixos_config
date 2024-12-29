{ pkgs, lib, config, inputs, ... }: {
    
  imports = [
      inputs.xremap-flake.nixosModules.default
  ];
  options = {
    xremap.enable = 
      lib.mkEnableOption "enables xremap module";
  };

  config = lib.mkIf config.xremap.enable {
    
    services.xremap = {
      userName = "matthew";
      config.modmap = [
        {
          name = "Global";
          remap = {"CapsLock" = "Esc"; };        
        }
      ];
    };
  };
  
}
