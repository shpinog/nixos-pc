{ config, pkgs, ... }: {
  hardware.opengl.enable = true;
  services.xserver.xkbOptions = "grp:caps_toggle, grp_led:caps";
  services.xserver.xkbVariant = "winkeys";
  services.xserver.layout = "us,ru(winkeys)";
  services.xserver = {
    enable = true;
    autorun = true;
    videoDrivers = [ "amdgpu" ];
    displayManager.sddm.enable = true;
    displayManager.defaultSession = "none+awesome";

    windowManager = {
      awesome = {
        enable = true;
        luaModules = [ pkgs.luaPackages.luafilesystem pkgs.luaPackages.cjson ];
      };
    };

  };
}
