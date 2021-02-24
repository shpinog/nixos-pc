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
      pkgs.mesa_drivers
    ];
    driSupport = true;
    driSupport32Bit = true; # For steam
  };
  
 sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    extraConfig = "#load-module module-suspend-on-idle";
  };

  
  hardware.bluetooth.enable = true;
   services.blueman.enable = true;
  hardware.bluetooth.config ={

      General = {
         # MultiProfile = "multiple";
         # ControllerMode = "bredr";
         FastConnectable = "false";
         
      };
  };


}
