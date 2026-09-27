# Declare assets and terminal appearance; merge noctalia-settings.nix into your shell settings.
{ pkgs, ... }:
let
  palette = (builtins.fromJSON (builtins.readFile ../palettes/Afterglow.json)).dark;
in
{
  xdg.configFile."noctalia/palettes/Afterglow.json".source = ../palettes/Afterglow.json;
  xdg.dataFile."wallpapers/afterglow.png".source = ../wallpapers/cherry-pilot-1920x1080.png;

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts = {
    sansSerif = [ "Source Sans 3" ];
    monospace = [ "Lilex Nerd Font" ];
  };
  gtk = {
    enable = true;
    font = {
      package = pkgs.source-sans;
      name = "Source Sans 3";
      size = 11;
    };
  };
  dconf.settings."org/gnome/desktop/interface".text-scaling-factor = 1.25;
  programs.kitty.font = {
    package = pkgs.nerd-fonts.lilex;
    name = ''family="Lilex Nerd Font" style="Medium"'';
    size = 17;
  };
  programs.kitty.settings = {
    background = palette.mSurface;
    foreground = palette.mOnSurface;
    cursor = palette.mPrimary;
    background_opacity = "0.94";
  };
}
