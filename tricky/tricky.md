    vim: set fdl=3:

    $misc/tricky/tricky.md

this file is symlinked in `$OSAB/nodes-set/jo-0.sh`

# $tricky directory
- `$tricky` is defined in `$OSL/nodes/jo/export`
- contains some directories that are tricky for `Dropbox`

## GRs
- `$cGRs` over 150k files...
- managed in  `$misc/GRs`
- synced to external drive in `$misc/ITr/rsync.sh`

## best on ext4
- directory `$tricky/GR-NF/ryanoasis-nerd-fonts` is huge, and rarely needed - see `$misc/tricky/NF.md`
- these directories are rsync'd to external drive by `$misc/tricky/ext4/rsync.sh`

### ircam_fr_pub_CTAN_systems_texlive_tlnet
    $tricky/ircam_fr_pub_CTAN_systems_texlive_tlnet/README.md
    rsync -av --delete rsync://mirrors.ircam.fr/pub/CTAN/systems/texlive/tlnet/ $tricky/ircam_fr_pub_CTAN_systems_texlive_tlnet

- for native install of `TeX Live`
- loads symlinks

### npm-Astro-ext4
- `JH`: `$tricky/npm-Astro-ext4/JH/tm/README.md`
- some Astro tests: `$tricky/npm-Astro-ext4` full of damned symlinks...

