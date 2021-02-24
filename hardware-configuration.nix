# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  




  fileSystems."/" =
    { device = "/dev/disk/by-uuid/1e95d118-0bc3-43b2-926b-56dc87e22d61";
      fsType = "xfs";
      options = [ "defaults" "discard" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/ec3aa7e6-7f91-4e02-9130-b9be88894943";
      fsType = "xfs";
      options = [ "defaults" "discard" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/DCBE-11C4";
      fsType = "vfat";
    };

  fileSystems."/home/shpinog/mnt" =
    { device = "/dev/disk/by-uuid/86f3aeda-4fc5-451f-9c05-4eff1a937046";
      fsType = "ext4";
    };

  boot.initrd.luks.devices = {
      crypt = {
        device = "/dev/nvme0n1p1";
        allowDiscards = true;
        preLVM = true;
    };
    }; 

  swapDevices = [
      {
      device = "/swapfile";
      priority = 0;
      size = 2048;
    }
    
   ];

  services.udev.extraRules = ''
    ACTION=="add|change", KERNEL=="nvme*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="kyber"
    ACTION=="add|change", KERNEL=="sdb", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="kyber"
    ACTION=="add|change", KERNEL=="sdc", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="kyber"
  '';


  
  }
