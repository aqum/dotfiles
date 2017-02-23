# Path to your oh-my-zsh installation.
export ZSH=/Users/adam/.oh-my-zsh

# oh-my-zsh variables
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"

plugins=(git wd git-flow)

source $ZSH/oh-my-zsh.sh

# default editor
EDITOR='vim'

# up/down partial search
bindkey '^K' up-line-or-search
bindkey '^J' down-line-or-search

# Aliases
# docker
alias dc="sudo docker-compose"
alias dcr="dc run --rm"

# misc
alias serve="python -m SimpleHTTPServer"
