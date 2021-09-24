#! /bin/sh

NOTIFY_ICON=/usr/share/icons/Papirus/32x32/apps/system-software-update.svg


if ! updates_arch="$(checkupdates 2> /dev/null | wc -l)"; then
  updates_arch=0
fi

if ! updates_aur="$(yay -Qum 2>/dev/null | wc -l)"; then
  updates_aur=0
fi

UPDATES="$((updates_arch + updates_aur))"

function notify_update() {
  # notify user of updates
  if hash notify-send &>/dev/null; then
    if (( UPDATES > 50 )); then
      notify-send -u critical -i $NOTIFY_ICON \
        "You really need to update!!" "$UPDATES New packages"
    elif (( UPDATES > 25 )); then
      notify-send -u normal -i $NOTIFY_ICON \
        "You should update soon" "$UPDATES New packages"
    elif (( UPDATES > 2 )); then
      notify-send -u low -i $NOTIFY_ICON \
        "$UPDATES New packages"
    fi
  fi
}

function checking_updates() {
  if [ "$UPDATES" -gt 0 ]; then
    notify_update
    echo -e "%{F#EA6962}  $UPDATES%{F-}"
  else
    echo -e "%{F#A9B665}  $UPDATES%{F-}"
  fi
}

checking_updates
