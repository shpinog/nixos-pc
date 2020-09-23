{ config, pkgs, ... }:

let
  unstable = import <unstable> {};
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "96d7de6db18d9a5bf254ddf3525bb4ef1d2a6bda";
  };
in
{
  imports = [ "${home-manager}/nixos" ];

  services.dbus.packages = with pkgs; [ gnome3.dconf ];

  # QT4/5 global theme
  environment.etc."xdg/Trolltech.conf" = {
    text = ''
      [Qt]
      style=Breeze
    '';
    mode = "444";
  };

  # GTK3 global theme (widget and icon theme)
  environment.etc."xdg/gtk-3.0/settings.ini" = {
    text = ''
      [Settings]
      gtk-icon-theme-name=breeze
      gtk-theme-name=Breeze-gtk
    '';
    mode = "444";
  };


  home-manager.users."shpinog" = {

    xsession.enable = true;
    xsession.windowManager.command = "exec awesome";

    home.packages = with pkgs; [
      htop
      smplayer
      spotify
      steam
      breeze-qt5
      # Icons (Main)
      gnome3.adwaita-icon-theme
      hicolor_icon_theme
    ];
    gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      font = {
        name = "IBM Plex 12";
      };
      gtk3.extraConfig.gtk-cursor-theme-name = "breeze";
    };


    home.keyboard = {
      layout = "us,ru(winkeys)";
      options = [ "grp:caps_toggle" "grp_led:caps" ];
    };
    home.file.".icons/default".source =
      "${pkgs.breeze-qt5}/share/icons/breeze_cursors";

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
