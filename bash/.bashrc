# SOURCE THE STANDARD GLOBAL DEFINITIONS
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# GLOBAL (ALL MACHINES) ALIAS DEFINITIONS
if [ -f ~/.dot_files/bash/global_aliases ]; then
    . ~/.dot_files/bash/global_aliases
fi

# LOCAL (MACHINE SPECIFIC) ALIAS DEFINITIONS
if [ -f ~/.dot_files/bash/local_aliases ]; then
    . ~/.dot_files/bash/local_aliases
fi

# COLOR THE MAN PAGES
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m' # end the info box
export LESS_TERMCAP_so=$'\E[01;42;30m' # begin the info box
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# HOMEBREW
if [[ $( uname ) == 'Darwin' ]]; then
  export PATH=/usr/local/bin:$PATH
fi
