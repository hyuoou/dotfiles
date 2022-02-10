" translate.vim
nmap <C-t> <Plug>(Translate)
vmap <C-t> <Plug>(VTranslate)

" fern.vim
nnoremap <silent> sf :Fern .<CR>
nnoremap <silent> fs :Fern . -reveal=% -drawer -toggle -width=40<CR>

" neoterm
nnoremap <silent> <C-p> :Ttoggle<CR>
tnoremap <silent> <C-p> <C-\><C-n>:Ttoggle<CR>

" fzf
nnoremap <silent> ff :Files<CR>

" vsnip
imap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

" skkeleton
imap <C-s> <Plug>(skkeleton-toggle)
cmap <C-s> <Plug>(skkeleton-toggle)

