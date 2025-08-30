#!/bin/bash

# Joseph Harriott  Fri 13 Jun 2025

# need a fast drive for this to be realistic

# rsync my key IT references to an external NTFS drive
# $cGRs, $ITr  defined in  $OSL/nodes/jo/export
# mkdir $notDr/GRs; cd $ITr; mkdir coreIT GRs jtIT tIs

# bash $misc/ITr/rsync.sh

#=> 1 last_update check
cat "$misc/ITr/last_update"
read -p "- good to continue? "

# #=> 2 $coreIT  rsync's to external drive
# for s in $coreIT $ITr/coreIT; do find "$s" | echo "$(wc -l) $s"; done
# echo "\$coreIT: $(date +%y%m%d-%H%M%S), $host -> TOSHIBA" >> $misc/ITr/last_update
# read -p "Enter to begin the rsync ? "
# rsync -irtv --delete $coreIT/ $ITr/coreIT
# echo

#=> 2 $cGRs  rsync's
for s in $cGRs $ITr/GRs; do find "$s" | echo "$(wc -l) $s"; done
# no idea why the local count is 31 more

#==> 0 to external drive
read -p "Enter  to  rsync  from  ${tpf5}$cGRs${tpfn}  to  ${tpf5}$ITr/GRs${tpfn} "
echo "GRs: $(date +%y%m%d-%H%M%S), $host -> TOSHIBA" >> $misc/ITr/last_update
rsync -iLrtv --delete $cGRs/ $ITr/GRs
echo
echo "${tpf3b}2nd rsync to highlight any errors${tpfn}"
rsync -iLrtv --delete $cGRs/ $ITr/GRs
echo

# #==> 1 from external drive 0 test
# read -p "Enter  to simulate  rsync  from  ${tpf5}$ITr/GRs${tpfn}  to  ${tpf5}$cGRs${tpfn} "
# rsync -inLrtv --delete $ITr/GRs/ $cGRs

# #==> 1 from external drive 1 do
# read -p "Enter  to  rsync  from  ${tpf5}$ITr/GRs${tpfn}  to  ${tpf5}$cGRs${tpfn} "
# echo "GRs: $(date +%y%m%d-%H%M%S), TOSHIBA -> $host" >> $misc/ITr/last_update
# rsync -iLrtv --delete $ITr/GRs/ $cGRs
# echo "${tpf3b}2nd rsync to highlight any errors${tpfn}"
# rsync -iLrtv --delete $ITr/GRs/ $cGRs
# echo

# #=> 2 $DJH/Cop-code  rsync's to external drive
# for s in $DJH/Cop-code $ITr/Cop-code; do find "$s" | echo "$(wc -l) $s"; done
# echo "\$DJH/Cop-code: $(date +%y%m%d-%H%M%S), $host -> TOSHIBA" >> $misc/ITr/last_update
# read -p "Enter to begin the rsync ? "
# rsync -irtv --delete $DJH/Cop-code/ $ITr/Cop-code
# echo

# #=> 2 $jtIT  rsync's to external drive
# for s in $jtIT $ITr/jtIT; do find "$s" | echo "$(wc -l) $s"; done
# echo "\$jtIT: $(date +%y%m%d-%H%M%S), $host -> TOSHIBA" >> $misc/ITr/last_update
# read -p "Enter to begin the rsync ? "
# rsync -irtv --delete $jtIT/ $ITr/jtIT
# echo

# #=> 2 $jtIT-MSWinUser  rsync's to external drive
# for s in $jtIT-MSWinUser $ITr/jtIT-MSWinUser; do find "$s" | echo "$(wc -l) $s"; done
# echo "jtIT-MSWinUser: $(date +%y%m%d-%H%M%S), $host -> TOSHIBA" >> $misc/ITr/last_update
# read -p "Enter to begin the rsync ? "
# rsync -irtv --delete $jtIT-MSWinUser/ $ITr/jtIT-MSWinUser

# #=> 2 $tIs  rsync's to external drive
# for s in $tIs $ITr/tIs; do find "$s" | echo "$(wc -l) $s"; done
# echo "\$tIs: $(date +%y%m%d-%H%M%S), $host -> TOSHIBA" >> $misc/ITr/last_update
# read -p "Enter to begin the rsync ? "
# rsync -irtv --delete $tIs/ $ITr/tIs
# echo

# #=> 2 $ZN-rc  rsync's to external drive
# for s in $notDr/ZN-rc $ITr/ZN-rc; do find "$s" | echo "$(wc -l) $s"; done
# echo "\$notDr/ZN-rc: $(date +%y%m%d-%H%M%S), $host -> TOSHIBA" >> $misc/ITr/last_update
# read -p "Enter to begin the rsync ? "
# rsync -irtv --delete $notDr/ZN-rc/ $ITr/ZN-rc
# echo

