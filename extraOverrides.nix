{pkgs, ...}:
with pkgs;
{
  alsa-sys = _: {
    buildInputs = [ pkgconfig alsaLib ];
  };

  fuse = _: {
    buildInputs = [ pkgconfig fuse ];
  };
}
