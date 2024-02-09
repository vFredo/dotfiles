from libqtile import layout
from libqtile.config import Match
from .widgets import colors

layout_theme = {
    "font": "JetBrainsMono Nerd Font",
    "border_focus": colors["orange"],
    "border_normal": colors["fgAlt2"],
    "margin": 4,
    "border_width": 2,
    "grow_amount": 1,
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(),
    layout.Bsp(**layout_theme),
    layout.TreeTab(
        level_shift=4,
        font="JetBrainsMono Nerd Font",
        section_fg=colors["fg"],
        active_fg=colors["bg"],
        inactive_fg=colors["fg"],
        bg_color=colors["bg"],
        active_bg=colors["blue"],
        inactive_bg=colors["bg"]
    ),
]

floating_layout = layout.Floating(
    **layout_theme,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
        Match(title='Volume Control'),  # GPG key password entry
    ]
)

