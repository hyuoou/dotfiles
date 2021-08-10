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
" git
	Plug 'tpope/vim-fugitive'
" Translation
	Plug 'skanehira/translate.vim'
	Plug 'vim-jp/vimdoc-ja'
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
" markdown
	Plug 'skanehira/preview-markdown.vim'
" neovim nightly plugins "
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'p00f/nvim-ts-rainbow'
	Plug 'tjdevries/colorbuddy.nvim'
	Plug 'maaslalani/nordbuddy'
call plug#end()