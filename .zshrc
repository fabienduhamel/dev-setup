# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git safe-paste composer docker docker-compose aws helm kubectl)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# go
if [ -d /usr/local/go/bin ]; then
    export PATH=$PATH:/usr/local/go/bin
fi

if [ -d ~/bin ]; then
    export PATH=$PATH:~/bin
fi

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# For Git language
export LANGUAGE=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export TERM="xterm-256color"

# History search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^p" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey "^n" down-line-or-beginning-search

# load custom theme conf
[ -f "$ZSH_CUSTOM/zsh-custom-theme" ] && source $ZSH_CUSTOM/zsh-custom-theme

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fix executable, ack installs itself as ack-grep on mint
command -v ack-grep &>/dev/null && FZF_EXECUTABLE="ack-grep" || FZF_EXECUTABLE="ack"
export FZF_DEFAULT_COMMAND="$FZF_EXECUTABLE -g '' --ignore-dir .git --ignore-dir Library --ignore-dir Cache --ignore-dir app/cache --ignore-dir .Trash"
export FZF_DEFAULT_OPTS='--height 15 --reverse --border'

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# colorls
source $(dirname $(gem which colorls))/tab_complete.sh

# helm completion
command -v helm && source <(helm completion zsh)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fabien/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/fabien/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fabien/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/fabien/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

