{ pkgs, lib, config, inputs, ... }: {

  imports = [inputs.waveforms.nixosModule];

  options = {
    waveforms.enable = 
      lib.mkEnableOption "enables waveforms module";
  };

  config = lib.mkIf config.waveforms.enable {

    users.users.matthew.extraGroups = [ "plugindev" ];
  };
  
}
