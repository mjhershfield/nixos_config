# NixOS configuration

## Setup
```sh
cd
git clone https://github.com/mjhershfield/nixos_config.git
cd nixos_config
sudo nixos-rebuild switch --flake ./#<configuration name here>
```

After a reboot, the system can be reconfigured by editing this repository and running
```sh
nh os switch
```

Note that for a different user, the FLAKE environment variable should be changed to point to this repository's filepath
