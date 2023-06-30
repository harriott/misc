#!/bin/bash
# vim: set fdl=1 tw=0:

# Joseph Harriott  Wed 05 Oct 2022

# Recursively find all  *.git  directories in  $GHrCl
# for each one, execute a  git pull, then copy over to  $GHrUse  on Dropbox.
# -------------------------------------------------------------------------
# $GHrCl  &  $GHrUse  are defined in  $Bash/export-jo
# bash $onGH/misc/GHreposPulls.sh

set -e  # quits on error

# There are a load of special cases mostly due to symlinks that I need to dereference for Dropbox
#  but there were also some with names that are illegal on MSWin.
# Check that symlinks are gone with  bash $onGH/misc/linux/symlinks_log.sh

#=> clones
# git clone https://github.com/amrali-eg/EncodingChecker $GHrCl/amrali-eg-EncodingChecker

#==> emacs
# git clone https://git.sr.ht/~bzg/worg $GHrCl/emacs/_bzg-worg
# git clone https://github.com/TobiasZawada/md-outline-list $GHrCl/emacs/TobiasZawada-md-outline-list
# git clone https://github.com/bbatsov/zenburn-emacs $GHrCl/emacs/bbatsov-zenburn-emacs
# git clone https://github.com/daviwil/dotfiles $GHrCl/emacs/daviwil-dotfiles
# git clone https://github.com/domtronn/all-the-icons.el $GHrCl/emacs/domtronn-all-the-icons.el
# git clone https://github.com/emacs-evil/evil $GHrCl/emacs/emacs-evil-evil
# git clone https://github.com/emacs-mirror/emacs $GHrCl/emacs/emacs-mirror-emacs
# git clone https://github.com/greduan/emacs-theme-gruvbox $GHrCl/emacs/greduan-emacs-theme-gruvbox
# git clone https://github.com/harriott/zenburn-emacs $GHrCl/emacs/harriott-zenburn-emacs
# git clone https://github.com/jakebox/jake-emacs $GHrCl/emacs/jakebox-jake-emacs
# git clone https://github.com/jekyll/minima $GHrCl/CP/Jekyll-jekyll-minima
# git clone https://github.com/joseph8th/literatemacs $GHrCl/emacs/joseph8th-literatemacs
# git clone https://github.com/jrblevin/markdown-mode $GHrCl/emacs/jrblevin-markdown-mode
# git clone https://github.com/jwiegley/use-package $GHrCl/emacs/jwiegley-use-package
# git clone https://github.com/kai2nenobu/emacs-dokuwiki-mode $GHrCl/emacs/kai2nenobu-emacs-dokuwiki-mode
# git clone https://github.com/noctuid/evil-guide $GHrCl/emacs/noctuid-evil-guide
# git clone https://github.com/plexus/chemacs2 $GHrCl/emacs/plexus-chemacs2

#==> linux
# git clone https://github.com/doronbehar/pistol $GHrCl/linux/doronbehar-pistol
# git clone https://github.com/getmail6/getmail6 $GHrCl/linux/mail/getmail6-getmail6
# git clone https://github.com/leo-arch/clifm $GHrCl/linux/leo-arch-clifm
# git clone https://github.com/majutsushi/urxvt-font-size $GHrCl/linux/tmux-fontSize/majutsushi-urxvt-font-size
# git clone https://github.com/rsnapshot/rsnapshot $GHrCl/linux/rsnapshot-rsnapshot
# git clone https://github.com/simmel/urxvt-resize-font $GHrCl/linux/tmux-fontSize/simmel-urxvt-resize-font
# git clone https://github.com/stefano-m/awesome-capslock_widget $GHrCl/linux/wm-awesome/stefano-m-awesome-capslock_widget
# git clone https://github.com/streetturtle/awesome-wm-widgets $GHrCl/linux/wm-awesome/streetturtle-awesome-wm-widgets

