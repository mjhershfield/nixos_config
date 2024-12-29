{ pkgs, lib, config, ... }: {

  options = {
    template.enable = 
      lib.mkEnableOption "enables template module";
  };

  config = lib.mkIf config.template.enable {
    option1 = 5;
    option2 = true;
  };
  
}
