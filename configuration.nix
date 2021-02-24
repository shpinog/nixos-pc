# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  imports = [ # Include the results of the hardware scan.
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ./hardware-configuration.nix
    ./home-manager.nix
    ./configuration-packages.nix
    ./configuration-xserver.nix
    ./hardware.nix
    ./polkit.nix
    ./kernel.nix
  ];

#Enable nonfree and unstable
  nixpkgs.config = {
  allowUnfree = true;
  packageOverrides = pkgs: {

    unstable = import <nixos-unstable> {
      config = config.nixpkgs.config;
    };
  };
  };

  
  nix.autoOptimiseStore = true;
  networking.hostId = "d1be0afd";
  virtualisation.docker.enable = false;
  services.gvfs.enable = true;
  services.geoclue2.enable = false;
  

  # Networking
 
  networking.useDHCP = false;
  networking.enableIPv6 = true;
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 8868 4668 4679 22 ];
  networking.firewall.allowedUDPPorts = [8868 4679];
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
  services.flatpak.enable = true;
  xdg.portal.enable = true;  

  #User and shell settings
  programs.fish.enable = true;
  users.users.shpinog = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" "media" "docker" "lp" ]; # Enable ‘sudo’ for the user.A
    shell = pkgs.fish;
  };

  



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

