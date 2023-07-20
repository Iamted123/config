
#!/bin/bash

# Get the connected monitor name
monitor=$(xrandr -q | grep ' connected' | awk '{print $1}')

# Check the current rotation
rotation=$(xrandr --verbose | grep "$monitor" -A 5 | grep 'rotate' | awk '{print $2}')

# Rotate the screen
if [ "$rotation" == "normal" ]; then
    xrandr --output "$monitor" --rotate right
else
    xrandr --output "$monitor" --rotate normal
fi

