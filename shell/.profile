# .zprofile: global environment settings for zsh login shells

# Adds '~/.local/bin' to $PATH
export PATH="$PATH:$HOME/.local/bin"

# Default Programs
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="google-chrome-stable"
export READER="zathura"
export PAGER="less"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export OPENER="xdg-open"

# XDG Conf
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Shell
export HISTFILE="$XDG_DATA_HOME/shell_history"
export HISTSIZE=1000000
export SAVEHIST=1000000
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export ALIASRC="$XDG_CONFIG_HOME/shell/aliasrc"
export BOOKMARK_ALIASRC="$XDG_CONFIG_HOME/shell/bookmark-aliasrc"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/shell/starship_prompt.toml"

# GTK
export GTK_IM_MODULE=cedilla

# QT
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# Fix Java on tiling window managers
export _JAVA_AWT_WM_NONREPARENTING=1

# ASDF runtime proxy
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/asdfrc"
export ASDF_DIR="/opt/asdf-vm"
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# XDG compliance
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/npm/node_repl_history"
export TREE_SITTER_DIR="$XDG_CONFIG_HOME/tree-sitter"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export WINEPREFIX="$XDG_DATA_HOME/wine/prefixes/default"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/cuda"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export PERL_CPANM_HOME="$XDG_DATA_HOME/cpanm"

# GoLang
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Ruby
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# Ask sudo password in dmenu
export SUDO_ASKPASS="$HOME/.local/bin/askpass"

# FZF
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

# Less
export LESSHISTFILE="-" # No History
