#!/bin/bash
# This script is an automator for flashing kinesis advanced pro 360 keyboard firmware
# upon mounting when in bootloader mode.

# mount point where to place firmware files.
mount=$1

zip="/tmp/firmware.zip"
extracted="/tmp/kinesis"

# If not yet downloaded, will fetch latest firmware built on github.
if [ ! -d "$extracted" ] || [ -z "$(ls -A "$extracted")" ]; then
  url="https://api.github.com/repos/dbvasconcelos/Adv360-Pro-ZMK/actions/artifacts?per_page=1"
  gh api \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "$(curl -s "$url" |
      jq '[.artifacts[] | {name : .name, archive_download_url : .archive_download_url}]' |
      jq -r '.[] | select (.name == "firmware") | .archive_download_url')" \
    >"$zip"
  unzip "$zip" -d "$extracted" && rm "$zip"
fi

# Setting filechooser location.
echo "$extracted" >"$XDG_CACHE_HOME/.yazi_last_selected"

# Select and send firmware files.
files="$(GDK_DEBUG=portals zenity --file-selection)"
for f in $(echo "$files" | tr "|" "\n"); do
  [ -f "$f" ] && mv "$f" "$mount"
done
