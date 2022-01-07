{ config, pkgs, ... }: {


  fonts = {

    fontDir.enable = true;
    enableGhostscriptFonts = true;
    enableDefaultFonts = true;
    fonts = with pkgs; [
      ubuntu_font_family
      noto-fonts-emoji
      noto-fonts
      dejavu_fonts
      font-awesome
      font-awesome-ttf
      vistafonts
      liberation_ttf
      iosevka

    ];

    fontconfig = {
      enable = true;
      antialias = true;
      subpixel.lcdfilter = "default";
      subpixel.rgba = "rgb"; 
      
      hinting = {
        enable = true;
        autohint = true;

      };
      
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [  "Noto Sans" ];
        monospace = [ "Noto Sans Mono" "Iosevka" ];
        emoji = [ "Font Awesome 5 Brands" "Noto Color Emoji" "Font Awesome 5 Free" "Font Awesome 5 Free Solid" ];

      };
    };
  };

}
