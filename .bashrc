# SOURCE THE STANDARD GLOBAL DEFINITIONS
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# ALIAS DEFINITIONS
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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
  # BREW
  export PATH=/usr/local/bin:$PATH
fi
