call plug#begin()
" lsp
	" Plug 'prabirshrestha/asyncomplete.vim'
	" Plug 'prabirshrestha/asyncomplete-lsp.vim'
	" Plug 'prabirshrestha/vim-lsp'
	" Plug 'mattn/vim-lsp-settings'
	Plug 'neovim/nvim-lspconfig'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'onsails/lspkind-nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'folke/trouble.nvim'
" filetree
	Plug 'lambdalisue/fern.vim'
	Plug 'lambdalisue/fern-git-status.vim'
	Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" icon
	Plug 'ryanoasis/vim-devicons'
	Plug 'lambdalisue/nerdfont.vim'
	Plug 'antoinemadec/FixCursorHold.nvim'
" theme
	Plug 'arcticicestudio/nord-vim'
	Plug 'tjdevries/colorbuddy.nvim'
	Plug 'maaslalani/nordbuddy', {'branch': 'main'}
" airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
" snippets
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'
	Plug 'hrsh7th/cmp-vsnip'
" treesitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'p00f/nvim-ts-rainbow'
" fzf
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
" Translation
	Plug 'skanehira/translate.vim'
" document
	Plug 'vim-jp/vimdoc-ja'
" golang
	Plug 'mattn/vim-goimports'
" terminal
	Plug 'kassio/neoterm'
" debug
	Plug 'skywind3000/asyncrun.vim'
" indent
	Plug 'Yggdroot/indentLine'
" template
	Plug 'mattn/vim-sonictemplate'
" comment
	Plug 'tpope/vim-commentary'
" markdown
	Plug 'kat0h/bufpreview.vim'
" deno
	Plug 'vim-denops/denops.vim', {'branch': 'main'}
" lexima
	Plug 'cohama/lexima.vim'
" git
	Plug 'tpope/vim-fugitive'
call plug#end()
