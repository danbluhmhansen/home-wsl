{pkgs, ...}: {
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
      default_shell = "nu";
      default_layout = "compact";
      theme = "catppuccin-mocha";
      pane_frames = false;
      keybinds = {
        normal = {
          "unbind \"Ctrl o\"" = [];
          "unbind \"Ctrl t\"" = [];
          "unbind \"Ctrl p\"" = [];
          "unbind \"Ctrl s\"" = [];
        };
        locked = {
          "bind \"Ctrl g\"" = { SwitchToMode = "Normal"; };
        };
        resize = {
          "bind \"Ctrl n\"" = { SwitchToMode = "Normal"; };
          "bind \"h Left\"" = { Resize = "Increase Left"; };
          "bind \"j Down\"" = { Resize = "Increase Down"; };
          "bind \"k Up\"" = { Resize = "Increase Up"; };
          "bind \"l Right\"" = { Resize = "Increase Right"; };
          "bind \"H\"" = { Resize = "Decrease Left"; };
          "bind \"J\"" = { Resize = "Decrease Down"; };
          "bind \"K\"" = { Resize = "Decrease Up"; };
          "bind \"L\"" = { Resize = "Decrease Right"; };
          "bind \"= +\"" = { Resize = "Increase"; };
          "bind \"-\"" = { Resize = "Decrease"; };
        };
        pane = {
          "bind \"Alt p\"" = { SwitchToMode = "Normal"; };
          "bind \"h Left\"" = { MoveFocus = "Left"; };
          "bind \"l Right\"" = { MoveFocus = "Right"; };
          "bind \"j Down\"" = { MoveFocus = "Down"; };
          "bind \"k Up\"" = { MoveFocus = "Up"; };
          "bind \"p\"" = { SwitchFocus = []; };
          "bind \"n\"" = { NewPane = []; SwitchToMode = "Normal"; };
          "bind \"d\"" = { NewPane = "Down"; SwitchToMode = "Normal"; };
          "bind \"r\"" = { NewPane = "Right"; SwitchToMode = "Normal"; };
          "bind \"x\"" = { CloseFocus = []; SwitchToMode = "Normal"; };
          "bind \"f\"" = { ToggleFocusFullscreen = []; SwitchToMode = "Normal"; };
          "bind \"z\"" = { TogglePaneFrames = []; SwitchToMode = "Normal"; };
          "bind \"w\"" = { ToggleFloatingPanes = []; SwitchToMode = "Normal"; };
          "bind \"e\"" = { TogglePaneEmbedOrFloating = []; SwitchToMode = "Normal"; };
          "bind \"c\"" = { SwitchToMode = "RenamePane"; PaneNameInput = 0;};
        };
        move = {
          "bind \"Ctrl h\"" = { SwitchToMode = "Normal"; };
          "bind \"n\" \"Tab\"" = { MovePane = []; };
          "bind \"p\"" = { MovePaneBackwards = []; };
          "bind \"h\" \"Left\"" = { MovePane = "Left"; };
          "bind \"j\" \"Down\"" = { MovePane = "Down"; };
          "bind \"k\" \"Up\"" = { MovePane = "Up"; };
          "bind \"l\" \"Right\"" = { MovePane = "Right"; };
        };
        tab = {
          "bind \"Alt t\"" = { SwitchToMode = "Normal"; };
          "bind \"r\"" = { SwitchToMode = "RenameTab"; TabNameInput = 0; };
          "bind \"h\" \"Left\" \"Up\" \"k\"" = { GoToPreviousTab = []; };
          "bind \"l\" \"Right\" \"Down\" \"j\"" = { GoToNextTab = []; };
          "bind \"n\"" = { NewTab = []; SwitchToMode = "Normal"; };
          "bind \"x\"" = { CloseTab = []; SwitchToMode = "Normal"; };
          "bind \"s\"" = { ToggleActiveSyncTab = []; SwitchToMode = "Normal"; };
          "bind \"b\"" = { BreakPane = []; SwitchToMode = "Normal"; };
          "bind \"]\"" = { BreakPaneRight = []; SwitchToMode = "Normal"; };
          "bind \"[\"" = { BreakPaneLeft = []; SwitchToMode = "Normal"; };
          "bind \"1\"" = { GoToTab = 1; SwitchToMode = "Normal"; };
          "bind \"2\"" = { GoToTab = 2; SwitchToMode = "Normal"; };
          "bind \"3\"" = { GoToTab = 3; SwitchToMode = "Normal"; };
          "bind \"4\"" = { GoToTab = 4; SwitchToMode = "Normal"; };
          "bind \"5\"" = { GoToTab = 5; SwitchToMode = "Normal"; };
          "bind \"6\"" = { GoToTab = 6; SwitchToMode = "Normal"; };
          "bind \"7\"" = { GoToTab = 7; SwitchToMode = "Normal"; };
          "bind \"8\"" = { GoToTab = 8; SwitchToMode = "Normal"; };
          "bind \"9\"" = { GoToTab = 9; SwitchToMode = "Normal"; };
          "bind \"Tab\"" = { ToggleTab = []; };
        };
        scroll = {
          "bind \"Alt s\"" = { SwitchToMode = "Normal"; };
          "bind \"e\"" = { EditScrollback = []; SwitchToMode = "Normal"; };
          "bind \"s\"" = { SwitchToMode = "EnterSearch"; SearchInput = 0; };
          "bind \"Ctrl c\"" = { ScrollToBottom = []; SwitchToMode = "Normal"; };
          "bind \"j\" \"Down\"" = { ScrollDown = []; };
          "bind \"k\" \"Up\"" = { ScrollUp = []; };
          "bind \"Ctrl f\" \"PageDown\" \"Right\" \"l\"" = { PageScrollDown = []; };
          "bind \"Ctrl b\" \"PageUp\" \"Left\" \"h\"" = { PageScrollUp = []; };
          "bind \"d\"" = { HalfPageScrollDown = []; };
          "bind \"u\"" = { HalfPageScrollUp = []; };
          # uncomment this and adjust key if using copy_on_select=false
          # \"bind \"Alt c\"" = { Copy = []; };
        };
        search = {
          "bind \"Alt s\"" = { SwitchToMode = "Normal"; };
          "bind \"Ctrl c\"" = { ScrollToBottom = []; SwitchToMode = "Normal"; };
          "bind \"j\" \"Down\"" = { ScrollDown = []; };
          "bind \"k\" \"Up\"" = { ScrollUp = []; };
          "bind \"Ctrl f\" \"PageDown\" \"Right\" \"l\"" = { PageScrollDown = []; };
          "bind \"Ctrl b\" \"PageUp\" \"Left\" \"h\"" = { PageScrollUp = []; };
          "bind \"d\"" = { HalfPageScrollDown = []; };
          "bind \"u\"" = { HalfPageScrollUp = []; };
          "bind \"n\"" = { Search = "down"; };
          "bind \"p\"" = { Search = "up"; };
          "bind \"c\"" = { SearchToggleOption = "CaseSensitivity"; };
          "bind \"w\"" = { SearchToggleOption = "Wrap"; };
          "bind \"o\"" = { SearchToggleOption = "WholeWord"; };
        };
        entersearch = {
          "bind \"Ctrl c\" \"Esc\"" = { SwitchToMode = "Scroll"; };
          "bind \"Enter\"" = { SwitchToMode = "Search"; };
        };
        renametab = {
          "bind \"Ctrl c\"" = { SwitchToMode = "Normal"; };
          "bind \"Esc\"" = { UndoRenameTab = []; SwitchToMode = "Tab"; };
        };
        renamepane = {
          "bind \"Ctrl c\"" = { SwitchToMode = "Normal"; };
          "bind \"Esc\"" = { UndoRenamePane = []; SwitchToMode = "Pane"; };
        };
        session = {
          "bind \"Ctrl k\"" = { SwitchToMode = "Normal"; };
          "bind \"Alt s\"" = { SwitchToMode = "Scroll"; };
          "bind \"d\"" = { Detach = []; };
          "bind \"w\"" = {
            "LaunchOrFocusPlugin \"zellij:session-manager\"" = {
              floating = true;
              move_to_focused_tab = true;
            };
            SwitchToMode = "Normal";
          };
        };
        tmux = {
          "bind \"[\"" = { SwitchToMode = "Scroll"; };
          "bind \"Ctrl b\"" = { Write = 2; SwitchToMode = "Normal"; };
          "bind \"\\\"\"" = { NewPane = "Down"; SwitchToMode = "Normal"; };
          "bind \"%\"" = { NewPane = "Right"; SwitchToMode = "Normal"; };
          "bind \"z\"" = { ToggleFocusFullscreen = []; SwitchToMode = "Normal"; };
          "bind \"c\"" = { NewTab = []; SwitchToMode = "Normal"; };
          "bind \",\"" = { SwitchToMode = "RenameTab"; };
          "bind \"p\"" = { GoToPreviousTab = []; SwitchToMode = "Normal"; };
          "bind \"n\"" = { GoToNextTab = []; SwitchToMode = "Normal"; };
          "bind \"Left\"" = { MoveFocus = "Left"; SwitchToMode = "Normal"; };
          "bind \"Right\"" = { MoveFocus = "Right"; SwitchToMode = "Normal"; };
          "bind \"Down\"" = { MoveFocus = "Down"; SwitchToMode = "Normal"; };
          "bind \"Up\"" = { MoveFocus = "Up"; SwitchToMode = "Normal"; };
          "bind \"h\"" = { MoveFocus = "Left"; SwitchToMode = "Normal"; };
          "bind \"l\"" = { MoveFocus = "Right"; SwitchToMode = "Normal"; };
          "bind \"j\"" = { MoveFocus = "Down"; SwitchToMode = "Normal"; };
          "bind \"k\"" = { MoveFocus = "Up"; SwitchToMode = "Normal"; };
          "bind \"o\"" = { FocusNextPane = []; };
          "bind \"d\"" = { Detach = []; };
          "bind \"Space\"" = { NextSwapLayout = []; };
          "bind \"x\"" = { CloseFocus = []; SwitchToMode = "Normal"; };
        };
        "shared_except \"locked\"" = {
          "bind \"Ctrl g\"" = { SwitchToMode = "Locked"; };
          "bind \"Ctrl q\"" = { Quit = []; };
          "bind \"Alt n\"" = { NewPane = []; };
          "bind \"Alt h\" \"Alt Left\"" = { MoveFocusOrTab = "Left"; };
          "bind \"Alt l\" \"Alt Right\"" = { MoveFocusOrTab = "Right"; };
          "bind \"Alt j\" \"Alt Down\"" = { MoveFocus = "Down"; };
          "bind \"Alt k\" \"Alt Up\"" = { MoveFocus = "Up"; };
          "bind \"Alt =\" \"Alt +\"" = { Resize = "Increase"; };
          "bind \"Alt -\"" = { Resize = "Decrease"; };
          "bind \"Alt [\"" = { PreviousSwapLayout = []; };
          "bind \"Alt ]\"" = { NextSwapLayout = []; };
        };
        "shared_except \"normal\" \"locked\"" = {
          "bind \"Enter\" \"Esc\"" = { SwitchToMode = "Normal"; };
        };
        "shared_except \"pane\" \"locked\"" = {
          "bind \"Alt p\"" = { SwitchToMode = "Pane"; };
        };
        "shared_except \"resize\" \"locked\"" = {
          "bind \"Ctrl n\"" = { SwitchToMode = "Resize"; };
        };
        "shared_except \"scroll\" \"locked\"" = {
          "bind \"Alt s\"" = { SwitchToMode = "Scroll"; };
        };
        "shared_except \"session\" \"locked\"" = {
          "bind \"Ctrl k\"" = { SwitchToMode = "Session"; };
        };
        "shared_except \"tab\" \"locked\"" = {
          "bind \"Alt t\"" = { SwitchToMode = "Tab"; };
        };
        "shared_except \"move\" \"locked\"" = {
          "bind \"Ctrl h\"" = { SwitchToMode = "Move"; };
        };
        "shared_except \"tmux\" \"locked\"" = {
          "bind \"Ctrl b\"" = { SwitchToMode = "Tmux"; };
        };
      };
    };
  };
}