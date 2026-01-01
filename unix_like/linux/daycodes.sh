#!/bin/bash
# vim: set et tw=0:

# bash $misc/unix_like/linux/daycodes.sh

# https://harriott.github.io/ - Fri 20 Jun 2025

# convert files from my compact daycodes to more generally usable - eg  ac-f.ext -> 1012-f.ext

# bash $misc/linux/daycodes.sh

for fdc in ??-*.*; do
  fmd=${fdc:2}
  md=''
  for dc in ${fdc:0:1} ${fdc:1:1}; do
    case $dc in
      1) md+=01;;
      2) md+=02;;
      3) md+=03;;
      4) md+=04;;
      5) md+=05;;
      6) md+=06;;
      7) md+=07;;
      8) md+=08;;
      9) md+=09;;
      a) md+=10;;
      b) md+=11;;
      c) md+=12;;
      d) md+=13;;
      e) md+=14;;
      f) md+=15;;
      g) md+=16;;
      h) md+=17;;
      i) md+=18;;
      j) md+=19;;
      k) md+=20;;
      l) md+=21;;
      m) md+=22;;
      n) md+=23;;
      o) md+=24;;
      p) md+=25;;
      q) md+=26;;
      r) md+=27;;
      s) md+=28;;
      t) md+=29;;
      u) md+=30;;
      v) md+=31;;
    esac
  done
  mv $fdc $md$fmd
done
