# Requires the Noctalia rendering contributions listed in README.md.
{ wallpaper }:
{
  theme = {
    source = "custom";
    custom_palette = "Afterglow";
    mode = "dark";
  };
  wallpaper.default.path = wallpaper;
  lockscreen.wallpaper = wallpaper;
  accessibility.ui_scale = 1.25;
  shell.font_family = "Source Sans 3";
  shell.animation = {
    enabled = true;
    speed = 1.0;
  };
  dock = {
    enabled = true;
    icon_size = 54;
    icon_saturation = 0.82;
    icon_shadow = true;
    main_axis_padding = 16;
    cross_axis_padding = 8;
    item_spacing = 6;
    border_width = 1.0;
    radius = 16;
    margin_edge = 12;
    shadow = true;
    magnification = true;
    active_scale = 1.0;
    inactive_scale = 1.0;
    magnification_scale = 1.12;
    background_opacity = 0.80;
  };
}
