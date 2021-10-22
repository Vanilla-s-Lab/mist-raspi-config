{ pkgs, ... }:
let userDb = pkgs.runCommand "db_load" { nativeBuildInputs = [ pkgs.db ]; } ''
  echo "MIST" >> logins.txt
  echo "MIST" >> logins.txt

  db_load -T -t hash -f logins.txt userDb.db
  mkdir -p $out/ && cp ./userDb.db $out/
'';
in
{
  services.vsftpd.enable = true;
  networking.firewall.enable = false;

  services.vsftpd = { enableVirtualUsers = true; userDbPath = "${userDb}/userDb"; };
  services.vsftpd = { localUsers = true; localRoot = "/tmp"; };
  services.vsftpd = { userlistEnable = true; userlist = [ "MIST" ]; };
  services.vsftpd = { chrootlocalUser = true; allowWriteableChroot = true; };
}
