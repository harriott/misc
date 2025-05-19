#!/bin/bash
# vim: set fdl=1:

# Joseph Harriott  Mon 19 May 2025

# need a fast drive for this to be realistic

# rsync my IT reference notes to USB flash

# bash $misc/ITr/rsync.sh

#=> 0 last_update check
cat "$misc/ITr/last_update"
read -p "- good to continue? "

#=> 1 last_update append
echo "$(date +%y%m%d-%H%M%S) $host TOSHIBA" >> $misc/ITr/last_update

#=> 2 target
Ufm="/run/media/jo/TOSHIBA/ITr"

#=> 3 counts
cd $Ufm; echo "Counts in  $ufm:"; for s in *; do echo " $(find $s | wc -l) $s"; done
for s in $coreIT $DCGRs $jtIT $tIs; do find "$s" | echo "$(wc -l) $s"; done

#=> 4 sync to drive
read -p "going to rsync to ${tpf5}$Ufm${tpfn}"
# cd $Ufm; mkdir coreIT GRs jtIT tIs
echo 'coreIT'; rsync -irtv --delete $coreIT/ $Ufm/coreIT
echo 'GRs';    rsync -irtv --delete $DCGRs/  $Ufm/GRs
echo 'jtIT';   rsync -irtv --delete $jtIT/   $Ufm/jtIT
echo 'tIs';    rsync -irtv --delete $tIs/    $Ufm/tIs

