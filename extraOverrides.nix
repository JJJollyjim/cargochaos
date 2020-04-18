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
    buildInputs = [ pkgconfig libslirp gnome2.glib ];
  };

  libudev-sys = _: {
    buildInputs = [ pkgconfig libudev ];
  };
}
