#!/bin/bash

status=$(amixer sget Master | tail -n 1 | awk '{print $NF}')

if [ "$status" == "[off]" ]; then
    dunstify -i audio-volume-muted -h string:x-canonical-private-synchronous:status "Muted"
else
    dunstify -i audio-volume-high -h string:x-canonical-private-synchronous:status "Volume: " -h int:value:"`pamixer --get-volume`"
fi
