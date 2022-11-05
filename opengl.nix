{ pkgs, ... }:
{

  services.xserver.videoDrivers = [ "nvidia" ];

#  hardware.nvidia.modesetting.enable = true;
#  hardware.nvidia.powerManagement.enable = true;

  hardware.nvidia.prime = {
    #offload.enable = true;
    sync.enable = true;
    #sync.allowExternalGpu = true;

    # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
    amdgpuBusId = "PCI:4:0:0";

    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
    nvidiaBusId = "PCI:3:0:0";
  };
}

# let
#   nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
#     export __NV_PRIME_RENDER_OFFLOAD=1
#     export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
#     export __GLX_VENDOR_LIBRARY_NAME=nvidia
#     export __VK_LAYER_NV_optimus=NVIDIA_only
#     exec "$@"
#   '';
# in
# {
#   environment.systemPackages = [ nvidia-offload ];
#
#   services.xserver.videoDrivers = [ "nvidia" ];
#   hardware.nvidia.prime = {
#     offload.enable = true;
#
#     # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
#     amdgpuBusId = "PCI:04:00:0";
#
#     # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
#     nvidiaBusId = "PCI:03:00:0";
#   };
# }
