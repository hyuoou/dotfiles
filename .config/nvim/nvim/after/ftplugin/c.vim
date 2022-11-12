" debug
nnoremap <silent> go <Cmd>AsyncRun g++ -Wall -std=c++20 % -o %<<CR>
nnoremap <silent> gO <Cmd>AsyncRun g++ -Wall -std=c++20 % -o %< && ./%<<CR>

" template
nnoremap <silent> <C-n> <Cmd>Template atcoder<CR>

