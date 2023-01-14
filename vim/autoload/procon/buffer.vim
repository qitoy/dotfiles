let s:manager = vital#vital#import('Vim.BufferManager').new()

function procon#buffer#open(name) abort
  let winid = win_getid()
  let info = s:manager.open('procon://' . a:name)
  if info.newbuf
    call setbufvar(info.bufnr, '&buftype', 'nofile')
    call setbufvar(info.bufnr, '&bufhidden', 'hide')
    call setbufvar(info.bufnr, '&swapfile', 0)
  endif
  call deletebufline(info.bufnr, 1, '$')
  call win_gotoid(winid)
endfunction

function procon#buffer#append(name, text) abort
  let bufnr = bufnr('procon://' . a:name)
  if bufnr == -1
    return
  endif
  call appendbufline(bufnr, '$', a:text)
endfunction
