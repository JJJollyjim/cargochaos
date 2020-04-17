let pkgs = import (import ./nix/sources.nix).nixpkgs {};
in
pkgs.lib.mapAttrs (_: pkg: (pkg {pkgs = pkgs;}).rootCrate.build) (import ./default.nix)
