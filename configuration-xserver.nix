{ config, pkgs, ... }: {
  hardware.opengl.enable = true;
  services.xserver = {
    enable = true;
    autorun = true;
    videoDrivers = [ "amdgpu" ];
    displayManager.sddm.enable = true;
    services.xserver.displayManager.defaultSession = "none+awesome";

    windowManager = {
      awesome = {
        enable = true;
        luaModules = [ pkgs.luaPackages.luafilesystem pkgs.luaPackages.cjson ];
      };
    };

  };
}
