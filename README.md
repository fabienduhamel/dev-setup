# dev-setup

Contains mandatory dotfiles and other stuff for personal dev :)

## How to

```sh
./link.sh      # Removes hard files and reates symbolic links
./unlink.sh    # Deletes symbolic links and recreates hard files
```

## Brew packages

```sh
# dev
brew install bat curl diff-so-fancy fzf gh jq yq ripgrep telnet tldr wget node yarn git-interactive-rebase-tool
# others
brew install WebPQuickLook borgbackup exiftool ffmpeg imagemagick rsync
```

## Others

```sh
# zsh-git-prompt
git clone https://github.com/zsh-git-prompt/zsh-git-prompt.git $ZSH_CUSTOM/plugins

# vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# colorls
sudo gem install colorls

# instant-markdown-d
sudo yarn global add instant-markdown-d
```
