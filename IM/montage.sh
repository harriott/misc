#!/bin/bash
# vim: set fdl=2:

# Joseph Harriott - Sat 05 Aug 2023
# sequence for creating montages
# bash $onGH/misc/IM/montage.sh

#=> 0 prepare in a directory
# i0-image = original - maybe scanned
# i1-image = first treatment - maybe text added
# i2-image = ready for montage

#=> 1 get the image list
mapfile -t i2s < <(ls i2*)
for ((ii=0; ii<${#i2s[@]}; ++ii)); do echo "$ii" "${i2s[ii]}"; done

#=> 2 make the montages
# m1-image = intermediate montage
# m2-image = final montage

#==> $Cfzd/manage/expenses/mine/n6m-/noReceipts
montage ${i2s[0]} ${i2s[1]} ${i2s[3]} -geometry +9+9 -tile 1x3 m1.jpg
montage m1.jpg ${i2s[2]} -geometry +9+9 -tile 2x1 m2.jpg

