# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# git completion
source ~/.git-completion.bash

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/sam/.local/bin
alias pwd_base='pwd | rev | cut -d"/" -f 1 | rev'
PROMPT_COMMAND='echo -ne "\033]0;$TERM: `pwd_base`\007"'
PS1='\[\e[1;38m\]\#`if [ $? = 0 ]; then echo "\[\e[1;32m\] ✔ "; else echo "\[\e[1;31m\] ✘ "; fi`\[\e[1;36m\]\u\[\e[0m\]@\h \[\e[1;33m\]\W \[\e[0m\]\$ '

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
