{ pkgs, lib, config, ... }: 

let
  # Questa desktop icon
  questaDesktopItem = pkgs.makeDesktopItem {
    name = "questa";
    desktopName = "Questa";
    exec = "${pkgs.quartus-prime-lite}/bin/vsim";
    terminal = true;
  };
in
{

  options = {
    quartus.enable = 
      lib.mkEnableOption "enables quartus module";
  };

  config = lib.mkIf config.quartus.enable rec {
    environment.systemPackages = with pkgs; [
      quartus-prime-lite
    ] ++ [questaDesktopItem];
 
    environment.variables = {
      LM_LICENSE_FILE = "/home/matthew/.config/quartus/LR-213188_License.dat";
    };

    # udev rules for usb blaster
    services.udev.packages = [
      (pkgs.writeTextFile {
        name = "altera-usb-blaster-udev";
        destination = "/etc/udev/rules.d/51-altera-usb-blaster.rules";
        text = ''
          SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666"
          SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666"
          SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666"
          SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666"
          SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666"
        '';
      })
    ];
  };
  
}
