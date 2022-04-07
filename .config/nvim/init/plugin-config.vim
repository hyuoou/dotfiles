" lightline
let g:lightline = {}
let g:lightline.colorscheme = 'nord'
let g:lightline.separator = {'left': "\ue0b0", 'right': "\ue0b2"}
let g:lightline.subseparator = {'left': "\ue0b1", 'right': "\ue0b3"}

let g:lightline.active = {}
let g:lightline.active.left = [
	\ ['mode', 'paste'],
	\ ['gitbranch', 'readonly', 'filename', 'modified'],
	\ ]
let g:lightline.active.right = [
	\ ['lsp_warnings', 'lsp_errors'],
	\ ['lineinfo', 'percent'],
	\ ['fileformat', 'fileencoding', 'filetype'],
	\ ]

let g:lightline.component_function = {
	\ 'gitbranch': 'GetGitBranch'
	\ }

let g:lightline.tabline = {
	\ 'left': [['buffers']],
	\ 'right': [[]],
	\ }

let g:lightline.component_expand = {
	\ 'buffers': 'lightline#bufferline#buffers'
	\ }

let g:lightline.component_type = {
	\ 'buffers': 'tabsel'
	\ }

function! GetGitBranch() abort
	if gitbranch#name() != ''
		return ' '.gitbranch#name()
	else
		return ''
	endif
endfunction

" lightline bufferline
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#icon_position = 'right'

" lightline nvim lsp
let g:lightline#lsp#indicator_warnings = 'W:'
let g:lightline#lsp#indicator_errors = 'E:'
call lightline#lsp#register()

autocmd MyAutoCmd DiagnosticChanged * call lightline#update()

" vimdoc-ja
set helplang=ja

" silicon
let g:silicon = {
	\ 'theme': 'Nord',
	\ 'font':  'SauceCodePro Nerd Font'
	\ }
let g:silicon['output'] = '~/Pictures/silicon/silicon-{time:%Y-%m-%d-%H:%M:%S}.png'

" neoterm
let g:neoterm_default_mod = 'vertical belowright'
let g:neoterm_autoinsert = 1
let g:neoterm_size = 80

nnoremap <silent> <C-p> <Cmd>Ttoggle<CR>

autocmd MyAutoCmd FileType neoterm call s:neoterm_config()
function! s:neoterm_config() abort
	tnoremap <silent> jj <C-\><C-n>
	tnoremap <silent> <C-p> <C-\><C-n><Cmd>Ttoggle<CR>
endfunction

" fern
let g:fern#renderer = 'nerdfont'

nnoremap <silent> sf <Cmd>Fern .<CR>
nnoremap <silent> fs <Cmd>Fern . -reveal=% -drawer -toggle -width=40<CR>

autocmd MyAutoCmd Filetype fern call s:fern_config()
function! s:fern_config() abort
	nmap <buffer><silent> y <Plug>(fern-action-clipboard-copy)
	nmap <buffer><silent> m <Plug>(fern-action-clipboard-move)
	nmap <buffer><silent> p <Plug>(fern-action-clipboard-paste)
	nmap <buffer><silent> d <Plug>(fern-action-remove)
	nmap <buffer><silent> r <Plug>(fern-action-rename:bottom)
	nnoremap <buffer><silent> <C-p> <Up>
endfunction

" lazygit.nvim
let g:lazygit_floating_window_corner_chars = ['┌', '┐', '└', '┘']

nnoremap <silent> <space>g <Cmd>LazyGit<CR>

" asyncrun
autocmd MyAutoCmd User AsyncRunStart call asyncrun#quickfix_toggle(20, 1)

" sonictemplete
let g:sonictemplate_vim_template_dir = '$HOME/.config/nvim/template'

" vsnip
let g:vsnip_snippet_dir = '$HOME/.config/nvim/vsnip'

" FixCursorHold
let g:cursorhold_updatetime = 100

