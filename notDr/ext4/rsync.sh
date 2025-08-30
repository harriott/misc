#!/bin/bash
# vim: set fdl=1:

# Joseph Harriott  Mon 26 May 2025

# rsync  $notDr  directories to/from external ext4

# bash $misc/notDr/ext4/rsync.sh
# see  $misc/notDr/notDr.md

t="/run/media/jo/KDT100G3B/"

mkdir -p /run/media/jo/KDT100G3B/notDr-GRNF-rnf
mkdir -p /run/media/jo/KDT100G3B/notDr-npmAstro

#=> 0 last_update check
cat "$misc/notDr/ext4/last_update"
read -p "- good to continue? "

#=> 1 GR-NF/ryanoasis-nerd-fonts & GRNF-rnf
for s in $notDr/GR-NF/ryanoasis-nerd-fonts /run/media/jo/KDT100G3B/notDr-GRNF-rnf; do find "$s" | echo "$(wc -l) $s"; done

#==> from ext4
echo "GR-NF: $(date +%y%m%d-%H%M%S), KDT100G3B -> $host" >> $misc/notDr/ext4/last_update
read -p "Enter to begin the rsync to KDT100G3B "
rsync -aiv --delete /run/media/jo/KDT100G3B/notDr-GRNF-rnf/ $notDr/GR-NF/ryanoasis-nerd-fonts

# #==> to ext4
# echo "GR-NF: $(date +%y%m%d-%H%M%S), $host -> KDT100G3B" >> $misc/notDr/ext4/last_update
# read -p "Enter to begin the rsync to KDT100G3B "
# rsync -aiv --delete $notDr/GR-NF/ryanoasis-nerd-fonts/ /run/media/jo/KDT100G3B/notDr-GRNF-rnf

#=> 1 ircam_fr_pub_CTAN_systems_texlive_tlnet
for s in $notDr/ircam_fr_pub_CTAN_systems_texlive_tlnet /run/media/jo/KDT100G3B/notDr-ircam_fr_pub_CTAN_systems_texlive_tlnet; do find "$s" | echo "$(wc -l) $s"; done

#==> from ext4
echo "ircam_fr_pub_CTAN_systems_texlive_tlnet: $(date +%y%m%d-%H%M%S), KDT100G3B -> $host" >> $misc/notDr/ext4/last_update
read -p "Enter to begin the rsync to KDT100G3B "
rsync -aiv --delete /run/media/jo/KDT100G3B/notDr-ircam_fr_pub_CTAN_systems_texlive_tlnet/ $notDr/ircam_fr_pub_CTAN_systems_texlive_tlnet

# #==> to ext4
# echo "ircam_fr_pub_CTAN_systems_texlive_tlnet: $(date +%y%m%d-%H%M%S), $host -> KDT100G3B" >> $misc/notDr/ext4/last_update
# read -p "Enter to begin the rsync to KDT100G3B "
# rsync -aiv --delete $notDr/ircam_fr_pub_CTAN_systems_texlive_tlnet/ /run/media/jo/KDT100G3B/notDr-ircam_fr_pub_CTAN_systems_texlive_tlnet

#=> 1 npm-Astro-ext4 -> npmAstro
for s in $notDr/npm-Astro-ext4 /run/media/jo/KDT100G3B/notDr-npmAstro; do find "$s" | echo "$(wc -l) $s"; done

#==> from ext4
echo "GR-NF: $(date +%y%m%d-%H%M%S), KDT100G3B -> $host" >> $misc/notDr/ext4/last_update
read -p "Enter to begin the rsync from KDT100G3B "
rsync -aiv --delete /run/media/jo/KDT100G3B/notDr-npmAstro/ $notDr/npm-Astro-ext4

# #==> to ext4
# echo "GR-NF: $(date +%y%m%d-%H%M%S), $host -> KDT100G3B" >> $misc/notDr/ext4/last_update
# read -p "Enter to begin the rsync to KDT100G3B "
# rsync -aiv --delete $notDr/npm-Astro-ext4/ /run/media/jo/KDT100G3B/notDr-npmAstro

