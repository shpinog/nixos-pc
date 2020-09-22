{ config, pkgs, system, ... }:

{
  environment.systemPackages =
  with pkgs; [
    sudo
    wget
    unzip unar
    git
    vscode-with-extensions vim
    vlc
    tor-browser-bundle-bin tdesktop firefox
    volctl flameshot steam-run mesa htop
    dmenu alacritty
    gnumake gcc
    python
    utillinux

#    bluez blueman
  ];
}
