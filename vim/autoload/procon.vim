let s:manager = vital#vital#import('Vim.BufferManager').new()

function procon#buffer(name, text) abort
  let winid = win_getid()
  let info = s:manager.open('procon://' . a:name)
  if info.newbuf
    call setbufvar(info.bufnr, '&buftype', 'nofile')
    call setbufvar(info.bufnr, '&bufhidden', 'hide')
    call setbufvar(info.bufnr, '&swapfile', 0)
  endif
  call deletebufline(info.bufnr, 1, '$')
  call setbufline(info.bufnr, 1, a:text)
  call win_gotoid(winid)
endfunction
