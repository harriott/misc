" vim: set fdl=1:

" $onGH/misc/CrossPlatform/vimtest/vimrc.vim

" my testing vimrc
"  gvim -u ~/.vimtest/vimrc.vim vimrc.vim
"  vim -u ~/.vimtest/vimrc.vim test.csv

""> 0 some basic settings
set runtimepath=~/.vimtest,/usr/share/vim/vimfiles,/usr/share/vim/vim90,/usr/share/vim/vimfiles/after

""> 1 all Vims
source $vimfiles/vimrc-Arch.vim
" source $vimfiles/vimrc-GNULinux.vim
source $vimfiles/filetype.vim

""> 1 gVim
let g:monitorheight='768'
" source $vimfiles/gvimrc.vim
source $vimfiles/gvimrc-Arch.vim

""> 2 plugin
source $vimfiles/plugin/plugin.vim
" source $vimfiles/plugin/plugins.vim
"
""> 2 plugin - csv.vim
" packadd csv.vim
packadd $vimfiles/pack/packs-cp/opt/csv.vim

