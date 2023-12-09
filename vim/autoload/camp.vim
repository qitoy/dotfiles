let s:manager = vital#vital#import('Vim.BufferManager').new()

function camp#openbuf(name) abort
  let winid = win_getid()
  let info = s:manager.open('camp://' . a:name)
  if info.newbuf
    call setbufvar(info.bufnr, '&buftype', 'nofile')
    call setbufvar(info.bufnr, '&bufhidden', 'hide')
    call setbufvar(info.bufnr, '&swapfile', 0)
  endif
  call deletebufline(info.bufnr, 1, '$')
  call win_gotoid(winid)
endfunction

function camp#append(name, text) abort
  let bufnr = bufnr('camp://' . a:name)
  if bufnr == -1
    return
  endif
  call appendbufline(bufnr, '$', a:text)
endfunction

function camp#write(name, text) abort
  call camp#openbuf(a:name)
  call camp#append(a:name, a:text)
endfunction

function camp#notify(func, ...) abort
  call denops#plugin#wait('camp')
  call denops#notify('camp', a:func, a:000)
endfunction

function camp#request(func, ...) abort
  call denops#plugin#wait('camp')
  return denops#request('camp', a:func, a:000)
endfunction

function camp#open() abort
  call camp#notify('campOpen')
endfunction

function camp#test() abort
  call camp#notify('campTest')
endfunction

function camp#submit(force) abort
  call camp#notify('campSubmit', !!a:force)
endfunction
