{ pkgs, lib, config, ... }: {

  options = {
    xilinx.enable = 
      lib.mkEnableOption "enables xilinx module";
  };

  config = lib.mkIf config.xilinx.enable {
    programs.nix-ld.enable = true;
  };
  
}
