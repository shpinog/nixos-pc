{ config, pkgs, ... }: {


  gtk = {
    enable = true;
    theme = {
      name = "Materia";
      package = pkgs.materia-theme;
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    font = {
      name = "IBM Plex 12";
    };
    gtk3.extraConfig.gtk-cursor-theme-name = "breeze";
  };


  programs = {


    firefox = {
        enableGnomeExtensions = true;
    };

      git = {
        enable = true;
        userName = "Shpinog";
        userEmail = "shpinog@gmail.com";
      };

      emacs = {
        enable = true;
        package = pkgs.emacs-nox;
                

      };

      rofi = {
        enable = true;
        font = "Hack 16";
      
      };

      starship = {
        enable = true;
      };

      bash = {
        enable = true;
      }; 

      mpv = {
        enable = true;
        config = 
        {
          profile = "gpu-hq";
          deband = "no";
          force-window = true;
          ytdl-format = "bestvideo+bestaudio";
          cache-default = 4000000;
          cache = "yes";
          cache-on-disk = "yes";
          cache-pause-initial = "yes";
          cache-pause-wait = "10";
          interpolation = "yes";
          video-sync = "display-resample";
          tscale = "oversample";
          hwdec = "auto-safe";
          vo = "gpu,vx";
          hwdec-codecs = "all";
        };
      };
    };
  }
