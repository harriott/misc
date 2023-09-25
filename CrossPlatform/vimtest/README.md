vim: set fdl=4:

## vimfiles test
my reduced vim files for testing

## how I setup this folder
    rsync -irtv --delete $vimfiles/pack/packs-cp/ $CrPl/encoding/Vim/test/pack/packs-cp/
    rsync -irtv --delete $vimfiles/pack/packs-unix/ $CrPl/encoding/Vim/test/pack/packs-unix/
    rsync -irtv --delete $vimfiles/pack/packs-win32/ $CrPl/encoding/Vim/test/pack/packs-win32/

symlinked in my `$OSAB/bs-symlinks/jo-2-whenWM-0.sh` to `~/.vimtest`

## my tests of csv.vim
    vim -u ~/.vimtest/vimrc.vim ~/.vimtest/test.csv

