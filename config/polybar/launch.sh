#!/usr/bin/env bash

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch main bar
while [ ! $# -eq 0 ]
do
  case "$1" in
    --bspwm)
      polybar -q bspwmBar -c "$DIR/config.ini" &
      ;;
    --i3)
      polybar -q i3Bar -c "$DIR/config.ini" &
      ;;
    *) echo "Choose a valid option.";;
  esac
  shift
done


