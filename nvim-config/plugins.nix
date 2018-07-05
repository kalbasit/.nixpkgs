{ vimUtils, fetchFromGitHub }:

{
  vim-terraform = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-terraform-2018-04-16";
    src = fetchFromGitHub {
      owner = "hashivim";
      repo = "vim-terraform";
      rev = "4e91b8c3a73fb9ecbf159fb5ca24ed6f39fad4f9";
      sha256 = "08qs61lll525ahwi1n4ksain04y830qd62sdxy3hjf6xjlppanzj";
    };
    dependencies = [];
  };

  vim-csv = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-csv-2018-06-24";
    src = fetchFromGitHub {
      owner = "chrisbra";
      repo = "csv.vim";
      rev = "918be3bd15920fd9bc79fca5e6870b8055742a1a";
      sha256 = "01fhw55s5q23ny3n7ldg53n3raysr2wnnkpfybbba2wv55w5vpdy";
    };
    dependencies = [];
  };
}
