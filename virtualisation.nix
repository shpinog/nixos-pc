{ pkgs, config, ... }: {

virtualisation.libvirtd.enable = true;
programs.dconf.enable = true;
environment.systemPackages = with pkgs; [ virt-manager ];
users.users.shpinog.extraGroups = [ "libvirtd" "docker" ];
virtualisation.docker.enable = true;


}
