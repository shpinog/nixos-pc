{ pkgs, config, lib, ... }:

with rec { inherit (config) device devices deviceSpecific; };
with deviceSpecific; {

  
  hardware.enableRedistributableFirmware = true; # For some unfree drivers
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableAllFirmware = true;
  powerManagement.cpuFreqGovernor = "schedutil";






  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      amdvlk
      vaapiVdpau
      libvdpau-va-gl
    ];
    driSupport = true;
    driSupport32Bit = true; # For steam
  };

#   hardware.opengl.extraPackages32 = with pkgs; [
#   driversi686Linux.amdvlk

# ];


  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux;
    [ libva ]
    ++ lib.optionals config.services.pipewire.enable [ pipewire ];


  
 sound.enable = true;
  hardware.pulseaudio.daemon.config ={
    avoid-resampling = "yes";
    resample-method = "soxr-vhq";
    default-sample-rate = "48000";
    default-sample-format = "s32le";
  };

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    extraConfig = "load-module module-echo-cancel use_master_format=1 aec_method=webrtc source_name=echoCancel_source sink_name=echoCancel_sink
set-default-source echoCancel_source
set-default-sink echoCancel_sink
    ";
  };

  
  hardware.bluetooth.enable = true;
   services.blueman.enable = true;
  hardware.bluetooth.settings ={

      General = {
         # MultiProfile = "multiple";
         # ControllerMode = "bredr";
         FastConnectable = "false";
         
      };
  };


}
