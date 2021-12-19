{ config, pkgs, lib, ... }: {

  # Boot and modules
  nix.buildCores = 20;
  nix.maxJobs = lib.mkDefault 20;

  boot.kernelPackages = with pkgs; unstable.linuxPackages_xanmod;
  boot.initrd.availableKernelModules = [ "ehci_pci" "ahci" "radeon" "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" "nvme" "radeon" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.supportedFilesystems = [ "" ];
  security.apparmor.enable = false;
  zramSwap.enable = false;
  zramSwap.algorithm = "zstd";
  services.earlyoom.enable = true;
  services.earlyoom.enableNotifications = true;
  services.auto-cpufreq.enable = false;
  hardware.enableAllFirmware = false;



  ### Boot Kernel

  # Use the systemd-boot EFI boot loader.

  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.memtest86.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 30;
    };
    consoleLogLevel = 3;
    extraModprobeConfig = "options ec_sys write_support=1";
    kernel.sysctl."vm.swappiness" = 50;
    kernel.sysctl."kernel/sysrq" = 1;
    kernel.sysctl."abi.vsyscall32" = 0;
    kernelParams = [
      "quiet"
      "mitigations=off"
      "radeon.dpm=0"
      "radeon.gartsize=1024"
      "radeon.vramlimit=512"
      "radeon.use_pflipirq=1"
      "intel_pstate=enable"
      "radeon.audio=0"
      "radeon.msi=0"
      "radeon.fastfb=1"
      "radeon.aspm=1"

    ];
  };









}
