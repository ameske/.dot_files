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
alias ls='ls -Gl'
alias la='ls -Gla'
alias grep='grep --color'

# ANY PROJECT SPECIFIC ALIASES
if [ -f ~/.project_aliases ]; then
    source ~/.project_aliases
fi
