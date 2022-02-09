nnoremap <silent> go :AsyncRun g++ -Wall -std=c++17 % -o %<<CR>
nnoremap <silent> gO :AsyncRun g++ -Wall -std=c++17 % -o %< && ./%<<CR>

" template
nnoremap <C-n> :Template atcoder<CR>

