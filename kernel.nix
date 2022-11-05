{ config, pkgs, lib, ... }: {

  # Boot and modules
  nix.settings.cores = 12;
  nix.settings.max-jobs = 12;
  

  boot.kernelPackages = with pkgs; linuxPackages_5_4;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_470;

  boot.initrd.enable = true;
  boot.initrd.availableKernelModules = [ "radeon" "ehci_pci" "ahci"  "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod"  ];
  boot.initrd.kernelModules = [ "dm-snapshot" "nvme"  ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.supportedFilesystems = [ "ntfs" ];
  security.apparmor.enable = false;
  zramSwap.enable = false;
  zramSwap.algorithm = "zstd";
  services.earlyoom.enable = false;
  services.earlyoom.enableNotifications = false;
  services.auto-cpufreq.enable = false;
  hardware.enableAllFirmware = false;
  services.cpupower-gui.enable = false;


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
        "amdgpu"
        "nouveau"
      ];
    consoleLogLevel = 3;
    extraModprobeConfig = "options ec_sys write_support=1";
#    kernel.sysctl."vm.swappiness" = 200;
    kernel.sysctl."kernel/sysrq" = 1;
    kernel.sysctl."abi.vsyscall32" = 0;
    kernelParams = [
      "quiet"
      "fsck.mode=force"
      "psi=1"
      "mitigations=off"
      "intel_pstate=enable"
      "nvidia.NVreg_EnablePCIeGen3=1"
    ];
  };









}
