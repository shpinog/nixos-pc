{ config, pkgs, ... }:

let
  unstable = import <unstable> {};
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "7d68c46feb845c572ef335f824062f90fdebf655";
  };
in
{
  imports = [ "${home-manager}/nixos" ];

#   services.xserver.layout = "us,ru(mac)";
#   services.xserver.xkbOptions = "lv3:rwin_switch,apple:badmap";
#   services.xserver.xkbVariant = "mac";

  services.xserver.xkbOptions = "grp:caps_toggle, grp_led:caps";
  services.xserver.xkbVariant = "winkeys";
  services.xserver.layout = "us,ru(winkeys)";

  home-manager.users."mb" = {

    xsession.enable = true;
    xsession.windowManager.command = "exec xmonad";

    home.keyboard = {
      layout = "us,ru(winkeys)";
      options = [ "grp:caps_toggle" "grp_led:caps"];
    };

    home.file = {
      ".Xdefaults".source = ./home/.Xdefaults;
      ".xmobarrc".source = ./home/.xmobarrc;
      ".xmonad/xmonad.hs".source = ./home/.xmonad/xmonad.hs;
      "wpa_supplicant.conf".source = ./home/wpa_supplicant.conf;
      "wallpaper.png".source = ./home/wallpaper.png;
    };

    programs = {
      git = {
        enable = true;
        userName  = "Michael Baynov";
        userEmail = "m.baynov@gmail.com";
      };
    };

  };

}
