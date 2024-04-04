#!/bin/bash
# vim: set fdl=1:

# Joseph Harriott  Wed 05 Oct 2022

# Recursively find all  *.git  directories in  $GHrCl
# for each one, execute a  git pull, then copy over to  $GHrUse  on Dropbox.
# -------------------------------------------------------------------------
# $GHrCl  &  $GHrUse  are defined in  $Bash/export-jo
# bash $misc/GHreposPulls.sh

# du -hs $GHrUse

# du -s **/.git > du-bulk.txt  then  :%s/\t/  /  then  :sort n

set -e  # quits on error

# There are a load of special cases mostly due to symlinks that I need to dereference for Dropbox
#  but there were also some with names that are illegal on MSWin.
# Check that symlinks are gone with  bash $misc/linux/symlinks_log.sh

#=> clones
gcfbn='git clone --filter=blob:none'

#==> CP
# $gcfbn https://github.com/OpenShot/openshot-qt $GHrCl/CP/OpenShot-openshot-qt
# $gcfbn https://github.com/jgm/pandoc $GHrCl/CP/jgm-pandoc
# $gcfbn https://github.com/rxi/json.lua $GHrCl/CP/rxi-json.lua
# $gcfbn https://github.com/wfxr/code-minimap $GHrCl/CP/wfxr-code-minimap
# $gcfbn https://github.com/reutenauer/polyglossia $GHrCl/CP/reutenauer-polyglossia
# $gcfbn https://github.com/MartinThoma/LaTeX-examples/ $GHrCl/CP/MartinThoma-LaTeX-examples
# $gcfbn https://github.com/pypa/pipx $GHrCl/CP/pypa-pipx
# $gcfbn https://github.com/gnuplot/gnuplot $GHrCl/CP/gnuplot-gnuplot
# $gcfbn https://github.com/Gnuplotting/gnuplot-palettes $GHrCl/CP/Gnuplotting-gnuplot-palettes
# $gcfbn https://github.com/MikelSotomonte/mpv-waveform $GHrCl/CP/MikelSotomonte-mpv-waveform
# $gcfbn https://github.com/mfcc64/mpv-scripts $GHrCl/CP/mpv/mfcc64-mpv-scripts
# $gcfbn https://github.com/sharkdp/bat $GHrCl/CP/sharkdp-bat

#===> Go-Hugo
# $gcfbn https://github.com/LukeSmithxyz/lugo $GHrCl/CP/Hugo/LukeSmithxyz-lugo
# $gcfbn https://github.com/Vimux/Mainroad $GHrCl/CP/Hugo/Vimux-Mainroad
# $gcfbn https://github.com/Vimux/blank $GHrCl/CP/Hugo/Vimux-blank
# $gcfbn https://github.com/adityatelange/hugo-PaperMod $GHrCl/CP/adityatelange-hugo-PaperMod
# $gcfbn https://github.com/adityatelange/hugo-PaperMod $GHrCl/CP/adityatelange-hugo-PaperMod
# $gcfbn https://github.com/gohugoio/hugo-mod-bootstrap-scss $GHrCl/CP/Hugo/gohugoio-hugo-mod-bootstrap-scss
# $gcfbn https://github.com/harriott/hugo-PaperMod $GHrCl/CP/Hugo/harriott-hugo-PaperMod
# $gcfbn https://github.com/heyeshuang/hugo-theme-tokiwa $GHrCl/CP/Hugo/heyeshuang-hugo-theme-tokiwa
# $gcfbn https://github.com/negrel/hugo-theme-pico $GHrCl/CP/Hugo/negrel-hugo-theme-pico
#  couldn't pull, so  sudo rm -r $GHrCl/CP/Hugo/negrel-hugo-theme-pico
# $gcfbn https://github.com/razonyang/hugo-theme-bootstrap $GHrCl/CP/Hugo/razonyang-hugo-theme-bootstrap
# $gcfbn https://github.com/razonyang/hugo-theme-bootstrap-skeleton $GHrCl/CP/Hugo/razonyang-hugo-theme-bootstrap-skeleton
# $gcfbn https://github.com/theNewDynamic/gohugo-theme-ananke $GHrCl/CP/Hugo/theNewDynamic-gohugo-theme-ananke
# $gcfbn https://github.com/gohugoio/hugoThemesSite $GHrCl/CP/Hugo/gohugoio-hugoThemesSite
# $gcfbn https://github.com/chipzoller/hugo-clarity $GHrCl/CP/Hugo/chipzoller-hugo-clarity
# $gcfbn https://github.com/thegeeklab/hugo-geekdoc $GHrCl/CP/Hugo/thegeeklab-hugo-geekdoc
# $gcfbn https://github.com/rootwork/hugo-module-site $GHrCl/CP/Hugo/rootwork-hugo-module-site

