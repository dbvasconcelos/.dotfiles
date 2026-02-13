#!/bin/bash
# This script is an automator for flashing kinesis advanced pro 360 keyboard firmware
# upon mounting when in bootloader mode.

# mount point where to place firmware files.
mount=$1

dir="/tmp/kinesis"

# Setting filechooser location.
echo "$dir" >"$XDG_CACHE_HOME/.yazi_last_selected"

# Select and send firmware files.
files="$(GDK_DEBUG=portals zenity --file-selection)"
for f in $(echo "$files" | tr "|" "\n"); do
  [ -f "$f" ] && mv "$f" "$mount"
done
