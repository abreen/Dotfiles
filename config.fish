if status --is-login; and test -f $HOME/bin
    set PATH $PATH $HOME/bin
end

set GNUBIN /usr/local/opt/coreutils/libexec/gnubin
if test -d $GNUBIN
    set PATH $PATH $GNUBIN
end

set PLAN9 /usr/local/plan9
if test -d $PLAN9
    set -x PLAN9 $PLAN9
    set PATH $PATH $PLAN9/bin
end

set -x EDITOR vim

set fish_greeting
