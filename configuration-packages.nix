{ config, pkgs, system, ... }:


let

unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in

{
  environment.systemPackages = with pkgs; [
    sudo
    schedtool
    lm_sensors
    breeze-icons
    ntfs3g
    geoclue2
    smartmontools
    unstable.vscode
    unstable.corectrl
    ncurses5
    ncurses
    wget
    unzip
    unar
    git
    unstable.vscode
    sysctl
    vim
    python3Full
    pythonPackages.pip
    pythonPackages.setuptools
    vlc
    tor-browser-bundle-bin
    unstable.tdesktop
    unstable.steam
    steamPackages.steam-runtime
    firefox
    volctl
    flameshot
    mesa
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
}

