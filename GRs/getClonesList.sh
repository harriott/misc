#!/bin/bash
# vim: set fdl=1 sw=2:

# Joseph Harriott  Mon 13 Jan 2025

# $misc/GRs/getClonesList.sh
#  sourced from
#   $misc/GRs/DCGRs.sh
#   $vfv/getRepos/unix.sh

if [ $1 ]; then
  if [ -f $1 ]; then
    dotgits=$(find . -name '.git' | sort)
    for dotgit in $dotgits; do
      repo=${dotgit%/*}
      mapfile -t urls < <(grep url $dotgit/config) # also collects remote
      url=${urls[0]}
      url=${url/git@github.com:/https:\/\/github.com\/}
      url=${url%.git}
      echo "${repo:2} ${url:7}" >> $1  # adding to, so not obliterating my manual additions
    done
    echo "$1"
    sed -i 's/\r//' $1  # remove CRLF
    sort -uo $1 $1  # tidy up
  else
    echo "$1  should exist"
  fi
else
  echo '- needs  *.clones'
fi

