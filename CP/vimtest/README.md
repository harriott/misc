vim: set fdl=4:

$misc/CP/vimtest/README.md

# vimfiles test
my reduced vim files for testing

## 0 symlink this folder
    $OSAB/bs-symlinks/jo-2-whenWM-0.sh

## 1 linux 0 setup this directory
    rpa(){ rsync -irtv --delete $vfp/$1/ $misc/CP/vimtest/pack/$1; }
        rpa packs-cp/opt/bufferize.vim
        rpa packs-cp/opt/vim-bbcode
        rpa packs-cp/opt/vim-dokuwiki
        rpa packs-cp/opt/vim-markdown

symlinked in my `$OSAB/bs-symlinks/jo-2-whenWM-0.sh` to `~/.vimtest`

## 1 linux 1 my tests
    gvim -u ~/.vimtest/vimrc.vim vimrc.vim

    vim -u ~/.vimtest/vimrc.vim vimrc.vim

    vim -u ~/.vimtest/vimrc.vim README.md

    vim -u ~/.vimtest/vimrc.vim filetypes/test.bbcode
    vim -u ~/.vimtest/vimrc.vim filetypes/test.csv
    vim -u ~/.vimtest/vimrc.vim filetypes/test-csv-1.md
    vim -u ~/.vimtest/vimrc.vim filetypes/test.dw

### harriott/vim-markdown
    vim -u ~/.vimtest/vimrc.vim filetypes/test_bbcode.md
    vim -u ~/.vimtest/vimrc.vim filetypes/test_csv-0.md
    vim -u ~/.vimtest/vimrc.vim filetypes/test_ps1.md
    vim -u ~/.vimtest/vimrc.vim filetypes/test_tex.md

## 2 MSWin 0 setup this directory
    ri $misc/CP/vimtest/pack/packs-cp/opt/* -recurse -force
    robocopy /mir $vimfiles\plugin\fzf $misc/CP/vimtest/plugin/fzf