#===> Go-lf
# $gcfbn https://github.com/gokcehan/lf $GHrCl/CP/gokcehan-lf
# $gcfbn https://codeberg.org/tplasdio/lf-config $GHrCl/CP/Go-lf/tplasdio-lf-config

#===> Ruby
# $gcfbn https://github.com/rouge-ruby/rouge $GHrCl/CP/Ruby/rouge-ruby-rouge

#====> Jekyll
# $gcfbn https://github.com/afaundez/jekyll-favicon $GHrCl/CP/Jekyll/afaundez-jekyll-favicon
# $gcfbn https://github.com/mmistakes/minimal-mistakes $GHrCl/CP/Jekyll/mmistakes-minimal-mistakes
# $gcfbn https://github.com/mmistakes/mm-github-pages-starter $GHrCl/CP/Jekyll/mmistakes-mm-github-pages-starter
# $gcfbn https://github.com/jwarby/jekyll-pygments-themes $GHrCl/CP/Jekyll/jwarby-jekyll-pygments-themes
# $gcfbn https://github.com/qian256/qian256.github.io/ $GHrCl/CP/Ruby/Jekyll/qian256-qian256_github_io
# $gcfbn https://github.com/jasonemiller/jasonemiller.github.io $GHrCl/CP/Ruby/Jekyll/jasonemiller-jasonemiller.github.io
# $gcfbn https://github.com/cloudify-cosmo/getcloudify.org $GHrCl/CP/Ruby/Jekyll/cloudify-cosmo-getcloudify.org
# $gcfbn https://github.com/jekyll/jekyll $GHrCl/CP/Ruby/Jekyll/jekyll-jekyll
# $gcfbn https://github.com/rfong/rflog $GHrCl/CP/Ruby/Jekyll/rfong-rflog

#===> Vim
# $gcfbn https://github.com/Eckankar/vim-latex-folding $GHrCl/CP/vim/Eckankar/vim-latex-folding
# $gcfbn https://github.com/kovisoft/slimv $GHrCl/vim-Lisp/kovisoft-slimv
# $gcfbn https://github.com/lervag/vimtex $GHrCl/CP/vim/lervag-vimtex
# $gcfbn https://github.com/rhysd/vim-gfm-syntax $GHrCl/CP/vim/rhysd-vim-gfm-syntax
# $gcfbn https://github.com/vim/vim $GHrCl/CP/vim-vim
# $gcfbn https://github.com/vlime/vlime $GHrCl/vim-Lisp/vlime-vlime
# $gcfbn https://github.com/preservim/tagbar $GHrCl/CP/Vim/preservim-tagbar
# $gcfbn https://github.com/lambdalisue/fern.vim $GHrCl/CP/Vim/lambdalisue-fern.vim
# $gcfbn https://github.com/Konfekt/vim-unicode-homoglyphs $GHrCl/CP/Vim/Konfekt-vim-unicode-homoglyphs
# $gcfbn https://github.com/vim-utils/vim-troll-stopper $GHrCl/CP/Vim/vim-utils-vim-troll-stopper
# $gcfbn https://github.com/nblock/vim-dokuwiki $GHrCl/CP/Vim/nblock-vim-dokuwiki

#==> emacs
# $gcfbn https://git.sr.ht/~bzg/worg $GHrCl/emacs/_bzg-worg
# $gcfbn https://github.com/TobiasZawada/md-outline-list $GHrCl/emacs/TobiasZawada-md-outline-list
# $gcfbn https://github.com/bbatsov/zenburn-emacs $GHrCl/emacs/bbatsov-zenburn-emacs
# $gcfbn https://github.com/daviwil/dotfiles $GHrCl/emacs/daviwil-dotfiles
# $gcfbn https://github.com/domtronn/all-the-icons.el $GHrCl/emacs/domtronn-all-the-icons.el
# $gcfbn https://github.com/emacs-evil/evil $GHrCl/emacs/emacs-evil-evil
# $gcfbn https://github.com/greduan/emacs-theme-gruvbox $GHrCl/emacs/greduan-emacs-theme-gruvbox
# $gcfbn https://github.com/jakebox/jake-emacs $GHrCl/emacs/jakebox-jake-emacs
# $gcfbn https://github.com/jekyll/minima $GHrCl/CP/Jekyll-jekyll-minima
# $gcfbn https://github.com/jrblevin/markdown-mode $GHrCl/emacs/jrblevin-markdown-mode
# $gcfbn https://github.com/jwiegley/use-package $GHrCl/emacs/jwiegley-use-package
# $gcfbn https://github.com/kai2nenobu/emacs-dokuwiki-mode $GHrCl/emacs/kai2nenobu-emacs-dokuwiki-mode
# $gcfbn https://github.com/noctuid/evil-guide $GHrCl/emacs/noctuid-evil-guide
# $gcfbn https://github.com/plexus/chemacs2 $GHrCl/emacs/plexus-chemacs2

