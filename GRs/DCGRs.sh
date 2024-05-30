#!/bin/bash

# Joseph Harriott  Thu 09 May 2024

# manage my downloaded collection of  Git  repositories

# $CITGRs  is exported in  $machBld/export-machine
# $DCGRs  is exported in  $Bash/export-jo

# bash $misc/GRs/DCGRs.sh

# du -hs $DCGRs

# du -s **/.git > dot_git_sizes.txt  then  :%s/\t/  /  then  :sort n

set -e  # quits on error

cd $CITGRs; pwd

#=> 0 clones
# gc='git clone'
gc='git clone --depth 1'
# gc='git clone --filter=blob:none'  # seems to cause too many errors on pulls

#==> 0 CP
# $gc https://github.com/OpenShot/openshot-qt $CITGRs/CP/OpenShot-openshot-qt
# $gc https://github.com/rxi/json.lua $CITGRs/CP/rxi-json.lua
# $gc https://github.com/wfxr/code-minimap $CITGRs/CP/wfxr-code-minimap
# $gc https://github.com/reutenauer/polyglossia $CITGRs/CP/reutenauer-polyglossia
# $gc https://github.com/MartinThoma/LaTeX-examples/ $CITGRs/CP/MartinThoma-LaTeX-examples
# $gc https://github.com/gnuplot/gnuplot $CITGRs/CP/gnuplot-gnuplot
# $gc https://github.com/Gnuplotting/gnuplot-palettes $CITGRs/CP/Gnuplotting-gnuplot-palettes
# $gc https://github.com/MikelSotomonte/mpv-waveform $CITGRs/CP/MikelSotomonte-mpv-waveform
# $gc https://github.com/mfcc64/mpv-scripts $CITGRs/CP/mpv/mfcc64-mpv-scripts
# $gc https://github.com/sharkdp/bat $CITGRs/CP/sharkdp-bat
# $gc https://github.com/catppuccin/latex $CITGRs/CP/catppuccin/latex
# $gc https://github.com/tjdevries/config_manager $CITGRs/CP/tjdevries-config_manager

#===> Go-Hugo
# $gc https://github.com/LukeSmithxyz/lugo $CITGRs/CP/Hugo/LukeSmithxyz-lugo
# $gc https://github.com/Vimux/Mainroad $CITGRs/CP/Hugo/Vimux-Mainroad
# $gc https://github.com/Vimux/blank $CITGRs/CP/Hugo/Vimux-blank
# $gc https://github.com/adityatelange/hugo-PaperMod $CITGRs/CP/adityatelange-hugo-PaperMod
# $gc https://github.com/adityatelange/hugo-PaperMod $CITGRs/CP/adityatelange-hugo-PaperMod
# $gc https://github.com/gohugoio/hugo-mod-bootstrap-scss $CITGRs/CP/Hugo/gohugoio-hugo-mod-bootstrap-scss
# $gc https://github.com/harriott/hugo-PaperMod $CITGRs/CP/Hugo/harriott-hugo-PaperMod
# $gc https://github.com/heyeshuang/hugo-theme-tokiwa $CITGRs/CP/Hugo/heyeshuang-hugo-theme-tokiwa
# $gc https://github.com/negrel/hugo-theme-pico $CITGRs/CP/Hugo/negrel-hugo-theme-pico
#  couldn't pull, so  sudo rm -r $CITGRs/CP/Hugo/negrel-hugo-theme-pico
# $gc https://github.com/razonyang/hugo-theme-bootstrap $CITGRs/CP/Hugo/razonyang-hugo-theme-bootstrap
# $gc https://github.com/razonyang/hugo-theme-bootstrap-skeleton $CITGRs/CP/Hugo/razonyang-hugo-theme-bootstrap-skeleton
# $gc https://github.com/theNewDynamic/gohugo-theme-ananke $CITGRs/CP/Hugo/theNewDynamic-gohugo-theme-ananke
# $gc https://github.com/gohugoio/hugoThemesSite $CITGRs/CP/Hugo/gohugoio-hugoThemesSite
# $gc https://github.com/chipzoller/hugo-clarity $CITGRs/CP/Hugo/chipzoller-hugo-clarity
# $gc https://github.com/thegeeklab/hugo-geekdoc $CITGRs/CP/Hugo/thegeeklab-hugo-geekdoc
# $gc https://github.com/rootwork/hugo-module-site $CITGRs/CP/Hugo/rootwork-hugo-module-site

#===> Go-lf
# $gc https://github.com/gokcehan/lf $CITGRs/CP/gokcehan-lf
# $gc https://codeberg.org/tplasdio/lf-config $CITGRs/CP/Go-lf/tplasdio-lf-config

