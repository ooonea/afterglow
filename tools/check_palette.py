#!/usr/bin/env python3
"""Check foreground/background contrast, including worst-case white backdrop."""
import json
from pathlib import Path

palette = json.loads((Path(__file__).resolve().parents[1] / 'palettes/Afterglow.json').read_text())['dark']

def rgb(value):
    return tuple(int(value[i:i+2], 16) / 255 for i in (1, 3, 5))

def luminance(color):
    linear = [v / 12.92 if v <= .04045 else ((v + .055) / 1.055) ** 2.4 for v in color]
    return sum(a * b for a, b in zip(linear, (.2126, .7152, .0722)))

def contrast(a, b):
    hi, lo = sorted((luminance(a), luminance(b)), reverse=True)
    return (hi + .05) / (lo + .05)

for role in ('Primary', 'Secondary', 'Tertiary', 'Error', 'Surface', 'SurfaceVariant', 'Hover'):
    ratio = contrast(rgb(palette['mOn' + role]), rgb(palette['m' + role]))
    print(f'{role}: {ratio:.2f}:1')
    assert ratio >= 4.5, role
for opacity in (.8, .9, .94):
    bg = tuple(opacity * c + 1 - opacity for c in rgb(palette['mSurface']))
    ratio = contrast(rgb(palette['mOnSurface']), bg)
    print(f'Surface alpha {opacity}, white backdrop: {ratio:.2f}:1')
    assert ratio >= 4.5
for group in ('normal', 'bright'):
    for name, color in palette['terminal'][group].items():
        if group == 'normal' and name == 'black':
            continue
        ratio = contrast(rgb(color), rgb(palette['terminal']['background']))
        print(f'Terminal {group}/{name}: {ratio:.2f}:1')
        assert ratio >= 4.5, (group, name)
