{ config, pkgs, system, ... }:



{









  environment.systemPackages = with pkgs; [
    linux-firmware
    sudo
    ethtool
    ###########-Wayland\Sway ###########
    wlroots
    wayland
    pciutils

    ########### Gnome utils ###########
    gnome.nautilus
    gnome.nautilus-python
    gnome.file-roller
    cmake

    ########### Other ###########
    #steam-run-native
    xclip
    glib
    wireguard-tools
    pkg-config
    wpgtk
    killall
    clinfo
    schedtool
    gnupg
    rnnoise-plugin
    
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
      enable = false;
      pinentryFlavor = "curses";
      enableSSHSupport = true;
    };
  };



}

