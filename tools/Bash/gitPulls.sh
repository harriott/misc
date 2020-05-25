#!/bin/bash
# vim: set tw=0

# Joseph Harriott http://momentary.eu/ Wed 18 Sep 2019

# Recursively find all *.git directories in the current directory,
# for each one, execute a git pull in it's containing directory.
# ----------------------------------------------------------------

dotgits=$(find . -name '*.git')
for dotgit in $dotgits; do
	repository=${dotgit%/*}
	echo $repository
done

