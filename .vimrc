" Get [vim-plug](https://github.com/junegunn/vim-plug) if not present 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()

Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" UTF-8
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set termguicolors

" Colouring
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

" COC settings
inoremap <silent><expr> <c-space> coc#refresh()
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cf <Plug>(coc-format)
nmap <leader>ca <Plug>(coc-codeaction-selected)

" Shortcuts for editing dotfiles (.vimrc, alacritty.yml, bashrc)
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>ea :e ~/.config/alacritty/alacritty.yml<cr>
nnoremap <leader>eb :e ~/.bashrc<cr>
nnoremap <leader>et :e ~/.tmux.conf<cr>
nnoremap <leader>eg :e ~/.gitconfig<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Buffer shortcuts
nnoremap <leader><tab> :bn<cr>
nnoremap <leader><s-tab> :bp<cr>
nnoremap <leader>^ :bd<cr>

" Time stamp
nnoremap <leader>dt "=strftime("[%d %b, %Y @ %H:%M]")<cr>P

" orgmode substitue
nnoremap <leader>on GGo<space>[<space>]<space>
nnoremap <leader>oc 0f[lrx
