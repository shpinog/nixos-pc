{ pkgs, config, lib, ... }:

with rec { inherit (config) device devices deviceSpecific; };
with deviceSpecific; {


  hardware.enableRedistributableFirmware = true; # For some unfree drivers

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true; # For steam
  hardware.opengl.package = pkgs.mesa_drivers;
  services.zfs.trim.enable = true;
  services.zfs.autoScrub.enable = true;

  boot = {
    loader = {
      timeout = 3;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    consoleLogLevel = 3;
    extraModprobeConfig = "options ec_sys write_support=1";
    kernel.sysctl."vm.swappiness" = 50;
    kernel.sysctl."kernel/sysrq" = 1;
    kernelParams = [
      "quiet"
      "zfs.zfs_arc_max=1884901888"
      "scsi_mod.use_blk_mq=1"
      "modeset"
      "nofb"
      "rd.systemd.show_status=auto"
      "rd.udev.log_priority=3"
      "pti=off"
      "spectre_v2=off"
    ];
  };


}
