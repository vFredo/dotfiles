import os
from libqtile.config import Screen
from libqtile import bar
from .widgets import *
from .keys import terminal

def parse_window_name(text):
    """Simplifies the names of a few windows, to be displayed in the bar"""
    target_names = [
        "Firefox",
        "VS Code",
        "Discord",
    ]
    return next(filter(lambda name: name in text, target_names), text)

decoration_group = {
    "decorations": [
        RectDecoration(colour=colors["bgAlt2"], radius=10, filled=True, padding_y=4,  group=True)
    ],
}

screens = [
    Screen(
        top=bar.Bar([
            widget.Sep(padding=4, linewidth=0),
            widget.CurrentLayoutIcon(
                scale=0.5,
                use_mask=True,
                foreground=colors["fg"],
            ),
            widget.GroupBox(
                padding=4,
                font='JetBrainsMono Medium',
                highlight_method='block',
                urgent_alert_method='block',
                active=colors["fg"],
                block_highlight_text_color=colors["bg"],
                inactive=colors["grey"],
                this_current_screen_border=colors["blue"],
                this_screen_border=colors["yellow"],
                other_screen_border=colors["purple"],
                urgent_border=colors["red"],
                urgent_text=colors["bg"],
            ),
            widget.WindowName(
                format="   {state}{name}",
                foreground=colors["fg"],
                max_chars=20,
                empty_group_string="   Desktop",
                parse_text=parse_window_name,
                **decoration_group
            ),

            widget.Spacer(),
            widget.Clock(
                foreground=colors["fg"],
                format=' %H:%M:%S 󰃭 %a, %b-%d-%Y'
            ),
            widget.Spacer(),

            widget.Net(
                interface="enp2s0",
                prefix="M",
                format=' {down:.2f} {down_suffix} ↓↑ {up:.2f} {up_suffix}',
                foreground=colors["purple"],
                **decoration_group
            ),
            widget.Volume(foreground=colors["yellow"], fmt=" {} ", **decoration_group),
            widget.CPU(format=" 󰻠 {load_percent:.1f}%", foreground=colors["fg"]),
            widget.Memory(measure_mem="G", format="󰍛 {MemUsed:.2f}{mm}", foreground=colors["orange"]),
            widget.CheckUpdates(
                distro="Arch_paru",
                update_interval=1800,
                colour_have_updates = colors["green"],
                colour_no_updates = colors["grey"],
                display_format=" {updates}",
                no_update_string=" 0",
                mouse_callbacks={
                    'Button1':
                    lambda: qtile.cmd_spawn(terminal + ' -e paru -Syu --noconfirm')
                },
            ),
            widget.KeyboardLayout(
                foreground=colors["fg"],
                configured_keyboards=['us', 'es'],
                fmt="  {}",
            ),
            widget.Systray(icon_size=15, padding=5),
            widget.TextBox(
                text=' ',
                foreground=colors["red"],
                padding=5,
                mouse_callbacks= {
                    'Button1':
                    lambda: qtile.cmd_spawn(os.path.expanduser('~/.config/rofi/powermenu.sh'))
                },
            )
        ],
        30,  # height in px
        background=colors["bg"]  # background color
        ),
    ),
]
