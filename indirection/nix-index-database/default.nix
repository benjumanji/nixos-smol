{ sources, ... }:
let
  self = sources.nix-index-database.outPath;
in
{
  imports = [ (import (sources.nix-index-database + "/nixos-module.nix") self) ];
  programs.nix-index-database.comma.enable = true;
}
