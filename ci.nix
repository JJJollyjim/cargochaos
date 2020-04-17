let pkgs = import (import ./nix/sources.nix).nixpkgs {};
in
pkgs.lib.mapAttrs (_: pkg: (pkg {pkgs = pkgs;}).rootCrate.build) 
(pkgs.lib.filterAttrs (_: c: let tree = (c {}).rootCrate.debug.internal.buildTree; in (builtins.hasAttr "crateBin" tree && tree.crateBin != [])) (import ./default.nix))
