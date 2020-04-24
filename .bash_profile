if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

#export PS1='\[\e[32m\]\t \[\e[33m\]\W \[\e[0m\]\$ '
export PS1='\n\[\e[30;47m\] \D{%m/%d %H:%M:%S} \[\e[37;46m\]\[\e[30m\] \W \[\e[36;49m\]\[\e[0m\] '
