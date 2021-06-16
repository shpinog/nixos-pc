{ config, pkgs, system, ... }:


let

unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in

{

    programs.steam.enable = true;

    environment.systemPackages = with pkgs; [
    sudo
    glib
    pkg-config
    wpgtk
    kitty
    killall
    unstable.lsd
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
    unstable.spotify
    lm_sensors
    breeze-icons
    ntfs3g
    glibc
    smartmontools
    vscode
    unstable.corectrl
    flatpak
    ncurses5
    ncurses
    wget
    unzip
    unar
    git
    sysctl
    vim
    python3Full
    pythonPackages.pip
    pythonPackages.setuptools
    vlc
    unstable.kotatogram-desktop
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
    python
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

