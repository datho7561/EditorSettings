" Colouring
syntax enable
let g:molokai_original = 1
colorscheme molokai

" Numbers and 80 char marker
set nu
let &colorcolumn=join(range(81,999),",")

" Indentation (set tabs to 4 wide, add autoindent, 
" keep tab insertiing tabs because it allows working with
" both space and tab indented files
set tabstop=4
set autoindent

" Splitting settings
set splitright

" Font (GUI)
if has('gui_running')
    set guifont=Ubuntu\ Mono\ 14
endif

execute pathogen#infect()
call pathogen#helptags()
