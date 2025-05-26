#!/bin/bash

# Joseph Harriott  Tue 20 May 2025

# manage my downloaded collection of  Git  repositories

# $cGRs, $ITr  are exported in  $OSL/nodes/jo/export

# cd $cGRs; bash $misc/GRs/cGRs.sh

# du -hs $cGRs

# du -s **/.git > dot_git_sizes.txt  then  :%s/\t/  /  then  :sort n

set -e  # quits on error

#=> 0 last update check
cat "/$misc/GRs/cGRs-lu"
read -p "- good to continue? "

# #=> 1 optionally  rsync  $ITr/GRs  to  $cGRs
# read -p "going to rsync from ${tpf5}$ITr/GRs${tpfn} to ${tpf5}$cGRs${tpfn}"
# rsync -irtv --delete $ITr/GRs/ $cGRs  # because I might've made changes from another machine
# exit

#=> 2 last update append
echo "$(date +%y%m%d-%H%M%S) $host" >> /$misc/GRs/cGRs-lu

#=> 3 update  cGRs.clones
echo 'updating  $misc/GRs/cGRs.clones'
. $misc/GRs/getClonesList.sh $misc/GRs/cGRs.clones

#=> 4 remove
# some repositories that don't update easily

# sudo rm -r $cGRs/CP/emacs/daviwil-dotfiles
# sudo rm -r $cGRs/CP-emacs-emacs-mirror-emacs
# sudo rm -r $cGRs/CP/emacs/syl20bnr-spacemacs
# sudo rm -r $cGRs/CP/Go/Hugo/gohugoio-hugo
# sudo rm -r $cGRs/CP/jgm-pandoc
# sudo rm -r $cGRs/CP/nomacs-nomacs
# sudo rm -r $cGRs/CP/pypa-pipx
# sudo rm -r $cGRs/d-MSWin/r-jdhitsolutions-PSScriptTools
# sudo rm -r $cGRs/d-unix/d-linux/d-mail/r-rpuntaie-mailwizard
# sudo rm -r $cGRs/unix/linux/BrodieRobertson-dotfiles

#=> 5 git clone
while read cloneLine; do
  clone="${cloneLine%% *}"
  if ! [ -d $clone ]; then
    gcc="git clone --depth 1 ${cloneLine#* } ${cloneLine%% *}"
    echo "${tpf3b}$clone${tpfn}  not there, so"
    $gcc
  fi
done <"$misc/GRs/cGRs.clones"  # can prefix  test https://github.com/test

# #=> 6 update  $cGRs
# # sf='StartFrom'
# # sf='./CP-emacs-emacs-mirror-emacs'
# # sf='./CP/emacs/syl20bnr-spacemacs'
# # sf='./CP/jgm-pandoc'
# # sf='./CP/MartinThoma-LaTeX-examples'
# # sf='./CP/nomacs-nomacs'
# # sf='./CP/Ruby/Jekyll/jekyll-jekyll'
# # sf='./d-MSWin/r-jdhitsolutions-PSScriptTools'
# # sf='./d-unix/d-linux/d-mail/r-rpuntaie-mailwizard'
# # sf='./linux/Arch/protesilaos-dotfiles'
# # sf='./linux/dwt1-dotfiles'
# # sf='./linux/leo-arch-clifm'
# # sf='./unix/linux/BrodieRobertson-dotfiles'
# # sf='./unix/rwxrob-dotfiles'
# # sf=hugo-module-site
# # sf='no_repository'
# # sf='tjdevries-config_manager'
# # once=yes
# . $misc/GRs/update-depth1.sh $misc/GRs/cGRs-ud1-fixes.sh

#=> 7 symlinks in  $cGRs
# because Dropbox doesn't like symlinks...

echo "Broken symlinks:"
find . -xtype l
find . -xtype l -delete
echo "- removed"

# deref () { echo $1; mv $1 $1-c; cp -Lr $1-c $1; sudo rm -fr $1-c; }
# read -p "going to dereference some symlinks (for Dropbox)"
# for dotgit in $dotgits; do
    # repository=${dotgit%/*}
    # if [[ $repository =~ none ]]; then deref $repository fi
# done

# #=> 8 syncs to external drives
# source $misc/ITr/rsync.sh
read -p "going to rsync from ${tpf5}$cGRs${tpfn} to ${tpf5}$ITr/GRs${tpfn}"
set +e
rsync -iLrtv --delete $cGRs/ $ITr/GRs
echo "${tpf3b}2nd rsync to highlight any errors${tpfn}"
rsync -iLrtv --delete $cGRs/ $ITr/GRs
echo ${tpfn}

