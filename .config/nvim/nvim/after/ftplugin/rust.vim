" debug
nnoremap <silent> go <Cmd>AsyncRun cargo build<CR>
nnoremap <silent> gO <Cmd>AsyncRun cargo run<CR>
command! Clippy AsyncRun cargo clippy

command! AtcoderSubmit call s:atcoder_submit()
function! s:atcoder_submit() abort
  let l:filename = expand('%:r')
  1ToggleTerm size=25 direction="horizontal"
  execute 'TermExec cmd="cargo atcoder submit ' . l:filename . '"'
endfunction

