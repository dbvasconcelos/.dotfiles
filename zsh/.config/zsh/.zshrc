# The individual ZSH per-interactive-shell startup file.

# Implicit change dir.
setopt AUTO_CD

# Glob sorting.
setopt NUMERIC_GLOB_SORT

# History Settings.
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Completion Settings.
autoload -Uz compinit && compinit
## Case insensitivity.
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
## Do not show completion menu, so fzf-tab can capture the unambiguous prefix.
zstyle ':completion:*' menu no

# Disable paste highlighting.
zle_highlight=('paste:none')

# Include hidden files.
_comp_options+=(globdots)

# Remove path duplicates.
typeset -U path PATH

# Disable ctrl-s to freeze terminal.
stty stop undef

# Aliases.
[ -f "${ALIASRC}" ] && source "${ALIASRC}"

# Exit even on partial line
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

## Plugins
plugins=(
	"/usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh"
	"/usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
	"/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
	"/usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh"
)
for plugin in "${plugins[@]}"; do
	[ -f "$plugin" ] && source "$plugin"
done

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

## Keybindings
# VI mode
bindkey -v
bindkey '^y' autosuggest-accept

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Starship Prompt
eval "$(starship init zsh)"
