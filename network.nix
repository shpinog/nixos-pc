{ pkgs, config, ... }: {
  networking.firewall.checkReversePath = false; # maybe "loose" also works, untested
  

  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];


 }
