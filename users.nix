{ pkgs, ... }:
{
  users.mutableUsers = false;
  users.users."akisamu" = {
    hashedPassword = "$6$misaki/meru$u/ByBI0ZjEL9n/tanndeveUkcOqA62HIVDGCjfc2OjIjs/QwPN0rKTGvsuv1RX1yOMLtZwc8eza6e5gvdM4un/";

    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };
}
