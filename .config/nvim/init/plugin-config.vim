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

" neoterm config
let g:neoterm_default_mod = 'vertical belowright'
let g:neoterm_autoinsert = 1
let g:neoterm_size = 80

" fern.vim show icon
let g:fern#renderer = 'nerdfont'

" quickfix
augroup MyGroup
	autocmd User AsyncRunStart call asyncrun#quickfix_toggle(20, 1)
augroup END

" sonictemplete
let g:sonictemplate_vim_template_dir = '$HOME/.config/nvim/sonictemplate'