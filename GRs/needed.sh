#!/bin/bash
# vim: set fdl=2:

# Joseph Harriott  Fri 07 Mar 2025
# bash $misc/GRs/needed.sh
# repositories needed for my system builds

set -e  # terminate on a fail

#=> code-minimap
rsync -irtv --delete $DCGRs/d-CP/r-CLI-wfxr-code-minimap/ $ITscc/CP/wfxr-code-minimap
# resourced from  $MSn\PS\Profile.ps1
# sourced in  $OSAB/nodes/Bash/bashrc-generic

#=> emacs
rsync -irtv --delete $DCGRs/d-CP/d-emacs/r-domtronn-all-the-icons.el/ $ITscc/CP/Emacs-domtronn-all-the-icons.el
# elements are symlinked in  $OSAB/nodes-set/root.sh

#=> LS_COLORS
rsync -irtv --delete $DCGRs/d-unix/d-linux/r-trapd00r-LS_COLORS/ $ITscc/unix-linux/trapd00r-LS_COLORS
# lscolors.sh  sourced in  $MSn/WSL/bashrc  $OSAB/nodes/Bash/bashrc-generic

#=> mpv
rsync -irtv --delete $DCGRs/d-CP/d-mpv/r-mfcc64-mpv-scripts/ $ITscc/unix-linux/mfcc64-mpv-scripts
# visualizer.lua  symlinked in  $OSAB/nodes/set/jo-2-whenWM-1.sh

#=> tmux
# elements of these repositories sourced in  $OSL/nodes/terminal-tmux/tmux.conf

sudo rm -r $ITscc/unix-tmux/*

rsync -irtv --delete $DCGRs/d-unix/d-tmux/r-tmux-plugins-tmux-logging/ $ITscc/unix-tmux/tmux-plugins-tmux-logging
rsync -irtv --delete $DCGRs/d-unix/d-tmux/r-tmux-plugins-tmux-prefix-highlight/ $ITscc/unix-tmux/tmux-plugins-tmux-prefix-highlight
rsync -irtv --delete $DCGRs/d-unix/d-tmux/r-tmux-plugins-tmux-resurrect/ $ITscc/unix-tmux/tmux-plugins-tmux-resurrect

#==> tmux-copy-toolkit
rsync -irtv --delete $DCGRs/d-unix/d-tmux/r-CrispyConductor-tmux-copy-toolkit/ $ITscc/unix-tmux/CrispyConductor-tmux-copy-toolkit  # copytk.tmux  run from  $OSL/nodes/terminal-tmux/tmux.conf

#===> tweak
# my preferred entry:
sed -i 's/x S/x e/' forArch/tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# conflicts with  tmux-resurrect:
sed -i '/C-s/ s/^/# /' forArch/tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# selections aren't visible:
sed -i '/k S/ s/^/# /' forArch/tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux
sed -i '/Y/ s/^/# /' forArch/tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# not useful for me:
sed -i '/Q/ s/^/# /' forArch/tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux
sed -i '/C-q/ s/^/# /' forArch/tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# only URLs qre well matched:
sed -i '/n-match-0-1/ s/^/# /' forArch/tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

#=> unix-linux > awesome
# elements of these repositories symlinked in  $OSAB/nodes/set/jo-1-awesome.sh

rsync -irtv --delete $DCGRs/d-CP/d-encoding/r-rxi-json_lua/ $ITscc/CP/rxi-json_lua
rsync -irtv --delete $DCGRs/d-unix/d-linux/d-wm-awesome/r-stefano-m-awesome-capslock_widget/ $ITscc/unix-linux/awesome-stefano-m-awesome-capslock_widget
rsync -irtv --delete $DCGRs/d-unix/d-linux/d-wm-awesome/r-streetturtle-awesome-wm-widgets/ $ITscc/unix-linux/awesome-streetturtle-awesome-wm-widgets

# #=> vim-foldtree
# rsync -irtv --delete $DCGRs/d-CP/d-Vim-Vim/r-lilydjwg-vim-foldtree/ $ITscc/CP/Vim-vim-foldtree
# cp $ITscc/CP/Vim-vim-foldtree/foldtree.vim $vfv/plugin/foldtree.vim

