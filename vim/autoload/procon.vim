function procon#config(arg) abort
  if type(a:arg) == v:t_string
    echomsg denops#request('procon', 'getConfig', [a:arg])
  elseif type(a:arg) == v:t_dict
    call denops#notify('procon', 'setConfig', [a:arg])
  else
    echohl ErrorMsg
    echomsg "arg must be string or dict"
    echohl None
  endif
endfunction
