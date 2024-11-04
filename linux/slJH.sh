#!/bin/bash

# Joseph Harriott  Wed 03 Jan 2024

# check for symlinks which could bother Dropbox
# ---------------------------------------------

# bash $misc/linux/slJH.sh

find $Drpbx -type l -ls > $Drpbx/symlinks
log="$Drpbx/links.slJH"
echo "" > $log
echo "Symlinks that will fail to sync from Dropbox to Win10 Pro:" >> $log
echo "" >> $log
awk '{print $11, $12, $13}' $Drpbx/symlinks >> $log
# - using  >>  instead of  ->  allows for simpler  $vimfiles/syntax/symlinks.vim
echo "" >> $log
rm $Drpbx/symlinks
echo "now open $log"  # $Drpbx/links.slJH

