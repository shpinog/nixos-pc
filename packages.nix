{ config, pkgs, system, ... }:



{





  programs.steam.enable = true;




  environment.systemPackages = with pkgs; [
    sudo
    ethtool
    ###########-Wayland\Sway ###########
    wlroots
    wayland

    ########### Gnome utils ###########
    gnome.nautilus
    gnome.nautilus-python
    gnome.file-roller
    cmake

    ########### Other ###########
    tdesktop
    #steam-run-native
    xclip
    glib
    wireguard
    wireguard-tools
    pkg-config
    wpgtk
    killall
    clinfo
    schedtool
    gnupg
    
    lm_sensors
    breeze-icons
    glibc
    smartmontools
    vscodium
    wget
    unzip
    unar
    git
    sysctl
    python3Full
    htop
    btop
    gnumake
    gcc
    global
    ctags
    binutils
    coreutils
    utillinux
    wpa_supplicant
    iw

  ];

  programs = {
    gnupg.agent = {
      enable = true;
      pinentryFlavor = "curses";
      enableSSHSupport = true;
    };
  };



}

