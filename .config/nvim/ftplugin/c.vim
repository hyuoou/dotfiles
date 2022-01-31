nnoremap <silent> go :AsyncRun g++ -Wall -std=c++17 % -o %<<CR>
nnoremap <silent> ggo :AsyncRun g++ -Wall -std=c++17 % -o %< && ./%<<CR>

" template
nnoremap <C-n> :Template atcoder<CR>

