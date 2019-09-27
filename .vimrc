" Colouring
syntax enable
let g:molokai_original = 1
colorscheme molokai

" Numbers and 80 char marker
set nu
let &colorcolumn=join(range(81,999),",")

" Indentation (set tabs to 4 wide,
" keep tab inserting tabs because it allows working with
" both space and tab indented files
" I used to use auto tabbing but now prefer to do my own indenting to make sure its consistent
set tabstop=4

" Splitting settings
set splitright

" Autocomplete for :o
set wildmode=longest:full,full

" Semicolon is also colon in normal mode
nmap ; :

" Make statusline always active
set laststatus=2

" Font (GUI)
if has('gui_running')
    set guifont=Ubuntu\ Mono\ 14
endif

execute pathogen#infect()
call pathogen#helptags()