#==> unix
# $gcfbn https://gitlab.com/rwxrob/dotfiles $GHrCl/unix/rwxrob-dotfiles
# $gcfbn https://github.com/simmel/urxvt-resize-font $GHrCl/unix/simmel-urxvt-resize-font
# $gcfbn https://github.com/jstkdng/ueberzugpp $GHrCl/unix/jstkdng-ueberzugpp

#===> linux
# $gcfbn https://github.com/boysetsfrog/vimpc $GHrCl/linux/boysetsfrog-vimpc
# $gcfbn https://github.com/doronbehar/pistol $GHrCl/linux/doronbehar-pistol
# $gcfbn https://github.com/fcambus/ansiweather $GHrCl/unix/linux/fcambus-ansiweather
# $gcfbn https://github.com/getmail6/getmail6 $GHrCl/linux/mail/getmail6-getmail6
# $gcfbn https://github.com/jarun/nnn $GHrCl/linux/jarun-nnn
# $gcfbn https://github.com/leo-arch/clifm $GHrCl/linux/leo-arch-clifm
# $gcfbn https://github.com/majutsushi/urxvt-font-size $GHrCl/linux/tmux-fontSize/majutsushi-urxvt-font-size
# $gcfbn https://github.com/rsnapshot/rsnapshot $GHrCl/linux/rsnapshot-rsnapshot
# $gcfbn https://github.com/simmel/urxvt-resize-font $GHrCl/linux/tmux-fontSize/simmel-urxvt-resize-font
# $gcfbn https://github.com/stefano-m/awesome-capslock_widget $GHrCl/linux/wm-awesome/stefano-m-awesome-capslock_widget
# $gcfbn https://github.com/streetturtle/awesome-wm-widgets $GHrCl/linux/wm-awesome/streetturtle-awesome-wm-widgets
# $gcfbn https://github.com/tats/w3m $GHrCl/linux/tats-w3m
# $gcfbn https://github.com/gsamokovarov/jump $GHrCl/linux/gsamokovarov-jump
# $gcfbn https://github.com/lukesmithxyz/voidrice $GHrCl/unix/linux/lukesmithxyz-voidrice
# $gcfbn https://github.com/trapd00r/LS_COLORS $GHrCl/unix/linux/trapd00r-LS_COLORS
# $gcfbn https://github.com/seebi/dircolors-solarized $GHrCl/unix/linux/seebi-dircolors-solarized

#====> Arch
# $gcfbn https://git.sr.ht/~protesilaos/dotfiles $GHrCl/linux/Arch/protesilaos-dotfiles
# $gcfbn https://gitlab.archlinux.org/archlinux/packaging/packages/pacman $GHrCl/linux/Arch/gitlab_archlinux_org-archlinux-packaging-packages-pacman
# $gcfbn https://gitlab.archlinux.org/archlinux/packaging/packages/texlive-core $GHrCl/linux/Arch/gitlab_archlinux_org-archlinux-packaging-packages/texlive-core

#===> tmux
# $gcfbn https://github.com/CrispyConductor/tmux-copy-toolkit $GHrCl/unix/tmux/CrispyConductor-tmux-copy-toolkit
# $gcfbn https://github.com/tmux-plugins/tmux-resurrect $GHrCl/unix/tmux/tmux-plugins-tmux-resurrect
# $gcfbn https://github.com/tmux-plugins/tmux-logging $GHrCl/unix/tmux/tmux-plugins-tmux-logging
# $gcfbn https://github.com/tmux-plugins/tmux-prefix-highlight $GHrCl/unix/tmux/tmux-plugins-tmux-prefix-highlight

