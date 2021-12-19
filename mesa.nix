{ config, pkgs, system, ... }:


let

  unstable = import <nixos-unstable> { };
in
{
  hardware.opengl = {
    enable = true;
    package = unstable.mesa.drivers;
    extraPackages = with pkgs; [
      unstable.vaapiVdpau
      unstable.libvdpau-va-gl
      unstable.mesa.opencl
    ];

    driSupport = true;
    driSupport32Bit = true;
    package32 = unstable.pkgsi686Linux.mesa.drivers;
  };
}
