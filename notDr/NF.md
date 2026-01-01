    vim: se fdl=1:

    $misc/notDr/NF.md

- this file is symlinked into `$notDr/GR-NF` directory
    - `$MSn/set/3.ps1`
    - `$OSAB/nodes-set/jo-0.sh`
- Nerd Fonts

# manage
maybe disable call to `git-prompt.sh` in `$AjB/bashrc-console` before entering this directory

## 0 get
    $notDr/GR-NF/ryanoasis-nerd-fonts/changelog.md

    git clone --depth 1 https://github.com/ryanoasis/nerd-fonts/ $notDr/GR-NF/ryanoasis-nerd-fonts

- maybe `git config --global core.compression 0` - see `$misc/CP/gitconfig`
- `merge` after `fetch` fails, so just re-download after an update

## 1 use - $coreIT
    rg -l Arimo
    rg -l Caskaydia
    rg -l DejaVu

## 1 use - for Arch 0
    fA="$cITcc/unix-linux-forArch-fonts/NF"
    pf="$notDr/GR-NF/ryanoasis-nerd-fonts/patched-fonts"

## 1 use - for Arch 1
    $cITcc/unix-linux-forArch-fonts/readme.md

### patched Arimo
    cp $pf/Arimo/Regular/ArimoNerdFont-Regular.ttf $fA

- from `$pf`, `Arimo/Regular/README.md` v1.33
- use `$MD4PDF/GNULinux/md4pdf.sh`

### patched Cascadia Code
    cp $pf/CascadiaCode/CaskaydiaCoveNerdFontMono-Regular.ttf $fA

from `$pf`, `CascadiaCode/README.md` v2407.24

#### use
    $ABjo/wm/Xresources/fontNF
    $OSAB/nodes-terminal/alacritty-all.toml

### patched DejaVu Sans Mono
    cp $pf/DejaVuSansMono/Regular/DejaVuSansMNerdFontMono-Regular.ttf $fA

from `$pf`, `DejaVuSansMono/Regular/README.md` v2.37

#### use
    $machBld/jo/Conky/Xfce
    $OSAB/nodes-terminal/wezterm.lua
    $vfv/enter/gvimrc-Arch.vim

### patched Hack Bold
    cp $pf/Hack/Bold/HackNerdFont-Bold.ttf $fA

- from `$pf`, `Hack/Bold/README.md` v3.003
- use: `$ABjo/wm/Xresources/fontNF`

### patched JetBrains
    cp $pf/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFontMono-Regular.ttf $fA

- from `$pf`, `JetBrainsMono/Ligatures/Regular/README.md` v2.304
- use `$vfv/enter/gvimrc-Arch.vim`

### patched Meslo LG
    cp $pf/Meslo/S/Regular/MesloLGSNerdFontMono-Regular.ttf $fA

- from `$pf`, `Meslo/M/Regular/README.md` v1.21
- use `$vfv/enter/gvimrc-Arch.vim`

### patched Ubuntu
    cp $pf/Ubuntu/Regular/UbuntuNerdFont-Regular.ttf $fA

- from `$pf`, `Ubuntu/Regular/README.md` v0.83
- use `$MD4PDF/GNULinux/md4pdf.sh`, but loads of characters not found

### patched UbuntuMono
    cp $pf/UbuntuMono/Regular/UbuntuMonoNerdFontMono-Regular.ttf $fA

from `$pf`, `UbuntuMono/Regular/README.md` v0.80

#### use
    $MD4PDF/GNULinux/md4pdf.sh
    $vfv/enter/gvimrc-Arch.vim

## 1 use - for MSWin10Pro
not yet

## 1 use - bin/scripts
    $notDr/GR-NF/ryanoasis-nerd-fonts/bin/scripts/README.md

- `bash $notDr/GR-NF/ryanoasis-nerd-fonts/bin/scripts/cheatsheet.sh > $notDr/GR-NF/cheatsheet.txt` all of them listed
- `bash $notDr/GR-NF/ryanoasis-nerd-fonts/bin/scripts/test-fonts.sh` ugly
- `bash $notDr/GR-NF/ryanoasis-nerd-fonts/bin/scripts/test-powerlines.sh` crashed `tmux`

## 1 use - lists
    tree $pf > $notDr/GR-NF/patched-fonts.tree
    tree -fi $pf > $notDr/GR-NF/patched-fonts-paths

