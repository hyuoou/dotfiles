set fenc=utf-8
set nobackup
set nowritebackup
set noswapfile
set autoread
set hidden
set showcmd

set number
set cursorline
set virtualedit=onemore
set smartindent
set showmatch
set laststatus=2
syntax enable

nnoremap j gj
nnoremap k gk
nnoremap n nzz
nnoremap N Nzz

set list
set listchars=tab:\>\-
set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nnoremap <space>q :nohlsearch<CR>

set clipboard+=unnamedplus

autocmd BufWritePre * :%s/\s\+$//ge

