#!/bin/bash
# vim: set fdl=1:

# Joseph Harriott  Sat 23 Mar 2024

# Recursively find all  *.git  directories, remove them and re-clone  --filter=blob:none

# reduced my  $cGRs  from  8.6G  down to  4.9G
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
#  $cGRs/CP/MartinThoma-LaTeX-examples
#  $cGRs/CP/OpenShot-openshot-qt
#  $cGRs/CP-Ruby-Jekyll/cloudify-cosmo-getcloudify.org
#  $cGRs/CP-Ruby-Jekyll/jasonemiller-jasonemiller.github.io
#  $cGRs/CP-Ruby-Jekyll/qian256-qian256_github_io
#  $cGRs/CP-Ruby-Jekyll/rfong-rflog
#  $cGRs/MSWin/jdhitsolutions-PSScriptTools
#  $cGRs/unix/linux/Arch/makccr-dot
#  $cGRs/unix/linux/wm-awesome/WillPower3309-awesome-dotfiles
# got this:
#  warning: Clone succeeded, but checkout failed.
#  You can inspect what was checked out with 'git status'
#  and retry with 'git restore --source=HEAD :/'
# followed by a helpful blank line
# they're fixed by  git checkout

# These repositories:
#  $vfp/packs-cp/opt/vim-markdown
#  $vfp/packs-cp/opt/vim-tagbar
#  $vfp/packs-unix/opt/vim-hexokinase
# fail due to tricky url's

