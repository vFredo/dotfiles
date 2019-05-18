#!/bin/python

import sys
import dbus
import argparse

parser = argparse.ArgumentParser()

parser.add_argument(
    '-p',
    '--playpause',
    type=str,
    metavar='Previous indicator',
    dest='icon_previous'
)

args = parser.parse_args()


def fix_string(string):
    # corrects encoding for the python version used
    if sys.version_info.major == 3:
        return string
    else:
        return string.encode('utf-8')

try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object(
        'org.mpris.MediaPlayer2.spotify',
        '/org/mpris/MediaPlayer2'
    )

    spotify_properties = dbus.Interface(
        spotify_bus,
        'org.freedesktop.DBus.Properties'
    )

    metadata = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
    status = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'PlaybackStatus')

    label_with_font = '%{{T{font}}}{label}%{{T-}}'
    icons = args.icon_previous
    icon = label_with_font.format(font='2', label=icons)

    if status == 'Playing' or status == 'Paused':
        print(icon)
    else:
        print('')

except Exception as e:
    if isinstance(e, dbus.exceptions.DBusException):
        print('')
    else:
        print(e)

