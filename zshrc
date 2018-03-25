## zplug
## https://github.com/zplug/zplug/blob/master/doc/guide/ja/README.md
#export ZPLUG_HOME=/usr/local/opt/zplug
#source $ZPLUG_HOME/init.zsh
#zplug "soimort/translate-shell"
#
#if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#fi
#
#zplug load --verbose

#
# Zsh
#

## history search
setopt interactivecomments
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

## enable cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

## cancel ignore "echo -n"
unsetopt promptcr

#
# System
#

export TZ=JST-9 # make virus buster scan faster

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'

#
# Alias
#

alias vi='vim'

## finder
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

## git
alias gitmg="git branch | peco | xargs git merge"
alias gitrb="git branch | peco | xargs git rebase"
alias gitdm="git branch --merged development | grep -vE '^(\*.+)|(master|development|knock)$' | xargs git branch -d"
alias gitblg="git branch | awk '{ if (NF == 2) print $2 }' | xargs -I % git log --oneline --first-parent %"
alias gitcp="git log --oneline --branches | peco | awk '{print $1}' | xargs git cherry-pick"
alias gitrbi="git branch | awk '{ if (NF == 2) print $2 }' | xargs -I % git log --oneline --first-parent % | peco | awk '{ print $1; }' | xargs -o git rebase -i"

## docker
alias docstp="docker ps -a | peco | awk '{ print $1; }' | xargs docker stop"
alias docrmi="docker images | peco | awk '{ print $3 }' | xargs docker rmi"


#
# Development
#

## rbenv
eval "$(rbenv init -)"
export PATH="/usr/local/opt/libxml2/bin:$PATH"

# ## python
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

## node
export PATH=$HOME/.nodebrew/current/bin:$PATH

## go
export GOPATH=~/
export PATH=$GOPATH/bin:$PATH

## postgresql
PGDATA=/usr/local/var/postgres

## erlang/kerl, elixir/exenv
. /usr/local/kerl/19.3/activate
export PATH="$HOME/.exenv/bin:$PATH"
eval "$(exenv init -)"

## mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

## serverless
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/m1007/.nodebrew/node/v6.9.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/m1007/.nodebrew/node/v6.9.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh

# read bashrc(must be in bottom)
test -r ~/.bashrc && . ~/.bashrc
