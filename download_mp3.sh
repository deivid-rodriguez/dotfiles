#!/bin/bash

#
# Pass a url with containing mp3 links and all of them will be downloaded to
# the current directory.
#
# @example
#
#  ./download_mp3.sh http://bohemianbetyars.hu/release/stone-soup/
#
wget $1 -O - | grep -oh "http[^ ]*.mp3" | wget -i -
