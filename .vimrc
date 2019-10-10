call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'valloric/youcompleteme', { 'do': './install.py --tern-completer' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'moll/vim-node'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

set number relativenumber
set ignorecase
set incsearch
set hidden
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set smarttab
set shiftwidth=2
set modifiable

let g:netrw_browse_split = 0

let g:ackprg = 'ag --vimgrep'

let mapleader = ' '

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

map mj :ALENext<cr>
map mk :ALEPrevious<cr>

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

set background=dark
colorscheme palenight
let g:ale_set_highlights = 0
let g:ale_change_sign_column_color = 1

let g:airline#extensions#tabline#enabled = 1

nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1

set wildignore+=*/.git/*,*/node_modules/*,*/tags/*

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set ttimeoutlen=50

let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

let g:ale_linters = {
 \ 'javascript': ['eslint']
 \ }

let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')

" Not working
command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

let g:gutentags_generate_on_new = 1
let g:gutentags_genetate_on_missing = 1
let g:gutentags_genetate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

" Store temporary files in a central spot
let vimtmp = $HOME . '/.tmp/' . getpid()
silent! call mkdir(vimtmp, "p", 0700)
let &backupdir=vimtmp
let &directory=vimtmp

if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
