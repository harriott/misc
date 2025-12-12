#!/bin/bash

# Joseph Harriott  Wed 09 Apr 2025
# bash $misc/GRs/needed.sh
# repositories needed for my system builds
# $GRs, the machine-local directory, is exported in  $machBld/export-GRs ($OSAB > mb-...)

set -e  # terminate on a fail

#=> awesome
# elements of these repositories symlinked in  $OSAB/nodes/set/jo-1-awesome.sh

rsync -irtv --delete $GRs/d-CP/d-encoding/r-rxi-json_lua/ $cITcc/CP/rxi-json_lua
rsync -irtv --delete $GRs/d-unix/d-linux/d-wm-awesome/r-stefano-m-awesome-capslock_widget/ $cITcc/unix-linux/awesome-stefano-m-awesome-capslock_widget
rsync -irtv --delete $GRs/d-unix/d-linux/d-wm-awesome/r-streetturtle-awesome-wm-widgets/ $cITcc/unix-linux/awesome-streetturtle-awesome-wm-widgets

#=> code-minimap
rsync -irtv --delete $GRs/d-CP/r-CLI-wfxr-code-minimap/ $cITcc/CP/wfxr-code-minimap
sed -i 's/\r//' $cITcc/CP/wfxr-code-minimap/completions/bash/code-minimap.bash  # ensure no CRLFs
# resourced from  $MSn/PS/Profile.ps1
# sourced in  $OSAB/nodes-Bash/bashrc-generic

#=> emacs
rsync -irtv --delete $GRs/d-CP/d-emacs/r-domtronn-all-the-icons.el/ $cITcc/CP/Emacs-domtronn-all-the-icons.el
# elements are symlinked in  $OSAB/nodes-set/root.sh

#=> <esc> <esc> prefixes sudo
cp $GRs/d-unix/r-ohmybash-oh-my-bash/plugins/sudo/sudo.plugin.sh $cITcc/CP/ohmybash-sudo.plugin.sh

#=> LS_COLORS
rsync -irtv --delete $GRs/d-unix/d-linux/r-trapd00r-LS_COLORS/ $cITcc/unix-linux/trapd00r-LS_COLORS
sed -i 's/\r//' $cITcc/unix-linux/trapd00r-LS_COLORS/lscolors.sh  # ensure no CRLFs
# lscolors.sh  sourced in  $MSn/WSL/bashrc  $OSAB/nodes/Bash/bashrc-generic

#=> mpv
rsync -irtv --delete $GRs/d-CP/d-mpv/r-mfcc64-mpv-scripts/ $cITcc/unix-linux/mfcc64-mpv-scripts
# visualizer.lua  symlinked in  $OSAB/nodes/set/jo-2-whenWM-1.sh

#=> tmux
# elements of these repositories sourced in  $OSL/nodes/terminal-tmux/tmux.conf

sudo rm -r $cITcc/unix-tmux/*

rsync -irtv --delete $GRs/d-unix/d-tmux/r-tmux-plugins-tmux-logging/ $cITcc/unix-tmux/tmux-plugins-tmux-logging
rsync -irtv --delete $GRs/d-unix/d-tmux/r-tmux-plugins-tmux-prefix-highlight/ $cITcc/unix-tmux/tmux-plugins-tmux-prefix-highlight
rsync -irtv --delete $GRs/d-unix/d-tmux/r-tmux-plugins-tmux-resurrect/ $cITcc/unix-tmux/tmux-plugins-tmux-resurrect

#==> tmux-copy-toolkit
rsync -irtv --delete $GRs/d-unix/d-tmux/r-CrispyConductor-tmux-copy-toolkit/ $cITcc/unix-tmux/CrispyConductor-tmux-copy-toolkit  # copytk.tmux  run from  $OSL/nodes/terminal-tmux/tmux.conf

#===> tweak
# my preferred entry:
sed -i 's/x S/x e/' $cITcc/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# conflicts with  tmux-resurrect:
sed -i '/C-s/ s/^/# /' $cITcc/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# selections aren't visible:
sed -i '/k S/ s/^/# /' $cITcc/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux
sed -i '/Y/ s/^/# /' $cITcc/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# not useful for me:
sed -i '/Q/ s/^/# /' $cITcc/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux
sed -i '/C-q/ s/^/# /' $cITcc/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# only URLs qre well matched:
sed -i '/n-match-0-1/ s/^/# /' $cITcc/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# #=> vim-foldtree
# rsync -irtv --delete $GRs/d-CP/d-Vim-Vim/r-lilydjwg-vim-foldtree/ $cITcc/CP/Vim-vim-foldtree
# cp $cITcc/CP/Vim-vim-foldtree/foldtree.vim $vfv/plugin/foldtree.vim

#=> Vim-msmtp-scripts-vim
rsync -irtv --delete $GRs/d-unix/d-linux/r-marlam-msmtp/scripts/vim/ $cITcc/CP/Vim-msmtp-scripts-vim

