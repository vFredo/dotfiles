from libqtile.config import DropDown, Key, Group, ScratchPad
from libqtile.lazy import lazy
from .keys import keys, mod, terminal

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod],
            i.name,
            lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        Key([mod], "Right", lazy.screen.next_group(),
            desc="Switch to next group"),

        Key([mod], "Left", lazy.screen.prev_group(),
            desc="Switch to previous group"),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name,
            lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
    ])

dropdown_options = {
    "width": 0.8,
    "height": 0.8,
    "x": 0.1,
    "y": 0.1,
    "opacity": 0.98,
    "on_focus_lost_hide": False
}

# Scratchpads configurations
groups.append(ScratchPad("scratchpad", [
    DropDown("tmp_term", terminal, **dropdown_options),
    DropDown("volume", "pavucontrol", **dropdown_options),
    DropDown("cpu_tasks", terminal + " -e btm", **dropdown_options),
    DropDown("file_manager", "thunar", **dropdown_options),
]))

keys.extend([
    Key([mod], "n", lazy.group["scratchpad"].dropdown_toggle("tmp_term")),
    Key([mod], "v", lazy.group["scratchpad"].dropdown_toggle("volume")),
    Key([mod], "b", lazy.group["scratchpad"].dropdown_toggle("cpu_tasks")),
    Key([mod], "e", lazy.group["scratchpad"].dropdown_toggle("file_manager"))
])
