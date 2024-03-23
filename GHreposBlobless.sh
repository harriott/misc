#!/bin/bash
# vim: set fdl=1:

# Joseph Harriott  Sat 23 Mar 2024

# Recursively find all  *.git  directories, remove them and re-clone  --filter=blob:none

# reduced my  $GHrCl  from  8.6G  down to  4.9G
# reduced my  $vfp  from  295M  down to  116M

# bash $misc/GHreposBlobless.sh

dotgits=$(find . -name '.git' | sort)
    for dotgit in $dotgits; do
        repository=${dotgit%/*}
        echo "de-blob-ing ${tpf3b}$repository${tpfn}"
        url=$(grep url $dotgit/config)
        echo ${url:7}
        sudo rm -r $repository
        git clone --filter=blob:none ${url:7} $repository
    done

# These repositories:
#  $GHrCl/CP/MartinThoma-LaTeX-examples
#  $GHrCl/CP/OpenShot-openshot-qt
#  $GHrCl/CP-Ruby-Jekyll/cloudify-cosmo-getcloudify.org
#  $GHrCl/CP-Ruby-Jekyll/jasonemiller-jasonemiller.github.io
#  $GHrCl/CP-Ruby-Jekyll/qian256-qian256_github_io
#  $GHrCl/CP-Ruby-Jekyll/rfong-rflog
#  $GHrCl/MSWin/jdhitsolutions-PSScriptTools
#  $GHrCl/unix/linux/Arch/makccr-dot
#  $GHrCl/unix/linux/wm-awesome/WillPower3309-awesome-dotfiles
# got this:
#  warning: Clone succeeded, but checkout failed.
#  You can inspect what was checked out with 'git status'
#  and retry with 'git restore --source=HEAD :/'
# followed by a helpful blank line
# they're fixed by  git checkout

