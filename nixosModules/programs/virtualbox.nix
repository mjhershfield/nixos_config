{ pkgs, lib, config, ... }: {

  options = {
    vbox.enable = 
      lib.mkEnableOption "enables virtualbox module";
  };

  config = lib.mkIf config.vbox.enable {
    virtualisation.virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };
    users.extraGroups.vboxusers.members = [ "matthew" ];

  };
  
}
