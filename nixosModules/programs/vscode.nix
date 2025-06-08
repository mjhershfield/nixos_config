{ pkgs, lib, config, ... }: {

  options = {
    vscode.enable = 
      lib.mkEnableOption "enables vscode module";
  };

  config = lib.mkIf config.vscode.enable {
    environment.systemPackages = with pkgs; [
      (vscode.fhsWithPackages (
        ps: with ps; [
          python3
          verible
          verilator
        ]
      ))
    ];
  };
  
}
