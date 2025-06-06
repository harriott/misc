#!/bin/bash
# vim: set fdl=1:

# Joseph Harriott  Mon 26 May 2025

# rsync  $tricky  directories to/from external ext4

# bash $misc/tricky/ext4/rsync.sh
# see  $misc/tricky/tricky.md

t="/run/media/jo/KDT100G3B/"

mkdir -p /run/media/jo/KDT100G3B/tricky-GRNF-rnf
mkdir -p /run/media/jo/KDT100G3B/tricky-npmAstro

#=> 0 last_update check
cat "$misc/tricky/ext4/last_update"
read -p "- good to continue? "

#=> 1 GR-NF/ryanoasis-nerd-fonts & GRNF-rnf
for s in $tricky/GR-NF/ryanoasis-nerd-fonts /run/media/jo/KDT100G3B/tricky-GRNF-rnf; do find "$s" | echo "$(wc -l) $s"; done

#==> from ext4
echo "GR-NF: $(date +%y%m%d-%H%M%S), KDT100G3B -> $host" >> $misc/tricky/ext4/last_update
read -p "Enter to begin the rsync to KDT100G3B "
rsync -aiv --delete /run/media/jo/KDT100G3B/tricky-GRNF-rnf/ $tricky/GR-NF/ryanoasis-nerd-fonts

# #==> to ext4
# echo "GR-NF: $(date +%y%m%d-%H%M%S), $host -> KDT100G3B" >> $misc/tricky/ext4/last_update
# read -p "Enter to begin the rsync to KDT100G3B "
# rsync -aiv --delete $tricky/GR-NF/ryanoasis-nerd-fonts/ /run/media/jo/KDT100G3B/tricky-GRNF-rnf

#=> 1 ircam_fr_pub_CTAN_systems_texlive_tlnet
for s in $tricky/ircam_fr_pub_CTAN_systems_texlive_tlnet /run/media/jo/KDT100G3B/tricky-ircam_fr_pub_CTAN_systems_texlive_tlnet; do find "$s" | echo "$(wc -l) $s"; done

#==> from ext4
echo "ircam_fr_pub_CTAN_systems_texlive_tlnet: $(date +%y%m%d-%H%M%S), KDT100G3B -> $host" >> $misc/tricky/ext4/last_update
read -p "Enter to begin the rsync to KDT100G3B "
rsync -aiv --delete /run/media/jo/KDT100G3B/tricky-ircam_fr_pub_CTAN_systems_texlive_tlnet/ $tricky/ircam_fr_pub_CTAN_systems_texlive_tlnet

# #==> to ext4
# echo "ircam_fr_pub_CTAN_systems_texlive_tlnet: $(date +%y%m%d-%H%M%S), $host -> KDT100G3B" >> $misc/tricky/ext4/last_update
# read -p "Enter to begin the rsync to KDT100G3B "
# rsync -aiv --delete $tricky/ircam_fr_pub_CTAN_systems_texlive_tlnet/ /run/media/jo/KDT100G3B/tricky-ircam_fr_pub_CTAN_systems_texlive_tlnet

#=> 1 npm-Astro-ext4 -> npmAstro
for s in $tricky/npm-Astro-ext4 /run/media/jo/KDT100G3B/tricky-npmAstro; do find "$s" | echo "$(wc -l) $s"; done

#==> from ext4
echo "GR-NF: $(date +%y%m%d-%H%M%S), KDT100G3B -> $host" >> $misc/tricky/ext4/last_update
read -p "Enter to begin the rsync from KDT100G3B "
rsync -aiv --delete /run/media/jo/KDT100G3B/tricky-npmAstro/ $tricky/npm-Astro-ext4

# #==> to ext4
# echo "GR-NF: $(date +%y%m%d-%H%M%S), $host -> KDT100G3B" >> $misc/tricky/ext4/last_update
# read -p "Enter to begin the rsync to KDT100G3B "
# rsync -aiv --delete $tricky/npm-Astro-ext4/ /run/media/jo/KDT100G3B/tricky-npmAstro

