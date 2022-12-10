function! vimrc#make(...) abort
  update
  call term_start(['make'] + a:000, {
  \ 'term_rows': 10,
  \ 'cwd': expand('%:p:h'),
  \})
endfunction

let s:manager = vital#vital#new().import('Vim.BufferManager').new()

function! vimrc#cmdwin(new) abort
  let info = s:manager.open('cmdwin', #{ opener: 'belowright 10new' })
  if info.newbuf
    call setbufvar(info.bufnr, '&buftype', 'nofile')
    call setbufvar(info.bufnr, '&bufhidden', 'hide')
    call setbufvar(info.bufnr, '&swapfile', 0)
    call ddc#custom#patch_buffer('sources', ['cmdline', 'around'])
    inoremap <buffer> <CR>
    \ <Esc><Cmd>call <SID>execCmdWin()<CR>
    nnoremap <buffer> <CR>
    \ <Cmd>call <SID>execCmdWin()<CR>
  endif
  call deletebufline(info.bufnr, 1, '$')
  let histnr = histnr(':')
  for i in range(1, histnr)
    let hist = histget(':', i)
    if hist !=# ''
      call setbufline(info.bufnr, line('$')+1, hist)
    endif
  endfor
  if a:new
    call feedkeys('Go')
  else
    call feedkeys('GA')
  endif
endfunction

function! s:execCmdWin() abort
  let line = getline('.')
  call histadd(':', line)
  call s:manager.close()
  execute line
endfunction
