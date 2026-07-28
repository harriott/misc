#!/bin/bash
# vim: set et sw=2 tw=0:

# bash $mull/datecodes/files_rename_to_date/with_description.sh

# https://harriott.github.io/ - mar 14 juil 2026

# convert files from my compact daycodes to more generally usable
#  - eg  ac-f.ext -> 1012-f.ext

source $(dirname "${BASH_SOURCE[0]}")/cf.sh
for fdc in *; do
  nsu=$(echo $fdc | sed 's/ \|_/-/') # no space or underscore
  [[ $fdc != $nsu ]] && mv "$fdc" $nsu
done
for fdc in ???-*.*; do fdc3; done
for fdc in ??-*.*; do fdc2; done
for fdc in ?-*.*; do fdc1; done

