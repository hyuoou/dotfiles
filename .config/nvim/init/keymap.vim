inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap  jj <ESC>

nnoremap <C-a> ^
nnoremap <C-e> $
nnoremap - <C-x>
nnoremap + <C-a>

vnoremap <C-a> ^
vnoremap <C-e> $

" translate.vim
nmap <C-t> <Plug>(Translate)
vmap <C-t> <Plug>(VTranslate)

" vim-airline tab key
nmap <C-j> <Plug>AirlineSelectPrevTab
nmap <C-k> <Plug>AirlineSelectNextTab

" vim-lsp
nnoremap <silent> K :LspHover<CR>
nnoremap <silent> <space>K :LspPeekDefinition<CR>
nnoremap ge :LspDefinition<CR>
nnoremap <space>r :LspRename<CR>
nnoremap <C-l> :LspNextDiagnostic<CR>
nnoremap <C-h> :LspPreviousDiagnostic<CR>

" Open fern.vim
nnoremap <silent> sf :Fern .<CR>
nnoremap <silent> fs :Fern . -reveal=% -drawer -toggle -width=40<CR>

" neoterm config
nnoremap <silent> <C-p> :Ttoggle<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-]> <C-\><C-n>

" fzf
nnoremap <silent> ff :Files<CR>

" undotree
nnoremap <space>u :UndotreeToggle<CR>

" vsnip
imap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

" skkeleton
imap <C-s> <Plug>(skkeleton-toggle)
cmap <C-s> <Plug>(skkeleton-toggle)

" undotree
nnoremap <space>u :UndotreeToggle<CR>
