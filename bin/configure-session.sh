#!/usr/bin/env bash

if type "xrandr" ; then
	xrandr --output eDP1 --scale 0.5x0.5 --output DP1 --scale 1x1 --left-of eDP1

	for m in $(xrandr --query | grep " connected" | cut -d" " -f1) ; do
		MONITOR=$m polybar --reload primary &
	done
else
	polybar --reload primary &
fi
