#!/bin/bash

#
# Aliases for dir color support
#
if [ -x /usr/bin/dircolors ]; then
  eval "$(dircolors -b)"
  alias ls='ls --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

#
# Default options for rg
#
alias rg='rg --hidden --ignore-file ~/.ignore'
