{ config, pkgs, lib, ... }: {

  programs.sway = {
    enable = true;
  };
  
 services.greetd = {
  enable = true;
  settings = {
    default_session = {
      command = "${pkgs.sway}/bin/sway";
      user = "shpinog";
    };
    inital_session = {
      user = "shpinog";
    };
  };
};




}
