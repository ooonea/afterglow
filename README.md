# Afterglow

A warm, restrained desktop theme for Noctalia 5.1 and Umbriel: blue graphite
surfaces, coral accents, peach light and consistently sized application icons.
Official marks are preserved, with one approved custom icon for swayimg.

The theme is being validated on a 1920×1080, 60 Hz desktop at display scale 1
and UI/text scale 1.25. The native icon effects and live-scene blur are active and visually accepted on
the reference workstation; frame pacing has not been measured.

## Contents

- `palettes/Afterglow.json`: native Noctalia palette and terminal colors.
- `wallpapers/cherry-pilot-1920x1080.png`: selected adult mecha-pilot illustration.
- `icons/swayimg.svg`: original Afterglow icon for the image viewer, CC BY 4.0.
- `examples/`: declarative appearance fragments, including Umbriel motion, colors
  and proportions; not complete session configurations.
- `tools/`: palette contrast checks and build-time icon normalization.

Integration is declarative. Import `examples/home-manager.nix` for the palette,
wallpaper, typography and terminal appearance. Merge `examples/noctalia-settings.nix` into
your existing Noctalia settings, passing the Home Manager wallpaper path as
`wallpaper`. Keep your existing TOML generation and native config validation;
these fragments do not install a session or replace keybindings and authentication.
Merge `builtins.fromJSON (builtins.readFile ./examples/umbriel-settings.json)`
into the existing Umbriel settings in the same way. Append its `window_rule` and
`layer_rule` entries to your existing lists rather than replacing application rules.
Remove conflicting `blur_optimized = true` overrides: blur must sample the live
scene behind each surface, not a cached wallpaper layer. See `DESIGN.md` for the
intended geometry, timing and outstanding runtime review.

Typography uses Source Sans 3 for the interface and Lilex Medium at 17 pt for
Kitty. The example sets GTK text scale and Noctalia UI scale to 1.25. For a system
greeter, also install `pkgs.source-sans` through NixOS `fonts.packages` and set its
native font family; the greeter cannot use fonts installed only in a user profile.
Qt applications need a GTK platform theme to inherit the GTK font. Existing
per-bar or per-widget font overrides must use the same family to stay consistent.

For icons, keep reviewed official marks in a version-controlled source directory,
with filenames matching the applications' desktop-entry `Icon` keys. Include the
approved `icons/swayimg.svg` in that version-controlled source directory for the
custom swayimg appearance. Call
`examples/icons.nix` with `pkgs` and that directory as `iconSources`, then assign
the resulting package to `gtk.iconTheme.package` and `Afterglow` to
`gtk.iconTheme.name`. Include `pkgs.adwaita-icon-theme` in the environment for
fallbacks. ImageMagick normalization happens during the Nix build; no runtime
script writes into the home directory. Logos remain separately licensed inputs.
When using the NixOS Noctalia service, include the icon theme package in
`systemd.user.services.noctalia.restartTriggers` so an icon-only generation
refreshes the shell's cached icon paths.

The wallpaper was generated with OpenAI image_gen, then resampled from 1672×941
with ImageMagick Lanczos and a centered extent to exactly 1920×1080. It is not a
native Full HD generation. The generation prompt is included beside the image.

## Native rendering requirements

The updated Noctalia example requires these contributions in addition to 5.1.0:

- [#4599](https://github.com/noctalia-dev/noctalia/pull/4599): apply image opacity once (`f89358261`).
- [#4600](https://github.com/noctalia-dev/noctalia/pull/4600): icon saturation (`9f75f32cc`).
- [#4601](https://github.com/noctalia-dev/noctalia/pull/4601): tinted mask coverage (`7a8c9b435`).
- [#4603](https://github.com/noctalia-dev/noctalia/pull/4603): alpha-shaped icon shadows, including review and lint corrections (`a2bebdb66`).
- [#4607](https://github.com/noctalia-dev/noctalia/pull/4607): preserve icon-theme precedence (`04b6f8ff6`), so inherited SVGs or better-sized PNGs do not replace normalized Afterglow icons.

These are submitted contributions, not a promise that stock Noctalia 5.1.0
supports the new settings. Use a package containing them; #4603 already carries
#4601 as its prerequisite. They do not require this workstation's hardware.
Umbriel's live-scene blur is existing functionality and needs no source patch.
It costs more rendering work than background-only blur; frame pacing remains a
runtime validation item.

## Design

A shared surface hierarchy joins shell, compositor and terminal. Warm accents
mark active state; independent cool, green and yellow colors preserve semantic
meaning. Geometry uses integer spacing and optical alignment. Golden-section
window proportions are optional spatial presets, not a claim that every visual
or animation follows a mathematical constant.

Motion should reveal spatial relationships, respond immediately to input and
settle without decorative bounce. Times must be tested at the actual refresh
rate. A static illustration does not demonstrate animation quality or renderer
capabilities.

## License and provenance

Original code and configuration: MIT. Original visual assets: CC BY 4.0, to the
extent the contributors hold applicable rights. See `LICENSES/` and
`PROVENANCE.md`. No rights to third-party trademarks or characters are granted.
No affiliation with anime franchises or application vendors is implied.