#===> Nvim
# $gc https://github.com/nvim-lua/kickstart.nvim $CITGRs/CP/Nvim/nvim-lua-kickstart.nvim
# $gc https://github.com/dam9000/kickstart-modular.nvim $CITGRs/CP/Nvim/dam9000-kickstart-modular.nvim
# $gc https://github.com/cpow/cpow-dotfiles $CITGRs/CP/Nvim/cpow-cpow-dotfiles
# $gc https://github.com/LunarVim/LunarVim $CITGRs/CP/Nvim/LunarVim-LunarVim
# $gc https://github.com/kevinfengcs88/nvim $CITGRs/CP/Nvim/kevinfengcs88-nvim
# $gc https://github.com/neovim/nvim-lspconfig $CITGRs/CP/Nvim/neovim-nvim-lspconfig
# $gc https://github.com/neovim/neovim $CITGRs/CP/Nvim/neovim-neovim
# $gc https://github.com/williamboman/mason.nvim $CITGRs/CP/Nvim/williamboman-mason.nvim
# $gc https://github.com/alextricity25/nvim_weekly_plugin_configs $CITGRs/CP/Nvim/alextricity25-nvim_weekly_plugin_configs

#===> Ruby
# $gc https://github.com/rouge-ruby/rouge $CITGRs/CP/Ruby/rouge-ruby-rouge

#====> Jekyll
# $gc https://github.com/afaundez/jekyll-favicon $CITGRs/CP/Jekyll/afaundez-jekyll-favicon
# $gc https://github.com/mmistakes/minimal-mistakes $CITGRs/CP/Jekyll/mmistakes-minimal-mistakes
# $gc https://github.com/mmistakes/mm-github-pages-starter $CITGRs/CP/Jekyll/mmistakes-mm-github-pages-starter
# $gc https://github.com/jwarby/jekyll-pygments-themes $CITGRs/CP/Jekyll/jwarby-jekyll-pygments-themes
# $gc https://github.com/qian256/qian256.github.io/ $CITGRs/CP/Ruby/Jekyll/qian256-qian256_github_io
# $gc https://github.com/jasonemiller/jasonemiller.github.io $CITGRs/CP/Ruby/Jekyll/jasonemiller-jasonemiller.github.io
# $gc https://github.com/cloudify-cosmo/getcloudify.org $CITGRs/CP/Ruby/Jekyll/cloudify-cosmo-getcloudify.org
# $gc https://github.com/jekyll/jekyll $CITGRs/CP/Ruby/Jekyll/jekyll-jekyll
# $gc https://github.com/rfong/rflog $CITGRs/CP/Ruby/Jekyll/rfong-rflog

#===> Vim
# $gc https://github.com/Eckankar/vim-latex-folding $CITGRs/CP/vim/Eckankar/vim-latex-folding
# $gc https://github.com/kovisoft/slimv $CITGRs/vim-Lisp/kovisoft-slimv
# $gc https://github.com/lervag/vimtex $CITGRs/CP/vim/lervag-vimtex
# $gc https://github.com/rhysd/vim-gfm-syntax $CITGRs/CP/vim/rhysd-vim-gfm-syntax
# $gc https://github.com/vim/vim $CITGRs/CP/vim-vim
# $gc https://github.com/vlime/vlime $CITGRs/vim-Lisp/vlime-vlime
# $gc https://github.com/preservim/tagbar $CITGRs/CP/Vim/preservim-tagbar
# $gc https://github.com/lambdalisue/fern.vim $CITGRs/CP/Vim/lambdalisue-fern.vim
# $gc https://github.com/Konfekt/vim-unicode-homoglyphs $CITGRs/CP/Vim/Konfekt-vim-unicode-homoglyphs
# $gc https://github.com/vim-utils/vim-troll-stopper $CITGRs/CP/Vim/vim-utils-vim-troll-stopper
# $gc https://github.com/nblock/vim-dokuwiki $CITGRs/CP/Vim/nblock-vim-dokuwiki
# $gc https://github.com/junegunn/vim-plug $CITGRs/CP/Vim/junegunn-vim-plug
# $gc https://github.com/Konfekt/complete-common-words.vim $CITGRs/CP/Vim/Konfekt-complete-common-words.vim

#==> 0 emacs
# $gc https://git.sr.ht/~bzg/worg $CITGRs/emacs/_bzg-worg
# $gc https://github.com/TobiasZawada/md-outline-list $CITGRs/emacs/TobiasZawada-md-outline-list
# $gc https://github.com/bbatsov/zenburn-emacs $CITGRs/emacs/bbatsov-zenburn-emacs
# $gc https://github.com/domtronn/all-the-icons.el $CITGRs/emacs/domtronn-all-the-icons.el
# $gc https://github.com/emacs-evil/evil $CITGRs/emacs/emacs-evil-evil
# $gc https://github.com/greduan/emacs-theme-gruvbox $CITGRs/emacs/greduan-emacs-theme-gruvbox
# $gc https://github.com/jakebox/jake-emacs $CITGRs/emacs/jakebox-jake-emacs
# $gc https://github.com/jekyll/minima $CITGRs/CP/Jekyll-jekyll-minima
# $gc https://github.com/jrblevin/markdown-mode $CITGRs/emacs/jrblevin-markdown-mode
# $gc https://github.com/jwiegley/use-package $CITGRs/emacs/jwiegley-use-package
# $gc https://github.com/kai2nenobu/emacs-dokuwiki-mode $CITGRs/emacs/kai2nenobu-emacs-dokuwiki-mode
# $gc https://github.com/noctuid/evil-guide $CITGRs/emacs/noctuid-evil-guide
# $gc https://github.com/plexus/chemacs2 $CITGRs/emacs/plexus-chemacs2

