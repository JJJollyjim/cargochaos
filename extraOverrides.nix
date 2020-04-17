{pkgs, ...}:
with pkgs;
{
  alsa-sys = _: {
    buildInputs = [ pkgconfig alsaLib ];
  };

  fuse = _: {
    buildInputs = [ pkgconfig fuse ];
  };

  libslirp-sys = _: {
    buildInputs = [ pkgconfig libslirp ];
  };
}
