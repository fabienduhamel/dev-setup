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
plugins=(git safe-paste symfony2 composer bower docker docker-compose)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

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

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fix executable, ack installs itself as ack-grep on mint
command -v ack-grep &>/dev/null && FZF_EXECUTABLE="ack-grep" || FZF_EXECUTABLE="ack"
export FZF_DEFAULT_COMMAND="$FZF_EXECUTABLE -g '' --ignore-dir .git --ignore-dir Library --ignore-dir Cache --ignore-dir app/cache --ignore-dir .Trash"
# export FZF_DEFAULT_COMMAND='ag -l --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--height 15 --reverse --border'

# Better zsh git prompt with zsh-git-prompt
source $ZSH/custom/plugins/zsh-git-prompt/zshrc.sh
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR="%{$fg[black]%}  "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[black]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[magenta]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[black]%}%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[black]%}%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[black]%}%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{✔%G%}"
ZSH_THEME_GIT_PROMPT_MERGING="%{$fg[black]%}|MERGING%{${reset_color}%}%{$bg[yellow]%}"
ZSH_THEME_GIT_PROMPT_REBASE="%{$fg_bold[black]%} REBASE%{${reset_color}%}%{$bg[yellow]%} "

git_super_status() {
    precmd_update_git_vars

    if [ -n "$__CURRENT_GIT_STATUS" ]; then
        local STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_BRANCH$GIT_BRANCH"
        local clean=1

        if [ -n "$GIT_REBASE" ] && [ "$GIT_REBASE" != "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_REBASE$GIT_REBASE"
        elif [ "$GIT_MERGING" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_MERGING"
        fi

        if [ "$GIT_LOCAL_ONLY" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_LOCAL"
        elif [ "$ZSH_GIT_PROMPT_SHOW_UPSTREAM" -gt "0" ] && [ -n "$GIT_UPSTREAM" ] && [ "$GIT_UPSTREAM" != ".." ]; then
            local parts=( "${(s:/:)GIT_UPSTREAM}" )
            if [ "$ZSH_GIT_PROMPT_SHOW_UPSTREAM" -eq "2" ] && [ "$parts[2]" = "$GIT_BRANCH" ]; then
                GIT_UPSTREAM="$parts[1]"
            fi
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UPSTREAM_FRONT$GIT_UPSTREAM$ZSH_THEME_GIT_PROMPT_UPSTREAM_END"
        fi

        if [ "$GIT_BEHIND" -ne "0" ] || [ "$GIT_AHEAD" -ne "0" ]; then
            STATUS="$STATUS "
        fi
        if [ "$GIT_BEHIND" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BEHIND$GIT_BEHIND"
        fi
        if [ "$GIT_AHEAD" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD$GIT_AHEAD"
        fi

        STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"

        if [ "$GIT_STAGED" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED"
            clean=0
        fi
        if [ "$GIT_CONFLICTS" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS"
            clean=0
        fi
        if [ "$GIT_CHANGED" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED"
            clean=0
        fi
        if [ "$GIT_UNTRACKED" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED$GIT_UNTRACKED"
            clean=0
        fi
        # if [ "$GIT_STASHED" -ne "0" ]; then
        #     STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STASHED$GIT_STASHED"
        #     clean=0
        # fi
        if [ "$clean" -eq "1" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
        fi

        STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX%{${reset_color}%}%{$bg[yellow]%}"
        echo $STATUS
    fi
}

# Override agnoster theme
prompt_time () {
    prompt_segment black grey "%*"
}

prompt_status() {
  local -a symbols

  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘" || symbols+="%{%F{green}%}●"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}

prompt_git_super_status () {
    [ -z "$__CURRENT_GIT_STATUS" ] || prompt_segment yellow black " `git_super_status`"
}

build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_virtualenv
  prompt_time
  prompt_dir
  prompt_git_super_status
  prompt_bzr
  prompt_hg
  prompt_end
}
