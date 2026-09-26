# Afterglow

A warm, restrained desktop theme for Noctalia 5.1 and Umbriel: blue graphite
surfaces, coral accents, peach light and consistently sized official application icons.

The theme is being validated on a 1920×1080, 60 Hz desktop at display scale 1
and UI/text scale 1.25. It is not yet a released or live-validated desktop.

## Contents

- `palettes/Afterglow.json`: native Noctalia palette and terminal colors.
- `wallpapers/cherry-pilot-1920x1080.png`: selected adult mecha-pilot illustration.
- `examples/`: declarative appearance fragments, including Umbriel motion, colors
  and proportions; not complete session configurations.
- `tools/`: palette contrast checks and build-time icon normalization.

Integration is declarative. Import `examples/home-manager.nix` for the palette,
wallpaper and terminal appearance. Merge `examples/noctalia-settings.nix` into
your existing Noctalia settings, passing the Home Manager wallpaper path as
`wallpaper`. Keep your existing TOML generation and native config validation;
these fragments do not install a session or replace keybindings and authentication.
Merge `builtins.fromJSON (builtins.readFile ./examples/umbriel-settings.json)`
into the existing Umbriel settings in the same way. See `DESIGN.md` for the
intended geometry, timing and outstanding runtime review.

For icons, keep reviewed official marks in a version-controlled source directory,
with filenames matching the applications' desktop-entry `Icon` keys. Call
`examples/icons.nix` with `pkgs` and that directory as `iconSources`, then assign
the resulting package to `gtk.iconTheme.package` and `Afterglow` to
`gtk.iconTheme.name`. Include `pkgs.adwaita-icon-theme` in the environment for
fallbacks. ImageMagick normalization happens during the Nix build; no runtime
script writes into the home directory. Logos remain separately licensed inputs.

The wallpaper was generated with OpenAI image_gen, then resampled from 1672×941
with ImageMagick Lanczos and a centered extent to exactly 1920×1080. It is not a
native Full HD generation. The generation prompt is included beside the image.

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
