#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

if [ "$1" != 'local' ]
then
  git pull origin master
fi

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

  links=`find dotfiles -maxdepth 1 -mindepth 1 -type l`
  for l in $links
  do
    dest=`readlink -f $l`
    ln -sf .$(basename $dest) ~/.$(basename $l)
  done
}

function sourceIt() {
  source ~/.bash_profile
}

syncIt
sourceIt

unset syncIt
unset sourceIt
