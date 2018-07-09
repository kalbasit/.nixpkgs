{stdenv, fetchgit, pinentry_ncurses}:

stdenv.mkDerivation rec {
  name = "private";
  version = "0.0.1";
  rev = "04dc7b590fb33b1e08fd1266ff85b945336d2196";

  phases = [ "installPhase" "postPhases" ];

  src = fetchgit {
    inherit rev;
    url = /home/kalbasit/code/personal/base/src/keybase/private;
    sha256 = "0l8zwfh5cz35qfnhflng27hnk0488rmqpj61nqx3199jzcp7is37";
  };

  # .gnupg/gpg-agent.conf
  # @pinentry_bin@


  installPhase = ''
    install -dm 755 $out/userPrivateHome
    cp -dr $src/.??* $out/userPrivateHome/

    substituteInPlace $out/userPrivateHome/.gnupg/gpg-agent.conf \
      --subst-var-by pinentry_bin ${pinentry_ncurses}/bin/pinentry-curses
  '';

  postPhases = ''
    find $out/userPrivateHome/.ssh -type f -exec grep -q 'PRIVATE KEY' {} \; -exec chmod 400 {} \;

    chmod 400 $out/userPrivateHome/.ssh/personal/id_rsa
  '';
}
