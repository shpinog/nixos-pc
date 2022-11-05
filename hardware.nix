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
   # systemd.services.radeon_low_power = {
   #   script = ''
   #     echo "performance" > /sys/class/drm/card0/device/power_dpm_state
   #   '';
   #   wantedBy = [ "multi-user.target" ];
   # };

#Mouse
services.ratbagd.enable = true;
### Video Drivers
programs.gamemode = {
  enable  = true;
  enableRenice = true;
};

# hardware.opengl.enable = true;
# hardware.opengl.driSupport32Bit = true;

# hardware.nvidia = {
#      
#     #powerManagement = {
#         #enabled = true;
#
#         #finegrained = true; #maybe comment this out idk what it does
#     #};
#
#     #uses beta drivers
#   
#     open = false;
#     #Fixes a glitch
#     nvidiaPersistenced = false;
#     #Required for amdgpu and nvidia gpu pairings
#     modesetting.enable = true;
#   #   prime = {
#   #       offload.enable = true;
#   #       #sync.enable = true;
#   # 
#   #       amdgpuBusId = "PCI:04:00:0";
#   #
#   #       nvidiaBusId = "PCI:03:00:0";
#   #   };
#   };


hardware = {
  opengl =
    let
      fn = oa: {
        nativeBuildInputs = oa.nativeBuildInputs ++ [ pkgs.glslang ];
        mesonFlags = oa.mesonFlags ++ [ "-Dvulkan-layers=device-select,overlay" ];
#       patches = oa.patches ++ [ ./mesa-vulkan-layer-nvidia.patch ]; See below 
        postInstall = oa.postInstall + ''
            mv $out/lib/libVkLayer* $drivers/lib

            #Device Select layer
            layer=VkLayer_MESA_device_select
            substituteInPlace $drivers/share/vulkan/implicit_layer.d/''${layer}.json \
              --replace "lib''${layer}" "$drivers/lib/lib''${layer}"

            #Overlay layer
            layer=VkLayer_MESA_overlay
            substituteInPlace $drivers/share/vulkan/explicit_layer.d/''${layer}.json \
              --replace "lib''${layer}" "$drivers/lib/lib''${layer}"
          '';
      };
    in
    with pkgs; {
      enable = true;
      driSupport32Bit = true;
      driSupport = true;
      extraPackages = with pkgs; [
        vulkan-tools
        vaapiVdpau
        libvdpau-va-gl
        ];
      package = (mesa.override {
        galliumDrivers = [  "radeonsi" "zink" "swrast"];
        vulkanDrivers = ["amd"];
        }).drivers;
      package32 = (pkgsi686Linux.mesa.overrideAttrs fn).drivers;
    };
 };



  



### Media settings
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  programs.noisetorch.enable = true;


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
