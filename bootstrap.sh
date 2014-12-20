#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function syncIt() {
  rsync --exclude ".git/" --exclude "bootstrap.sh" \
        --exclude "LICENSE" -avh --no-perms . ~;
}

function sourceIt() {
  source ~/.bash_profile;
}

syncIt;
sourceIt;

unset syncIt;
unset sourceIt;
