#!/bin/bash
# vim: set et tw=0:

# bash $misc/linux/oggConv.sh

# Joseph Harriott
# Last updated: Mon 20 Feb 2017

# ogg-convert all wav files in the directory, and move out all original files to a subdirectlry.

# make an empty subdirectory from the current directory's name:
currDirName=${PWD##*/}
if [ -d "$currDirName" ]; then rm -r "$currDirName"; fi
mkdir "$currDirName"

# make ogg's from wav's, and move out all original files to subdirectory:
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for afile in *; do
    if [ $afile != "$currDirName" ]; then
        theExtension=${afile##*.}
        if [ ${theExtension,,} = "wav" ] # case-insensitive test
            then oggenc $afile -q 6; fi
        mv $afile $currDirName
    fi
done
IFS=$SAVEIFS
