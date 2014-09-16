# GREP IN COLOR, WITH EGREP
alias grep='egrep --color -n'

# LS ALIASES BASED ON OS
if [[ $( uname ) == 'Darwin' ]]; then
    alias ls='ls -Glh'
    alias la='ls -Glah'
else
    alias ls='ls -lh --color'
    alias la='ls -lah --color'
fi

# SUFFIX ALIASES
alias -s go=vim
alias -s c=vim
alias -s tex=vim
alias -s py=vim
alias -s txt=vim
alias -s sh=bash
alias -s yml=vim

alias go='nocorrect go'
