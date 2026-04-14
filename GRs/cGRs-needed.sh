#!/bin/bash

# https://harriott.github.io/ - Tue 14 Apr 2026

# bash $misc/GRs/cGRs-needed.sh
# /mnt/SDU3D1TB/Dropbox/JH/core/IT/onGitHub/misc/GRs/cGRs-needed.sh
# repositories needed for my system builds
# $GRs, the machine-local directory, is exported in  $machBld/export-GRs ($OSAB > mb-...)

set -e  # terminate on a fail

# #=> awesome
# # elements of these repositories symlinked in  $OSAB/nodes/set/jo-1-awesome.sh

# rsync -irtv --delete $GRs/d-CP/d-encoding/r-rxi-json_lua/ $cITcc/CP/rxi-json_lua
# rsync -irtv --delete $GRs/d-unix-like/d-linux/d-wm-awesome/r-stefano-m-awesome-capslock_widget/ $cITcc/unix-linux/awesome-stefano-m-awesome-capslock_widget
# rsync -irtv --delete $GRs/d-unix-like/d-linux/d-wm-awesome/r-streetturtle-awesome-wm-widgets/ $cITcc/unix-linux/awesome-streetturtle-awesome-wm-widgets

# #=> code-minimap
# rsync -irtv --delete $GRs/d-CP/d-CLI/r-wfxr-code-minimap/ $cITcc/CP/wfxr-code-minimap
# sed -i 's/\r//' $cITcc/CP/wfxr-code-minimap/completions/bash/code-minimap.bash  # ensure no CRLFs
# # resourced from  $MSn/PS/Profile.ps1
# # sourced in  $OSAB/nodes-Bash/bashrc-generic

# #=> emacs
# rsync -irtv --delete $GRs/d-CP/d-emacs/r-domtronn-all-the-icons.el/ $cITcc/CP/Emacs-domtronn-all-the-icons.el
# # elements are symlinked in  $OSAB/nodes-set/root.sh

# #=> <esc> <esc> prefixes sudo
# cp $GRs/d-unix-like/r-ohmybash-oh-my-bash/plugins/sudo/sudo.plugin.sh $cITcc/CP/ohmybash-sudo.plugin.sh

# #=> LS_COLORS
# rsync -irtv --delete $GRs/d-unix-like/d-linux/r-trapd00r-LS_COLORS/ $cITcc/unix-linux/trapd00r-LS_COLORS
# sed -i 's/\r//' $cITcc/unix-linux/trapd00r-LS_COLORS/lscolors.sh  # ensure no CRLFs
# # lscolors.sh  sourced in  $MSn/WSL/bashrc  $OSAB/nodes/Bash/bashrc-generic

#=> mpv-scripts
[ -d $cITcc/CP/mpv-scripts ] || mkdir -p $cITcc/CP/mpv-scripts
# for  $OSAB/nodes-set/jo-2-whenWM-1.sh
cp $GRs/d-CP/d-mpv/r-ayghub-open-dir/open-dir.lua $cITcc/CP/mpv-scripts
cp $GRs/d-CP/d-mpv/r-mfcc64-mpv-scripts/visualizer.lua $cITcc/CP/mpv-scripts
cp $GRs/d-CP/d-mpv/r-mfcc64-mpv-scripts/firequalizer15.lua $cITcc/CP/mpv-scripts
cp $GRs/d-CP/d-mpv/r-yuukidach-mpv-scripts/show_filename.lua $cITcc/CP/mpv-scripts
cp $GRs/d-CP/d-mpv/r-CounterPillow-mpv-quack/quack.lua $cITcc/CP/mpv-scripts

#=> tmux
# elements of these repositories sourced in  $OSL/nodes/terminal-tmux/tmux.conf

sudo rm -r $cITcc/unix-tmux/*

rsync -irtv --delete $GRs/d-unix-like/d-terminal-tmux/r-tmux-plugins-tmux-logging/ $cITcc/unix-tmux/tmux-plugins-tmux-logging
rsync -irtv --delete $GRs/d-unix-like/d-terminal-tmux/r-tmux-plugins-tmux-prefix-highlight/ $cITcc/unix-tmux/tmux-plugins-tmux-prefix-highlight
rsync -irtv --delete $GRs/d-unix-like/d-terminal-tmux/r-tmux-plugins-tmux-resurrect/ $cITcc/unix-tmux/tmux-plugins-tmux-resurrect

#==> tmux-copy-toolkit
rsync -irtv --delete $GRs/d-unix-like/d-terminal-tmux/r-CrispyConductor-tmux-copy-toolkit/ $cITcc/unix-tmux/CrispyConductor-tmux-copy-toolkit  # copytk.tmux  run from  $OSL/nodes/terminal-tmux/tmux.conf

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

# only URLs are well matched:
sed -i '/n-match-0-1/ s/^/# /' $cITcc/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# #=> vim-foldtree
# rsync -irtv --delete $GRs/d-CP/d-Vim-Vim/r-lilydjwg-vim-foldtree/ $cITcc/CP/Vim-vim-foldtree
# cp $cITcc/CP/Vim-vim-foldtree/foldtree.vim $vfv/plugin/foldtree.vim

#=> Vim-msmtp-scripts-vim
rsync -irtv --delete $GRs/d-unix-like/d-linux/r-marlam-msmtp/scripts/vim/ $cITcc/CP/Vim-msmtp-scripts-vim

