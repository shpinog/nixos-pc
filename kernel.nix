{ config, pkgs, lib, ... }: {

  # Boot and modules
#  nix.settings.cores = 16;
#  nix.settings.max-jobs = 16;
  environment.memoryAllocator.provider = "libc";
  

  boot.kernelPackages = with pkgs; linuxPackages_zen;
  boot.initrd.enable = true;
  boot.initrd.availableKernelModules = [ "amdgpu" "ehci_pci" "ahci"  "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod"  ];
  boot.initrd.kernelModules = [ "amdgpu""dm-snapshot" "nvme"  ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.supportedFilesystems = [ "" ];
  security.apparmor.enable = false;
  zramSwap.enable = true;
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
      systemd-boot.consoleMode = "max";
      timeout = 30;
    };
    blacklistedKernelModules =
      [ 
        "radeon"
      ];
    consoleLogLevel = 3;
    extraModprobeConfig = "options ec_sys write_support=1";
    kernel.sysctl."vm.swappiness" = 200;
    kernel.sysctl."kernel/sysrq" = 1;
    kernel.sysctl."abi.vsyscall32" = 0;
    kernelParams = [
      "quiet"
      "video=efifb"
      "fsck.mode=force"
      "radeon.si_support=0"
      "radeon.cik_support=0"
      "amdgpu.si_support=1"
      "amdgpu.cik_support=1"
      "mitigations=off"
      "intel_pstate=enable"
      "amdgpu.dc=1"
      "iomem=relaxed"
    ];
  };









}
