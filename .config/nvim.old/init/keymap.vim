inoremap <C-d> <Del>
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
nmap <C-j> <Plug>AirlineSelectPrevTab
nmap <C-k> <Plug>AirlineSelectNextTab

" Go to definition
" nnoremap <silent> gd :LspPeekDefinition<CR>
" nnoremap <silent> ge :LspDefinition<CR>

" " Rename the symbol
" nnoremap <silent> rr :LspRename<CR>

" " Jump to diagnostic
" nnoremap <C-l> :LspNextDiagnostic<CR>
" nnoremap <C-h> :LspPreviousDiagnostic<CR>

" troubel
nnoremap <silent> gx :TroubleToggle lsp_document_diagnostics<CR>

" Open fern.vim
nnoremap <silent> fs :Fern . -reveal=% -drawer -toggle -width=40<CR>
nnoremap <silent> sf :Fern .<CR>

" neoterm config
nnoremap <C-p> :Ttoggle<CR>
tnoremap <silent> jj <C-\><C-n>
tnoremap <Esc> <C-\><C-n>

" debug
nnoremap <silent> go :AsyncRun

" fzf key
nnoremap ff :Files<CR>

" snippets
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

