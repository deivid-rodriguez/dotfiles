#!/bin/bash

export SHELLCHECK_OPTS="-e SC1090 -e SC2015"

cd $HOME

shellcheck -x -s bash .bashrc .bash_profile .completion.d/* .profile .profile.d/*
