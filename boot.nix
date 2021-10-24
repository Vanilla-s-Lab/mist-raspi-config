{ lib, pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_rpi4;
  boot.initrd.availableKernelModules = lib.mkForce [ ];
}
