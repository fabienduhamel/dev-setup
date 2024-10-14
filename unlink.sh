#!/bin/bash

# removes the file in current filesystem
# and replaces it with a new copy of the file in this directory

function unlink {
  set +e
  rm "$1"
  set -e
  cp "$(pwd)/$2" "$1"
}

set -e
set -x

unlink ~/.oh-my-zsh/custom/aliases.zsh aliases.zsh
unlink ~/.p10k.zsh .p10k.zsh
unlink ~/.gitconfig .gitconfig
unlink ~/.gitignore_global .gitignore_global
unlink ~/.zshrc .zshrc
unlink ~/.vimrc .vimrc
unlink ~/.config/atuin/config.toml .config/atuin/config.toml
unlink ~/.config/nvim/lua/config/lazy.lua .config/nvim/lua/config/lazy.lua
unlink ~/.config/nvim/lua/plugins/colorscheme.lua .config/nvim/lua/plugins/colorscheme.lua
