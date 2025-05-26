    vim: se fdl=1:

    $misc/tricky/NF.md

- this file is symlinked in `$OSAB/nodes-set/jo-0.sh` into `$tricky/GR-NF` directory
- Nerd Fonts

# manage
maybe disable call to `git-prompt.sh` in `$AjB/bashrc-console` before entering this directory

## 0 get
    git clone --depth 1 https://github.com/ryanoasis/nerd-fonts/ $tricky/GR-NF/ryanoasis-nerd-fonts

maybe `git config --global core.compression 0` - see `$misc/CP/gitconfig`

## 1 use - $coreIT
    rg -l Arimo
    rg -l Caskaydia
    rg -l DejaVu

## 1 use - for Arch 0
    fA="$ITscc/unix-linux-forArch-fonts/nerd-fonts"
    pf="$tricky/GR-NF/ryanoasis-nerd-fonts/patched-fonts"

## 1 use - for Arch 1
    $ITscc/unix-linux-forArch-fonts/readme.md

### patched Arimo
    cp $pf/Arimo/Regular/ArimoNerdFont-Regular.ttf $fA

`$pf/Arimo/Regular/README.md` v1.33
- use `$MD4PDF/GNULinux/md4pdf.sh`

### patched Cascadia Code
    cp $pf/CascadiaCode/Regular/CaskaydiaCoveNerdFontMono-Regular.ttf $fA

`$pf/CascadiaCode/Regular/README.md` v2111.01

#### use
    $ABjo/wm/Xresources/fontNF
    $OSAB/nodes/alacritty-all.toml

### patched DejaVu Sans Mono
    cp $pf/DejaVuSansMono/Regular/DejaVuSansMNerdFontMono-Regular.ttf $fA

- `$pf/DejaVuSansMono/Regular/README.md` v2.37

#### use
    $ABjo/wm/Xresources/fontNF
    $machBld/jo/conkyrc
    $vfv/enter/gvimrc-Arch.vim

### patched Hack Bold
    cp $pf/Hack/Bold/HackNerdFont-Bold.ttf $fA

- `$pf/Hack/Bold/README.md` v3.003
- use: `$ABjo/wm/Xresources/fontNF`

### patched JetBrains
    cp $pf/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFontMono-Regular.ttf $fA

- `$pf/JetBrainsMono/Ligatures/Regular/README.md` v2.304
- use `$vfv/enter/gvimrc-Arch.vim`

### patched Meslo LG
    cp $pf/Meslo/S/Regular/MesloLGSNerdFontMono-Regular.ttf $fA

- `$pf/Meslo/M/Regular/README.md` v1.21
- use `$vfv/enter/gvimrc-Arch.vim`

### patched Ubuntu
    cp $pf/Ubuntu/Regular/UbuntuNerdFont-Regular.ttf $fA

- `$pf/Ubuntu/Regular/README.md` v0.83
- use `$MD4PDF/GNULinux/md4pdf.sh`, but loads of characters not found

### patched UbuntuMono
    cp $pf/UbuntuMono/Regular/UbuntuMonoNerdFontMono-Regular.ttf $fA

`$pf/UbuntuMono/Regular/README.md` v0.80

#### use
    $MD4PDF/GNULinux/md4pdf.sh
    $vfv/enter/gvimrc-Arch.vim

## 1 use - for MSWin10Pro
not yet

## 1 use - bin/scripts
    $tricky/GR-NF/ryanoasis-nerd-fonts/bin/scripts/README.md

    bash $tricky/GR-NF/ryanoasis-nerd-fonts/bin/scripts/cheatsheet.sh > cheatsheet.txt  # all of them listed
    bash $tricky/GR-NF/ryanoasis-nerd-fonts/bin/scripts/test-fonts.sh
    bash $tricky/GR-NF/ryanoasis-nerd-fonts/bin/scripts/test-powerlines.sh

## 1 use - lists
    tree $pf > $tricky/GR-NF/patched-fonts.tree
    tree -fi $pf > $tricky/GR-NF/patched-fonts-paths

