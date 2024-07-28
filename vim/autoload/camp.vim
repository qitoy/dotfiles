function camp#notify(func, ...) abort
  call denops#plugin#wait('camp')
  call denops#notify('camp', a:func, a:000)
endfunction

function camp#open() abort
  call camp#notify('campOpen')
endfunction

function camp#run() abort
  call camp#notify('campRun')
endfunction

function camp#test() abort
  call camp#notify('campTest')
endfunction

function camp#submit(force) abort
  call camp#notify('campSubmit', !!a:force)
endfunction

function camp#summaries() abort
  call ddu#start(#{
  \ sources: ['camp_summaries'],
  \})
endfunction
