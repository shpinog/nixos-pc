# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{

  imports = [ # Include the results of the hardware scan.
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ./hardware-configuration.nix
    ./home-manager/home-manager.nix
    ./configuration-fonts.nix
    ./configuration-packages.nix
    ./configuration-xserver.nix
    ./hardware.nix
    ./polkit.nix
    ./kernel.nix
    ./network.nix
    ./greetd.nix

  ];

#Enable nonfree and unstable
  nixpkgs.config = {
  allowUnfree = true;
  joypixels.acceptLicense = true;
  
  packageOverrides = pkgs: {

    unstable = import <nixos-unstable> {
      config = config.nixpkgs.config;
    };
  };
  };

  
  nix.autoOptimiseStore = true;
  networking.hostId = "d1be0afd";
  virtualisation.docker.enable = false;
  services.gvfs = {
    enable = true;
    package = lib.mkForce pkgs.gnome3.gvfs;
  };  
  environment.systemPackages = with pkgs; [ lxqt.lxqt-policykit ]; # provides a default authentification client for policykit
  

  # Networking
 
  networking.useDHCP = false;
  networking.enableIPv6 = true;
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
  services.openssh.enable = true;
  networking.firewall.logRefusedConnections = false;
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

  programs.bash.enableLsColors = true;
  programs.bash.vteIntegration = true;
  programs.bash.enableCompletion = true;
   services.teamviewer.enable = true;



 users.users.shpinog = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" "media" "docker" "lp" ]; # Enable ‘sudo’ for the user.A
    shell = pkgs.bash;
  };

    nixpkgs.overlays = [
      (self: super:
        with super; {
          awesome =
            super.awesome.override { luaPackages = super.luajitPackages; };
        })
    ];


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

