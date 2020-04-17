{pkgs, ...}:
with pkgs;
{
  alsa-sys = _: {
    buildInputs = [ pkgconfig alsaLib ];
  };
}
