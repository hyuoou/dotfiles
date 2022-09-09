" debug
nnoremap <silent> go <Cmd>AsyncRun cargo build<CR>
nnoremap <silent> gO <Cmd>AsyncRun cargo run<CR>
command! CargoCheck AsyncRun cargo check

