#!/bin/bash
# Interactive bash startup script.

export HISTCONTROL=erasedups

# shellcheck source=/dev/null
[ -f "$ALIASRC" ] && source "$ALIASRC"

# Prompt
# shellcheck disable=SC2155
if [ -x "$(command -v starship)" ]; then
    eval "$(starship init bash)"
fi
