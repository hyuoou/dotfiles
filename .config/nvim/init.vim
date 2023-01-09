" disable default plugins
let g:did_install_default_menus = 1
let g:did_install_syntax_menu   = 1
let g:did_indent_on             = 1
let g:did_load_filetypes        = 1
let g:loaded_2html_plugin       = 1
let g:loaded_gzip               = 1
let g:loaded_man                = 1
let g:loaded_matchit            = 1
let g:loaded_matchparen         = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_remote_plugins     = 1
let g:loaded_shada_plugin       = 1
let g:loaded_spellfile_plugin   = 1
let g:loaded_tarPlugin          = 1
let g:loaded_tutor_mode_plugin  = 1
let g:loaded_zipPlugin          = 1
let g:loaded_fzf                = 1
let g:loaded_skim               = 1
let g:skip_loading_mswin        = 1

" autocmd
augroup MyAutoCmd
  autocmd!
  autocmd BufWritePre * %s/\s\+$//ge
  autocmd FileType qf setlocal nolist
  autocmd BufRead $HOME/.config/i3/config set filetype=i3config
augroup END

" dein.vim config
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

let s:nvim_config_dir = fnamemodify(expand('<sfile>'), ':h')
let s:rc_dir = s:nvim_config_dir . '/rc/'
let s:toml_dir = s:nvim_config_dir . '/toml/'

let s:cmp_toml        = s:toml_dir .. 'cmp.toml'
let s:ddc_toml        = s:toml_dir .. 'ddc.toml'
let s:ddu_toml        = s:toml_dir .. 'ddu.toml'
let s:dein_toml       = s:toml_dir .. 'dein.toml'
let s:denops_toml     = s:toml_dir .. 'denops.toml'
let s:fern_toml       = s:toml_dir .. 'fern.toml'
let s:lang_toml       = s:toml_dir .. 'lang.toml'
let s:lazy_toml       = s:toml_dir .. 'lazy.toml'
let s:lightline_toml  = s:toml_dir .. 'lightline.toml'
let s:lsp_toml        = s:toml_dir .. 'lsp.toml'
let s:lua_toml        = s:toml_dir .. 'lua.toml'
let s:treesitter_toml = s:toml_dir .. 'treesitter.toml'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' .. s:dein_repo_dir)
endif
execute 'set runtimepath+=' .. s:dein_repo_dir

if getenv('GITHUB_GRAPHQL_API') != v:null
  let g:dein#install_github_api_token = $GITHUB_GRAPHQL_API
  command! DeinUpdate call dein#check_update(v:true)
else
  command! DeinUpdate call dein#update()
endif


let g:dein#inline_vimrcs = ['opts.vim', 'keys.vim']
call map(g:dein#inline_vimrcs, {_, val -> s:rc_dir . val})

let g:dein#auto_recache          = v:true
let g:dein#lazy_rplugins         = v:true
let g:dein#install_check_diff    = v:true
let g:dein#install_progress_type = 'floating'
let g:dein#types#git#enable_partial_clone = v:true

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " call dein#load_toml(s:cmp_toml,        {'lazy': 1})
  call dein#load_toml(s:ddc_toml,        {'lazy': 1})
  call dein#load_toml(s:ddu_toml,        {'lazy': 1})
  call dein#load_toml(s:dein_toml,       {'lazy': 0})
  call dein#load_toml(s:denops_toml,     {'lazy': 1})
  call dein#load_toml(s:fern_toml,       {'lazy': 1})
  call dein#load_toml(s:lazy_toml,       {'lazy': 1})
  call dein#load_toml(s:lang_toml,       {'lazy': 1})
  call dein#load_toml(s:lightline_toml,  {'lazy': 1})
  call dein#load_toml(s:lsp_toml,        {'lazy': 1})
  call dein#load_toml(s:lua_toml,        {'lazy': 1})
  call dein#load_toml(s:treesitter_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif


filetype plugin indent on
syntax enable