#===> Arch
# git clone https://git.sr.ht/~protesilaos/dotfiles $GHrCl/linux/Arch/protesilaos-dotfiles
# git clone https://gitlab.archlinux.org/archlinux/packaging/packages/pacman $GHrCl/linux/Arch/gitlab_archlinux_org-archlinux-packaging-packages-pacman
# git clone https://gitlab.archlinux.org/archlinux/packaging/packages/texlive-core $GHrCl/linux/Arch/gitlab_archlinux_org-archlinux-packaging-packages/texlive-core

#==> CP
# git clone https://github.com/OpenShot/openshot-qt $GHrCl/CP/OpenShot-openshot-qt
# git clone https://github.com/jgm/pandoc $GHrCl/CP/jgm-pandoc
# git clone https://github.com/rxi/json.lua $GHrCl/CP/rxi-json.lua
# git clone https://github.com/wfxr/code-minimap $GHrCl/CP/wfxr-code-minimap
# git clone https://github.com/reutenauer/polyglossia $GHrCl/CP/reutenauer-polyglossia
# git clone https://github.com/MartinThoma/LaTeX-examples/ $GHrCl/CP/MartinThoma-LaTeX-examples

#===> Ruby
# git clone https://github.com/rouge-ruby/rouge $GHrCl/CP/Ruby/rouge-ruby-rouge

#====> Jekyll
# git clone https://github.com/afaundez/jekyll-favicon $GHrCl/CP/Jekyll/afaundez-jekyll-favicon
# git clone https://github.com/mmistakes/minimal-mistakes $GHrCl/CP/Jekyll/mmistakes-minimal-mistakes
# git clone https://github.com/mmistakes/mm-github-pages-starter $GHrCl/CP/Jekyll/mmistakes-mm-github-pages-starter
# git clone https://github.com/jwarby/jekyll-pygments-themes $GHrCl/CP/Jekyll/jwarby-jekyll-pygments-themes
# git clone https://github.com/qian256/qian256.github.io/ $GHrCl/CP/Ruby/Jekyll/qian256-qian256_github_io
# git clone https://github.com/jasonemiller/jasonemiller.github.io $GHrCl/CP/Ruby/Jekyll/jasonemiller-jasonemiller.github.io
# git clone https://github.com/cloudify-cosmo/getcloudify.org $GHrCl/CP/Ruby/Jekyll/cloudify-cosmo-getcloudify.org
# git clone https://github.com/jekyll/jekyll $GHrCl/CP/Ruby/Jekyll/jekyll-jekyll

#===> Hugo
# git clone https://github.com/LukeSmithxyz/lugo $GHrCl/CP/Hugo/LukeSmithxyz-lugo
# git clone https://github.com/Vimux/Mainroad $GHrCl/CP/Hugo/Vimux-Mainroad
# git clone https://github.com/Vimux/blank $GHrCl/CP/Hugo/Vimux-blank
# git clone https://github.com/adityatelange/hugo-PaperMod $GHrCl/CP/adityatelange-hugo-PaperMod
# git clone https://github.com/adityatelange/hugo-PaperMod $GHrCl/CP/adityatelange-hugo-PaperMod
# git clone https://github.com/gohugoio/hugo $GHrCl/CP/Hugo/gohugoio-hugo
# git clone https://github.com/gohugoio/hugo-mod-bootstrap-scss $GHrCl/CP/Hugo/gohugoio-hugo-mod-bootstrap-scss
# git clone https://github.com/harriott/hugo-PaperMod $GHrCl/CP/Hugo/harriott-hugo-PaperMod
# git clone https://github.com/heyeshuang/hugo-theme-tokiwa $GHrCl/CP/Hugo/heyeshuang-hugo-theme-tokiwa
# git clone https://github.com/negrel/hugo-theme-pico $GHrCl/CP/Hugo/negrel-hugo-theme-pico
# git clone https://github.com/razonyang/hugo-theme-bootstrap $GHrCl/CP/Hugo/razonyang-hugo-theme-bootstrap
# git clone https://github.com/razonyang/hugo-theme-bootstrap-skeleton $GHrCl/CP/Hugo/razonyang-hugo-theme-bootstrap-skeleton
# git clone https://github.com/theNewDynamic/gohugo-theme-ananke $GHrCl/CP/Hugo/theNewDynamic-gohugo-theme-ananke
# git clone https://github.com/gohugoio/hugoThemesSite $GHrCl/CP/Hugo/gohugoio-hugoThemesSite

