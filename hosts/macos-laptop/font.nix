# make a  derivation for berkeley-mono font installation
{pkgs}:
pkgs.stdenv.mkDerivation {
  pname = "berkeley-mono-typeface";
  version = "1.009";

  src = ~/Library/Fonts/BerkeleyMono-Bold.ttf;

  unpackPhase = ''
    runHook preUnpack
    ${pkgs.unzip}/bin/unzip $src

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    install -Dm644 berkeley-mono-patched/*.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
