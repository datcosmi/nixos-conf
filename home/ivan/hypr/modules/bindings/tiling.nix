{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    bindd = [
      # Close windows
      "$mainMod, W, Close window, killactive,"

      # Control tiling
      "$mainMod, J, Toggle window split, layoutmsg, togglesplit, # dwindle"
      "$mainMod, P, Pseudo window, layoutmsg, pseudo, # dwindle"
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

      "$mainMod, k, Move window focus up, movefocus, u"
      "$mainMod, j, Move window focus down, movefocus, d"

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
      "$mainMod ALT, h, Swap window to the left, swapwindow, l"
      "$mainMod ALT, l, Swap window to the right, swapwindow, r"
      "$mainMod ALT, k, Swap window up, swapwindow, u"
      "$mainMod ALT, j, Swap window down, swapwindow, d"

      # Cycle through applications on active workspace
      "ALT, TAB, Cycle to next window, cyclenext"
      "ALT SHIFT, TAB, Cycle to prev window, cyclenext, prev"
      "ALT, TAB, Reveal active window on top, bringactivetotop"
      "ALT SHIFT, TAB, Reveal active window on top, bringactivetotop"

      # Resize active window
      # "$mainMod, code:20, Expand window left, resizeactive, -100 0    # - key"
      # "$mainMod, code:21, Shrink window left, resizeactive, 100 0     # = key"
      "$mainMod SHIFT, code:20, Shrink window up, resizeactive, 0 -100"
      "$mainMod SHIFT, code:21, Expand window down, resizeactive, 0 100"

      # Scroll through existing workspaces with $mainMod + scroll
      "$mainMod, mouse_down, Scroll active workspace forward, workspace, e+1"
      "$mainMod, mouse_up, Scroll active workspace backward, workspace, e-1"

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

      # SCROLLING LAYOUT

      # Scroll layout by columns
      "$mainMod, h, Column left, layoutmsg, move -col"
      "$mainMod, l, Column right, layoutmsg, move +col"

      # Move windows between columns
      "$mainMod SHIFT, H, Move window left column, layoutmsg, movewindowto l"
      "$mainMod SHIFT, L, Move window right column, layoutmsg, movewindowto r"
      "$mainMod SHIFT, K, Move window up column, layoutmsg, movewindowto u"
      "$mainMod SHIFT, J, Move window down column, layoutmsg, movewindowto d"

      # Resize current column
      "$mainMod CTRL, h, Shrink column, layoutmsg, colresize -0.1"
      "$mainMod CTRL, l, Expand column, layoutmsg, colresize +0.1"

      # Cycle column width presets
      "$mainMod CTRL, k, Cycle column width forward, layoutmsg, colresize +conf"
      "$mainMod CTRL, j, Cycle column width backward, layoutmsg, colresize -conf"

      # Column management
      "$mainMod, n, Promote window to new column, layoutmsg, promote"

      # Toggle fit / left
      "$mainMod, b, Toggle column fit/left, layoutmsg, togglefit"

      # Swap columns
      "$mainMod SHIFT, comma, Swap column right, layoutmsg, swapcol l"
      "$mainMod SHIFT, period, Swap column left, layoutmsg, swapcol r"

      # Move entire column to adjacent workspace
      "$mainMod CTRL, comma, Move column to prev workspace, layoutmsg, movecoltoworkspace e-1"
      "$mainMod CTRL, period, Move column to next workspace, layoutmsg, movecoltoworkspace e+1"

      # Move windows between columns / directions (promotes to new column at right edge)
      # "$mainMod SHIFT, RIGHT, Move window to the right, layoutmsg, movewindowto r"
      # "$mainMod SHIFT, LEFT, Move window to te left, layoutmsg, movewindowto l"
      # "$mainMod SHIFT, UP, Move window up, layoutmsg, movewindowto u"
      # "$mainMod SHIFT, DOWN, Move window down, layoutmsg, movewindowto d"
    ];

    bindmd = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mainMod, mouse:272, Move window, movewindow"
      "$mainMod, mouse:273, Resize window, resizewindow"
    ];
  };
}
