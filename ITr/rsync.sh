#!/bin/bash
# vim: set fdl=2:

# Joseph Harriott  Tue 20 May 2025

# need a fast drive for this to be realistic

# rsync my IT reference notes to an external NTFS drive

# bash $misc/ITr/rsync.sh

#=> 0 last_update check
cat "$misc/ITr/last_update"
read -p "- good to continue? "

# #=> 1 make targets
# cd $ITr; mkdir coreIT GRs jtIT tIs

#=> 2 coreIT rsync's to external drive
for s in $coreIT $ITr/coreIT; do find "$s" | echo "$(wc -l) $s"; done
echo "coreIT: $(date +%y%m%d-%H%M%S), $host -> TOSHIBA" >> $misc/ITr/last_update
read -p "Enter to begin the rsync ? "
rsync -irtv --delete $coreIT/ $ITr/coreIT

#=> 2 cGRs rsync's to external drive
for s in $cGRs $ITr/GRs; do find "$s" | echo "$(wc -l) $s"; done
echo "GRs: $(date +%y%m%d-%H%M%S), $host -> TOSHIBA" >> $misc/ITr/last_update
read -p "Enter to begin the rsync ? "
rsync -iLrtv --delete $cGRs/ $ITr/GRs

#=> 2 jtIT rsync's to external drive
for s in $jtIT $ITr/jtIT; do find "$s" | echo "$(wc -l) $s"; done
echo "jtIT: $(date +%y%m%d-%H%M%S), $host -> TOSHIBA" >> $misc/ITr/last_update
read -p "Enter to begin the rsync ? "
rsync -irtv --delete $jtIT/ $ITr/jtIT

#=> 2 tIs rsync's to external drive
for s in $tIs $ITr/tIs; do find "$s" | echo "$(wc -l) $s"; done
echo "tIs: $(date +%y%m%d-%H%M%S), $host -> TOSHIBA" >> $misc/ITr/last_update
read -p "Enter to begin the rsync ? "
rsync -irtv --delete $tIs/ $ITr/tIs

