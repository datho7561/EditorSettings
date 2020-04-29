" UTF-8
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set termguicolors

" Colouring
syntax enable
colorscheme molokai

" Numbers and 80 char marker
set nu
let &colorcolumn=join(range(81,82),",")

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

" Font in GVIM
set gfn=Fira\ Mono\ for\ Powerline\ 13

" airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_left_alt_sep = ''
let g:airline_right_sep=''
let g:airline_right_alt_sep = ''
let g:airline_theme='base16_monokai'

" Disable
set go-=m  "menu bar
set go-=T  "toolbar
set go-=r  "scrollbar

" NICE ;)
set go+=d  "Use GTK dark theme
