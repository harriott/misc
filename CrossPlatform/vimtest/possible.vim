
" configurations that might be tested

""> 0 check that this file's not been sourced
let g:possible_vim = 1

""> 1 plugin - ALE
packadd ale

""> 1 plugin - fzf.vim
packadd fzf.vim

""> 1 plugin - vim-illuminate
packadd vim-illuminate

""> 1 plugin - ingo-library
packadd vim-ingo-library

""> 1 plugin - vim-airline
packadd vim-airline

""> 1 plugin - vim-ShowTrailingWhitespace
packadd vim-ShowTrailingWhitespace

""> 1 plugin - vim-startify
packadd vim-startify

""> 1 plugin - vim-colors-tomorrow
colorscheme tomorrow

""> 1 plugin - VimTeX
packadd vimtex

""> 2 plugin - after
source $vimfiles/after/plugin/plugins.vim

""> 3 ftplugin
source $misc/CrossPlatform/vimtest/ftplugin-csv.vim

