{buildGoPackage, fetchFromGitHub}:

buildGoPackage rec {
  name = "swm";
  version = "0.2.1";

  goPackagePath = "github.com/kalbasit/swm";

  src = fetchFromGitHub {
    owner = "kalbasit";
    repo = "swm";
    rev = "v${version}";
    sha256 = "0k0cvmmz8dbxfby0bfvvd0f0jl484c7baw1bsa54cxkr7rz0xf94";
  };
}
