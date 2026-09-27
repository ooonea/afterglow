#!/usr/bin/env python3
"""Build an Afterglow icon theme from a directory of application icons."""

from pathlib import Path
import re
import subprocess
import sys


source, destination = map(Path, sys.argv[1:])
icons = destination / "108x108/apps"
icons.mkdir(parents=True, exist_ok=True)
for path in sorted(source.iterdir()):
    if path.suffix.lower() not in {".png", ".svg", ".webp"}:
        continue
    # A black border makes fully opaque alpha masks measurable too.
    bounds = subprocess.check_output(
        ["magick", "-background", "none", str(path), "-alpha", "extract",
         "-threshold", "10%", "-bordercolor", "black", "-border", "1",
         "-format", "%@", "info:"], text=True,
    )
    match = re.fullmatch(r"(\d+)x(\d+)\+(\d+)\+(\d+)", bounds)
    if match is None:
        raise ValueError(f"Cannot measure {path.name}: {bounds}")
    width, height, x, y = map(int, match.groups())
    if not width or not height:
        raise ValueError(f"Empty icon: {path.name}")
    subprocess.run(
        ["magick", "-background", "none", str(path), "-crop",
         f"{width}x{height}+{x - 1}+{y - 1}", "+repage", "-filter", "Lanczos",
         "-resize", "88x88", "-gravity", "center", "-background", "none",
         "-extent", "108x108", "-define", "png:exclude-chunks=date,time",
         str(icons / f"{path.stem}.png")], check=True,
    )

(destination / "index.theme").write_text(
    "[Icon Theme]\nName=Afterglow\nComment=Normalized application icons\n"
    "Inherits=hicolor,Adwaita\nDirectories=108x108/apps\n\n"
    "[108x108/apps]\nSize=108\nType=Scalable\nMinSize=16\nMaxSize=108\nContext=Applications\n"
)
