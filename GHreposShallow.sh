#!/bin/bash
# vim: set fdl=1:

# Joseph Harriott  Fri 22 Mar 2024

# Recursively find all  *.git  directories, remove them and re-clone   --depth 1
# - useless, as explained below

# reduced my  $GHrCl  from  8.6G  down to  3.7G
# reduced my  $vfp  from  295M  down to  83M

# bash $misc/GHreposShallow.sh

dotgits=$(find . -name '.git' | sort)
    for dotgit in $dotgits; do
        repository=${dotgit%/*}
        echo "shallowing ${tpf3b}$repository${tpfn}"
        url=$(grep url $dotgit/config)
        sudo rm -r $repository
        git clone --depth 1 ${url:7} $repository
    done

# unfortunately subsequent  git pull --depth 1  get this message:
# hint: You have divergent branches and need to specify how to reconcile them.
# hint: You can do so by running one of the following commands sometime before
# hint: your next pull:
# hint:
# hint:   git config pull.rebase false  # merge
# hint:   git config pull.rebase true   # rebase
# hint:   git config pull.ff only       # fast-forward only
# hint:
# hint: You can replace "git config" with "git config --global" to set a default
# hint: preference for all repositories. You can also pass --rebase, --no-rebase,
# hint: or --ff-only on the command line to override the configured default per
# hint: invocation.
# fatal: Need to specify how to reconcile divergent branches.

