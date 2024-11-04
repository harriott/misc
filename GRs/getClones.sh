#!/bin/bash
# vim: set fdl=1 sw=2:

# Joseph Harriott  Mon 21 Oct 2024

# $misc/GRs/getClones.sh
# sourced from
#  $misc/GRs/DCGRs.sh
#  $vfv/getRepos/unix.sh

if [ $1 ]; then
  if [ -f $1 ]; then
    dotgits=$(find . -name '.git' | sort)
    for dotgit in $dotgits; do
      repository=${dotgit%/*}
      mapfile -t urls < <(grep url $dotgit/config) # also collects remote
      url=${urls[0]}
      url=${url/git@github.com:/https:\/\/github.com\/}
      url=${url%.git}
      echo "${repository:2} ${url:7}" >> $1
    done
    sort -uo $1 $1
  else
    echo "$1  should exist"
  fi
else
  echo '- needs  all.clones'
fi

