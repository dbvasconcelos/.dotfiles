#!/bin/bash
# Interactive bash startup script.

export HISTCONTROL=erasedups

# shellcheck source=/dev/null
[ -f "$ALIASRC" ] && source "$ALIASRC"

# shellcheck source=/dev/null
[ -f "$BOOKMARK_ALIASRC" ] && source "$BOOKMARK_ALIASRC"

# Programing Language Runtime Proxy
# shellcheck source=/dev/null
[ -f "$ASDF_DIR/asdf.sh" ] && source "$ASDF_DIR/asdf.sh"

# Prompt
# shellcheck disable=SC2155
if [ -x "$(command -v starship)" ]; then
  eval "$(starship init bash)"
else
  export PS1="\[$(tput bold)\]\[$(tput setaf 3)\]\u\[$(tput setaf 1)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 7)\]\w\n\\[$(tput setaf 2)\]\$ \[$(tput sgr0)\]"
fi
