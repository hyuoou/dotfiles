call plug#begin()
" lsp
	Plug 'neovim/nvim-lspconfig'
	Plug 'matsui54/denops-popup-preview.vim', {'branch': 'main'}
" complete
	Plug 'Shougo/ddc.vim', {'branch': 'main'}
	Plug 'Shougo/pum.vim', {'branch': 'main'}
	Plug 'Shougo/ddc-around', {'branch': 'main'}
	Plug 'Shougo/ddc-sorter_rank', {'branch': 'main'}
	Plug 'Shougo/ddc-matcher_head', {'branch': 'main'}
	Plug 'Shougo/ddc-converter_remove_overlap', {'branch': 'main'}
	Plug 'tani/ddc-fuzzy', {'branch': 'main'}
	Plug 'Shougo/ddc-nvim-lsp', {'branch': 'main'}
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
" backslash
	Plug 'lambdalisue/vim-backslash'
call plug#end()

