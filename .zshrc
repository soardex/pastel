autoload -U colors
colors

##
# Auto-completion
##
autoload -U compinit
compinit

setopt hash_list_all		# hash everything before completion
setopt completealiases		# complete aliases

zstyle ':completion::complete:*' use-cache on			# completion caching
zstyle ':completion:*' cache-path ~/.zsh/cache			# completion cache path
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'	# ignore case
zstyle ':completion:*' menu select=2				# menu if number of items > 2

##
# History
##
HISTFILE=~/.zsh_history     	# store history
HISTSIZE=3000			# set history size to 3000
SAVEHIST=3000			# set history to be save to 3000
setopt append_history		# append
setopt hist_ignore_all_dups	# no duplicate
setopt hist_reduce_blanks	# trim blanks
setopt hist_verify		# show before executing history commands
setopt inc_append_history	# add commands as they are being execute
setopt share_history		# share history between sessions

##
# Miscs
##
unsetopt beep			# no bell on error
unsetopt hist_beep		# no bell on error on history

PROMPT="[%{$fg[cyan]%}%n%{$fg[white]%}:%{$fg[green]%}%m%{$fg[white]%} %~]%# "

alias ls="ls --color=auto"
alias ll="ls -lah"
alias vi="vim"

export TERM="xterm-256color"
export PATH=$HOME/bin:$PATH
