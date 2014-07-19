# User specific aliases and functions

if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

HISTFILE=~/.histfile            # where to store history
HISTSIZE=1000
SAVEHIST=1000                   

autoload -Uz compinit colors
compinit                        # turn on command completion
colors                          # turn on colors

PROMPT="%{$fg_no_bold[magenta]%}%m %{$fg_no_bold[blue]%}%~ %{$reset_color%}"

alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias motd="cat /etc/motd"
alias today="date +%F"

alias v="vim"
alias g="git"
alias l="ls"
