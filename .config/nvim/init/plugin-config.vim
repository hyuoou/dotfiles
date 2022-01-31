" airline
let g:airline_theme = 'nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}

" git
let g:rainbow_active = 1

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

" undotree
if !exists('g:undotree_SplitWidth')
	let g:undotree_SplitWidth = 40
endif
if !exists('g:undotree_DiffpanelHeight')
	let g:undotree_DiffpanelHeight = 20
endif
if !exists('g:undotree_SetFocusWhenToggle')
	let g:undotree_SetFocusWhenToggle = 1
endif

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
			"#5e81ac"
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
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ge', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
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

