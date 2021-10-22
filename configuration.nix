{ pkgs, ... }:
{
  sdImage.compressImage = false;
  imports = [
    ./wireless.nix
    ./users.nix

    ./services/openssh.nix
    ./services/vsftpd.nix

    ./nix/binaryCaches.nix
    ./nix/flakes.nix
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
  };

  networking.hostName = "MIST-Raspi";
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
