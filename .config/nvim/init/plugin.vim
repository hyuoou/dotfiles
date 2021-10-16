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
	Plug 'ryanoasis/vim-devicons'
" lsp
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
" snippets
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'
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
" indent
	Plug 'Yggdroot/indentLine'
" fzf
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
" template
	Plug 'mattn/vim-sonictemplate'
" comment
	Plug 'tpope/vim-commentary'
" neovim nightly plugins "
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'p00f/nvim-ts-rainbow'
	Plug 'tjdevries/colorbuddy.nvim'
	Plug 'maaslalani/nordbuddy', {'branch': 'main'}
call plug#end()

