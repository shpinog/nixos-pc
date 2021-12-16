{ config, pkgs, ... }:

let
  unstable = import <unstable> { };
  home-manager = builtins.fetchGit {
    url = "https://github.com/rycee/home-manager.git";
    rev = "6ce1d64073f48b9bc9425218803b1b607454c1e7";
    ref = "release-21.11";
  };
in
{

  imports = [
    (import "${home-manager}/nixos")
  ];



  home-manager.users."shpinog" = {

    imports = [
      ./programs.nix
      ./packages.nix
      ./settings.nix
      ./config-files.nix
      ./aliases.nix
    ];

  };

}
