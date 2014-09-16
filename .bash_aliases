######################
# Alias List
#
# Author: Kyle Ames
# Updated June 12, 2014
# ####################

# COMMAND ALIAS LIST
if [[ $( uname ) == 'Darwin' ]]; then
    alias ls='ls -Gl'
    alias la='ls -Gla'
else
    alias ls='ls -l --color'
    alias la='ls -la --color'
fi

alias grep='grep --color -n'
alias obliterate='curl -XDELETE localhost:9200/_all && /opt/npulse/scripts/stage_kibana_index.sh && /opt/npulse/scripts/stage_cma_elastistats_dashboard.sh'

# ANY PROJECT SPECIFIC ALIASES
if [ -f ~/.project_aliases ]; then
    source ~/.project_aliases
fi
