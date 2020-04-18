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

  libsodium-sys = _: {
    buildInputs = [ pkgconfig libsodium ];
  };

  libusb-sys = _: {
    buildInputs = [ pkgconfig libusb1 ];
  };

  magick_rust = _: {
    buildInputs = [ pkgconfig imagemagick7 ];
  };

  milter-sys = _: {
    buildInputs = [ pkgconfig libmilter ];
  };

  nettle-sys = _: {
    buildInputs = [ pkgconfig nettle ];
  };

  opencc-rust = _: {
    buildInputs = [ pkgconfig opencc ];
  };
}
