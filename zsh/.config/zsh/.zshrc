# The individual ZSH per-interactive-shell startup file

# Disable paste highlighting
zle_highlight=('paste:none')

# Enable Completion
autoload -Uz compinit && compinit

# Auto completion of command line switches for aliases
setopt complete_aliases

# Allow navigation on completion menus
zstyle ':completion:*' menu select

# Auto completion with case insensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Include hidden files
zmodload zsh/complist
_comp_options+=(globdots)

# Remove path duplicates
typeset -U PATH path

# History Settings
setopt histignoredups histignorespace

# Automatically cd into typed directory
setopt autocd

# Disable ctrl-s to freeze terminal
stty stop undef

# Aliases
[ -f "${ALIASRC}" ] && source "${ALIASRC}"

# Bookmarks Aliases
[ -f "${BOOKMARK_ALIASRC}" ] && source "${BOOKMARK_ALIASRC}"

# Named Directories
export NAMEDDIRRC="${ZDOTDIR}/.znameddirs"
[ -f "${NAMEDDIRRC}" ] && source "${NAMEDDIRRC}"

# Exit even on partial line
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

## Plugins

# FZF
[ -f "/usr/share/fzf/key-bindings.zsh" ] && source "/usr/share/fzf/key-bindings.zsh"
[ -f "/usr/share/fzf/completion.zsh" ] && source "/usr/share/fzf/completion.zsh"

# Vi mode plugin
[ -f "/usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ] && source "/usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

# Auto Suggestions Plugin
[ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" ] && source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
bindkey '^ ' autosuggest-accept

# Syntax Highlighting Plugin
[ -f "/usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" ] && source "/usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

## Keybindings

# Menu navigation
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

# Prompt
eval "$(starship init zsh)"
