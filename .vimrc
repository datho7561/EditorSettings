" Get [vim-plug](https://github.com/junegunn/vim-plug) if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()

Plug 'datho7561/molokai', {'branch': 'monokai-datho7561'}
Plug 'arcticicestudio/nord-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" UTF-8
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" Colouring
set termguicolors
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

" Highlight current line
set cursorline

" Font in GVIM
set gfn=Fira\ Mono\ for\ Powerline\ 13

" for tabline and statusline
set showtabline=2
set laststatus=2
set noshowmode
set cmdheight=2

" lightline config
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ 'active': {
      \   'left': [['mode']],
      \   'right': [['lineinfo'], ['filetype']],
      \ },
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [],
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }

" cursor needs to be at bottom/top to move view
set scrolloff=0

" Disable menus in GVIM
set go-=m  "menu bar
set go-=T  "toolbar
set go-=r  "scrollbar
set go+=d  "Use GTK dark theme

" Show whitespace characters
set listchars=tab:→\ ,space:·
set list

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

" Themes
nnoremap <leader>tn :colorscheme nord<cr>
nnoremap <leader>tm :colorscheme molokai<cr>
nnoremap <leader>ts :set background=light<cr>:colorscheme solarized8<cr>

" Buffer shortcuts
nnoremap <leader><tab> :bn<cr>
nnoremap <leader><s-tab> :bp<cr>
nnoremap <leader>^ :bd<cr>

" Time stamp
nnoremap <leader>dt "=strftime("[%d %b, %Y @ %H:%M]")<cr>P

" orgmode substitute
nnoremap <leader>on GGo<space>[<space>]<space>
nnoremap <leader>oc 0f[lrx
