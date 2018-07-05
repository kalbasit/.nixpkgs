# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.kernelModules = [ "kvm-intel" "vboxpci" ];
  boot.extraModulePackages = [ ];
  boot.blacklistedKernelModules = ["nouveau"];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/03f03590-9d56-42c4-a0d0-a7de50bdbc98";
      fsType = "btrfs";
    };

   boot.initrd.luks.devices = {
    cryptkey = {
      device = "/dev/disk/by-uuid/4dd5e87d-9138-4bc3-9d6a-1922aebd2e7f";
    };

    cryptroot = {
      device = "/dev/disk/by-uuid/fd5b8e77-a627-416e-9156-ec9e64512f88";
      keyFile = "/dev/mapper/cryptkey";
    };

    cryptswap = {
      device = "/dev/disk/by-uuid/076590e6-2968-40e3-bb9b-e02047ca8112";
      keyFile = "/dev/mapper/cryptkey";
    };
  };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2B2A-DC95";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/7cc60eb7-e65e-4dee-b90b-22886d8d957e"; }
    ];

  nix.maxJobs = lib.mkDefault 12;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}