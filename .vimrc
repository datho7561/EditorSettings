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

" Set tabs to be 4 wide, and keep tab button to insert a tab
set tabstop=4

" Splitting settings
set splitright

" Autocomplete for :o
set wildmode=longest:full,full

" Highlight search results
set hlsearch

" Font in GVIM
set gfn=Fira\ Mono\ for\ Powerline\ 13

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_left_alt_sep = ''
let g:airline_right_sep=''
let g:airline_right_alt_sep = ''

" Disable menus in GVIM
set go-=m  "menu bar
set go-=T  "toolbar
set go-=r  "scrollbar
set go+=d  "Use GTK dark theme

" Semicolon is also colon in normal mode
nnoremap ; :

" Disable wq since it is easy to fat finger this combo
cnoremap wq <nop>

" Set Leader
let mapleader = " "

" Shortcuts for editing .vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Switch between dark and light themes (molokai and solarized light)
nnoremap <leader>td :set background=dark<cr>:colorscheme molokai<cr>
nnoremap <leader>tl :set background=light<cr>:colorscheme solarized<cr>

" Spotify shortcuts
nnoremap <leader>mn :!spotifycli --next<cr><cr>
nnoremap <leader>mp :!spotifycli --prev && spotifycli --prev<cr><cr>
nnoremap <leader>mt :!spotifycli --playpause<cr><cr>
