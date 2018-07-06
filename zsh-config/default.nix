{stdenv, self}:

stdenv.mkDerivation rec {
  name = "zsh-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome
    substitute $src/zshrc $out/userHome/.zshrc \
      --subst-var-by bin_dir ${self.src}/bin \
      --subst-var-by libexec_dir ${self.src}/libexec \
      --subst-var-by zsh_dir ${self.src}/zsh
  '';
}
