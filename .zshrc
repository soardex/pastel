autoload -Uz compinit
compinit

zstyle ':completion:*' menu select=2

HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000

PROMPT="[%n@%m %~]%# "

alias ls="ls --color=auto"
alias ll="ls -lah"
alias vi="vim"

export TERM="xterm-256color"
export PATH=$HOME/bin:$PATH
