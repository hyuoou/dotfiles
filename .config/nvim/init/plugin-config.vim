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

let g:lightline.component = {}
let g:lightline.component_function = {}
let g:lightline.component_function.gitbranch = 'GetGitBranch'

let g:lightline.tabline = {}
let g:lightline.tabline.left = [['tabs']]
let g:lightline.tabline.right = [[]]

let g:lightline.tab = {}
let g:lightline.tab.active = ['tabnum', 'filename', 'devicon', 'modified']
let g:lightline.tab.inactive = ['tabnum', 'filename', 'devicon', 'modified']

let g:lightline.tab_component_function = {}
let g:lightline.tab_component_function.devicon = 'GetDeviIcon'

function! GetDeviIcon(n) abort
	let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
	return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction

function! GetGitBranch() abort
	if gitbranch#name() != ''
		return ' '.gitbranch#name()
	endif
	return ''
endfunction

let g:lightline#lsp#indicator_warnings = 'W:'
let g:lightline#lsp#indicator_errors = 'E:'
call lightline#lsp#register()
autocmd DiagnosticChanged * call lightline#update()

" vimdoc-ja
set helplang=ja

" neoterm
let g:neoterm_default_mod = 'vertical belowright'
let g:neoterm_autoinsert = 1
let g:neoterm_size = 80

" fern
let g:fern#renderer = 'nerdfont'

" quickfix
augroup MyGroup
	autocmd User AsyncRunStart call asyncrun#quickfix_toggle(20, 1)
augroup END

" sonictemplete
let g:sonictemplate_vim_template_dir = '$HOME/.config/nvim/template'

" vsnip
let g:vsnip_snippet_dir = '$HOME/.config/nvim/vsnip'

" FixCursorHold
let g:cursorhold_updatetime = 100

" skkeleton
call skkeleton#config({
	\'eggLikeNewline': v:true,
	\})
call skkeleton#register_kanatable('rom', {
	\'jj': 'escape',
	\';': 'henkanPoint',
	\})

" vsnip
let g:vsnip_snippet_dir = '$HOME/.config/nvim/vsnip'

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
local opts = {noremap=true, silent=true}
vim.api.nvim_set_keymap('n', '<C-h>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--	vim.api.nvim_buf_set_keymap(bfile, 'n', 'ge', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

local servers = { 'clangd', 'gopls', 'bashls', 'vimls' }
for _, lsp in pairs(servers) do
	require('lspconfig')[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
EOF

" ddc config
call ddc#custom#patch_global({
	\ 'backspaceCompletion': v:true,
	\ 'completionMenu': 'pum.vim',
	\ })

call ddc#custom#patch_global('sources', ['nvim-lsp', 'vsnip', 'skkeleton', 'around'])
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
	\ }})

" enable ddc
call ddc#enable()
call popup_preview#enable()

" pum mapping
let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()

inoremap <silent><expr> <C-n> pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' : '<C-n>'
inoremap <silent><expr> <C-p> pum#visible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>' : '<C-p>'
inoremap <silent><expr> <Esc> pum#visible() ? '<Cmd>call pum#map#cancel()<CR>' : '<Esc>'
inoremap <silent><expr> <CR>  pum#visible() ? '<Cmd>call pum#map#confirm()<CR>' : lexima#expand('<LT>CR>', 'i')
autocmd User PumCompleteDone call vsnip_integ#on_complete_done(g:pum#completed_item)

