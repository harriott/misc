#!/bin/bash
# vim: set fdl=1 tw=0:

# Joseph Harriott  Fri 05 Aug 2022

# Recursively find all *.git directories in  GHrepos
# for each one, execute a git pull, then copy over to  GHrepos  on Dropbox.
# -------------------------------------------------------------------------

set -e  # quits on error

# There are a load of special cases mostly due to symlinks that I need to dereference for Dropbox
#  but there were also some with names that are illegal on MSWin.
# Check that symlinks are gone with  bash $onGH/misc/linux/symlinks_log.sh

mr () { echo "fixing ${tpf3b}$1${tpfn}"; mv $1 $1-c; }
cpLrm () { cp -Lr $1-c $1; sudo rm -fr $1-c; }

if [ $host = 'sbMb' ]; then
    ITC=/mnt/SDU3D1TB/IT-Copied/unix-like/linux/GHrepos
    GHr=$cITh/unix-like/linux/GHrepos/
    # rsync -iLrtv $GHr/ $ITC  # if lost...
    cd $ITC; pwd
    dotgits=$(find . -name '*.git' | sort)
    for dotgit in $dotgits; do
        repository=${dotgit%/*}
        echo "pulling ${tpf3b}$repository${tpfn}"
        cd $repository; git pull; cd $ITC
    done
    cd $GHr; pwd
    read -p "going to rsync from ${tpf7}$ITC${tpfn}"
    rsync -iLrtv $ITC/ $GHr
    read -p "going to fix some repositories for Dropbox"
    for dotgit in $dotgits; do
        repository=${dotgit%/*}
        if [[ $repository =~ nonexistant ]]; then
            mr $repository
            cpLrm $repository
        fi  # this functionality seems to be replaced by rsync's  -L
    done  # this loop allows making repo-specific adjustments
else
    echo "not configured for ${tpf7}$host${tpfn}"
fi
echo ${tpfn}

# git clone https://github.com/AmosNimos/awesome
# git clone https://github.com/BrodieRobertson/dotfiles
# git clone https://github.com/ChrisTitusTech/titus-awesome
# git clone https://github.com/Eredarion/dotfiles
# git clone https://github.com/HikariKnight/material-awesome
# git clone https://github.com/JavaCafe01/dotfiles
# git clone https://github.com/Konfekt/vim-mutt-aliases
# git clone https://github.com/WillPower3309/awesome-dotfiles
# git clone https://github.com/actionless/awesome_config
# git clone https://github.com/alfunx/.dotfiles
# git clone https://github.com/awesomeWM/awesome
# git clone https://github.com/baszoetekouw/pinfo
# git clone https://github.com/lcpz/awesome-copycats
# git clone https://github.com/lcpz/lain
# git clone https://github.com/makccr/dot
# git clone https://github.com/manilarome/thunderblurred
# git clone https://github.com/material-shell/material-awesome
# git clone https://github.com/ranger/ranger
# git clone https://github.com/rpuntaie/mailwizard
# git clone https://github.com/valr/cbatticon
# git clone https://github.com/worron/awesome-config
# git clone https://github.com/worron/redflat
# git clone https://github.com/xinhaoyuan/layout-machi
# git clone https://gitlab.com/LukeSmithxyz/mutt-wizard
# git clone https://gitlab.com/dwt2/dotfiles
