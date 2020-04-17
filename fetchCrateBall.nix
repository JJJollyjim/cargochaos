{ pkgs ? (import <nixpkgs> {}), name, vers, cksum, ... }:
pkgs.fetchurl {
  name = "${name}-${vers}.tar.gz";
  url = "https://static.crates.io/crates/${name}/${name}-${vers}.crate";
  sha256 = cksum;
}
