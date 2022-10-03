#!/bin/bash
# vim: set fdl=1 tw=0:

# Joseph Harriott  Fri 05 Aug 2022

# Recursively find all *.git directories in  $GHrCl
# for each one, execute a git pull, then copy over to  $GHrUse  on Dropbox.
# -------------------------------------------------------------------------
# $GHrCl  &  $GHrUse  are defined in  $Bash/export-jo
# bash $onGH/misc/GHreposPulls.sh

set -e  # quits on error

# There are a load of special cases mostly due to symlinks that I need to dereference for Dropbox
#  but there were also some with names that are illegal on MSWin.
# Check that symlinks are gone with  bash $onGH/misc/linux/symlinks_log.sh

mr () { echo "fixing ${tpf3b}$1${tpfn}"; mv $1 $1-c; }
cpLrm () { cp -Lr $1-c $1; sudo rm -fr $1-c; }

# git clone https://github.com/amrali-eg/EncodingChecker $GHrCl/amrali-eg-EncodingChecker
# git clone https://github.com/bbatsov/zenburn-emacs $GHrCl/emacs/bbatsov-zenburn-emacs
# git clone https://github.com/daviwil/dotfiles $GHrCl/emacs/daviwil-dotfiles
# git clone https://github.com/domtronn/all-the-icons.el $GHrCl/emacs/domtronn-all-the-icons.el
# git clone https://github.com/emacs-evil/evil $GHrCl/emacs/emacs-evil-evil
# git clone https://github.com/emacs-mirror/emacs $GHrCl/emacs/emacs-mirror-emacs
# git clone https://github.com/getmail6/getmail6 $GHrCl/linux/mail/getmail6-getmail6
# git clone https://github.com/greduan/emacs-theme-gruvbox $GHrCl/emacs/greduan-emacs-theme-gruvbox
# git clone https://github.com/harriott/zenburn-emacs $GHrCl/emacs/harriott-zenburn-emacs
# git clone https://github.com/jakebox/jake-emacs $GHrCl/emacs/jakebox-jake-emacs
# git clone https://github.com/joseph8th/literatemacs $GHrCl/emacs/joseph8th-literatemacs
# git clone https://github.com/jrblevin/markdown-mode $GHrCl/emacs/jrblevin-markdown-mode
# git clone https://github.com/jwiegley/use-package $GHrCl/emacs/jwiegley-use-package
# git clone https://github.com/kai2nenobu/emacs-dokuwiki-mode $GHrCl/emacs/kai2nenobu-emacs-dokuwiki-mode
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

if [ $host = 'sbMb' ]; then
    # rsync -iLrtv --delete $GHrUse/ $GHrCl  # if lost...

    cd $GHrCl; pwd
    dotgits=$(find . -name '*.git' | sort)
    for dotgit in $dotgits; do
        repository=${dotgit%/*}
        echo "pulling ${tpf3b}$repository${tpfn}"
        cd $repository
        git pull
        if [[ $repository =~ nonexistant ]]; then
            false
        elif [[ $repository =~ clifm ]]; then
            [ -s "src/aux.c" ] && mv src/aux.c src/aux-rNT.c
        elif [[ $repository =~ protesilaos ]]; then
            fd -tl -HL -x unlink {} \; -x touch {}
        fi
        cd $GHrCl
    done

    cd $GHrUse; pwd
    read -p "going to rsync from ${tpf5}$GHrCl${tpfn}"
    set +e
    rsync -iLrtv --delete $GHrCl/ $GHrUse
    echo "${tpf3b}2nd rsync to highlight any errors${tpfn}"
    # read -p "incase there were errors, now re-rsync from ${tpf5}$GHrCl${tpfn} to see them"
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
    echo "not configured for ${tpf5}$host${tpfn}"
fi