" skkeleton
call skkeleton#config({
	\ 'eggLikeNewline': v:true,
	\ })
call skkeleton#register_kanatable('rom', {
	\ 'jj': 'escape',
	\ ';': 'henkanPoint',
	\ })

lua <<EOF
-- treesitter
require("nvim-treesitter.configs").setup {
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	},
-- nvim-ts-rainbow
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1000,
		colors = {
			"#E8BA36",
			"#54A857",
			"#359FF4",
			"#5060BB",
			"#179387",
			"#88c0d0",
			"#5e81ac",
		},
	},
}
-- nvim-lspconfig
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<C-h>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ge', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

local servers = { 'clangd', 'gopls', 'bashls', 'vimls', 'rust_analyzer' }
for _, lsp in pairs(servers) do
	require('lspconfig')[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
EOF

" translate.vim
nmap <C-t> <Plug>(Translate)
vmap <C-t> <Plug>(VTranslate)

" skkeleton
imap <C-s> <Plug>(skkeleton-toggle)
cmap <C-s> <Plug>(skkeleton-toggle)

" vsnip
let g:vsnip_snippet_dir = '$HOME/.config/nvim/vsnip'

imap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

" ddc config
call ddc#custom#patch_global({
	\ 'backspaceCompletion': v:true,
	\ 'completionMenu': 'pum.vim',
	\ })

call ddc#custom#patch_global('sources', ['nvim-lsp', 'tabnine', 'vsnip', 'skkeleton', 'around', 'file'])
call ddc#custom#patch_global('sourceOptions', {
	\ '_': {
	\ 	'ignoreCase': v:true,
	\ 	'matchers': ['matcher_fuzzy'],
	\ 	'sorters': ['sorter_fuzzy'],
	\ 	'converter': ['converter_remove_overlap', 'converter_fuzzy']},
	\ 'vsnip': {
	\ 	'mark': 'VS',
	\ 	'dup': v:true,
	\ },
	\ 'nvim-lsp': {
	\ 	'mark': 'LSP',
	\ 	'dup': v:true,
	\ 	'isVolatile': v:true,
	\ 	'minAutoCompleteLength': 1,
	\ 	'forceCompletionPattern': '\.\w*|:\w*|->\w*',
	\ },
	\ 'skkeleton': {
	\ 	'mark': 'SKK',
	\ 	'matchers': ['skkeleton'],
	\ 	'sorters': [],
	\ 	'minAutoCompleteLength': 1,
	\ },
	\ 'around': {
	\ 	'mark': 'A',
	\ 	'isVolatile': v:true,
	\ },
	\ 'file': {
	\ 	'mark': 'F',
	\ 	'isVolatile': v:true,
	\ 	'forceCompletionPattern': '\S/\S*',
	\ },
	\ 'tabnine': {
	\ 	'mark': 'TN',
	\ 	'maxItems': 5,
	\ 	'isVolatile': v:true,
	\ },
	\ })

" enable ddc
call ddc#enable()
call popup_preview#enable()

" pum mapping
let g:lexima_map_escape = '<Plug>(lexima-escape)'
let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()

inoremap <silent><expr> <C-n> pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' : '<C-n>'
inoremap <silent><expr> <C-p> pum#visible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>' : '<C-p>'
inoremap <silent><expr> <Esc> pum#visible() ? '<Cmd>call pum#map#cancel()<CR>'  : '<Plug>(lexima-escape)'
inoremap <silent><expr> <CR>  pum#visible() ? '<Cmd>call pum#map#confirm()<CR>' : lexima#expand('<LT>CR>', 'i')
autocmd User PumCompleteDone call vsnip_integ#on_complete_done(g:pum#completed_item)

