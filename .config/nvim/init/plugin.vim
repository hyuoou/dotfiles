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
	Plug 'lambdalisue/fern.vim', {'on': 'Fern'}
	Plug 'lambdalisue/fern-git-status.vim', {'on': 'Fern'}
	Plug 'lambdalisue/fern-renderer-nerdfont.vim', {'on': 'Fern'}
	Plug 'antoinemadec/FixCursorHold.nvim'
" icon
	Plug 'ryanoasis/vim-devicons'
	Plug 'lambdalisue/nerdfont.vim'
" theme
	Plug 'arcticicestudio/nord-vim'
	Plug 'tjdevries/colorbuddy.nvim'
	Plug 'andersevenrud/nordic.nvim', {'branch': 'main'}
" statusline
	Plug 'itchyny/lightline.vim'
	Plug 'itchyny/vim-gitbranch'
	Plug 'josa42/nvim-lightline-lsp'
" snippets
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'
" treesitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'p00f/nvim-ts-rainbow'
" fuzzyfinder
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
" translation
	Plug 'skanehira/denops-translate.vim', {'branch': 'main'}
" document
	Plug 'vim-jp/vimdoc-ja'
" golang
	Plug 'mattn/vim-goimports', {'for': 'go'}
" terminal
	Plug 'kassio/neoterm', {'on': 'Ttoggle'}
" debug
	Plug 'skywind3000/asyncrun.vim', {'on': 'AsyncRun'}
" template
	Plug 'mattn/vim-sonictemplate', {'on': 'Template'}
" comment
	Plug 'tpope/vim-commentary'
" markdown
	Plug 'kat0h/bufpreview.vim', {'on': 'PreviewMarkdown'}
	Plug 'mattn/vim-maketable', {'on': 'MakeTable'}
" deno
	Plug 'vim-denops/denops.vim', {'branch': 'main'}
" autopair
	Plug 'cohama/lexima.vim'
" skk
	Plug 'vim-skk/skkeleton', {'branch': 'main'}
" backslash
	Plug 'lambdalisue/vim-backslash', {'for': 'vim'}
call plug#end()

