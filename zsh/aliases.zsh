# GREP IN COLOR, WITH EGREP
alias grep='egrep --color -n'

# LS ALIASES BASED ON OS
if [[ $( uname ) == 'Darwin' ]]; then
    alias ls='ls -Gl'
    alias la='ls -Gla'
else
    alias ls='ls -l --color'
    alias la='ls -la --color'
fi
