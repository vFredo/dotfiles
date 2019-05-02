#!/usr/bin/env bash

# Terminate bash instances
killall -q polybar

# Wait until the bar is closed
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1
polybar main_bar &

echo "Bar launched..."
