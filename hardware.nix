{ pkgs, config, lib, ... }:

with rec { inherit (config) device devices deviceSpecific; };
with deviceSpecific; {


  hardware.enableRedistributableFirmware = true; # For some unfree drivers
  hardware.cpu.intel.updateMicrocode = true;
  #hardware.enableAllFirmware = true;
  powerManagement.enable = false;
  services.fstrim = {
    enable = true;
    interval = "daily";
  };

   # ATI power manager profile
   systemd.services.radeon_low_power = {
     script = ''
       echo "performance" > /sys/class/drm/card0/device/power_dpm_state
     '';
     wantedBy = [ "multi-user.target" ];
   };


### Video Drivers
   programs.gamemode.enable = true;
   hardware.opengl = {
     enable = true;
     extraPackages = with pkgs; [
       vulkan-tools
       vaapiVdpau
       libvdpau-va-gl
       ];
    extraPackages32 = with pkgs; [
       ];
     driSupport = true;
     driSupport32Bit = true; # For steam
   };

  



### Media settings
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;


  };


  sound.enable = true;
  hardware.pulseaudio.daemon.config = {
    avoid-resampling = "yes";
    resample-method = "soxr-vhq";
    default-sample-rate = "48000";
    default-sample-format = "s32le";
  };

  hardware.pulseaudio = {
    enable = false;
    package = pkgs.pulseaudioFull;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    extraConfig = "load-module module-echo-cancel use_master_format=1 aec_method=webrtc source_name=echoCancel_source sink_name=echoCancel_sink
set-default-source echoCancel_source
set-default-sink echoCancel_sink
    ";
  };


  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.bluetooth.settings = {

    General = {
      # MultiProfile = "multiple";
      # ControllerMode = "bredr";
      FastConnectable = "true";

    };
  };


}