#==> 0 unix
# $gc https://gitlab.com/rwxrob/dotfiles $CITGRs/unix/rwxrob-dotfiles
# $gc https://github.com/simmel/urxvt-resize-font $CITGRs/unix/simmel-urxvt-resize-font
# $gc https://github.com/jstkdng/ueberzugpp $CITGRs/unix/jstkdng-ueberzugpp
# $gc https://github.com/brndnmtthws/conky $CITGRs/unix/brndnmtthws-conky

#===> linux
# $gc https://github.com/boysetsfrog/vimpc $CITGRs/linux/boysetsfrog-vimpc
# $gc https://github.com/doronbehar/pistol $CITGRs/linux/doronbehar-pistol
# $gc https://github.com/fcambus/ansiweather $CITGRs/unix/linux/fcambus-ansiweather
# $gc https://github.com/getmail6/getmail6 $CITGRs/linux/mail/getmail6-getmail6
# $gc https://github.com/jarun/nnn $CITGRs/linux/jarun-nnn
# $gc https://github.com/leo-arch/clifm $CITGRs/linux/leo-arch-clifm
# $gc https://github.com/majutsushi/urxvt-font-size $CITGRs/linux/tmux-fontSize/majutsushi-urxvt-font-size
# $gc https://github.com/rsnapshot/rsnapshot $CITGRs/linux/rsnapshot-rsnapshot
# $gc https://github.com/simmel/urxvt-resize-font $CITGRs/linux/tmux-fontSize/simmel-urxvt-resize-font
# $gc https://github.com/stefano-m/awesome-capslock_widget $CITGRs/linux/wm-awesome/stefano-m-awesome-capslock_widget
# $gc https://github.com/streetturtle/awesome-wm-widgets $CITGRs/unix/linux/wm-awesome/streetturtle-awesome-wm-widgets
# $gc https://github.com/tats/w3m $CITGRs/linux/tats-w3m
# $gc https://github.com/gsamokovarov/jump $CITGRs/linux/gsamokovarov-jump
# $gc https://github.com/lukesmithxyz/voidrice $CITGRs/unix/linux/lukesmithxyz-voidrice
# $gc https://github.com/trapd00r/LS_COLORS $CITGRs/unix/linux/trapd00r-LS_COLORS
# $gc https://github.com/seebi/dircolors-solarized $CITGRs/unix/linux/seebi-dircolors-solarized
# $gc https://github.com/Axlefublr/dotfiles $CITGRs/unix/linux/Axlefublr-dotfiles

#====> Arch
# $gc https://git.sr.ht/~protesilaos/dotfiles $CITGRs/linux/Arch/protesilaos-dotfiles
# $gc https://gitlab.archlinux.org/archlinux/packaging/packages/pacman $CITGRs/linux/Arch/gitlab_archlinux_org-archlinux-packaging-packages-pacman
# $gc https://gitlab.archlinux.org/archlinux/packaging/packages/texlive-core $CITGRs/linux/Arch/gitlab_archlinux_org-archlinux-packaging-packages/texlive-core

#===> tmux
# $gc https://github.com/CrispyConductor/tmux-copy-toolkit $CITGRs/unix/tmux/CrispyConductor-tmux-copy-toolkit
# $gc https://github.com/tmux-plugins/tmux-resurrect $CITGRs/unix/tmux/tmux-plugins-tmux-resurrect
# $gc https://github.com/tmux-plugins/tmux-logging $CITGRs/unix/tmux/tmux-plugins-tmux-logging
# $gc https://github.com/tmux-plugins/tmux-prefix-highlight $CITGRs/unix/tmux/tmux-plugins-tmux-prefix-highlight

#==> 0 MSWin
# $gc https://github.com/amrali-eg/EncodingChecker $CITGRs/amrali-eg-EncodingChecker
# $gc https://github.com/jdhitsolutions/PSScriptTools $CITGRs/MSWin/jdhitsolutions-PSScriptTools
# $gc https://github.com/Windos/BurntToast $CITGRs/MSWin/Windos-BurntToast
# $gc https://github.com/bdukes/PowerShellModules $CITGRs/MSWin/dukes-PowerShellModules

#==> 1 re-clones
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

