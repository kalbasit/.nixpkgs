{stdenv}:

stdenv.mkDerivation rec {
  name = "zsh-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome
    ln -s $src/bin $out/userHome/.bin
    ln -s $src/libexec $out/userHome/.libexec
    ln -s $src/zsh $out/userHome/.zsh
    cp $src/zshrc $out/userHome/.zshrc
  '';
}
