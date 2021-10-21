{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs = { self, nixpkgs, nixos-hardware }: {
    nixosConfigurations."MIST-Raspi" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./configuration.nix
        nixos-hardware.nixosModules.raspberry-pi-4
        "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
      ];
    };
  };
}
