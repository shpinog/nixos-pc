{ config, pkgs, system, ... }:

{
  environment.systemPackages =
  with pkgs; [
#    (import ./hello2)
    (callPackage ./hello2 {})
    sudo
    wget
    connman
    connman-gtk
    wpa_supplicant_gui
#    networkmanager
#    iwd

    mkpasswd
    unzip unar
    emacs git
    escrotum feh
    vscode-with-extensions
    vlc
    docker docker-compose
    google-chrome tor-browser-bundle-bin
    termite dmenu
    ocaml opam gnumake gcc gnum4 binutils-unwrapped dune pkg-config ocamlformat
    ghc cabal-install stack cabal2nix nix-prefetch-git

    xmonad-with-packages
    pkgs.haskellPackages.xmonad
    pkgs.haskellPackages.xmonad-extras
    pkgs.haskellPackages.xmonad-contrib
    xmobar

    nodejs yarn nodePackages.node2nix
    python
    ninja
    utillinux
    brave
    xorg.xmessage

#    bluez blueman
  ];
}
