#!/usr/bin/env bash
# Interactive non-login shell startup script.

export HISTCONTROL=erasedups:ignorespace

# shellcheck source=/dev/null
[ -f "$ALIASRC" ] && source "$ALIASRC"

# Prompt
# shellcheck disable=SC2155
if [ -x "$(command -v starship)" ]; then
    eval "$(starship init bash)"
fi
