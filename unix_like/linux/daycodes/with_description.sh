#!/bin/bash
# vim: set et sw=2 tw=0:

# bash $misc/unix_like/linux/daycodes/with_description.sh

# https://harriott.github.io/ - Mon 12 Jan 2026

# convert files from my compact daycodes to more generally usable
#  - eg  ac-f.ext -> 1012-f.ext

source $(dirname "${BASH_SOURCE[0]}")/cf.sh
for fdc in ???-*.*; do fdc3; done
for fdc in ??-*.*; do fdc2; done
for fdc in ?-*.*; do fdc1; done

