{ vimUtils, fetchFromGitHub }:

{
  vim-colemak = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-colemak-2016-10-16";
    src = fetchFromGitHub {
      owner = "kalbasit";
      repo = "vim-colemak";
      rev = "6ac1c0bf362845355c65dfeab9a9987c1b4dc7ec";
      sha256 = "1li7yc5vglrhf7w7i7gs2i7ihdb1bhx85basmpgqlf7790lv1599";
    };
    dependencies = [];
  };

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

  vim-pig = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-pig-2017-06-08";
    src = fetchFromGitHub {
      owner = "motus";
      repo = "pig.vim";
      rev = "60d8a0883d3e474e61af46b581a5ce3af65e9bb5";
      sha256  = "0az48a3slpzljb69d60cpahkshmdbss0snc8lmvf4yrc1gx8yncv";
    };
    dependencies = [];
  };

  vim-emmet = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-emmet-2018-05-20";
    src = fetchFromGitHub {
      owner = "mattn";
      repo = "emmet-vim";
      rev = "f5b185e3a27d8db82b93bf7070387a332395abe1";
      sha256 = "1sl4qjy2afn8vspbf0qgfwffcxk4c6y6ngi2w3yda3bz3ssfrm8l";
    };
    dependencies = [];
  };

  vim-yats = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-yats-2018-06-20";
    src = fetchFromGitHub {
      owner = "HerringtonDarkholme";
      repo = "yats.vim";
      rev = "957a351b6ec33b06307c14a25195c73f28770959";
      sha256 = "1v0ckva8v3157087l9z3i07bq7h2n0b11fb8dn2xl1a6bgvxpy8n";
    };
    dependencies = [];
  };

  vim-color-seoul256 = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-color-seoul256-2017-09-04";
    src = fetchFromGitHub {
      owner = "junegunn";
      repo = "seoul256.vim";
      rev = "1475b7610663c68aa90b6e565997c8792ce0d222";
      sha256 = "03gqw14f5cirivcg1p06g500ns066yv5rd0z3zikvn4ql7n278dk";
    };
    dependencies = [];
  };

  vim-typescript = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-typescript-2018-06-05";
    src = fetchFromGitHub {
      owner = "mhartington";
      repo = "nvim-typescript";
      rev = "11074c8f6cf93c4714db2115a2c81cc9b6862acf";
      sha256 = "0yr9zmky2si663wpzvw26q6hz5kmzz016rnvz5p4lx7y56jwabad";
    };
    dependencies = [];
  };
}
