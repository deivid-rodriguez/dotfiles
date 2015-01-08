#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function syncIt() {
  list=`find dotfiles -maxdepth 1 -mindepth 1`;

  for f in $list
  do
    cp -r $f ~/.$(basename $f);
  done
}

function sourceIt() {
  source ~/.bash_profile;
}

syncIt;
sourceIt;

unset syncIt;
unset sourceIt;
