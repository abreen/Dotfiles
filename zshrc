# vim: et:ts=2:sw=2

bindkey -e

export EDITOR=vim
alias edit="$EDITOR"
alias e=edit

alias l=ls
alias ll='ls -l'
alias la='ls -a'

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
source "$HOME/.zshrc-homebrew"
source "$HOME/.zshrc-ssh"
[[ -f "$HOME/.zshrc-work" ]] && source "$HOME/.zshrc-work"
