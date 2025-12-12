#!/usr/bin/gawk -f

# echo "scramble the inner letters of these words" | awk -f $misc/linux/jumbler.awk

# http://www.stevesachs.com/jumbler.txt

# (c) 2004 Stephen E. Sachs
# Released under GNU General Public License, www.gnu.org/copyleft/gpl.html

BEGIN {
  srand()
  while ((getline)>0) {
    for(i=1;i<=NF;i++) {
      $i = pjumble($i)
    }
  print $0
  }
}

function pjumble(x) {
  # separating out punctuation...
  if (!match(x,"[^a-zA-Z1-9 ]+")) return jumble(x)
  else return jumble(substr(x,1,RSTART-1)) substr(x,RSTART,RLENGTH) pjumble(substr(x,RSTART+RLENGTH))
}

function jumble(x,  a,n,y,z) {
  # preserving first and last letters, making sure it differs from original...
  n = length(x)
  if (n<=3) return x
  else {
    y = substr(x,2,n-2)
    a = "^" substr(y,1,1) "+$"
    while (1) { z = mix(y); if (y != z || y ~ a ) return substr(x,1,1) z substr(x,n,1) }
  }
}

function mix(x,  n,c) {
  # mixing what comes in between...
  n = length(x)
  c = int(rand()*(n)+1)
  if (x) return substr(x,c,1) mix(substr(x,1,c-1) substr(x,c+1,n-c))
}
