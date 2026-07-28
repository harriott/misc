#!/bin/bash

# https://harriott.github.io/ - Tue 14 Apr 2026

# bash $misc/GRs/cGRs-needed.sh
# /mnt/SDU3D1TB/Dropbox/JH/core/IT/onGitHub/misc/GRs/cGRs-needed.sh
# repositories needed for my system builds
# $GRs, the machine-local directory, is exported in  $OSL/nodes/jo/export

set -e  # terminate on a fail

# #=> code-minimap
# rsync -irtv --delete $GRs/d-CP/d-CLI/r-wfxr-code-minimap/ $ITccl/CP/wfxr-code-minimap
# sed -i 's/\r//' $ITccl/CP/wfxr-code-minimap/completions/bash/code-minimap.bash  # ensure no CRLFs
# # resourced from  $MSn/PS/Profile.ps1
# # sourced in  $ABno/Bash/bashrc-generic

# #=> emacs
# rsync -irtv --delete $GRs/d-CP/d-emacs/r-domtronn-all-the-icons.el/ $ITccl/CP/Emacs-domtronn-all-the-icons.el
# # elements are symlinked in  $OSAB/nodes-set/root.sh

# #=> <esc> <esc> prefixes sudo
# cp $GRs/d-unix-like/r-ohmybash-oh-my-bash/plugins/sudo/sudo.plugin.sh $ITccl/CP/ohmybash-sudo.plugin.sh

# #=> LS_COLORS
# rsync -irtv --delete $GRs/d-unix-like/d-linux/r-trapd00r-LS_COLORS/ $ITccl/unix-linux/trapd00r-LS_COLORS
# sed -i 's/\r//' $ITccl/unix-linux/trapd00r-LS_COLORS/lscolors.sh  # ensure no CRLFs
# # lscolors.sh  sourced in  $MSn/WSL/bashrc  $OSAB/nodes/Bash/bashrc-generic

#=> mpv-scripts
[ -d $ITccl/CP/mpv-scripts ] || mkdir -p $ITccl/CP/mpv-scripts
# for  $OSAB/nodes-set/jo-2-whenWM-1.sh
cp $GRs/d-CP/d-mpv/r-ayghub-open-dir/open-dir.lua $ITccl/CP/mpv-scripts
cp $GRs/d-CP/d-mpv/r-mfcc64-mpv-scripts/visualizer.lua $ITccl/CP/mpv-scripts
cp $GRs/d-CP/d-mpv/r-mfcc64-mpv-scripts/firequalizer15.lua $ITccl/CP/mpv-scripts
cp $GRs/d-CP/d-mpv/r-yuukidach-mpv-scripts/show_filename.lua $ITccl/CP/mpv-scripts
cp $GRs/d-CP/d-mpv/r-CounterPillow-mpv-quack/quack.lua $ITccl/CP/mpv-scripts

#=> tmux
# elements of these repositories sourced in  $OSL/nodes/terminal-tmux/tmux.conf

sudo rm -r $ITccl/unix-tmux/*

rsync -irtv --delete $GRs/d-unix-like/d-terminal-tmux/r-tmux-plugins-tmux-logging/ $ITccl/unix-tmux/tmux-plugins-tmux-logging
rsync -irtv --delete $GRs/d-unix-like/d-terminal-tmux/r-tmux-plugins-tmux-prefix-highlight/ $ITccl/unix-tmux/tmux-plugins-tmux-prefix-highlight
rsync -irtv --delete $GRs/d-unix-like/d-terminal-tmux/r-tmux-plugins-tmux-resurrect/ $ITccl/unix-tmux/tmux-plugins-tmux-resurrect

#==> tmux-copy-toolkit
rsync -irtv --delete $GRs/d-unix-like/d-terminal-tmux/r-CrispyConductor-tmux-copy-toolkit/ $ITccl/unix-tmux/CrispyConductor-tmux-copy-toolkit  # copytk.tmux  run from  $OSL/nodes/terminal-tmux/tmux.conf

#===> tweak
# my preferred entry:
sed -i 's/x S/x e/' $ITccl/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# conflicts with  tmux-resurrect:
sed -i '/C-s/ s/^/# /' $ITccl/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# selections aren't visible:
sed -i '/k S/ s/^/# /' $ITccl/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux
sed -i '/Y/ s/^/# /' $ITccl/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# not useful for me:
sed -i '/Q/ s/^/# /' $ITccl/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux
sed -i '/C-q/ s/^/# /' $ITccl/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# only URLs are well matched:
sed -i '/n-match-0-1/ s/^/# /' $ITccl/unix-tmux/CrispyConductor-tmux-copy-toolkit/copytk.tmux

# #=> vim-foldtree
# rsync -irtv --delete $GRs/d-CP/d-Vim-Vim/r-lilydjwg-vim-foldtree/ $ITccl/CP/Vim-vim-foldtree
# cp $ITccl/CP/Vim-vim-foldtree/foldtree.vim $vfv/plugin/foldtree.vim

#=> Vim-msmtp-scripts-vim
rsync -irtv --delete $GRs/d-unix-like/d-linux/r-marlam-msmtp/scripts/vim/ $ITccl/CP/msmtp-scripts-vim

