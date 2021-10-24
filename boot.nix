{ inputs, system, lib, pkgs, ... }:
let freshSystem = inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  modules = [ inputs.nixos-hardware.nixosModules.raspberry-pi-4 ];
};
in
{
  boot.kernelPackages = pkgs.linuxPackages_rpi4;
  boot.initrd.availableKernelModules = lib.mkForce
    freshSystem.config.boot.initrd.availableKernelModules;
}
