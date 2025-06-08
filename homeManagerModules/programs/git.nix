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
      extraConfig = {
        core.pager = "delta";
        interactive.diffFilter = "delta --color-only";
        delta.navigate = "true";
        merge.conflictStyle  = "zdiff3";
      };
    };
  };
}
