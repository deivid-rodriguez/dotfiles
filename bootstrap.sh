#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit

function download_it {
  curl -sSL https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > dotfiles/profile.d/prompt
}

function sync_it {
  rsync -ah --delete dotfiles/profile.d/ ~/.profile.d
  rsync -ah --delete dotfiles/completion.d/ ~/.completion.d
  rsync -ah dotfiles/config/ ~/.config
  rsync -ah dotfiles/local/ ~/.local

  files=$(find dotfiles -maxdepth 1 -mindepth 1 -type f)
  for f in $files
  do
    rsync -ah --delete "$f" "$HOME/.$(basename "$f")"
  done
}

# shellcheck disable=SC1090
function source_it {
  source "$HOME/.profile"
}

download_it
sync_it
source_it

unset download_it
unset sync_it
unset source_it
