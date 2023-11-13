vim: set fdl=4:

$misc/CrossPlatform/vimtest/README.md

## vimfiles test
my reduced vim files for testing

## how I setup this folder
    rpa(){ rsync -irtv --delete $vfp/$1/ $misc/CrossPlatform/vimtest/pack/$1; }
        rpa packs-cp/opt/bufferize.vim
        rpa packs-cp/opt/vim-bbcode
        rpa packs-cp/opt/vim-dokuwiki
        rpa packs-cp/opt/vim-markdown

symlinked in my `$OSAB/bs-symlinks/jo-2-whenWM-0.sh` to `~/.vimtest`

## my tests
    gvim -u ~/.vimtest/vimrc.vim vimrc.vim

    vim -u ~/.vimtest/vimrc.vim vimrc.vim

    vim -u ~/.vimtest/vimrc.vim README.md

    vim -u ~/.vimtest/vimrc.vim test.bbcode
    vim -u ~/.vimtest/vimrc.vim test.csv
    vim -u ~/.vimtest/vimrc.vim test-csv-1.md
    vim -u ~/.vimtest/vimrc.vim test.dw

### harriott/vim-markdown
    vim -u ~/.vimtest/vimrc.vim test-bbcode.md
    vim -u ~/.vimtest/vimrc.vim test-csv-0.md
    vim -u ~/.vimtest/vimrc.vim test-ps1.md
    vim -u ~/.vimtest/vimrc.vim test-tex.md

