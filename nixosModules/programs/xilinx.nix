{ pkgs, lib, config, inputs, ... }: {

  options = {
    xilinx.enable = 
      lib.mkEnableOption "enables xilinx module";
  };

  config = lib.mkIf config.xilinx.enable {

    # Use nix-xilinx flake to handle FHS environemnts for Xilinx software
    nixpkgs.overlays = [ inputs.nix-xilinx.overlay ];

    # Install FHS environment for vivado/vitis and shortcuts to access them
    environment.systemPackages = with pkgs; [
      xilinx-shell
      vitis
      vitis_hls
      vivado
    ];

    # Add udev rules to access programmers
    services.udev.packages = [
      (pkgs.writeTextFile {
        name = "xilinx-digilent-usb-udev";
        destination = "/etc/udev/rules.d/52-xilinx-digilent-usb.rules";
        text = ''
          ATTR{idVendor}=="1443", MODE:="666"
          ACTION=="add", ATTR{idVendor}=="0403", ATTR{manufacturer}=="Digilent", MODE:="666"
        '';
      })
      (pkgs.writeTextFile {
        name = "xilinx-pcusb-udev";
        destination = "/etc/udev/rules.d/52-xilinx-pcusb.rules";
        text = ''
          ATTR{idVendor}=="03fd", ATTR{idProduct}=="0008", MODE="666"
          ATTR{idVendor}=="03fd", ATTR{idProduct}=="0007", MODE="666"
          ATTR{idVendor}=="03fd", ATTR{idProduct}=="0009", MODE="666"
          ATTR{idVendor}=="03fd", ATTR{idProduct}=="000d", MODE="666"
          ATTR{idVendor}=="03fd", ATTR{idProduct}=="000f", MODE="666"
          ATTR{idVendor}=="03fd", ATTR{idProduct}=="0013", MODE="666"
          ATTR{idVendor}=="03fd", ATTR{idProduct}=="0015", MODE="666"
        '';
      })
      (pkgs.writeTextFile {
        name = "xilinx-ftdi-usb-udev";
        destination = "/etc/udev/rules.d/52-xilinx-ftdi-usb.rules";
        text = ''
          ACTION=="add", ATTR{idVendor}=="0403", ATTR{manufacturer}=="Xilinx", MODE:="666"
        '';
      })
      # FTDI UDEV RULE
      (pkgs.writeTextFile {
        name = "ftdi-d3xx-udev";
        destination = "/etc/udev/rules.d/51-ftd3xx.rules";
        text = ''
          SUBSYSTEM=="usb", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="601e", MODE="0666"
          SUBSYSTEM=="usb", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="601f", MODE="0666"
          SUBSYSTEM=="usb", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="602a", MODE="0666"
          SUBSYSTEM=="usb", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="602b", MODE="0666"
          SUBSYSTEM=="usb", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="602c", MODE="0666"
          SUBSYSTEM=="usb", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="602d", MODE="0666"
          SUBSYSTEM=="usb", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="602f", MODE="0666"
        '';
      })
    ];
  };
  
}
