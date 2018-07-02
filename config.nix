{
  allowUnfree = true;

  firefox = {
    enableGoogleTalkPlugin = true;
    enableAdobeFlash = true;
  };

  chromium = {
    enablePepperFlash = true;
    commandLineArgs = "--force-device-scale-factor=2";
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

    docker-machine-kvm2 = import ./docker-machine-kvm2 {
      inherit (pkgs) stdenv buildGoPackage fetchFromGitHub libvirt pkgconfig;
    };

    bazel_0_14_1 = bazel.overrideAttrs (oldAttrs: rec {
      version = "0.14.1";
      src = fetchurl {
        url = "https://github.com/bazelbuild/bazel/releases/download/${version}/bazel-${version}-dist.zip";
        # nix-prefetch-url --unpack https://github.com/bazelbuild/bazel/releases/download/0.14.1/bazel-0.14.1-dist.zip
        sha256 = "0980zd7w2bbk6x7rjbvkdfkc31dzv600lvqf35x7mbhq4vcdr76l";
      };
    });

    minikube_0_25_2 = minikube.overrideAttrs (oldAttrs: rec {
      localkube-version = "1.9.4";

      localkube-binary = fetchurl {
        url = "https://storage.googleapis.com/minikube/k8sReleases/v${localkube-version}/localkube-linux-amd64";
        sha256 = "0c1n8p7q38hx864xvcsr01d028cizjfpsqbfpf1y24fnrpzacajw";
      };

      version = "0.25.2";

      name = "minikube-${version}";

      preBuild = builtins.replaceStrings [oldAttrs.version] [version] oldAttrs.preBuild;

      src = fetchFromGitHub {
        owner  = "kubernetes";
        repo   = "minikube";
        rev    = "v${version}";
        sha256 = "1h8sxs6xxmli7xkb33kdl4nyn1sgq2b8b2d6aj5wim11ric3l7pb";
      };
    });

    kubectl_1_9_4 = kubectl.overrideAttrs (oldAttrs: rec {
      version = "1.9.4";

      src = fetchFromGitHub {
        owner = "kubernetes";
        repo = "kubernetes";
        rev = "v${version}";
        sha256 = "00abs626rhgz5l2ij8jbyws4g3lnb9ipima1q83q0nlj7ksaqz7d";
      };

      patches = [];
    });

    helm_2_9_0 = kubernetes-helm.overrideAttrs (oldAttrs: rec {
      version = "2.9.0";
      src = fetchurl {
        url = "https://kubernetes-helm.storage.googleapis.com/helm-v${version}-linux-amd64.tar.gz";
        sha256 = "0bnjpiivhsxhl45ab32vzf6crv4z8nbq5kcjkvlbcbswdbgp0pq6";
      };
    });

    all = with pkgs; buildEnv {
      name = "all";

      paths = [
        # core
        bash

        # nix helpers
        nix-prefetch-scripts
        nix-repl
        nixops
        nixpkgs-lint
        nox
        patchelf
        patchutils

        # utilities
        gist
        gnupg
        htop
        httpie
        inotify-tools
        jq
        libnotify
        lsof
        tmux
        tree
        unzip
        virtualbox

        docker-machine-kvm2 # required by Minikube vm-driver kvm2

        qemu

        libu2f-host # support for Yubikey on Chromium

        # editors
        neovim

        # development tools
        bazel_0_14_1
        gcc
        git
        git-crypt
        gnumake
        go dep
        jdk
        kubectl_1_9_4
        minikube_0_25_2
        nodejs-8_x yarn
        python2Full
        python3Full
        rake
        helm_2_9_0

        # networking tools
        curl
        mosh
        ncat
        wget

        # i3 and helpers
        i3blocks
        i3status
        rofi
        termite
        xcape
        xorg.xbacklight
        xorg.xdpyinfo
        xorg.xmodmap
        xsel
        xss-lock

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
