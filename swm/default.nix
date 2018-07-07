# This file was generated by https://github.com/kamilchm/go2nix v1.2.1
{ stdenv, buildGoPackage, fetchgit, fetchhg, fetchbzr, fetchsvn }:

buildGoPackage rec {
  name = "swm-unstable-${version}";
  version = "2018-04-19";
  rev = "de4a7564d2e002f5773fe4b3fcbe2c22e9abe6b6";

  goPackagePath = "github.com/kalbasit/swm";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/kalbasit/swm";
    sha256 = "0d62rnci528ckfgh1jb7k16m9haa6infl7mrmiwlinynm8idca49";
  };

  goDeps = ./deps.nix;

  # TODO: add metadata https://nixos.org/nixpkgs/manual/#sec-standard-meta-attributes
  meta = {
  };
}