#===> Vim
# git clone https://github.com/Eckankar/vim-latex-folding $GHrCl/CP/vim/Eckankar/vim-latex-folding
# git clone https://github.com/kovisoft/slimv $GHrCl/vim-Lisp/kovisoft-slimv
# git clone https://github.com/lervag/vimtex $GHrCl/CP/vim/lervag-vimtex
# git clone https://github.com/rhysd/vim-gfm-syntax $GHrCl/CP/vim/rhysd-vim-gfm-syntax
# git clone https://github.com/vim/vim $GHrCl/CP/vim-vim
# git clone https://github.com/vlime/vlime $GHrCl/vim-Lisp/vlime-vlime

#=> pulls to  $GHrCl  &  syncs to  $GHrUse
if [ $host = 'sbMb' ]; then
    # rsync -iLrtv --delete $GHrUse/ $GHrCl  # if lost...

    # pulls to  $GHrCl
    # pull=no
    # start='./CP/MartinThoma-LaTeX-examples'
    # start='./CP/Ruby/Jekyll/jekyll-jekyll'
    # start='./linux/Arch/protesilaos-dotfiles'
    # start='./linux/dwt1-dotfiles'
    # start='./linux/leo-arch-clifm'
    pull=yes
    cd $GHrCl; pwd
    dotgits=$(find . -name '*.git' | sort)
    for dotgit in $dotgits; do
        repository=${dotgit%/*}
        echo $repository
        [[ $repository == $start ]] && pull=yes
        if [[ $pull == yes ]]; then
            echo "pulling ${tpf3b}$repository${tpfn}"
            cd $repository
            git pull
            if [[ $repository =~ nonexistant ]]; then
                false
            elif [[ $repository =~ LaTeX-examples ]]; then
                sy=publications/hasy/symbols
                for cc in $sy/AE $sy/O; do
                    [ -s $cc.pdf ] && mv $cc.pdf $cc-caps.pdf
                done
            elif [[ $repository =~ clifm ]]; then
                [ -s "src/aux.c" ] && mv src/aux.c src/aux-rNT.c
            elif [[ $repository =~ (jekyll|protesilaos) ]]; then
                fd -tl -HL -x unlink {} \; -x touch {}
            fi
            cd $GHrCl
        fi
        # [[ $pull == yes ]] && break  # when you want only one repository
    done

    # sync all to  $GHrUse
    cd $GHrUse; pwd
    read -p "going to rsync from ${tpf5}$GHrCl${tpfn}"
    set +e
    rsync -iLrtv --delete $GHrCl/ $GHrUse
    echo "${tpf3b}2nd rsync to highlight any errors${tpfn}"
    rsync -iLrtv --delete $GHrCl/ $GHrUse
    echo ${tpfn}

    exit
    # make repo-specific adjustments
    read -p "going to fix some repositories for Dropbox"
    mr () { echo "fixing ${tpf3b}$1${tpfn}"; mv $1 $1-c; }
    cpLrm () { cp -Lr $1-c $1; sudo rm -fr $1-c; }
    for dotgit in $dotgits; do
        repository=${dotgit%/*}
        if [[ $repository =~ nonexistant ]]; then
            mr $repository
            cpLrm $repository
        fi  # this functionality seems to be replaced by rsync's  -L
    done

else
    echo "not configured for ${tpf5}$host${tpfn}"
fi

