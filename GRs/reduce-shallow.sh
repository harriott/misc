#!/bin/bash
# vim: set fdl=1:

# Joseph Harriott  Thu 02 May 2024

# Recursively find all  *.git  directories, remove them and re-clone   --depth 1

# reduced my  $DCGRs  from  8.6G  down to  3.7G
# reduced my  $DCGRs (--filter=blob:none)  from  5.0G  down to  1.2G
# reduced my  $vimfiles  from  206M  down to  152M

# rsync -irtv --delete $vimfiles/ $Storage/Play0/vf
# rsync -irtv --delete $vimfiles/vim/ $Storage/Play0/vv
# rsync -irtv --delete $Storage/Play0/vf/ $vimfiles

# bash $misc/GHreposShallow.sh

# cd $Storage/Play0/vf/
get=GO  # comment out to get from  $start
start=vader.vim
dotgits=$(find . -name '.git' | sort)
    for dotgit in $dotgits; do
        dgf=${dotgit%/*}
        repository=${dgf:2}
        [[ $repository =~ $start ]] && get=GO
        if [[ $get == GO ]]; then
            if wget -q --spider google.com; then
                echo "shallowing ${tpf3b}$repository${tpfn}"
                url=$(grep url $dotgit/config)
                sudo rm -r $repository
                git clone --depth 1 ${url:7} $repository
            else
                exit
            fi
        fi
    done

# subsequent  git pull --depth 1  get this message:
#  hint: You have divergent branches and need to specify how to reconcile them.
#  hint: You can do so by running one of the following commands sometime before
#  hint: your next pull:
#  hint:
#  hint:   git config pull.rebase false  # merge
#  hint:   git config pull.rebase true   # rebase
#  hint:   git config pull.ff only       # fast-forward only
#  hint:
#  hint: You can replace "git config" with "git config --global" to set a default
#  hint: preference for all repositories. You can also pass --rebase, --no-rebase,
#  hint: or --ff-only on the command line to override the configured default per
#  hint: invocation.
#  fatal: Need to specify how to reconcile divergent branches.

