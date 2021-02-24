{ config, pkgs, lib, ... }:{

# Boot and modules
  nix.buildCores= 12;
  nix.maxJobs = lib.mkDefault 16;
  boot.kernelPackages = pkgs.linuxZenWMuQSS;
  boot.initrd.availableKernelModules = [ "ehci_pci" "ahci" "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" "amdgpu" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

### Boot Kernel

  # Use the systemd-boot EFI boot loader.

  boot = {
    loader = {
    	systemd-boot.enable = true;
    	efi.canTouchEfiVariables = true;
    	timeout = 30;
    };
    consoleLogLevel = 3;
    extraModprobeConfig = "options ec_sys write_support=1";
    kernel.sysctl."vm.swappiness" = 50;
    kernel.sysctl."kernel/sysrq" = 1;
    kernelParams = [
      "quiet"
      "amdgpu.ppfeaturemask=0xffffffff"
      "scsi_mod.use_blk_mq=1"
      "modeset"
      "nofb"
      "rd.systemd.show_status=auto"
      "rd.udev.log_priority=3"
      "pti=off"
      "spectre_v2=off"
      "mitigations=off"
      "noibrs" 
      "noibpb" 
      "nopti"
      "nospectre_v1"
      "l1tf=off"
      "nospec_store_bypass_disable"
      "no_stf_barrier"
      "mds=off"
      "tsx=on" 
      "tsx_async_abort=off"
      "net.ifnames=0"
      "usbhid.mousepoll=2"
      "threadirqs"
    ];
  };



  nixpkgs = {
    overlays = [
      (self: super: {
        linuxZenWMuQSS = pkgs.linuxPackagesFor (pkgs.linux_zen.override {
          structuredExtraConfig = with lib.kernel; {
            SCHED_MUQSS = yes;
          };
          ignoreConfigErrors = true;
        });
      })
    ];
  };



  


}