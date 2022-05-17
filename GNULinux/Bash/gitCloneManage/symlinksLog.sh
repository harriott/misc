#!/bin/bash

# Joseph Harriott  Tue 17 May 2022

# Recursively find all *.git directories in the current directory,
# for each one, execute a git pull in it's containing directory.
# ----------------------------------------------------------------
# bash $onGH/misc/GNULinux/Bash/gitCloneManage/symlinksLog.sh

dir=$DROPBOX/JH
find $dir/ -type l -ls > $dir/slJH
echo "vim: se ft=slJH nowrap:" > $dir/slJH.log
echo "" >> $dir/slJH.log
echo "Symlinks that fail to sync from Dropbox to Win10 Pro:" >> $dir/slJH.log
echo "" >> $dir/slJH.log
awk '{print $11, ">>", $13}' $dir/slJH >> $dir/slJH.log
# - using  >>  instead of  ->  allows for simpler  $vimfiles/syntax/slJH.vim
echo "" >> $dir/slJH.log
echo '- created by $onGH/misc/GNULinux/Bash/gitCloneManage/symlinksLog.sh' >> $dir/slJH.log
echo "" >> $dir/slJH.log
rm $dir/slJH
echo "now open $dir/slJH.log"

