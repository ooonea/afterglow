# Declare assets and terminal appearance; merge noctalia-settings.nix into your shell settings.
{ ... }:
let
  palette = (builtins.fromJSON (builtins.readFile ../palettes/Afterglow.json)).dark;
in
{
  xdg.configFile."noctalia/palettes/Afterglow.json".source = ../palettes/Afterglow.json;
  xdg.dataFile."wallpapers/afterglow.png".source = ../wallpapers/cherry-pilot-1920x1080.png;

  programs.kitty.settings = {
    background = palette.mSurface;
    foreground = palette.mOnSurface;
    cursor = palette.mPrimary;
    background_opacity = "0.94";
  };
}
