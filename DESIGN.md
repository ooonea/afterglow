# Design and implementation boundaries

Target: 1920×1080, display scale 1, text/UI scale 1.25, approximately 60 Hz.
Blue graphite surfaces support coral focus and peach highlights. Terminal
background opacity is 0.94; dock and bar opacity 0.90. The wallpaper keeps its
subject on the right to leave quieter space behind working windows.

The approved composition uses 38.2% / 61.8% divisions. Umbriel window extent
presets are 0.382, 0.5 and 0.618. Spacing, controls and typography use native
integer dimensions instead of forcing irrational proportions everywhere.

The selected typography pairs Source Sans 3's humanist forms with Lilex Medium
at 17 pt in the terminal. GTK uses Source Sans 3 at 11 pt before text scaling;
Noctalia keeps its native size hierarchy at UI scale 1.25. Bar labels use medium
weight. Terminal bold remains available for emphasis. Source Sans 3 has a lower
x-height than Inter at the same nominal size; the selected comparison preserves
native geometry rather than enlarging every control to equalize that metric.
The type study is approved; deployment still needs a live readability check.

Official app icons fit an 88-pixel visible envelope on a 108-pixel canvas.
At the dock's 54-pixel size this becomes 44 pixels. Active and inactive icons
share scale 1.0; hover peaks at 1.12. Original icon pixels and shapes are preserved;
the renderer applies saturation 0.82 and a palette-colored alpha-shaped shadow.
The shadow uses one-third opacity, Gaussian sigma 2 logical pixels and a 2-pixel
downward offset.
No individual tiles or custom replacement symbols are used.

Umbriel motion uses cubic ease-out: opening 167 ms at scale 0.97, closing
133 ms with fade, moving 200 ms, workspace and overview transitions 233 ms,
border transition 133 ms. These approximate 10, 8, 12 and 14 frames at 60 Hz;
they are design choices, not measured frame pacing. Noctalia retains its native
animation system at speed 1.0. Compositor and shell motion can be disabled using
their native animation.enabled settings.

The HTML mockup is an artistic reference. Native panel geometry, blur and
elevation differ from browser rendering. Icon effects are native renderer
operations, not baked into the icon package. Blur samples the current composed
scene behind each surface, including moving windows and video. Unchanged pixels
may be cached; changes underneath must invalidate the affected blur. Post-activation
review must cover launcher, clipboard, control
center, notifications, lock screen, quick repeated input and motion interruption.
No runtime visual or frame-pacing success is claimed before that review.
