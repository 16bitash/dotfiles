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
set hidden
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set smarttab
set shiftwidth=2
set modifiable

let g:ackprg = 'ag --vimgrep'

let mapleader = ' '

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
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

" Store temporary files in a central spot
let vimtmp = $HOME . '/.tmp/' . getpid()
silent! call mkdir(vimtmp, "p", 0700)
let &backupdir=vimtmp
let &directory=vimtmp

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
