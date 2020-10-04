#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar pbar &

#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload pbar &
#  done
#else
#  polybar --reload pbar &
#fi

run nitrogen --restore
run picom -b
