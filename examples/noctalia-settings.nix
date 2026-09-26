# Appearance fragment for Noctalia 5.1; merge into your existing settings.
{ wallpaper }:
{
  theme = {
    source = "custom";
    custom_palette = "Afterglow";
    mode = "dark";
  };
  wallpaper.default.path = wallpaper;
  lockscreen.wallpaper = wallpaper;
  shell.animation = {
    enabled = true;
    speed = 1.0;
  };
  dock = {
    icon_size = 54;
    active_scale = 1.0;
    inactive_scale = 1.0;
    magnification_scale = 1.12;
    background_opacity = 0.90;
  };
}
