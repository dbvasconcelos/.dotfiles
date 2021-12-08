# .profile: global environment settings for login shells

# Adds '~/.local/bin' to $PATH
export PATH="${PATH}:${HOME}/.local/bin"

# Default Programs
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="google-chrome-stable"
export READER="zathura"
export PAGER="less"
export OPENER="xdg-open"

# XDG Conf
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CACHE_HOME="${HOME}/.cache"

# Shell
export HISTFILE="${XDG_DATA_HOME}/history"
export HISTSIZE=1000000
export SAVEHIST=1000000

export INPUTRC="${XDG_CONFIG_HOME}/shell/inputrc"
export ALIASRC="${XDG_CONFIG_HOME}/shell/aliasrc"
export BOOKMARK_ALIASRC="${XDG_CONFIG_HOME}/shell/bookmark-aliasrc"

# GTK
export GTK_IM_MODULE=cedilla

# Fix Java on tiling window managers
export _JAVA_AWT_WM_NONREPARENTING=1

# XDG compliance
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export WGETRC="${XDG_CONFIG_HOME}/wget/wgetrc"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/pass"
export TREE_SITTER_DIR="${XDG_CONFIG_HOME}/tree-sitter"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export WINEPREFIX="${XDG_DATA_HOME}/wine/prefixes/default"
export MYSQL_HISTFILE="${XDG_CACHE_HOME}/mysql/mysql_history"

# NPM
export NVM_DIR="${XDG_CONFIG_HOME}/nvm"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"

# GoLang
export GOPATH="${XDG_DATA_HOME}/go"
export PATH="${PATH}:${GOPATH}/bin"
export GO111MODULE=on
export GODEBUG=cgocheck=0

# Docker
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export DOCKER_BUILDKIT=1

# Ask sudo password in dmenu
export SUDO_ASKPASS="${HOME}/.local/bin/askpass"

# FZF
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

# Less
export LESS=-R # only ANSI "color" escape sequences are output in "raw" form
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')" # start blink
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')" # start bold
export LESS_TERMCAP_me="$(printf '%b' '[0m')" # turn off bold, blink and underline
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')" # start standout (reverse video)
export LESS_TERMCAP_se="$(printf '%b' '[0m')" # stop standout
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')" # start underline
export LESS_TERMCAP_ue="$(printf '%b' '[0m')" # stop underline
export LESSHISTFILE="-" # No History
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null" # turn on highlight

# LF
LF_ICONS=$(sed ~/.config/lf/icons \
            -e '/^[ \t]*#/d'      \
            -e '/^[ \t]*$/d'      \
            -e 's/[ \t]\+/=/g'    \
            -e 's/$/ /')
export LF_ICONS=${LF_ICONS//$'\n'/:}
