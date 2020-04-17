let
  pkgs = import (import ./nix/sources.nix).nixpkgs {};
in
builtins.mapAttrs
  (_: pkg:
    let
      rc = (pkg { pkgs = pkgs; nixpkgs = null; release = false; }).rootCrate;
      tree = rc.debug.internal.buildTree;
    in
      if (builtins.hasAttr "crateBin" tree) then rc.build else null
  )
  (import ./default.nix)
