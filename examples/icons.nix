# Call with an explicit, version-controlled directory of app icons.
# Filenames must match desktop-entry Icon keys. Inputs retain their own licenses.
{ pkgs, iconSources }:
pkgs.runCommand "afterglow-icons"
  {
    nativeBuildInputs = [
      pkgs.python3
      pkgs.imagemagick
    ];
  }
  ''
    python3 ${../tools/normalize_icons.py} ${iconSources} "$out/share/icons/Afterglow"
  ''
