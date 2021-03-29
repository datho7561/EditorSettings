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

" modify the lightline molokai theme to suit my needs
let s:black = [ '#272822', 233 ]
let s:gray = [ '#808080', 244 ]
let s:white = [ '#f8f8f2', 234 ]
let s:cyan = [ '#66d9ef', 81 ]
let s:green = [ '#a9dc76', 118 ]
let s:orange = [ '#fc9867', 166 ]
let s:pink = [ '#f92672', 161 ]
let s:red = [ '#ff0000', 160 ]
let s:yellow = [ '#e6db74', 229 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [ [ s:black, s:cyan ], [ s:orange, s:black ] ]
let s:p.normal.middle = [ [ s:orange, s:black ] ]
let s:p.normal.right = [ [ s:pink, s:black ], [ s:black, s:pink ] ]
let s:p.normal.error = [ [ s:pink, s:black ] ]
let s:p.normal.warning = [ [ s:yellow, s:black ] ]
let s:p.insert.left = [ [ s:black, s:green ], [ s:green, s:black ] ]
let s:p.visual.left = [ [ s:black, s:yellow ], [ s:yellow, s:black ] ]
let s:p.replace.left = [ [ s:black, s:red ], [ s:red, s:black ] ]
let s:p.inactive.left =  [ [ s:pink, s:black ], [ s:white, s:black ] ]
let s:p.inactive.middle = [ [ s:gray, s:black ] ]
let s:p.inactive.right = [ [ s:white, s:pink ], [ s:pink, s:black ] ]
let s:p.tabline.left = [ [ s:pink, s:black ] ]
let s:p.tabline.middle = [ [ s:pink, s:black] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.tabline.tabsel = [ [ s:black, s:pink ] ]

let g:lightline#colorscheme#molokai#palette = lightline#colorscheme#flatten(s:p)

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

" CoC settings
inoremap <silent><expr> <c-space> coc#refresh()
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cD <Plug>(coc-type-definition)
nmap <leader>cf <Plug>(coc-format)
nmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <leader>cr <Plug>(coc-references)

" Shortcuts for editing dotfiles (.vimrc, alacritty.yml, bashrc)
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>ea :e ~/.config/alacritty/alacritty.yml<cr>
nnoremap <leader>eb :e ~/.bashrc<cr>
nnoremap <leader>et :e ~/.tmux.conf<cr>
nnoremap <leader>eg :e ~/.gitconfig<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" hide files from CtrlP search
let g:ctrlp_custom_ignore = '(node_modules|out|target|\.git)'

" Themes
nnoremap <leader>tn :colorscheme nord<cr>
nnoremap <leader>tm :colorscheme molokai<cr>
nnoremap <leader>ts :set background=light<cr>:colorscheme solarized8<cr>

" Buffer shortcuts
nnoremap <leader><tab> :bn<cr>
nnoremap <leader><s-tab> :bp<cr>
nnoremap <leader>^ :bd<cr>

" orgmode substitue
nnoremap <leader>ot o<space>[<space>]<space>
nnoremap <leader>on o<space><space>*<space><space>
nnoremap <leader>oc 0f[lrx
nnoremap <leader>oi 05i<space><esc>
nnoremap <leader>ou 05x
nnoremap <leader>od "=strftime("[%d %b, %Y @ %H:%M]")<cr>P
