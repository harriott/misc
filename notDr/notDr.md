    vim: set fdl=3:

    $misc/notDr/notDr.md

this file is symlinked in `$MSn/set/3.ps1` & `$OSAB/nodes-set/jo-0.sh`

# $notDr directory
- `$notDr` is defined in `$MSn\PS\Env.ps1` & `$OSL/nodes/jo/export`
- contains some directories that are tricky for `Dropbox`

## GRs
    $misc/GRs/GRs.md

## best on ext4
- directory `$notDr/GR-NF/ryanoasis-nerd-fonts` is huge, and rarely needed - see `$misc/notDr/NF.md`
- these directories are rsync'd to external drive by `$misc/notDr/ext4/rsync.sh`

### ircam_fr_pub_CTAN_systems_texlive_tlnet
    $notDr/ircam_fr_pub_CTAN_systems_texlive_tlnet/README.md
    rsync -av --delete rsync://mirrors.ircam.fr/pub/CTAN/systems/texlive/tlnet/ $notDr/ircam_fr_pub_CTAN_systems_texlive_tlnet

- for native install of `TeX Live`
- loads symlinks

### npm-Astro-ext4
- `JH`: `$notDr/npm-Astro-ext4/JH/tm/README.md`
- some Astro tests: `$notDr/npm-Astro-ext4` full of damned symlinks...

## Zourit Nextcloud
    $misc/CP/rclone.md

- can't recall where I got the `pass` from
- WebDAV <https://cloud6.zourit.net/remote.php/dav/files/0db3dcd2-559e-103c-85dd-b3e96c5fa175/>

### commands
    rclone lsd ZCzNc:  # quick list of top-level directories

#### 0 get clone
    $ find $notDr/ZN-rcl | wc -l
    PS> (ls $notDr/ZN-rcl -Force -s).count
    rclone sync -P ZCzNc: $notDr/ZN-rcl

#### 1 get  ZN-use
    $ rsync -irtv --delete $notDr/ZN-rcl/ $CzMa/online/ZNc/ZN-use
    $ rsync -irtv --delete $notDr/ZN-rcl/ $DJH/work-Cz-manage-online-ZNc/ZN-use

    PS> robocopy /mir $notDr/ZN-rcl $notDr/ZN-rcl-RCd
    PS> cd $notDr/ZN-rcl-RCd
    PS> perl $onGH/FM-underscores/underscores.pl
    PS> robocopy /mir $notDr/ZN-rcl-RCd $CzMa/online/ZNc/ZN-use /l

