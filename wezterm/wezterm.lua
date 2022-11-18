local wezterm = require "wezterm"
local act = wezterm.action

wezterm.on("gui-startup", function()
    local tab, pane, window = wezterm.mux.spawn_window{}
    window:gui_window():toggle_fullscreen()
end)

return {
    font = wezterm.font("UDEV Gothic 35LG"),
    use_ime = true,
    font_size = 11.0,
    color_scheme = "iceberg-dark",
    window_background_opacity = 0.85,
    hide_tab_bar_if_only_one_tab = true,
    window_decorations = "RESIZE",
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    default_cursor_style = 'BlinkingBlock',
    disable_default_key_bindings = true,
    keys = {
        { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
        { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
        { key = 'Enter', mods = 'ALT', action = act.ToggleFullScreen },
        { key = '!', mods = 'CTRL', action = act.ActivateTab(0) },
        { key = '!', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
        { key = '"', mods = 'ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
        { key = '"', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
        { key = '#', mods = 'CTRL', action = act.ActivateTab(2) },
        { key = '#', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
        { key = '$', mods = 'CTRL', action = act.ActivateTab(3) },
        { key = '$', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
        { key = '%', mods = 'CTRL', action = act.ActivateTab(4) },
        { key = '%', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },
        { key = '%', mods = 'ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
        { key = '%', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
        { key = '&', mods = 'CTRL', action = act.ActivateTab(6) },
        { key = '&', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
        { key = "'", mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
        { key = '(', mods = 'CTRL', action = act.ActivateTab(-1) },
        { key = '(', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },
        { key = '*', mods = 'CTRL', action = act.ActivateTab(7) },
        { key = '*', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
        { key = '1', mods = 'SUPER', action = act.ActivateTab(0) },
        { key = '2', mods = 'SUPER', action = act.ActivateTab(1) },
        { key = '3', mods = 'SUPER', action = act.ActivateTab(2) },
        { key = '4', mods = 'SUPER', action = act.ActivateTab(3) },
        { key = '5', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
        { key = '5', mods = 'SUPER', action = act.ActivateTab(4) },
        { key = '6', mods = 'SUPER', action = act.ActivateTab(5) },
        { key = '7', mods = 'SUPER', action = act.ActivateTab(6) },
        { key = '8', mods = 'SUPER', action = act.ActivateTab(7) },
        { key = '9', mods = 'SUPER', action = act.ActivateTab(-1) },
        { key = '@', mods = 'CTRL', action = act.ActivateTab(1) },
        { key = '@', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
        { key = 'C', mods = 'CTRL', action = act.CopyTo 'Clipboard' },
        { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
        { key = 'F', mods = 'CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
        { key = 'F', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
        { key = 'H', mods = 'CTRL', action = act.HideApplication },
        { key = 'H', mods = 'SHIFT|CTRL', action = act.HideApplication },
        { key = 'K', mods = 'CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
        { key = 'K', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
        { key = 'L', mods = 'CTRL', action = act.ShowDebugOverlay },
        { key = 'L', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
        { key = 'M', mods = 'CTRL', action = act.Hide },
        { key = 'M', mods = 'SHIFT|CTRL', action = act.Hide },
        { key = 'N', mods = 'CTRL', action = act.SpawnWindow },
        { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
        { key = 'P', mods = 'CTRL', action = act.PaneSelect{ alphabet =  '', mode =  'Activate' } },
        { key = 'P', mods = 'SHIFT|CTRL', action = act.PaneSelect{ alphabet =  '', mode =  'Activate' } },
        { key = 'Q', mods = 'CTRL', action = act.QuitApplication },
        { key = 'Q', mods = 'SHIFT|CTRL', action = act.QuitApplication },
        { key = 'R', mods = 'CTRL', action = act.ReloadConfiguration },
        { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
        { key = 'T', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
        { key = 'T', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
        { key = 'U', mods = 'CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
        { key = 'U', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
        { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
        { key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
        { key = 'W', mods = 'CTRL', action = act.CloseCurrentTab{ confirm = true } },
        { key = 'W', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
        { key = 'X', mods = 'CTRL', action = act.ActivateCopyMode },
        { key = 'X', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
        { key = 'Z', mods = 'CTRL', action = act.TogglePaneZoomState },
        { key = 'Z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
        { key = '^', mods = 'CTRL', action = act.ActivateTab(5) },
        { key = '^', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
        { key = 'c', mods = 'SUPER', action = act.CopyTo 'Clipboard' },
        { key = 'f', mods = 'SUPER', action = act.Search 'CurrentSelectionOrEmptyString' },
        { key = 'h', mods = 'SUPER', action = act.HideApplication },
        { key = 'k', mods = 'SUPER', action = act.ClearScrollback 'ScrollbackOnly' },
        { key = 'l', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
        { key = 'm', mods = 'SUPER', action = act.Hide },
        { key = 'n', mods = 'SUPER', action = act.SpawnWindow },
        { key = 'p', mods = 'SHIFT|CTRL', action = act.PaneSelect{ alphabet =  '', mode =  'Activate' } },
        { key = 'q', mods = 'SUPER', action = act.QuitApplication },
        { key = 'r', mods = 'SUPER', action = act.ReloadConfiguration },
        { key = 't', mods = 'SUPER', action = act.SpawnTab 'CurrentPaneDomain' },
        { key = 'u', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
        { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard' },
        { key = 'w', mods = 'SUPER', action = act.CloseCurrentTab{ confirm = true } },
        { key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
        { key = 'z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
        { key = '{', mods = 'SUPER', action = act.ActivateTabRelative(-1) },
        { key = '}', mods = 'SUPER', action = act.ActivateTabRelative(1) },
        { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },
    },

    key_tables = {
        copy_mode = {
            { key = 'Tab', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
            { key = 'Tab', mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
            { key = 'Enter', mods = 'NONE', action = act.CopyMode 'MoveToStartOfNextLine' },
            { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
            { key = 'Space', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
            { key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
            { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
            { key = ',', mods = 'NONE', action = act.CopyMode 'JumpReverse' },
            { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
            { key = ';', mods = 'NONE', action = act.CopyMode 'JumpAgain' },
            { key = 'F', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
            { key = 'F', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
            { key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },
            { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
            { key = 'H', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' },
            { key = 'H', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
            { key = 'L', mods = 'NONE', action = act.CopyMode 'MoveToViewportBottom' },
            { key = 'L', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
            { key = 'M', mods = 'NONE', action = act.CopyMode 'MoveToViewportMiddle' },
            { key = 'M', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
            { key = 'O', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
            { key = 'O', mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
            { key = 'T', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
            { key = 'T', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
            { key = 'V', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Line' } },
            { key = 'V', mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode =  'Line' } },
            { key = '^', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
            { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
            { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
            { key = 'b', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
            { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
            { key = 'c', mods = 'CTRL', action = act.CopyMode 'Close' },
            { key = 'f', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = false } } },
            { key = 'f', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
            { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
            { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
            { key = 'g', mods = 'CTRL', action = act.CopyMode 'Close' },
            { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
            { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
            { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
            { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
            { key = 'm', mods = 'ALT', action = act.CopyMode 'MoveToStartOfLineContent' },
            { key = 'o', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEnd' },
            { key = 'q', mods = 'NONE', action = act.CopyMode 'Close' },
            { key = 't', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = true } } },
            { key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
            { key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode =  'Block' } },
            { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
            { key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { CopyMode =  'Close' } } },
            { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PageUp' },
            { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },
            { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
            { key = 'LeftArrow', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
            { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
            { key = 'RightArrow', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
            { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
            { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
        },

        search_mode = {
            { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
            { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
            { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
            { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
            { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
            { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
            { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
            { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
            { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
            { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
        },

    }
}