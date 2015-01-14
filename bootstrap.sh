#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

git pull origin master

function syncIt() {
  dirs=`find dotfiles -maxdepth 1 -mindepth 1 -type d`

  for d in $dirs
  do
    cp -r $d/. ~/.$(basename $d)
  done

  files=`find dotfiles -maxdepth 1 -mindepth 1 -type f`
  for f in $files
  do
    cp -r $f ~/.$(basename $f)
  done
}

function sourceIt() {
  source ~/.bash_profile
}

syncIt
sourceIt

unset syncIt
unset sourceIt
