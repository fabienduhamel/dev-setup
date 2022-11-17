#!/bin/bash

function link
{
    set +e
    rm "$2"
    set -e
    ln -s "$(pwd)/$1" "$2"
}

set -e
set -x

link aliases.zsh               ~/.oh-my-zsh/custom/aliases.zsh
link zsh-custom-agnoster-theme ~/.oh-my-zsh/custom/zsh-custom-agnoster-theme
link .gitconfig                ~/.gitconfig
link .gitignore_global         ~/.gitignore_global
link .zshrc                    ~/.zshrc
link .vimrc                    ~/.vimrc

