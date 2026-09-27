# Afterglow project rules

- Workstation integration is entirely declarative through NixOS and Home Manager:
  palette, wallpaper, icon generation, application appearance and motion. No
  manually installed files, runtime mutation scripts or activation-time copying.
- Preserve official application marks and aspect ratios. Normalize visible alpha
  bounds on a common canvas; use one shared dock surface without individual tiles.
- Use golden proportions only where they improve composition and usability.
- Open new image previews in the owner's graphical viewer and obtain approval
  before integrating them. The selected wallpaper and normalized mockup are approved.
- Do not bundle or relicense third-party application logos or Dracula PRO assets.
- Follow the workspace publication protocol before creating the public repository.
- Blur must follow the live scene behind each surface, including moving content;
  do not substitute a static or background-only wallpaper blur. Caching unchanged
  pixels is acceptable only when scene changes invalidate the affected result.
