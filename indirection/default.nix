{ pkgs, ... }:
{
  imports = [ ./nix-index-database ];

  environment.etc."nixos/nixpkgs".source = builtins.storePath pkgs.path;

  nix = {
    channel.enable = false;
    nixPath = [
      "nixPath=/etc/nixos/nixpkgs"
    ];
  };

  services.getty.autologinUser = "nixos";

  users.users.nixos = {
    isNormalUser = true;
  };

  users.groups.nixos = { };
}
