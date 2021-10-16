inoremap <C-d> <Del>
inoremap <C-b> <BS>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <silent> jj <ESC>

nnoremap <C-a> <Home>
nnoremap <C-e> <End>
nnoremap <C-t> :Translate!

vnoremap <C-a> <Home>
vnoremap <C-e> <End>
vnoremap <C-t> :Translate<CR>

" vim-airline tab key
" nnoremap <C-u> :bp<CR>
" nnoremap <C-i> :bn<CR>
nmap <C-u> <Plug>AirlineSelectPrevTab
nmap <C-i> <Plug>AirlineSelectNextTab

" Open fern.vim
nnoremap <C-f> :Fern . -reveal=% -drawer -toggle -width=40<CR>

" neoterm config
nnoremap <C-p> :Ttoggle<CR>
tnoremap <silent> jj <C-\><C-n>
tnoremap <Esc> <C-\><C-n>

" debug
nnoremap <C-o> :AsyncRun

" fzf key
nnoremap ff :Files<CR>

" snippets
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

