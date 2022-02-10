{ pkgs, config, ... }: {
  networking.firewall.checkReversePath = false; # maybe "loose" also works, untested
  networking.usePredictableInterfaceNames = true;


  networking.firewall.allowedTCPPortRanges = [{ from = 1714; to = 1764; }];
  networking.firewall.allowedUDPPortRanges = [{ from = 1714; to = 1764; }];


  networking.useDHCP = false;
  networking.enableIPv6 = true;
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "systemd-resolved";
  programs.nm-applet.enable = true;
  services.openssh.enable = true;
  networking.firewall.logRefusedConnections = false;
  networking.firewall.allowedTCPPorts = [ 8868 4668 4679 22 ];
  networking.firewall.allowedUDPPorts = [ 8868 4679 4671 69 ];

  services.resolved = {
    enable = true;
    extraConfig = '' 
       [Resolve]
   DNS=1.1.1.1 9.9.9.9
   DNSOverTLS=yes
   DNSSEC=yes
   FallbackDNS=8.8.8.8 1.0.0.1 8.8.4.4
    
    '';
  };

  # systemd.services.wakeonlan = {
  #   description = "Reenable wake on lan every boot";
  #   after = [ "network.target" ];
  #   serviceConfig = {
  #     Type = "simple";
  #     RemainAfterExit = "true";
  #     ExecStart = "${pkgs.ethtool}/sbin/ethtool -s enp7s0 wol g";
  #   };
  #   wantedBy = [ "default.target" ];
  # };



}
