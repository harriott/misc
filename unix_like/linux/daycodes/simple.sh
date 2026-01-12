#!/bin/bash
# vim: set et sw=2 tw=0:

# bash $misc/unix_like/linux/daycodes/simple.sh

# https://harriott.github.io/ - Mon 12 Jan 2026

# Convert files from my compact daycodes to more generally usable
#  - eg  ac.ext -> 1012.ext - use with care!

source $(dirname "${BASH_SOURCE[0]}")/cf.sh
for fdc in ???.*; do fdc3; done
for fdc in ??.*; do fdc2; done
for fdc in ?.*; do fdc1; done

