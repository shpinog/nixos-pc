{ config, pkgs, ... }: {
  services.xserver.xkbOptions = "grp:caps_toggle, grp_led:caps";
  services.xserver.xkbVariant = "winkeys";
  services.xserver.layout = "us,ru(winkeys)";
  services.xserver.displayManager.defaultSession = "awesome";

  services.xserver.displayManager.startx = {
    enable = true;
  };
  #  services.xserver.displayManager.autoLogin.enable = true;
  #  services.xserver.displayManager.autoLogin.user = "shpinog";

#  hardware.nvidia.modesetting.enable = true;
#  hardware.nvidia.powerManagement.enable = true;
programs.dconf.enable = true;
services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];

  
  services.xserver = {
    enable = true;
    autorun = false;
    videoDrivers = [ "amdgpu" ];


    # deviceSection = ''
    #   Option "TearFree" "false"
    # '';




    libinput.enable = true;
    config = ''
      Section "InputClass"
        Identifier "mouse accel"
        Driver "libinput"
        MatchIsPointer "on"
        Option "AccelProfile" "flat"
        Option "AccelSpeed" "0"
      EndSection
    '';




    # Enable the Awesome Desktop Environment.

    windowManager = {
      awesome = {
        enable = true;
      };
    };



  };
}
