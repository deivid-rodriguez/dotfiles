#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit

function download_it {
  curl -sSL https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > profile.d/prompt
  curl -sSL https://git.zx2c4.com/password-store/plain/src/completion/pass.bash-completion > completion.d/pass
}

function sync_it {
  rsync -ah --delete profile.d/ ~/.profile.d
  rsync -ah --delete completion.d/ ~/.completion.d
  rsync -ah config/ ~/.config
  rsync -ah local/ ~/.local

  files=(
    irbrc
    bash_completion
    profile
    ruby-version
    bash_aliases
    pryrc
    byebugrc
    gemrc
    bash_profile
  )

  for f in "${files[@]}"
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
