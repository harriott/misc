#!/bin/bash

# Joseph Harriott  Mon 21 Oct 2024

# depth=1 update a load of cloned  Git  repositories from their remotes

# $misc/GRs/update-depth1.sh
#  sourced from
#   $misc/GRs/DCGRs.sh
#   $vfv/getRepos/unix/get.sh

[ $rd ] || rd=$PWD  # root directory
[ -f repos ] && rm repos
[ $sf ] || update=GO  # start from  echo $sf
dotgits=$(find . -name '.git' | sort)
for dotgit in $dotgits; do
    cd $rd
    rrp=${dotgit%/*}
    repository=${rrp:2}
    echo $repository >> repos
    [[ $repository =~ "$sf" ]] && update=GO
    if [[ $update == GO ]]; then
        echo "fetch ${tpf3b}$repository${tpfn}"
        cd $rd/$repository
        mapfile -t fetched < <(git fetch --depth 1 -v 2>&1); echo "${fetched[-1]}"
        if [[ ! ${fetched[-1]} =~ = ]]; then
            echo "reset & clean ${tpf3b}$repository${tpfn}"
            reset=$(git reset --hard $(git remote show)/$(git branch --show-current) 2>&1 |tee)
            echo "$reset"
            [[ $reset =~ fatal ]] && exit
            git clean -dfx
        fi
    fi
    [ -s "$1" ] && . $1
    [[ $update == GO ]] && [ $once ] && exit
done
cd $rd
sort -uo repos repos

