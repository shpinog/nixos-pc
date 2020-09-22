{ config, pkgs, ... }:

let
  unstable = import <unstable> { };
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "96d7de6db18d9a5bf254ddf3525bb4ef1d2a6bda";
  };
in {
  imports = [ "${home-manager}/nixos" ];


  home-manager.users."shpinog" = {

    xsession.enable = true;
    xsession.windowManager.command = "exec awesome";

    home.packages = [ pkgs.htop pkgs.smplayer ];

    home.keyboard = {
      layout = "us,ru(winkeys)";
      options = [ "grp:caps_toggle" "grp_led:caps" ];
    };

    #home.file = {
    #".Xdefaults".source = ./home/.Xdefaults;
    #};

    programs = {
      git = {
        enable = true;
        userName = "Shpinog";
        userEmail = "shpinog@gmail.com";
      };
    };

  };
  
}
