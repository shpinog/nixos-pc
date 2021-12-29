{ config, pkgs, system, ... }:



{





  programs.steam.enable = false;




  environment.systemPackages = with pkgs; [
    sudo
    linuxPackages.x86_energy_perf_policy
    ethtool
    compsize #btrfs compression info

    ###########-Wayland\Sway ###########
    firefox-wayland
    qtile
    wlroots
    kakoune
    bitwarden
    clipman
    flashfocus
    autotiling
    swaykbdd
    jq
    python39Packages.cairocffi
    python39Packages.dbus-next
    foot
    wayland
    clipman
    emacs-nox
    mako
    swaybg
    wofi
    ###########Pipeware##############
    easyeffects

    ########### Gnome utils ###########
    gnome.nautilus
    gnome.nautilus-python
    gnome.file-roller

    ########### Other ###########
    tdesktop
    #steam-run-native
    xclip
    glib
    wireguard
    wireguard-tools
    pkg-config
    wpgtk
    kitty
    killall
    clinfo
    schedtool
    sublime3
    xorg.libXft
    symbola
    font-manager
    noto-fonts
    noto-fonts-extra
    pass
    gnupg
    spotify
    lm_sensors
    breeze-icons
    papirus-icon-theme
    ntfs3g
    glibc
    smartmontools
    vscodium
    flatpak
    ncurses5
    ncurses
    wget
    unzip
    unar
    git
    sysctl
    neovim
    python3Full
    python3Packages.pip
    python3Packages.setuptools
    vlc
    volctl
    flameshot
    htop
    dmenu
    alacritty
    gnumake
    gcc
    global
    ctags
    fpc
    binutils
    coreutils
    utillinux
    wpa_supplicant
    python37Packages.termcolor
    iw
    networkmanager-openvpn

    #    bluez blueman
  ];

  programs = {
    gnupg.agent = {
      enable = true;
      pinentryFlavor = "curses";
      enableSSHSupport = true;
    };
  };



}

