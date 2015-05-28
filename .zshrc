################################################################
# Maintainer:
#       Edward Fitz Abucay
#       http://www.vastorigins.com
#
# Version:
#       1.0
#
# Repository:
#       http://github.com/soardex/pastel.git
#
################################################################

autoload -U colors
colors

##
# Auto-completion
##
autoload -U compinit
compinit
zmodload -i zsh/complist

setopt hash_list_all		# hash everything before completion
setopt complete_aliases		# complete aliases
setopt complete_in_word     # allow completion from within a word phrase
setopt always_to_end        # completion is performed with the cursor within a word, and a full completion is inserted, the cursor is moved to the end of the word

zstyle ':completion::complete:*' use-cache on			    # completion caching
zstyle ':completion:*' cache-path ~/.zsh/cache			    # completion cache path
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'	# ignore case
zstyle ':completion:*' menu select=2				        # menu if number of items > 2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*' group-name ''


##
# History
##
HISTFILE=~/.zsh_history     	# store history
HISTSIZE=3000			        # set history size to 3000
SAVEHIST=3000			        # set history to be save to 3000
setopt append_history		    # append
setopt hist_ignore_all_dups	    # no duplicate
setopt hist_reduce_blanks	    # trim blanks
setopt hist_verify		        # show before executing history commands
setopt inc_append_history	    # add commands as they are being execute
setopt share_history		    # share history between sessions

##
# Miscs
##
unsetopt beep			# no bell on error
unsetopt hist_beep		# no bell on error on history

setopt PROMPT_SUBST     # allow parameter expansion, command substitution and arithmetic expansions
PROMPT="[%{$fg[cyan]%}%n%{$fg[white]%}:%{$fg[green]%}%m%{$fg[white]%} %~]%# "

alias ls="ls --color=auto"
alias ll="ls -lah"
alias vi="vim"
alias gdb="gdb -silent"
alias irssi="TERM=screen-256color irssi"
alias pacman-upd="pacman -Syu --noconfirm"
alias pacman-get="pacman -S --noconfirm"

export PYTHONSTARTUP=$HOME/.pythonrc
export TERM="xterm-256color"
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$PATH

eval "$(rbenv init -)"
