#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")" || exit

if [ "$1" != 'local' ]
then
  git pull origin master
fi

function syncIt() {
  rsync -ah --delete dotfiles/profile.d/ ~/.profile.d
  rsync -ah --delete dotfiles/completion.d/ ~/.completion.d
  rsync -ah dotfiles/config/ ~/.config

  files=$(find dotfiles -maxdepth 1 -mindepth 1 -type f)
  for f in $files
  do
    rsync -ah --delete "$f" "$HOME/.$(basename "$f")"
  done
}

function sourceIt() {
  source "$HOME/.bash_profile"
}

syncIt
sourceIt

unset syncIt
unset sourceIt
