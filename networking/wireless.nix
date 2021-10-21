{ ... }:
{
  networking.wireless.enable = true;
  networking.wireless.networks = {
    "@Ruijie-s02C6".psk = "Jxustnc001";
  };
  networking.wireless.interfaces = [ "wlan0" ];
  networking.interfaces."wlan0".useDHCP = true;
}
