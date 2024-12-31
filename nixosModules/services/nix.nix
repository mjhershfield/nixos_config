{ pkgs, lib, config, inputs, ... }: {

  nix = {
    enable = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    optimise = {
      automatic = true;
      dates = ["weekly"];
    };

    settings.experimental-features = ["nix-command" "flakes"];
    
  };

  environment.systemPackages = with pkgs; [
    nix-index
  ];

  # programs.nix-ld.enable = true;
}
