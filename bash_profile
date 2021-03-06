#!/bin/bash

#
# If not running interactively, don't do anything
#
[ -z "$PS1" ] && return

#
# Set default editor
#
export EDITOR=nvim

#
# Set default terminal
#
export TERM=xterm-256color

#
# Smart pager
#
export PAGER="less"
export LESS="--no-init --quit-if-one-screen --raw-control-chars"

#
# Don't put duplicate lines or lines starting with space in the history. See
#
HISTCONTROL=ignoreboth

#
# Append to the history file, don't overwrite it
#
shopt -s histappend

#
# Set unlimited history length
#
HISTSIZE=
HISTFILESIZE=

#
# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
#
shopt -s checkwinsize

#
# Enable the "**" pattern used in a pathname expansion context to match all
# files and zero or more directories and subdirectories. NOTE: Requires bash 4
#
shopt -s globstar

#
# Make less more friendly for non-text input files, see lesspipe(1)
#
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

custom_folder="$HOME/.profile.d"

#
# General utilities
#

# shellcheck disable=SC1090
function load_general_utils {
  source "$custom_folder/utils"
  source "$custom_folder/paths"
  source "$custom_folder/prompt"
  source "$custom_folder/media"
  source "$custom_folder/git"
  source "$custom_folder/linuxbrew"
}

load_general_utils

unset load_general_utils

#
# Folder for local bins
#
PATH_append "$HOME/.local/bin"

# shellcheck disable=SC1090
function load_language_customizations {
  source "$custom_folder/latex"
  source "$custom_folder/ruby"
}

load_language_customizations

unset load_language_customizations

# shellcheck disable=SC1090
source "$HOME/.bash_aliases"

# shellcheck disable=SC1090
source "$HOME/.bash_completion"

#
# Set some color variables
#
turquoise='\[\033[49;36m\]'
blue='\[\033[01;34m\]'
yellow='\[\033[33m\]'
reset='\[\033[00m\]'

#
# Set custom prompt
#
PS1="$yellow\$(__git_ps1 '(%s) ')$turquoise\\u@\\h$blue \\w \\$ $reset"

#
# Activate direnv
#
eval "$(direnv hook bash)"
