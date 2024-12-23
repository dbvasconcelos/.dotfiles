#!/usr/bin/env bash

set -x

# This wrapper script is invoked by xdg-desktop-portal-termfilechooser.
#
# Inputs:
# 1. "1" if multiple files can be chosen, "0" otherwise.
# 2. "1" if a directory should be chosen, "0" otherwise.
# 3. "0" if opening files was requested, "1" if writing to a file was
#    requested. For example, when uploading files in Firefox, this will be "0".
#    When saving a web page in Firefox, this will be "1".
# 4. If writing to a file, this is recommended path provided by the caller. For
#    example, when saving a web page in Firefox, this will be the recommended
#    path Firefox provided, such as "~/Downloads/webpage_title.html".
#    Note that if the path already exists, we keep appending "_" to it until we
#    get a path that does not exist.
# 5. The output path, to which results should be written.
#
# Output:
# The script should print the selected paths to the output path (argument #5),
# one path per line.
# If nothing is printed, then the operation is assumed to have been canceled.

save="$3"
path="$4"
out="$5"

last_selected_storage="$XDG_CACHE_HOME/.yazi_last_selected"

if [ -z "$path" ]; then
    if [ -f "$last_selected_storage" ]; then
        path="$(cat "$last_selected_storage")"
    else
        path="$HOME"
    fi
fi

if [ "$save" = "1" ]; then
    printf '%s' '
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    !!!                 === DUMMY FILE! ===                !!!
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    Instructions:
    1) Move this file wherever you want.
    2) Rename the file if needed.
    3) Confirm your selection by opening the file, for
       example by pressing <Enter>.

    Notes:
    1) This file is provided for your convenience. You
       could delete it and choose another file to overwrite
       that.
    2) If you quit yazi without opening a file, this file
       will be removed and the save operation aborted.
    ' >"$path"
fi

set -- --chooser-file="$out" --cwd-file="$last_selected_storage" "$path"
kitty --class filechooser -- yazi "$@"

# Remove file if the save operation aborted
if [ "$save" = "1" ] && [ ! -s "$out" ]; then
    rm "$path"
fi
