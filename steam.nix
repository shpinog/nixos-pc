
{ config, pkgs, system, ... }:

{
 nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
       libgdiplus
       SDL2
       icu63
       cairo
       libtensorflow
        
      ];
    };
  };

  programs.steam.enable = true;

}
