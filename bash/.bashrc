#!/usr/bin/env bash
# Interactive non-login shell startup script.

export HISTCONTROL="erasedups:ignoreboth"

if [ -f "$ALIASRC" ]; then
  # shellcheck source=/dev/null
  source "$ALIASRC"
fi

# Prompt
if [ -x "$(command -v starship)" ]; then
  eval "$(starship init bash)"
fi
