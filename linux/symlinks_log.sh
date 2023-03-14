#!/bin/bash

# Joseph Harriott  Tue 28 Feb 2023

# check for symlinks in JH, which could bother Dropbox
# ----------------------------------------------------

# bash $onGH/misc/linux/symlinks_log.sh

dir=$Drpbx/JH/search
find $dir/ -type l -ls > $dir/symlinks
echo "vim: se ft=slJH nowrap:" > $dir/symlinks.log
echo "" >> $dir/symlinks.log
echo "Symlinks that will fail to sync from Dropbox to Win10 Pro:" >> $dir/symlinks.log
echo "" >> $dir/symlinks.log
awk '{print $11, ">>", $13}' $dir/symlinks >> $dir/symlinks.log
# - using  >>  instead of  ->  allows for simpler  $vimfiles/syntax/symlinks.vim
echo "" >> $dir/symlinks.log
echo '- created by $onGH/misc/linux/symlinks_log.sh' >> $dir/symlinks.log
echo "" >> $dir/symlinks.log
rm $dir/symlinks
echo "now open $dir/symlinks.log"

