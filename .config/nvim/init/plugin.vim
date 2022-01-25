call plug#begin()
" lsp
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
" fern
	Plug 'lambdalisue/fern.vim'
	Plug 'lambdalisue/fern-git-status.vim'
	Plug 'lambdalisue/fern-renderer-nerdfont.vim'
	Plug 'antoinemadec/FixCursorHold.nvim'
" icon
	Plug 'ryanoasis/vim-devicons'
	Plug 'lambdalisue/nerdfont.vim'
" theme
	Plug 'arcticicestudio/nord-vim'
	Plug 'tjdevries/colorbuddy.nvim'
	Plug 'andersevenrud/nordic.nvim', {'branch': 'main'}
" statusline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
" snippets
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'
" treesitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'p00f/nvim-ts-rainbow'
" fzf
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
" translation
	Plug 'skanehira/denops-translate.vim', {'branch': 'main'}
" document
	Plug 'vim-jp/vimdoc-ja'
" golang
	Plug 'mattn/vim-goimports'
" terminal
	Plug 'kassio/neoterm'
" debug
	Plug 'skywind3000/asyncrun.vim'
" template
	Plug 'mattn/vim-sonictemplate'
" comment
	Plug 'tpope/vim-commentary'
" markdown
	Plug 'kat0h/bufpreview.vim'
	Plug 'mattn/vim-maketable'
" deno
	Plug 'vim-denops/denops.vim', {'branch': 'main'}
" autopair
	Plug 'cohama/lexima.vim'
" git
	Plug 'tpope/vim-fugitive'
" skk
	Plug 'vim-skk/skkeleton', {'branch': 'main'}
" undo
	Plug 'mbbill/undotree'
call plug#end()

