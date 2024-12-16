# The individual ZSH per-interactive-shell startup file

# Completion
autoload -Uz compinit && compinit
# Auto completion of command line switches for aliases
setopt complete_aliases
# Auto completion with case insensitivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

# Disable paste highlighting
zle_highlight=('paste:none')

# Include hidden files
zmodload zsh/complist
_comp_options+=(globdots)

# Remove path duplicates
typeset -U PATH path

# History Settings
setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks

# Disable ctrl-s to freeze terminal
stty stop undef

# Aliases
[ -f "${ALIASRC}" ] && source "${ALIASRC}"

# Exit even on partial line
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

# Do the initialization when the script is sourced (i.e. Initialize instantly)
ZVM_INIT_MODE=sourcing

## Plugins
plugins=(
	"zsh-vi-mode"
	"fast-syntax-highlighting"
	"zsh-autosuggestions"
	"fzf-tab-git"
)
for plugin in "${plugins[@]}"; do
	file="$(printf "/usr/share/zsh/plugins/%s/%s.plugin.zsh" "$plugin" "${plugin%-git}")"
	[ -f "$file" ] && source "$file"
done

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Python Environments
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
[ -d "$PYENV_ROOT/bin" ] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

## Keybindings
# VI mode
bindkey -v
bindkey '^ ' autosuggest-accept

# Starship Prompt
eval "$(starship init zsh)"
