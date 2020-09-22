{ config, pkgs, ... }: {
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      inconsolata
      dejavu_fonts
      ubuntu_font_family
      ipafont
      source-code-pro
      ttf_bitstream_vera
      carlito
    ];
    fontconfig.enable = true;
    fontconfig.defaultFonts = {
      monospace = [ "Source Code Pro" "DejaVu Sans Mono" "IPAGothic" ];
      sansSerif = [ "DejaVu Sans" "IPAPGothic" ];
      serif = [ "DejaVu Serif" "IPAPMincho" ];
    };
  };
}
