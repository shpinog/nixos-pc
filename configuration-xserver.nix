{ config, pkgs, ... }:
{
  hardware.opengl.enable = true;
  services.xserver = {
    enable = true;
    autorun = true;
    videoDrivers = [ "nVidia" "laptop" ];
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
    displayManager.defaultSession = "xfce+xmonad";
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmonad
      ];
    };
    displayManager.sessionCommands = ''
      ${pkgs.xlibs.xset}/bin/xset r rate 280 30
    '';
    libinput.enable = false;
    synaptics = {
      enable = true;
      tapButtons = false;
      dev = "/dev/input/event*";
      twoFingerScroll = true;
      accelFactor = "0.0001";
      minSpeed = "1.0";
      maxSpeed = "2.0";
      scrollDelta = -500;
      buttonsMap = [ 1 3 2 ];
    };
  };
}
