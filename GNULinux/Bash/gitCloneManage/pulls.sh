#!/bin/bash
# vim: set fdl=1 tw=0:

# Joseph Harriott  Tue 17 May 2022

# Recursively find all *.git directories in the current directory,
# for each one, execute a git pull in it's containing directory.
# ----------------------------------------------------------------
# bash $onGH/misc/GNULinux/Bash/gitCloneManage/Pulls.sh

specialCases () {
    if [[ $1 =~ BrodieRobertson ]]; then
        find . -name "*\?*" -exec perl-rename -v 's|\?|_|g' {} \;
    elif [[ $1 =~ Eredarion ]]; then
        find . -name "*:*" -exec perl-rename -v 's|:|_|g' {} \;
    fi
}

wd=$PWD
dotgits=$(find . -name '*.git')
for dotgit in $dotgits; do
	repository=${dotgit%/*}
	echo ${tpf3b}$repository${tpfn}
	cd $repository
    git pull
    specialCases $repository
    cd $wd
done
echo ${tpfn}

