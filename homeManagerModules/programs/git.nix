{ pkgs, lib, config, ... }: {

  options = {
    git.enable = 
      lib.mkEnableOption "enables git module";
  };

  config = lib.mkIf config.git.enable {

    programs.git = {
      enable = true;
      userEmail = "mhershfield@ufl.edu";
      userName = "Matthew Hershfield";
    };
  };
}
