{ pkgs, lib, config, ... }: {

  options = {
    shell.enable = 
      lib.mkEnableOption "enables shell module";
  };

  config = lib.mkIf config.shell.enable {
    environment.systemPackages = with pkgs; [
      trashy
      bat
      bat-extras.batman
      delta
      ghostty
      viu
    ];

    environment.shellAliases = {
      rm = ''echo "Don't use rm! Use 'trash' or '/bin/rm'"'';
      man = "batman";
      viu = "TERM=xterm-kitty viu";
    };

    # programs.bash = {
    #   completion.enable = true;
    #   interactiveShellInit = "";
    # };

    programs.starship = {
      enable = true;
    };
  };
  
}
