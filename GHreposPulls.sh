#!/bin/bash
# vim: set fdl=1 tw=0:

# Joseph Harriott  Fri 05 Aug 2022

# Recursively find all *.git directories in  $GHrCl
# for each one, execute a git pull, then copy over to  $GHrUse  on Dropbox.
# -------------------------------------------------------------------------
# $GHrCl  is defined in  $machBld/export-machine
# $GHrUse  is defined in  $Bash/export-jo
# bash $onGH/misc/GHreposPulls.sh

set -e  # quits on error

# There are a load of special cases mostly due to symlinks that I need to dereference for Dropbox
#  but there were also some with names that are illegal on MSWin.
# Check that symlinks are gone with  bash $onGH/misc/linux/symlinks_log.sh

mr () { echo "fixing ${tpf3b}$1${tpfn}"; mv $1 $1-c; }
cpLrm () { cp -Lr $1-c $1; sudo rm -fr $1-c; }

# git clone https://github.com/daviwil/dotfiles $GHrCl/emacs/daviwil-dotfiles
# git clone https://github.com/emacs-evil/evil $GHrCl/emacs/emacs-evil-evil
# git clone https://github.com/emacs-mirror/emacs $GHrCl/emacs/emacs-mirror-emacs
# git clone https://github.com/getmail6/getmail6 $GHrCl/linux/mail/getmail6-getmail6
# git clone https://github.com/greduan/emacs-theme-gruvbox $GHrCl/emacs/greduan-emacs-theme-gruvbox
# git clone https://github.com/jakebox/jake-emacs $GHrCl/emacs/jakebox-jake-emacs
# git clone https://github.com/joseph8th/literatemacs $GHrCl/emacs/joseph8th-literatemacs
# git clone https://github.com/jrblevin/markdown-mode $GHrCl/emacs/jrblevin-markdown-mode
# git clone https://github.com/jwiegley/use-package $GHrCl/emacs/jwiegley-use-package
# git clone https://github.com/kovisoft/slimv $GHrCl/vim-Lisp/kovisoft-slimv
# git clone https://github.com/leo-arch/clifm $GHrCl/linux/leo-arch-clifm
# git clone https://github.com/noctuid/evil-guide $GHrCl/emacs/noctuid-evil-guide
# git clone https://github.com/plexus/chemacs2 $GHrCl/emacs/plexus-chemacs2
# git clone https://github.com/vlime/vlime $GHrCl/vim-Lisp/vlime-vlime
# git clone https://github.com/streetturtle/awesome-wm-widgets $GHrCl/linux/wm-awesome/streetturtle-awesome-wm-widgets
# git clone https://github.com/rxi/json.lua $GHrCl/CP/rxi-json.lua
# git clone https://github.com/TobiasZawada/md-outline-list $GHrCl/emacs/TobiasZawada-md-outline-list
# git clone https://github.com/vim/vim $GHrCl/CP/vim-vim
# git clone https://git.sr.ht/~bzg/worg $GHrCl/emacs/_bzg-worg
# git clone https://git.sr.ht/~protesilaos/dotfiles $GHrCl/linux/Arch/protesilaos-dotfiles
git clone https://github.com/kai2nenobu/emacs-dokuwiki-mode $GHrCl/emacs/kai2nenobu-emacs-dokuwiki-mode

if [ $host = 'sbMb' ]; then
    # rsync -iLrtv --delete $GHrUse/ $GHrCl  # if lost...
    cd $GHrCl; pwd
    dotgits=$(find . -name '*.git' | sort)
    for dotgit in $dotgits; do
        repository=${dotgit%/*}
        echo "pulling ${tpf3b}$repository${tpfn}"
        cd $repository; git pull; cd $GHrCl
    done
    cd $GHrUse; pwd
    read -p "going to rsync from ${tpf7}$GHrCl${tpfn}"
    rsync -iLrtv --delete $GHrCl/ $GHrUse
    echo ${tpfn}; exit
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


# in  $GHrCl:

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

