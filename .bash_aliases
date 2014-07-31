######################
# Alias List
#
# Author: Kyle Ames
# Updated June 12, 2014
# ####################

# SSH ALIAS LIST
alias goodman='ssh goodman'
alias madison='ssh madison'
alias zaneshowker='ssh zaneshowker'

# COMMAND ALIAS LIST
if [[ $( uname ) == 'Darwin' ]]; then
    alias ls='ls -Gl'
    alias la='ls -Gla'
else
    alias ls='ls -l --color'
    alias la='ls -la --color'
fi

alias grep='grep --color'

# ANY PROJECT SPECIFIC ALIASES
if [ -f ~/.project_aliases ]; then
    source ~/.project_aliases
fi
