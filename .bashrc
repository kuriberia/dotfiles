alias ls="ls -GF"
alias la="ls -A"
alias ll="ls -ohA"

cdls ()
{
    \cd "$@" && ls
}
alias cd="cdls"

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ..="cd .."
