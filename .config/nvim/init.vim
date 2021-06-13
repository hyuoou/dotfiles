" ここからコピペした -> https://qiita.com/morikooooo/items/9fd41bcd8d1ce9170301

" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
" set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
" set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" ここまでコピペ

" keymap
inoremap <C-d> <Del>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

nnoremap <C-a> <Home>
nnoremap <C-e> <End>

"プラグイン
call plug#begin()
" appearance
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'arcticicestudio/nord-vim'
" deoplete
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
" deoplete source
	Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
	Plug 'zchee/deoplete-clang'
" filetree
	Plug 'lambdalisue/fern.vim'
" fern.vim fit status
	Plug 'lambdalisue/fern-git-status.vim'
" fern.vim icon
	Plug 'lambdalisue/nerdfont.vim'
	Plug 'lambdalisue/fern-renderer-nerdfont.vim'
	Plug 'antoinemadec/FixCursorHold.nvim'
" lsp
	Plug 'prabirshrestha/async.vim'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'lighttiger2505/deoplete-vim-lsp'
" run goimports
	Plug 'mattn/vim-goimports'
" lexima
	Plug 'cohama/lexima.vim'
" terminal
	Plug 'kassio/neoterm'
call plug#end()

set background=dark
colorscheme nord
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

let g:cursorhold_updatetime = 100

" Open fern.vim
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>

" fern.vim show icon
let g:fern#renderer = 'nerdfont'

" delete space
autocmd BufWritePre * :%s/\s\+$//ge

" neoterm config
let g:neoterm_default_mod = 'vertical belowright'
let g:neoterm_autoinsert = 1
nnoremap <C-o> :Tnew<CR>

" deoplete-go config
let g:deoplete#sources#go#gocode_binary = '$GOBIN/gocode'
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
