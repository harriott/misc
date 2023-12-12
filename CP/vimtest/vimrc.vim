" vim: set fdl=1:

" $misc/CrossPlatform/vimtest/vimrc.vim

" my testing vimrc
" ----------------

""> 0 some basic settings
set packpath=~/.vimtest,/usr/share/vim/vim90
set runtimepath=~/.vimtest,/usr/share/vim/vimfiles,/usr/share/vim/vim90
" $misc/CrossPlatform/vimtest/filetype.vim  gets sourced

""> 1 Vim flavour - all
" if !has('nvim') | source $HOME/.vim/vimrc_example.vim | endif
" source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/defaults.vim
" source $vimfiles/vimrc-Arch.vim
" source $vimfiles/vimrc-GNULinux.vim
" source $vimfiles/filetype.vim

""> 1 Vim flavour - gVim
" let g:monitorheight='768'
" source $vimfiles/gvimrc.vim
" source $vimfiles/gvimrc-Arch.vim

""> 2 plugin
" source $vimfiles/plugin/plugin.vim
" source $vimfiles/plugin/plugins.vim
"
""> 3 plugin - ~/.vimtest/pack
" find . -maxdepth 4 -mindepth 4 -type d
packadd bufferize.vim
" packadd vim-bbcode
" packadd csv.vim
" packadd vim-dokuwiki
packadd vim-markdown

