#!/bin/bash

# replaces the target file with the file in this directory
# and creates a symlink

function link {
  set +e
  rm "$2"
  set -e
  ln -s "$(pwd)/$1" "$2"
}

set -e
set -x

link aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
link .p10k.zsh ~/.p10k.zsh
link .gitconfig ~/.gitconfig
link .gitignore_global ~/.gitignore_global
link .zshrc ~/.zshrc
link .config/atuin/config.toml ~/.config/atuin/config.toml
link .config/nvim/lua/config/lazy.lua ~/.config/nvim/lua/config/lazy.lua
link .config/nvim/lua/plugins/colorscheme.lua ~/.config/nvim/lua/plugins/colorscheme.lua
