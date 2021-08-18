{ config, pkgs, ... }: {
  services.xserver.xkbOptions = "grp:caps_toggle, grp_led:caps";
  services.xserver.xkbVariant = "winkeys";
  services.xserver.layout = "us,ru(winkeys)";
 services.xserver.displayManager.defaultSession = "sway";

  services.xserver.displayManager.startx= {
    enable = true;
  };
#  services.xserver.displayManager.autoLogin.enable = true;
#  services.xserver.displayManager.autoLogin.user = "shpinog";


programs.sway = {
  
  enable = true;
  wrapperFeatures.gtk = true;

  extraPackages = with pkgs; [
  swaylock
  swayidle
  wl-clipboard
  mako # notification daemon
  waybar
  xdg-desktop-portal
  xdg-desktop-portal-wlr
  grim
  ];
};

  services.xserver = {
    enable = true;
    autorun = false;
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
