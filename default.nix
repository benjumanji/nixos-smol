let
  sources = import ./npins;
  pkgs = import sources.nixpkgs { };
  patched = pkgs.applyPatches {
    src = pkgs.path;
    name = "nixpkgs";
    patches = [
      ./0001-nixos-default.nix-Allow-specialArgs-to-be-passed.patch
    ];
  };
  nixos = import (patched + "/nixos");
in
nixos {
  configuration.imports = [
    { system.stateVersion = "25.05"; }
    ./indirection
  ];
  specialArgs = { inherit sources; };
}
