alias ls='eza'
alias ll='eza -l --icons'
alias top='btop'
alias lal='ls -lAh'
alias dua='du -sh `ls -A | grep . | cut -d "'" "'" -f6-`'

function meteo
{
    curl -4 "wttr.in/$1"
}

# Linux
alias clearswap="su -c 'swapoff -a && swapon -a'"

alias ping="prettyping"
alias cat="bat -pp --color=always --theme=ansi"
alias less="bat -p --color=always --theme=ansi"
alias please='sudo $(fc -ln -1)'

# Git
alias gnd='git diff --name-only'
compdef _git gnd=git-checkout
alias gu='git fetch --prune && git up'
alias gf='git fetch --tags && git blist'
alias gda='git diff --cached'
alias gs='git show'
alias gb='git blist'
alias gt='git tag'
alias grt='git remove-tags'
alias gbm='git branch --merged'
alias gbnm='git branch --no-merged'
alias gcm='git commit -m'
alias gcn='git commit --no-edit'
alias gcf='git commit --fixup'
alias gm='git merge --no-edit'
alias gmn='git merge --no-ff --no-edit'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gsta='git stash save -u'
alias glg='git lg'
alias gll='git ll'
alias gmb='git merge-base `git rev-parse --abbrev-ref HEAD`'

alias colorpalette='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done'

# git commit --fixup + rebase -i --autosquash (from a commit message)
function gcfrb
{
    local PATTERN="$1"
    if [[ -z $PATTERN ]]; then
        echo "Usage: $0 pattern"
        return 1
    fi

    local REBASE_HASH=$(git --no-pager log --pretty="%h %s" | grep -i -A1 "$PATTERN" | tail -n1 | cut -d" " -f1)

    if [[ -z $REBASE_HASH ]]; then
        echo "Pattern \"$PATTERN\" not found in git log."
        return 2
    fi

    git commit --fixup :/$PATTERN && GIT_SEQUENCE_EDITOR=true git rebase -ip $REBASE_HASH
}

# git tag and push
function gtp
{
    git tag -m "$1" $1 && git push origin $1
}

# increment the semver version as AECF pattern
function grr
{
    local BRANCH=`git rev-parse --abbrev-ref --symbolic-full-name @{u}`
    local QUESTION='git reset --hard '$BRANCH;
    read -q "REPLY?$QUESTION? (y/n) "
    if [ $REPLY = 'y' ]; then
        echo ""
        git reset --hard $BRANCH
    fi
}

function nexttag
{
    LEVEL=$1
    CURRENT_TAG=`git tag | sort -V | tail -1`
    if [[ $CURRENT_TAG = *"RC"* ]] && [[ -z $LEVEL ]]; then
        VERSION_PREFIX=$(sed -r 's/^(.+RC).+$/\1/' <<< $CURRENT_TAG)
        PRERELEASE_VERSION=$(sed -r 's/^.+RC([0-9]+)$/\1/' <<< $CURRENT_TAG)
        NEXT_PRERELEASE_VERSION=$(($PRERELEASE_VERSION+1))
        echo $VERSION_PREFIX$NEXT_PRERELEASE_VERSION
    else
        echo v$(semver -i $LEVEL $CURRENT_TAG)
    fi
}

# Max OS X aliases
if [ "$(uname -s)" = "Darwin" ]; then
    alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl -a -s"
    alias python="/usr/bin/python3"
fi

function vv
{
    [ -z "$1" ] && local FILE=$(fzf) || local FILE=$(cd "$1" && fzf)
    [ -z $FILE ] || vim $FILE
}

# Picture sorting

function pic-init-sort {
    mkdir -p mp4 raw jpg

    IFS=$'\n'


    for file in $(\ls | grep -E \.'(MP4|mp4)'); do
        mv "$file" mp4/
    done

    for file in $(\ls | grep -E \.'(JPG|jpg)'); do
        RAW="${file%.*}.RW2"
        if [ -e "$RAW" ]; then
            mv "$file" raw/
            mv "$RAW" raw/
        else
            mv "$file" jpg/
        fi
    done
}

function pic-clean-raws
{
    mkdir -p delete
    for file in $(\ls RAW | grep .RW2); do JPG=${file%.*}.JPG; ls . | grep -E "^$JPG$" && echo "$JPG exists" || mv RAW/$file delete ; done
}

function pic-clean-jpegs
{
    mkdir -p delete
    for file in $(\ls . | grep .JPG); do
        RAW=${file%.*}.RW2;
        \ls . | grep -E "$RAW$" && echo "$RAW exists" || mv $file delete/
    done
}
