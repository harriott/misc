#!/bin/bash

# Joseph Harriott  lun 11 nov 2024

# manage my downloaded collection of  Git  repositories

# $CITGRs  is exported in  $machBld/export-machine
# $DCGRs  is exported in  $OSL/export-jo

# cd $CITGRs; bash $misc/GRs/DCGRs.sh

# du -hs $DCGRs

# du -s **/.git > dot_git_sizes.txt  then  :%s/\t/  /  then  :sort n

set -e  # quits on error

#=> 1 create  DCGRs.clones
. $misc/GRs/getClonesList.sh $misc/GRs/DCGRs.clones

# #=> 2 rsync  $DCGRs  to  $CITGRs
# rsync -irtv --delete $DCGRs/ $CITGRs  # because I might've made changes from another machine

#=> 3 remove
# some repositories that don't update easily

# sudo rm -r $CITGRs/CP/emacs/daviwil-dotfiles
# sudo rm -r $CITGRs/CP-emacs-emacs-mirror-emacs
# sudo rm -r $CITGRs/CP/emacs/syl20bnr-spacemacs
# sudo rm -r $CITGRs/CP/Go/Hugo/gohugoio-hugo
# sudo rm -r $CITGRs/CP/jgm-pandoc
# sudo rm -r $CITGRs/CP/nomacs-nomacs
# sudo rm -r $CITGRs/CP/pypa-pipx
# sudo rm -r $CITGRs/unix/linux/BrodieRobertson-dotfiles

#=> 4 git clone
while read cloneLine; do
  clone="${cloneLine%% *}"
  if ! [ -d $clone ]; then
    gcc="git clone --depth 1 ${cloneLine#* } ${cloneLine%% *}"
    echo "${tpf3b}$clone${tpfn}  not there, so"
    $gcc
  fi
done <"$misc/GRs/DCGRs.clones"  # can prefix  test https://github.com/test

#=> 5 update  $CITGRs
# sf='StartFrom'
# sf='./CP-emacs-emacs-mirror-emacs'
# sf='./CP/emacs/syl20bnr-spacemacs'
# sf='./CP/jgm-pandoc'
# sf='./CP/MartinThoma-LaTeX-examples'
# sf='./CP/nomacs-nomacs'
# sf='./CP/Ruby/Jekyll/jekyll-jekyll'
# sf='./linux/Arch/protesilaos-dotfiles'
# sf='./linux/dwt1-dotfiles'
# sf='./linux/leo-arch-clifm'
# sf='./unix/linux/BrodieRobertson-dotfiles'
# sf='./unix/rwxrob-dotfiles'
# sf=hugo-module-site
# sf='no_repository'
# sf='tjdevries-config_manager'
# once=yes
. $misc/GRs/update-depth1.sh $misc/GRs/DCGRs-ud1-fixes.sh

#=> 6 symlinks in  $CITGRs
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

#=> 7 sync to  $DCGRs
read -p "going to rsync from ${tpf5}$CITGRs${tpfn} to ${tpf5}$DCGRs${tpfn}"
set +e
rsync -iLrtv --delete $CITGRs/ $DCGRs
echo "${tpf3b}2nd rsync to highlight any errors${tpfn}"
rsync -iLrtv --delete $CITGRs/ $DCGRs
echo ${tpfn}

#=> 8 advise to check for symlinks
echo 'now maybe  bash $misc/linux/slJH.sh'
echo

