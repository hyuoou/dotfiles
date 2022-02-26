" debug
nnoremap <silent> go :AsyncRun chmod u+x %<CR>
nnoremap <silent> gO :AsyncRun chmod u+x % && ./%<CR>

" Template
nnoremap <silent> <C-n> :Template shebang<CR>
