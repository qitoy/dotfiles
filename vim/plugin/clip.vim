command! Clip drop vimrc://clip

autocmd vimrc BufNewFile vimrc://clip call s:clip_init()

function s:clip_init() abort
  setlocal buftype=nofile
  nnoremap <buffer> <C-S> <Cmd>call <SID>clip_copy()<CR>
endfunction

function s:clip_copy() abort
  let @+ = getline(1, '$')->join("\<CR>")
endfunction
