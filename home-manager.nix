{ config, pkgs, ... }:

let
  unstable = import <unstable> {};
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "209566c752c4428c7692c134731971193f06b37c";
    ref = "release-201.09";
  };
in
{
  imports = [ "${home-manager}/nixos" ];

  services.dbus.packages = with pkgs; [ gnome3.dconf ];
  environment.variables.EDITOR = "nvim";
  

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
      gtk-icon-theme-name=Qogir
      gtk-theme-name=Qogir
    '';
    mode = "444";
  };

 
  home-manager.users."shpinog" = {

    xsession.enable = true;
    xsession.windowManager.command = "exec awesome";
    home.sessionVariables.TERM = "xterm";
    xdg.enable = true;
    services.udiskie.enable = true;
    
     programs = {

      fish = {

        enable =true;

      };

     };

    


    home.packages = with pkgs; [
      htop
      ###Network analize
      nmap
      tcpdump
      ngrep
      sshfs
      ipscan
      ###
      arc-theme
      smplayer
      spotify
      discord
      breeze-qt5
      ranger
      nnn
      kitty
      mpv
      qbittorrent
      pcmanfm
      viewnior
      networkmanagerapplet
      okular
      # Icons (Main)
      xdg-user-dirs
      xdg_utils
      perl530Packages.FileMimeInfo
      feh
      ###
      lxappearance
      ffmpeg-full
      peek
 	    simplescreenrecorder
      pavucontrol
      gnome3.adwaita-icon-theme
      hicolor_icon_theme
    ];






    gtk = {
      enable = true;
      iconTheme = {
        name = "Qogir";
        package = pkgs.qogir-theme;
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


    home.file = {
    ".config/kitty/kitty.conf".source =./configFiles/kitty.conf;
    ".config/ranger".source =./configFiles/ranger;


    }; 
  



    programs = {
      git = {
        enable = true;
        userName = "Shpinog";
        userEmail = "shpinog@gmail.com";
      };
    };

  };

}
