call plug#begin('~/.cache/vim-plug/')
" lsp
	Plug 'neovim/nvim-lspconfig'
" ddc.vim
	Plug 'Shougo/ddc.vim', {'branch': 'main'}
" pum.vim
	Plug 'Shougo/pum.vim', {'branch': 'main'}
" ddc source
	Plug 'Shougo/ddc-around', {'branch': 'main'}
	Plug 'Shougo/ddc-nvim-lsp', {'branch': 'main'}
	Plug 'Shougo/ddc-mocword', {'branch': 'main'}
	Plug 'LumaKernel/ddc-file', {'branch': 'main'}
	Plug 'LumaKernel/ddc-tabnine', {'branch': 'main'}
	Plug 'matsui54/ddc-buffer', {'branch': 'main'}
	Plug 'delphinus/ddc-tmux', {'branch': 'main'}
" ddc filter
	Plug 'Shougo/ddc-converter_remove_overlap', {'branch': 'main'}
	Plug 'tani/ddc-fuzzy', {'branch': 'main'}
" ddc popup
	Plug 'matsui54/denops-popup-preview.vim', {'branch': 'main'}
" ddu.vim
	Plug 'Shougo/ddu.vim', {'branch': 'main'}
" ddu ui
	Plug 'Shougo/ddu-ui-ff', {'branch': 'main'}
" ddu source
	Plug 'Shougo/ddu-source-file_rec', {'branch': 'main'}
	Plug 'Shougo/ddu-source-file_old', {'branch': 'main'}
	Plug 'Shougo/ddu-source-line', {'branch': 'main'}
	Plug 'Shougo/ddu-source-action', {'branch': 'main'}
	Plug 'Shougo/ddu-source-file', {'branch': 'main'}
	Plug 'shun/ddu-source-buffer', {'branch': 'main'}
	Plug 'shun/ddu-source-rg', {'branch': 'main'}
	Plug 'gamoutatsumi/ddu-source-nvim-lsp'
	Plug 'matsui54/ddu-source-file_external', {'branch': 'main'}
	Plug 'matsui54/ddu-source-command_history', {'branch': 'main'}
	Plug 'matsui54/ddu-source-help', {'branch': 'main'}
" ddu filter
	Plug 'Shougo/ddu-filter-matcher_substring', {'branch': 'main'}
" ddu kind
	Plug 'Shougo/ddu-kind-file', {'branch': 'main'}
" ddu command
	Plug 'Shougo/ddu-commands.vim', {'branch': 'main'}
" filer
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
" statusline
	Plug 'itchyny/lightline.vim'
	Plug 'itchyny/vim-gitbranch'
	Plug 'josa42/nvim-lightline-lsp'
	Plug 'mengelbrecht/lightline-bufferline'
" snippets
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'
" treesitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'p00f/nvim-ts-rainbow'
" translate
	Plug 'skanehira/denops-translate.vim', {'branch': 'main'}
" document
	Plug 'vim-jp/vimdoc-ja'
" golang
	Plug 'mattn/vim-goimports', {'for': 'go'}
" terminal
	Plug 'Shougo/deol.nvim', {'on': 'Deol'}
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
" silicon
	Plug 'segeljakt/vim-silicon', {'on': 'Silicon'}
" git
	Plug 'kdheepak/lazygit.nvim', {'branch': 'main', 'on': 'LazyGit'}
	Plug 'lambdalisue/gin.vim', {'branch': 'main'}
" surround
	Plug 'tpope/vim-surround'
call plug#end()

