#!/bin/bash
# vim: set et sw=2 tw=0:

# $misc/unix_like/linux/daycodes/cf.sh
#  common functionality for
#   $misc/unix_like/linux/daycodes/simple.sh
#   $misc/unix_like/linux/daycodes/with_description.sh

# https://harriott.github.io/ - Mon 12 Jan 2026

cdc () {
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
}

fdc3 () {
  [ -z "$fdc" ] && continue
  fmd=${fdc:3}; md=''
  for dc in ${fdc:0:1} ${fdc:1:1} ${fdc:2:1}; do cdc; done
  mv $fdc $md$fmd
}
fdc2 () {
  [ -z "$fdc" ] && continue
  fmd=${fdc:2}; md=''
  for dc in ${fdc:0:1} ${fdc:1:1}; do cdc; done
  mv $fdc $md$fmd
}
fdc1 () {
  [ -z "$fdc" ] && continue
  fmd=${fdc:1}; md=''
  dc=${fdc:0:1}; cdc
  mv $fdc $md$fmd
}

shopt -s nullglob  # see  $misc/unix_like/linux/need_for_nullglob.sh

