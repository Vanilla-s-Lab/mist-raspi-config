{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    deploy-rs.url = "github:serokell/deploy-rs";
  };

  outputs = { self, nixpkgs, nixos-hardware, deploy-rs, ... }: rec {
    nixosConfigurations."MIST-Raspi" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./configuration.nix
        nixos-hardware.nixosModules.raspberry-pi-4
        "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
      ];
    };

    deploy.nodes."MIST-Raspi" = rec {
      hostname = "192.168.110.24";
      sshUser = "root";

      profiles.system = {
        user = "${sshUser}";
        path = deploy-rs.lib."aarch64-linux".activate.nixos nixosConfigurations."MIST-Raspi";
        fastConnection = true;
      };
    };
  };
}
