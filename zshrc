# vim: et:ts=2:sw=2

export EDITOR=vim
alias edit="$EDITOR"
alias e=edit

alias l=ls
alias ll='ls -l'
alias v=vim

alias g=git
alias gf='git fetch'
alias gp='git pull'
alias gP='git push'
alias gd='git diff'
alias gC='git commit -m'
alias gc='git checkout'
alias ga='git add'
alias gs='git status'
alias gl='git log'

source "$HOME/.zshrc-term"
[[ -f "$HOME/.zshrc-work" ]] && source "$HOME/.zshrc-work"
