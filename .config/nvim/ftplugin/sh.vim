" debug
nnoremap <silent> go :AsyncRun chmod u+x %<CR>
nnoremap <silent> gO :AsyncRun chmod u+x % && ./%<CR>
command! ShellCheck :AsyncRun shellcheck %

" Template
nnoremap <silent> <C-n> :Template shebang<CR>

