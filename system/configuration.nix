# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./fix-cursor-size.nix
  ];

  # NOTE: Xorg driver modesetting does not work with the kernel that ships with
  # the stable channel (4.14.51).
  # TODO: Pin to kernel 4.16.17
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config = {
    allowUnfree = true;

    firefox = {
      enableGoogleTalkPlugin = true;
      enableAdobeFlash = true;
    };

    chromium = {
      enablePepperFlash = true;
      commandLineArgs = "--force-device-scale-factor=2";
    };
  };

  networking.hostName = "athena"; # Define your hostname.
  networking.networkmanager.enable = true;

  i18n = {
    consoleFont = "latarcyrheb-sun32";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "America/Los_Angeles";

  # auto-update the system automatically
  system.autoUpgrade.enable = true;

  environment.systemPackages = with pkgs; [
    pciutils # provide lspci

    acpid

    neovim

    chromium
    firefox
  ];

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.virtualbox.host.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.bash.enableCompletion = true;
  # programs.mtr.enable = true;
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  networking.firewall.allowedUDPPortRanges = [ { from = 60000; to = 61000; } ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # TODO TODO TODO: remove this once it's all setup
  security.sudo.wheelNeedsPassword = false;

  users.extraUsers.kalbasit = {
    isNormalUser = true;
    uid = 1026;
    extraGroups = [ "wheel" "docker" "fuse" "vboxusers" "libvirtd" ];
    hashedPassword = "$6$0bx5eAEsHJRxkD8.$gJ7sdkOOJRf4QCHWLGDUtAmjHV/gJxPQpyCEtHubWocHh9O7pWy10Frkm1Ch8P0/m8UTUg.Oxp.MB3YSQxFXu1";
    openssh.authorizedKeys.keys = [
      (builtins.readFile (builtins.fetchurl {
        url = "https://github.com/kalbasit.keys";
        sha256 = "439dea6077640c229dcaa2a2849c57424b8d7731ecc3bd4fc4ca11bb1f98cde2";
      }))
    ];
  };
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";
  programs.zsh.enable = true;

  services.xserver = {
    autoRepeatDelay = 200;
    autoRepeatInterval = 30;

    enable = true;
    autorun = true;

    videoDrivers = ["modesetting"]; # "nouveau"];

    libinput = {
      enable = true;
      naturalScrolling = true;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        rofi
        i3status
        i3blocks
      ];
    };

    displayManager.lightdm.enable = true;

    # $ xdpyinfo | grep -B 2 resolution                                                                            ~/.nixpkgs
    # screen #0:
    #   dimensions:    3840x2160 pixels (998x561 millimeters)
    #   resolution:    98x98 dots per inch
    monitorSection = ''
      DisplaySize 406 228
    '';

    xkbVariant = "colemak";
    layout = "us";
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; # Did you read the comment?
}
