{ pkgs, config, lib, ... }:

with rec { inherit (config) device devices deviceSpecific; };
with deviceSpecific; {


  hardware.enableRedistributableFirmware = true; # For some unfree drivers

 

  boot = {
    loader = {
      timeout = 30;
    };
    consoleLogLevel = 3;
    extraModprobeConfig = "options ec_sys write_support=1";
    kernel.sysctl."vm.swappiness" = 50;
    kernel.sysctl."kernel/sysrq" = 1;
    kernelParams = [
      "quiet"
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
    ];
  };


}
