#!/usr/bin/env sh

shellcheck \
  bin/shellcheck.sh \
  bootstrap.sh \
  dotfiles/bash_aliases \
  dotfiles/bash_completion \
  dotfiles/bash_profile \
  dotfiles/profile \
  dotfiles/profile.d/git \
  dotfiles/profile.d/latex \
  dotfiles/profile.d/linuxbrew \
  dotfiles/profile.d/media \
  dotfiles/profile.d/paths \
  dotfiles/profile.d/ruby \
  dotfiles/profile.d/utils
