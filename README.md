# dev-setup

Contains mandatory dotfiles and other stuff for personal dev :)

## How to

```sh
./link.sh      # Removes hard files and reates symbolic links
./unlink.sh    # Deletes symbolic links and recreates hard files
```

## ZSH installation

Follow:

- [https://ohmyz.sh/#install](https://ohmyz.sh/#install)
- [https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#installation](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#installation)

### Fonts

Download [MesloLG Nerd Font](https://www.nerdfonts.com/font-downloads).

### Theme

Import themes from `iterm2/` folder.

### Setings

Import settings from `iterm2/` folder.

## Brew packages

```sh
# dev
brew install bat curl diff-so-fancy fzf gh jq yq ripgrep telnet tldr wget node yarn git-interactive-rebase-tool prettyping ack ag btop atuin fx tabiew eza zoxide fd hub
# others
brew install WebPQuickLook borgbackup exiftool ffmpeg imagemagick rsync
```

## Others

Neovim/lazyvim instead?

```sh
# zsh-autosuggestions (optional)
# https://github.com/zsh-users/zsh-autosuggestions
brew install zsh-autosuggestions

# vim (abandoned for nvim)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# instant-markdown-d
sudo yarn global add instant-markdown-d
```

[BrightIntosh](https://www.brightintosh.de/) app for XDR brightness on MacOS.

