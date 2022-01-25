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
EOF

