{ pkgs, ... }:
{
  sdImage.compressImage = false;
  imports = [
    ./networking/wireless.nix
    ./users.nix
    ./services/openssh.nix
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;
}
