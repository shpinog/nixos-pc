{ config, pkgs, ... }: {
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      ubuntu_font_family
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
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
      serif = [ "Ubuntu" "Noto" ];
      sansSerif = [ "Ubuntu" "Noto" ];
      monospace = [ "Fira" ]
    };
  };
}
