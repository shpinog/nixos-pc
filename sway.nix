{ config, pkgs, lib, ... }: {

  programs.sway = {
    enable = true;
    wrapperFeatures = {
      gtk = true;
      base = true;
    };
  };
  
 services.greetd = {
  enable = true;
  settings = {
    default_session = {
      command = "${pkgs.sway}/bin/sway --unsupported-gpu";
      user = "shpinog";
    };
    inital_session = {
      user = "shpinog";
    };
  };
};




}
