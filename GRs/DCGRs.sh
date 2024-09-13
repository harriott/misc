#!/bin/bash

# Joseph Harriott  Thu 09 May 2024

# manage my downloaded collection of  Git  repositories

# $CITGRs  is exported in  $machBld/export-machine
# $DCGRs  is exported in  $AjB/export-jo

# bash $misc/GRs/DCGRs.sh

# du -hs $DCGRs

# du -s **/.git > dot_git_sizes.txt  then  :%s/\t/  /  then  :sort n

set -e  # quits on error

cd $CITGRs; pwd

#=> 0 clones
# gc='git clone'
gc='git clone --depth 1'
# gc='git clone --filter=blob:none'  # seems to cause too many errors on pulls

#==> 0 clone

#==> 1 re-clone
# sudo rm -r $CITGRs/CP/emacs/daviwil-dotfiles
# $gc https://github.com/daviwil/dotfiles $CITGRs/CP/emacs/daviwil-dotfiles

# sudo rm -r $CITGRs/CP-emacs-emacs-mirror-emacs
# $gc https://github.com/emacs-mirror/emacs $CITGRs/CP-emacs-emacs-mirror-emacs

# sudo rm -r $CITGRs/CP/emacs/syl20bnr-spacemacs
# $gc https://github.com/syl20bnr/spacemacs $CITGRs/CP/emacs/syl20bnr-spacemacs

# sudo rm -r $CITGRs/CP/Go/Hugo/gohugoio-hugo
# $gc https://github.com/gohugoio/hugo $CITGRs/CP/Go/Hugo/gohugoio-hugo

# sudo rm -r $CITGRs/CP/jgm-pandoc
# $gc https://github.com/jgm/pandoc $CITGRs/CP/jgm-pandoc

# sudo rm -r $CITGRs/CP/nomacs-nomacs
# $gc https://github.com/nomacs/nomacs $CITGRs/CP/nomacs-nomacs

# sudo rm -r $CITGRs/CP/pypa-pipx
# $gc https://github.com/pypa/pipx $CITGRs/CP/pypa-pipx

# sudo rm -r $CITGRs/unix/linux/BrodieRobertson-dotfiles
# $gc https://github.com/BrodieRobertson/dotfiles $CITGRs/unix/linux/BrodieRobertson-dotfiles

#=> 2 updates  $CITGRs
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
. $misc/GRs/update-depth1.sh $misc/GRs/update-fixes.sh

#=> 3 symlinks in  $CITGRs
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

#=> 4 sync to  $DCGRs
# rsync -iLrtv --delete $CITGRs/ $DCGRs  # if lost...

read -p "going to rsync from ${tpf5}$CITGRs${tpfn} to ${tpf5}$DCGRs${tpfn}"
set +e
rsync -iLrtv --delete $CITGRs/ $DCGRs
echo "${tpf3b}2nd rsync to highlight any errors${tpfn}"
rsync -iLrtv --delete $CITGRs/ $DCGRs
echo ${tpfn}

#=> 5 advise to check for symlinks
echo 'now maybe  bash $misc/linux/slJH.sh'
echo

