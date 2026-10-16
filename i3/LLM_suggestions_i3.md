# Six lines, each an atomic change:

9/29/2026
1. Replace `set $ws6 "6: "` with `set $ws6 "6: Terminal 2"` (gives the tab a label instead of a trailing-space blank).

2. Add `bindsym $mod+Shift+Return exec --no-startup-id i3-msg 'workspace number $ws6; exec wezterm; workspace number $ws1'` — this is the actual "second terminal" binding; the three-command sequence is the race-free form from the i3 docs, and the trailing `workspace $ws1` puts focus back where you were.

3. Do **not** add `assign [class="^org.wezfurlong.wezterm$"] $ws6` — `assign` matches *every* window of that class, so your `$mod+Return` and launcher-`w` terminals would all jump to ws6 too. You want one home (ws1) plus one escape hatch (ws6), which only a binding gives you.

4. If you already took my earlier suggestion and now have `assign [class="^org.wezfurlong.wezterm$"] $ws1` in the file, comment it out — with multiple matching `assign` rules i3 takes the first, so it silently makes line 3 pointless and will confuse you later.

5. Optionally add `workspace $ws6 layout tabbed` so repeated `$mod+Shift+Return` presses stack the terminals vertically instead of halving each one.

6. Optionally, in the `mode "$mode_launcher"` block, add `bindsym W exec --no-startup-id i3-msg 'workspace number $ws6; exec wezterm; workspace number $ws1'` and change the mode title to `Launch: [f]irefox [s]lack [e]macs [p]ositron [w]ezterm [W]ezterm2 [d]ate`.

Leave the startup `exec --no-startup-id wezterm` untouched — that one still lands on ws1.

One fallback: if i3-msg complains about `$ws6` in your version, swap `workspace number $ws6` for the literal `workspace 6` in lines 2 and 6.

