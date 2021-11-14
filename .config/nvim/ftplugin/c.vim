" nnoremap <C-o> :AsyncRun g++ -std=c++17 -Wall % -o %< && ./%<<CR>
nnoremap <silent> go :AsyncRun g++ -std=c++17 % -o %< && ./%<<CR>

" template
nnoremap <C-n> :Template atcoder<CR>

