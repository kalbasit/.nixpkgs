{
  allowUnfree = true;

  firefox = {
    enableGoogleTalkPlugin = true;
    enableAdobeFlash = true;
  };

  chromium = {
    enablePepperFlash = true;
    enablePepperPDF = true;
  };

  packageOverrides = pkgs_: with pkgs_; {
    # gtk-config = import ./gtk-config {
    #   inherit (pkgs) stdenv albatross;
    # };
    # termite-config = import ./termite-config {
    #   inherit (pkgs) stdenv;
    #   vte = gnome3.vte;
    # };
    # qtile-config = import ./qtile-config {
    #   inherit (pkgs) stdenv;
    # };
    # bash-config = import ./bash-config {
    #   inherit (pkgs) stdenv fzf ; jdk = oraclejdk;
    # };
    # my_vim = import ./vim-config { inherit pkgs ; };
    # elixir-config = import ./elixir-config {
    #   inherit (pkgs) stdenv;
    # };

    all = with pkgs; buildEnv {
      name = "all";

      paths = [
        # core
        bash

        # utilities
        unzip
        gnupg
        tmux
        docker
        virtualbox

        libu2f-host # support for Yubikey on Chromium

        # editors
        neovim

        # development tools
        git
        git-crypt
        jdk
        gnumake
        gcc
        rake
        nodejs-8_x yarn
        go dep
        python2Full
        python3Full

        # networking tools
        mosh
        ncat
        wget
        curl

        # i3 and helpers
        xcape
        i3blocks
        i3status
        termite # My favorite shell
        xss-lock
        xorg.xdpyinfo
        xorg.xmodmap
        rofi
        xorg.xbacklight
        xsel

        # Applications
        chromium
        firefox
      ];

      # paths = [
      #   gtk-config
      #   termite-config
      #   qtile-config
      #   bash-config
      #   elixir-config

      #   nix-repl
      #   nix-prefetch-scripts
      #   nixpkgs-lint
      #   nixops
      #   nox
      #   patchelf
      #   patchutils

      #   telnet
      #   wireshark-gtk
      #   bind
      #   netcat-openbsd

      #   termite
      #   cv
      #   powerline-fonts
      #   clipit
      #   xsel
      #   ntfy

      #   pasystray
      #   pavucontrol
      #   alsaUtils

      #   blueman

      #   arandr

      #   gnumake

      #   tree
      #   inotify-tools
      #   fzf
      #   ripgrep
      #   fd
      #   ranger
      #   my_vim
      #   atom
      #   typora

      #   git
      #   git-radar
      #   gitg
      #   meld
      #   tig

      #   bazaar
      #   mercurial

      #   zip
      #   unzip
      #   p7zip

      #   bc

      #   firefoxWrapper
      #   chromium
      #   httpie
      #   mitmproxy

      #   tokei
      #   jq

      #   go

      #   beam.packages.erlangR20.elixir

      #   nodejs-8_x

      #   oraclejdk
      #   maven
      #   #idea.idea-ultimate
      #   #heroku

      #   python36
      #   gcc

      #   nim
      #   ponyc

      #   python36Packages.glances

      #   python36Packages.docker_compose
      #   gparted
      #   proot
      #   vagrant
      #   ansible2

      #   evince
      #   libreoffice
      #   vlc
      #   ffmpeg
      #   geeqie
      #   pinta
      #   inkscape
      #   graphicsmagick
      #   yed
      #   zoom-us

      #   deluge

      #   hexchat
      # ];
    };
  };
}
