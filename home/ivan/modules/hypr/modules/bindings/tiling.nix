{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    bindd = [
      # Close windows
      "$mainMod, W, Close window, killactive,"
      # CTRL ALT, DELETE, Close all windows, exec, omarchy-hyprland-window-close-all

      # Control tiling
      "$mainMod, J, Toggle window split, layoutmsg, togglesplit, # dwindle"
      "$mainMod, P, Pseudo window, layoutmsg, pseudo, # dwindle"
      # $mainMod, T, Toggle window floating/tiling, togglefloating,
      "$mainMod, T, Togggle floating window, togglefloating, centerwindow"
      "$mainMod, C, Center window, centerwindow"
      "$mainMod, F, Full screen, fullscreen, 0"
      "$mainMod CTRL, F, Tiled full screen, fullscreenstate, 0 2"
      "$mainMod ALT, F, Full width, fullscreen, 1"
      # $mainMod, O, Pop window out (float & pin), exec, omarchy-hyprland-window-pop

      # Move focus with $mainMod + arrow keys
      "$mainMod, LEFT, Move window focus left, movefocus, l"
      "$mainMod, RIGHT, Move window focus right, movefocus, r"
      "$mainMod, UP, Move window focus up, movefocus, u"
      "$mainMod, DOWN, Move window focus down, movefocus, d"

      # Switch workspaces with $mainMod + [1-9]
      "$mainMod, code:10, Switch to workspace 1, workspace, 1"
      "$mainMod, code:11, Switch to workspace 2, workspace, 2"
      "$mainMod, code:12, Switch to workspace 3, workspace, 3"
      "$mainMod, code:13, Switch to workspace 4, workspace, 4"
      "$mainMod, code:14, Switch to workspace 5, workspace, 5"
      "$mainMod, code:15, Switch to workspace 6, workspace, 6"
      "$mainMod, code:16, Switch to workspace 7, workspace, 7"
      "$mainMod, code:17, Switch to workspace 8, workspace, 8"
      "$mainMod, code:18, Switch to workspace 9, workspace, 9"
      "$mainMod, code:19, Switch to workspace 10, workspace, 10"

      # Move active window to a workspace with $mainMod + SHIFT + [1-9]
      "$mainMod SHIFT, code:10, Move window to workspace 1, movetoworkspace, 1"
      "$mainMod SHIFT, code:11, Move window to workspace 2, movetoworkspace, 2"
      "$mainMod SHIFT, code:12, Move window to workspace 3, movetoworkspace, 3"
      "$mainMod SHIFT, code:13, Move window to workspace 4, movetoworkspace, 4"
      "$mainMod SHIFT, code:14, Move window to workspace 5, movetoworkspace, 5"
      "$mainMod SHIFT, code:15, Move window to workspace 6, movetoworkspace, 6"
      "$mainMod SHIFT, code:16, Move window to workspace 7, movetoworkspace, 7"
      "$mainMod SHIFT, code:17, Move window to workspace 8, movetoworkspace, 8"
      "$mainMod SHIFT, code:18, Move window to workspace 9, movetoworkspace, 9"
      "$mainMod SHIFT, code:19, Move window to workspace 10, movetoworkspace, 10"

      # Control scratchpad
      "$mainMod, S, Toggle scratchpad, togglespecialworkspace, scratchpad"
      "$mainMod ALT, S, Move window to scratchpad, movetoworkspacesilent, special:scratchpad"

      # TAB between workspaces
      "$mainMod, TAB, Next workspace, workspace, e+1"
      "$mainMod SHIFT, TAB, Previous workspace, workspace, e-1"
      "$mainMod CTRL, TAB, Former workspace, workspace, previous"

      # Move workspaces to other monitors
      "$mainMod SHIFT ALT, LEFT, Move workspace to left monitor, movecurrentworkspacetomonitor, l"
      "$mainMod SHIFT ALT, RIGHT, Move workspace to right monitor, movecurrentworkspacetomonitor, r"

      # Swap active window with the one next to it with $mainMod + SHIFT + arrow keys
      "$mainMod SHIFT, LEFT, Swap window to the left, swapwindow, l"
      "$mainMod SHIFT, RIGHT, Swap window to the right, swapwindow, r"
      "$mainMod SHIFT, UP, Swap window up, swapwindow, u"
      "$mainMod SHIFT, DOWN, Swap window down, swapwindow, d"

      # Cycle through applications on active workspace
      "ALT, TAB, Cycle to next window, cyclenext"
      "ALT SHIFT, TAB, Cycle to prev window, cyclenext, prev"
      "ALT, TAB, Reveal active window on top, bringactivetotop"
      "ALT SHIFT, TAB, Reveal active window on top, bringactivetotop"

      # Resize active window
      "$mainMod, code:20, Expand window left, resizeactive, -100 0    # - key"
      "$mainMod, code:21, Shrink window left, resizeactive, 100 0     # = key"
      "$mainMod SHIFT, code:20, Shrink window up, resizeactive, 0 -100"
      "$mainMod SHIFT, code:21, Expand window down, resizeactive, 0 100"

      # Scroll through existing workspaces with $mainMod + scroll
      "$mainMod, mouse_down, Scroll active workspace forward, workspace, e+1"
      "$mainMod, mouse_up, Scroll active workspace backward, workspace, e-1"

      # Move/resize windows with mainMod + LMB/RMB and dragging
      "bindmd = $mainMod, mouse:272, Move window, movewindow"
      "bindmd = $mainMod, mouse:273, Resize window, resizewindow"

      # Toggle groups
      "$mainMod, G, Toggle window grouping, togglegroup"
      "$mainMod ALT, G, Move active window out of group, moveoutofgroup"

      # Join groups
      "$mainMod ALT, LEFT, Move window to group on left, moveintogroup, l"
      "$mainMod ALT, RIGHT, Move window to group on right, moveintogroup, r"
      "$mainMod ALT, UP, Move window to group on top, moveintogroup, u"
      "$mainMod ALT, DOWN, Move window to group on bottom, moveintogroup, d"

      # Navigate a single set of grouped windows
      "$mainMod ALT, TAB, Next window in group, changegroupactive, f"
      "$mainMod ALT SHIFT, TAB, Previous window in group, changegroupactive, b"

      # Overload lateral window navigation for grouped windows
      "$mainMod ALT, LEFT, Move grouped window focus left, changegroupactive, b"
      "$mainMod ALT, RIGHT, Move grouped window focus right, changegroupactive, f"

      # Scroll through a set of grouped windows with $mainMod + ALT + scroll
      "$mainMod ALT, mouse_down, Next window in group, changegroupactive, f"
      "$mainMod ALT, mouse_up, Previous window in group, changegroupactive, b"

      # Activate window in a group by number
      "$mainMod ALT, code:10, Switch to group window 1, changegroupactive, 1"
      "$mainMod ALT, code:11, Switch to group window 2, changegroupactive, 2"
      "$mainMod ALT, code:12, Switch to group window 3, changegroupactive, 3"
      "$mainMod ALT, code:13, Switch to group window 4, changegroupactive, 4"
      "$mainMod ALT, code:14, Switch to group window 5, changegroupactive, 5"
    ];
  };
}
