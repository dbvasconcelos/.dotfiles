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

# Window Title
autoload -Uz add-zsh-hook
function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}
function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}
if [[ "$TERM" == (alacritty*|gnome*|konsole*|putty*|rxvt*|screen*|tmux*|xterm*|st*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

## Plugins

# Vi mode plugin
[ -f "/usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ] && source "/usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

# Auto Suggestions Plugin
[ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" ] && source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
bindkey '^ ' autosuggest-accept

# Syntax Highlighting Plugin
[ -f "/usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" ] && source "/usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

# Programing Language Runtime Proxy
[ -f "/opt/asdf-vm/asdf.sh" ] && source "/opt/asdf-vm/asdf.sh"

# Dynamic JAVA_HOME
[ -f "$ASDF_DATA_DIR/plugins/java/set-java-home.zsh" ] && source "$ASDF_DATA_DIR/plugins/java/set-java-home.zsh"

# LF cd
[ -f "/usr/share/lf/lfcd.sh" ] && source "/usr/share/lf/lfcd.sh"

## Keybindings

# Menu navigation
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

# Ctrl+t to fzf select file
[ -f "/usr/share/fzf/key-bindings.zsh" ] && source "/usr/share/fzf/key-bindings.zsh"

# Ctrl+r to fzf search history
[ -f "/usr/share/fzf/completion.zsh" ] && source "/usr/share/fzf/completion.zsh"

# Ctrl+f to LF cd
bindkey -s '^o' 'lfcd\n'

# Ctrl+g to fzf switch directory
bindkey -s '^g' 'cd "$(dirname "$(fzf)")"\n'

# Prompt
eval $(starship init zsh)
