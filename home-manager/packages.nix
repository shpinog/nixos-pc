{ config, pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
      htop
      nmap
      tcpdump
      ngrep
      firefox
      sshfs
      ipscan
      arc-theme
      smplayer
      discord
      breeze-qt5
      kitty
      mpv
      qbittorrent
      pcmanfm
      viewnior
      networkmanagerapplet
      okular
      xdg-user-dirs
      xdg_utils
      perl530Packages.FileMimeInfo
      lxappearance
      ffmpeg-full
      peek
      simplescreenrecorder
      pavucontrol
      gnome3.adwaita-icon-theme
      hicolor_icon_theme
  ];
}
