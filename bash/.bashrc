#!/bin/bash
# Interactive bash startup script.

export HISTCONTROL=erasedups

# shellcheck source=/dev/null
[ -f "$ALIASRC" ] && source "$ALIASRC"

# shellcheck source=/dev/null
[ -f "$BOOKMARK_ALIASRC" ] && source "$BOOKMARK_ALIASRC"

# Prompt
[ -x "$(command -v starship)" ] && eval "$(starship init bash)"