call ddu#custom#patch_global({
	\ 'ui': 'ff',
	\ 'uiParams': {
	\ 	'ff': {
	\ 		'split': 'floating',
	\ 		'previewFloating': v:true,
	\ 		'previewHeight': 20,
	\ 		'previewWidth': 100,
	\ 	},
	\ },
	\ 'sourceOptions': {
	\ 	'_': {
	\ 		'matchers': ["matcher_substring"],
	\ 		'ignoreCase': v:true,
	\ 	},
	\ 	'command_history': {
	\ 		'defaultAction': 'execute',
	\ 	},
	\ },
	\ 'sourceParams': {
	\ 	'file_external': {'cmd': ['git', 'ls-files', '-co', '--exclude-standard']},
	\ },
	\ 'kindOptions': {
	\ 	'file': {
	\ 		'defaultAction': 'open',
	\ 	},
	\ 	'action': {
	\ 		'defaultAction': 'do',
	\ 	},
	\ },
	\ })

autocmd MyAutoCmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
	nnoremap <buffer><silent> <CR> <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
	nnoremap <buffer><silent> <Space> <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
	nnoremap <buffer><silent> i <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
	nnoremap <buffer><silent> q <Cmd>call ddu#ui#ff#do_action('quit')<CR>
	nnoremap <buffer><silent> p <Cmd>call ddu#ui#ff#do_action('preview')<CR>
	nnoremap <buffer><silent> c <Cmd>call ddu#ui#ff#do_action('chooseAction')<CR>
	nnoremap <buffer><silent> d <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'delete'})<CR>
	nnoremap <buffer><silent> e <Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'edit'})<CR>
	nnoremap <buffer><silent> <Esc> <Cmd>call ddu#ui#ff#do_action('quit')<CR>
	nnoremap <buffer><silent> <C-p> <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd MyAutoCmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
	inoremap <buffer><silent> <CR> <Esc><Cmd>close<CR>
	nnoremap <buffer><silent> <CR> <Cmd>close<CR>
	nnoremap <buffer><silent> <Esc>
		\ <Cmd>close<CR><Cmd>call ddu#ui#ff#do_action('quit')<CR>
	nnoremap <buffer><silent> <C-p>
		\ <Cmd>close<CR><Cmd>call ddu#ui#ff#do_action('quit')<CR>
	nnoremap <buffer><silent> q
		\ <Cmd>close<CR><Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

command! DduRgLive call s:ddu_rg_live()
function! s:ddu_rg_live() abort
	call ddu#start({
	\ 'volatile': v:true,
	\ 'sources': [{
	\ 	'name': 'rg',
	\ 	'options': {'matchers': []},
	\ }],
	\ 'ui{arams}': {'ff': {
	\ 	'ignoreEmpty': v:false,
	\ 	'autoResize': v:false,
	\ }},
	\ 'uiParams': {
	\ 	'ff': {
	\ 		'startFilter': v:true,
	\ 	},
	\ },
	\ })
endfunction

command! DduGhq call s:ddu_file_external()
function! s:ddu_file_external() abort
	call ddu#start({
	\ 'sources': [{'name': 'file_external'}],
	\ 'sourceParams': {
	\ 	'file_external': {'cmd': ['ghq', 'list', '-p']},
	\ },
	\ 'sourceOptions': {
	\ 	'file_external': {'defaultAction': 'cd'},
 	\ },
	\ })
endfunction

command! Cnf Ddu file_rec -source-option-path=/home/hyuoou/.config/nvim

nnoremap <silent> ff <Cmd>Ddu file_rec<CR>
nnoremap <silent> ;o <Cmd>Ddu file_old<CR>
nnoremap <silent> ;d <Cmd>Ddu nvim_lsp_diagnostic_all<CR>
nnoremap <silent> ;b <Cmd>Ddu buffer<CR>
nnoremap <silent> ;g <Cmd>DduRg<CR>
nnoremap <silent> ;l <Cmd>DduRgLive<CR>
nnoremap <silent> ;f <Cmd>Ddu file_external<CR>
nnoremap <silent> /  <Cmd>Ddu line -ui-param-startFilter=v:true<CR>
nnoremap <silent> ;; <Cmd>Ddu command_history<CR>

