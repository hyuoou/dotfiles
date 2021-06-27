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
"set expandtab
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

" clipboard
set clipboard+=unnamedplus

" keymap
inoremap <C-d> <Del>
inoremap <C-b> <BS>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <silent> jj <ESC>

nnoremap <C-a> <Home>
nnoremap <C-e> <End>
nnoremap <C-t> :Translate!

vnoremap <C-a> <Home>
vnoremap <C-e> <End>
vnoremap <C-t> :Translate<CR>

" plugin
call plug#begin()
" airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'arcticicestudio/nord-vim'
" filetree
	Plug 'lambdalisue/fern.vim'
" fern.vim git status
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
" run goimports
	Plug 'mattn/vim-goimports'
" lexima
	Plug 'cohama/lexima.vim'
" terminal
	Plug 'kassio/neoterm'
" debug
	Plug 'skywind3000/asyncrun.vim'
" rainbow
"	Plug 'luochen1990/rainbow'
" git
	Plug 'tpope/vim-fugitive'
	let g:rainbow_active = 1
" Translation
	Plug 'skanehira/translate.vim'
	Plug 'vim-jp/vimdoc-ja'
	set helplang=ja
" spell check
	Plug 'kamykn/spelunker.vim'
	Plug 'kamykn/popup-menu.nvim'
" dart
	Plug 'dart-lang/dart-vim-plugin'
" flutter
	Plug 'thosakwe/vim-flutter'
" indent
	Plug 'Yggdroot/indentLine'
" fzf
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
" template
	Plug 'mattn/vim-sonictemplate'
" neovim nightly plugins "
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'p00f/nvim-ts-rainbow'
	Plug 'tjdevries/colorbuddy.nvim'
	Plug 'maaslalani/nordbuddy'
call plug#end()

set nospell

" appearance
set background=dark
let g:airline_theme = 'nord'
colorscheme nord
lua require('colorbuddy').colorscheme('nordbuddy')
" vim-airline tab key
nnoremap <C-u> :bp<CR>
nnoremap <C-i> :bn<CR>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}

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
let g:neoterm_size = 80
nnoremap <C-p> :Ttoggle<CR>
tnoremap <C-p> :Ttoggle<CR>
tnoremap <Esc> <C-\><C-n>

" auto open quickfix
augroup MyGroup
	autocmd User AsyncRunStart call asyncrun#quickfix_toggle(20, 1)
augroup END

" debug
nnoremap <C-o> :AsyncRun

" set filetype
autocmd BufRead,BufNewFile *.c setfiletype c
autocmd BufRead,BufNewFile *.go setfiletype go
autocmd BufRead,BufNewFile *.cpp setfiletype c++

" lua config
lua <<EOF
-- treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true,              -- false will disable the whole extension
		disable = { "vue", "ruby" },  -- list of language that will be disabled
	},
}
-- nvim-ts-rainbow
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  }
}
EOF

" fzf key
nnoremap ff :Files<CR>

" template folder
let g:sonictemplate_vim_template_dir = '$HOME/.config/nvim/sonictemplate'

highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

