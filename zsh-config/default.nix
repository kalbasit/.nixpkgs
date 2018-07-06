{stdenv}:

stdenv.mkDerivation rec {
  name = "zsh-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome
      cp -R $src/bin $out/userHome/.bin
      cp -R $src/libexec $out/userHome/.libexec
      cp -R $src/zsh $out/userHome/.zsh
      cp $src/zshrc $out/userHome/.zshrc
  '';
}