#==> MSWin
# $gcfbn https://github.com/amrali-eg/EncodingChecker $GHrCl/amrali-eg-EncodingChecker
# $gcfbn https://github.com/jdhitsolutions/PSScriptTools $GHrCl/MSWin/jdhitsolutions-PSScriptTools
# $gcfbn https://github.com/Windos/BurntToast $GHrCl/MSWin/Windos-BurntToast
# $gcfbn https://github.com/bdukes/PowerShellModules $GHrCl/MSWin/dukes-PowerShellModules

#=> pulls to  $GHrCl  &  syncs to  $GHrUse
if [ $host = 'sbMb' ]; then
    # rsync -iLrtv --delete $GHrUse/ $GHrCl  # if lost...

    # Some repositories that won't cleanly pull:
    # ------------------------------------------

    # sudo rm -r $GHrCl/CP-emacs-emacs-mirror-emacs
    # $gcfbn https://github.com/emacs-mirror/emacs $GHrCl/CP-emacs-emacs-mirror-emacs

    # sudo rm -r $GHrCl/CP/Go/Hugo/gohugoio-hugo
    # $gcfbn https://github.com/gohugoio/hugo $GHrCl/CP/Go/Hugo/gohugoio-hugo

    # sudo rm -r $GHrCl/CP/emacs/syl20bnr-spacemacs
    # $gcfbn https://github.com/syl20bnr/spacemacs $GHrCl/CP/emacs/syl20bnr-spacemacs

    # sudo rm -r $GHrCl/CP/nomacs-nomacs
    # $gcfbn https://github.com/nomacs/nomacs $GHrCl/CP/nomacs-nomacs

    # sudo rm -r $GHrCl/unix/linux/BrodieRobertson-dotfiles
    # $gcfbn https://github.com/BrodieRobertson/dotfiles $GHrCl/unix/linux/BrodieRobertson-dotfiles

    # pulls to  $GHrCl
    # ----------------

    # pull=start  # uncomment to pull from a  $start
        # start='./CP-emacs-emacs-mirror-emacs'
        # start='./CP/emacs/syl20bnr-spacemacs'
        # start='./CP/jgm-pandoc'
        # start='./CP/MartinThoma-LaTeX-examples'
        # start='./CP/nomacs-nomacs'
        # start='./CP/Ruby/Jekyll/jekyll-jekyll'
        # start='./linux/Arch/protesilaos-dotfiles'
        # start='./linux/dwt1-dotfiles'
        # start='./linux/leo-arch-clifm'
        # start='./unix/linux/BrodieRobertson-dotfiles'
        # start='./unix/rwxrob-dotfiles'
    pull=GO  # uncomment to pull all

    cd $GHrCl; pwd
    dotgits=$(find . -name '.git' | sort)
    for dotgit in $dotgits; do
        repository=${dotgit%/*}
        # echo $repository
        [[ $repository == $start ]] && pull=GO
        if [[ $pull == GO ]]; then
            echo "pulling ${tpf3b}$repository${tpfn}"
            cd $repository
            git pull
            if [[ $repository =~ nonexistant ]]; then
                false
            elif [[ $repository =~ clifm ]]; then
                [ -s "misc/codecov/aux.c.gcov" ] &&
                    mv misc/codecov/aux.c.gcov misc/codecov/aux-rNT.c.gcov
                [ -s "src/aux.c" ] && mv src/aux.c src/aux-rNT.c
                [ -s "src/aux.h" ] && mv src/aux.h src/aux-rNT.h
                # fd aux $GHrCl/linux/leo-arch-clifm
            elif [[ $repository =~ (jekyll|protesilaos) ]]; then
                fd -tl -HL -x unlink {} \; -x touch {}
            elif [[ $repository =~ LaTeX-examples ]]; then
                sy=publications/hasy/symbols
                for cc in $sy/AE $sy/O; do
                    [ -s $cc.pdf ] && mv $cc.pdf $cc-caps.pdf
                done
            fi
            cd $GHrCl
        fi
        # [[ $pull == GO ]] && break  # when you want only one repository
    done

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

    # sync all to  $GHrUse
    # --------------------

    cd $GHrUse; pwd
    read -p "going to rsync from ${tpf5}$GHrCl${tpfn}"
    set +e
    rsync -iLrtv --delete $GHrCl/ $GHrUse
    echo "${tpf3b}2nd rsync to highlight any errors${tpfn}"
    rsync -iLrtv --delete $GHrCl/ $GHrUse
    echo ${tpfn}

    cp $GHrUse/CP/wfxr-code-minimap/completions/powershell/_code-minimap.ps1 $ITscc/forMSWin/code-minimap/_code-minimap.ps1
else
    echo "not configured for ${tpf5}$host${tpfn}"
fi

