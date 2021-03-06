{ config, pkgs, ... }: {
  services.xserver.xkbOptions = "grp:caps_toggle, grp_led:caps";
  services.xserver.xkbVariant = "winkeys";
  services.xserver.layout = "us,ru(winkeys)";
  services.xserver.displayManager.defaultSession = "none+awesome";
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "shpinog";
  services.dbus.packages = with pkgs; [ gnome3.dconf ];


  services.picom = {

    enable = false;
    backend = "glx";
    vSync = true;

  };
  


  services.xserver = {
    enable = true;
    autorun = true;
    videoDrivers = [ "amdgpu" ];
    deviceSection = ''
      Option "TearFree" "false"
    '';
    

    
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
       luaModules = [ pkgs.luaPackages.luafilesystem pkgs.luaPackages.cjson ];
      };
    };



  };
}
