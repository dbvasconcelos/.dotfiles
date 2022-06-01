#!/bin/sh

# FZF fuzzy finder
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

# ASDF Runtime proxy
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/asdfrc"
export ASDF_DIR="/opt/asdf-vm"
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# Golang
export GOPATH="$XDG_DATA_HOME/go"
PATH="$PATH:$GOPATH/bin"

# Ruby
if [ -x "$(command -v ruby)" ]; then
  GEM_HOME="$(ruby -e 'puts Gem.user_dir')" && export GEM_HOME
  PATH="$PATH:$GEM_HOME/bin"
fi
