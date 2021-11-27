" setting
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd

" 見た目系
set number
set cursorline
set virtualedit=onemore
set smartindent
" set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk
syntax enable

" Tab系
set list listchars=tab:\>\-
" set expandtab
set tabstop=4
set shiftwidth=4

" 検索系
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" clipboard
set clipboard+=unnamedplus

" delete space
autocmd BufWritePre * :%s/\s\+$//ge

