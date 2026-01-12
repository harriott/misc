#!/bin/bash
# vim: set et sw=2 tw=0:

# bash $misc/unix_like/linux/need_for_nullglob.sh

# https://harriott.github.io/ - Mon 12 Jan 2026

# try commenting the next line,
# and you will see that the following line will return the glob pattern (when it's not matched)
shopt -s nullglob
for f in ?.*; do echo $f; done

