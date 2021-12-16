{ config, pkgs, ... }: {


  fonts = {

    fontDir.enable = true;
    enableGhostscriptFonts = true;
    enableDefaultFonts = true;
    fonts = with pkgs; [
      ubuntu_font_family
      noto-fonts-emoji
      dejavu_fonts
      font-awesome
      font-awesome-ttf
    ];

    fontconfig = {
	enable = true;

    defaultFonts = {
      serif = [ "Ubuntu" "Noto" ];
      sansSerif = [ "Ubuntu" "Noto" ];
      monospace = [ "Sans" ];
      emoji = [ "Font Awesome 5 Brands" "Noto Color Emoji" "Font Awesome 5 Free" "Font Awesome 5 Free Solid" ];

    };
   };
  };

}
