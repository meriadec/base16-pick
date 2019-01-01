#!/bin/env bash

set -e

FOCUSED=0

while IFS='' read -r line || [[ -n "$line" ]]; do

  THEME="$line"

  if [[ -f shots/$THEME.png ]]; then
    echo "-- cache exists for $THEME"
  else

    if [[ $FOCUSED -eq 0 ]]; then
      FOCUSED=1
      i3-msg workspace tmp
    fi

    base16-pick "$THEME"

    kitty \
      --directory ~/ledger/ledger-live-desktop \
      bash ~/git/base16-pick/scripts/mock-activity.sh "$THEME" vim &

    KITTY_PID=$!
    sleep 1

    maim "shots/$THEME.png"

    kill -9 "$KITTY_PID" >/dev/null

  fi

done < "themes-list.txt"


if [[ $FOCUSED -eq 1 ]]; then
  i3-msg workspace '1: main'
fi
