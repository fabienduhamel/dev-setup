#!/bin/bash

# source ~/.zshrc

BACKUP_DIR=`dirname $0`
ACTION=$1

function save
{
    cp "$1" "$BACKUP_DIR/$2"
}

function restore
{
    cp "$BACKUP_DIR/$2" "$1"
}

set -e
set -x

if [[ "$ACTION" == "--save" ]]; then
    save ~/.oh-my-zsh/custom/aliases.zsh aliases.zsh
    save ~/.gitconfig gitconfig
    save ~/.gitignore_global gitignore_global
    save ~/.zshrc zshrc
elif [[ "$ACTION" == "--restore" ]]; then
    restore ~/.oh-my-zsh/custom/aliases.zsh aliases.zsh
    restore ~/.gitconfig gitconfig
    restore ~/.gitignore_global gitignore_global
    restore ~/.zshrc zshrc
else
    echo "Choose '--save' or '--restore'"
    exit 1
fi
