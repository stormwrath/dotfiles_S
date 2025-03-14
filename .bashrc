#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# My .bashrc
export EDITOR=vim
export TERM=xterm-256color
export COLORTERM=truecolor
HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoreboth	# ingore space and dups

shopt -s histappend

alias urlencode='python3 -c "import sys;from urllib import request as rq;print(rq.quote(sys.argv[1]))"'
alias urldecode='python3 -c "import sys;from urllib import request as rq;print(rq.unquote(sys.argv[1]))"'
set -o vi

source ~/.config/fzf/fzf.bash
[ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X" # boot up x-cmd.
eval "$(direnv hook bash)"
eval "$(zoxide init bash)"


