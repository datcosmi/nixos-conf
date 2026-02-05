{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Browser types
      "tag +chromium-based-browser, match:class ((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)"
      "tag +firefox-based-browser, match:class ([fF]irefox|zen|librewolf)"

      # Force chromium-based browsers into a tile to deal with --app bug
      "tile on, match:tag chromium-based-browser"

      # Only a subtle opacity change, but not for video sites
      "opacity 1 0.97, match:tag chromium-based-browser"
      "opacity 1 0.97, match:tag firefox-based-browser"

      # Some video sites should never have opacity applied to them
      "opacity 1.0 1.0, match:title ((?i)(?:[a-z0-9-]+\.)*youtube\.com_/|app\.zoom\.us_/wc/home)"

      # Float and center Zen Browser history tab
      "float on, match:class zen, match:title Library"
      "center on, match:class zen, match:title Library"
    ];
  };
}
