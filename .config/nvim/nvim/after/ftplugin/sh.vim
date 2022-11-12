" debug
nnoremap <silent> go <Cmd>AsyncRun chmod u+x %<CR>
nnoremap <silent> gO <Cmd>AsyncRun chmod u+x % && ./%<CR>
command! ShellCheck AsyncRun shellcheck %

" Template
nnoremap <silent> <C-n> <Cmd>Template shebang<CR>

