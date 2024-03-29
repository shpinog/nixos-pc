# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{

  imports = [
    # Include the results of the hardware scan.
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ./hardware-configuration.nix
    ./fonts.nix
    ./packages.nix
    ./xserver.nix
    ./hardware.nix
    ./polkit.nix
    ./kernel.nix
    ./network.nix
    ./sway.nix
    ./virtualisation.nix
    ./steam.nix
    ./opengl.nix

  ];


  #VirtualBox

  services.gvfs.enable = true;
  virtualisation.virtualbox.host.enable = false;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  






  #Enable nonfree and unstable
  nixpkgs.config = {
    allowUnfree = true;

  
  };


  nix.settings.auto-optimise-store = true;
  networking.hostId = "d1be0afd";

  environment.systemPackages = with pkgs; [ lxqt.lxqt-policykit ]; # provides a default authentification client for policykit


 

  #networking.interfaces.enp7s0.useDHCP = true;


  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";



  #Enable flatpak
  services.flatpak.enable = false;
  xdg.portal.enable = true;

  #User and shell settings

  programs.bash.enableLsColors = true;
  programs.bash.vteIntegration = true;
  programs.bash.enableCompletion = true;

  #Android
  programs.adb.enable = true;

  users.users.shpinog = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "adbusers" "storage" "media" "docker" "lp" "corectrl" "video" ]; # Enable ‘sudo’ for the user.A
    shell = pkgs.bash;
  };

  nix.settings.trusted-users = 
  [
    "root"
    "shpinog"

  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

