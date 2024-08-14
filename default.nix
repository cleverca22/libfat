{ stdenv, libxenon }:

stdenv.mkDerivation {
  name = "libfat";
  src = ./.;
  DEVKITXENON = "${libxenon}/devkitxenon";
  PREFIX = "${stdenv.hostPlatform.config}-";
  buildInputs = [ libxenon ];
  installPhase = ''
    mkdir -pv $out/{include/libfat/,lib}
    cp -v libxenon/lib/xenon/libfat.a $out/lib/
    cp -v libxenon/include/fat.h $out/include/libfat/
  '';
}
