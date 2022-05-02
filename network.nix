{ pkgs, config, lib, ... }: {
  networking.firewall.checkReversePath = false; # maybe "loose" also works, untested
  networking.usePredictableInterfaceNames = true;


  networking.firewall.allowedTCPPortRanges = [{ from = 1714; to = 1764; }];
  networking.firewall.allowedUDPPortRanges = [{ from = 1714; to = 1764; }];


  networking.useDHCP = false;
  networking.enableIPv6 = false;
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";
  programs.nm-applet.enable = true;
  services.openssh.enable = true;
  networking.firewall.logRefusedConnections = false;
  networking.firewall.allowedTCPPorts = [ 8868 4662 4679 22 ];
  networking.firewall.allowedUDPPorts = [ 8868 4679 4672 69 ];

networking = {
    nameservers = [ "127.0.0.1" "::1" ];
    resolvconf.useLocalResolver = true;
  };


  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv6_servers = true;
      require_dnssec = true;

      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };
         server_names = [
        "yandex"
        "google"
      ];

    };
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
