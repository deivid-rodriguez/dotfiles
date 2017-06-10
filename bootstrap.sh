#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit

function sync_it {
  rsync -ah --delete dotfiles/profile.d/ ~/.profile.d
  rsync -ah --delete dotfiles/completion.d/ ~/.completion.d
  rsync -ah dotfiles/config/ ~/.config
  rsync -ah dotfiles/bin/ ~/.local/bin

  files=$(find dotfiles -maxdepth 1 -mindepth 1 -type f)
  for f in $files
  do
    rsync -ah --delete "$f" "$HOME/.$(basename "$f")"
  done
}

# shellcheck disable=SC1090
function source_it {
  source "$HOME/.bash_profile"
}

sync_it
source_it

unset sync_it
unset source_it
