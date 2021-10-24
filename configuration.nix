{ pkgs, ... }:
{
  sdImage.compressImage = false;
  imports = [
    ./wireless.nix
    ./users.nix
    ./boot.nix

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
  hardware.raspberry-pi."4".audio.enable = true;
  hardware.raspberry-pi."4".fkms-3d.enable = true;
}
