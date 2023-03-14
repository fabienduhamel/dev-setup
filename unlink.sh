#!/bin/bash

function unlink
{
    set +e
    rm "$1"
    set -e
    cp "$(pwd)/$2" "$1"
}

set -e
set -x

unlink ~/.oh-my-zsh/custom/aliases.zsh      aliases.zsh
unlink ~/.oh-my-zsh/custom/zsh-custom-theme zsh-custom-theme
unlink ~/.gitconfig                         .gitconfig
unlink ~/.gitignore_global                  .gitignore_global
unlink ~/.zshrc                             .zshrc
unlink ~/.vimrc                             .vimrc

