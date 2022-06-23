#!/bin/bash
# Interactive bash startup script.

export HISTCONTROL=erasedups

# shellcheck source=/dev/null
[ -f "$ALIASRC" ] && source "$ALIASRC"

# shellcheck source=/dev/null
[ -f "$BOOKMARK_ALIASRC" ] && source "$BOOKMARK_ALIASRC"

# Prompt
if [ -x "$(command -v starship)" ]; then
  eval "$(starship init bash)"
else
  PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
  export PS1
fi
