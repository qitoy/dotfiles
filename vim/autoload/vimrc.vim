function! vimrc#make(...) abort
  update
  call term_start(['make'] + a:000, {
  \ 'term_rows': 10,
  \ 'cwd': expand('%:p:h'),
  \})
endfunction

function! vimrc#cmdwin(mode, new) abort
  execute 'silent belowright 10new cmdwin://' . a:mode
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  call ddc#custom#patch_buffer('sources', ['cmdline', 'around'])
  inoremap <buffer> <CR>
  \ <Esc><Cmd>call <SID>execCmdWin()<CR>
  nnoremap <buffer> <CR>
  \ <Cmd>call <SID>execCmdWin()<CR>
  call deletebufline('%', 1, '$')
  let histnr = histnr(a:mode)
  for i in range(1, histnr)
    let hist = histget(a:mode, i)
    if hist !=# ''
      call setbufline('%', line('$')+1, hist)
    endif
  endfor
  if a:new
    call feedkeys('Go')
  else
    call feedkeys('GA')
  endif
endfunction

function! s:execCmdWin() abort
  let mode = expand('%')[-1:]
  let line = getline('.')
  call histadd(mode, line)
  quit
  call feedkeys(mode . line . "\<CR>")
endfunction
