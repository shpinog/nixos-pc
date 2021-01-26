{ config, pkgs, system, ... }:

let

unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

in

{
  environment.systemPackages = with pkgs; [
    sudo
    krusader
    breeze-icons
    ntfs3g
    smartmontools
    unstable.vscode
    openvpn
    wget
    unzip
    unar
    git
    unstable.vscode
    unstable.radeon-profile
    unstable.stockfish
    sysctl
    vim
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
    ghc
    binutils
    coreutils
    cabal-install
    python
    utillinux
    pixiewps
    wpa_supplicant
    aircrack-ng
    hashcat-utils
    phrasendrescher
    python37Packages.termcolor
    iw
    networkmanager-openvpn
    
    #    bluez blueman
  ];
}

