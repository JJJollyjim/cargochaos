let
  sources = import ./nix/sources.nix;
  mozOverlay = import (sources.nixpkgs-mozilla);
  pkgs = import sources.nixpkgs {
    overlays = [ 
      mozOverlay
      (super: _: {
        rustc = super.latest.rustChannels.nightly.rust;
        inherit (super.latest.rustChannels.nightly) cargo rust rust-fmt rust-std clippy; 
      })
    ];
  };
  allOverrides = pkgs.defaultCrateOverrides // (pkgs.callPackage ./extraOverrides.nix {});
in
builtins.mapAttrs
  (_: pkg:
    let
      rc = (pkg { pkgs = pkgs; nixpkgs = null; release = false; defaultCrateOverrides = allOverrides; }).rootCrate;
      tree = rc.debug.internal.buildTree;
    in
      if (builtins.hasAttr "crateBin" tree) then rc.build else null
  )
  (import ./default.nix)
