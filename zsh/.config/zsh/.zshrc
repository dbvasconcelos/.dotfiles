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
setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks

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
plugins=(
	"zsh-vi-mode"
	"fast-syntax-highlighting"
	"zsh-autosuggestions"
)
for plugin in "${plugins[@]}"; do
	file="$(printf "/usr/share/zsh/plugins/%s/%s.plugin.zsh" "$plugin" "$plugin")"
	[ -f "$file" ] && source "$file"
done


keybindings() {
	## Keybindings
	bindkey '^ ' autosuggest-accept
	# Menu navigation
	bindkey -M menuselect '^h' vi-backward-char
	bindkey -M menuselect '^k' vi-up-line-or-history
	bindkey -M menuselect '^l' vi-forward-char
	bindkey -M menuselect '^j' vi-down-line-or-history
}

# Integrations
integrations() {
	#FZF
	fzf_completion="/usr/share/fzf/completion.zsh"
	[ -f "$fzf_completion" ] && source "$fzf_completion"
	fzf_keybindings="/usr/share/fzf/key-bindings.zsh"
	[ -f "$fzf_keybindings" ] && source "$fzf_keybindings"
}
zvm_after_init_commands+=(integrations keybindings)

# Python
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
[ -d "$PYENV_ROOT/bin" ] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Starship Prompt
eval "$(starship init zsh)"
