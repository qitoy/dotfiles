command! Nippo call s:edit_nippo()

function s:edit_nippo() abort
  const file = [$XDG_DATA_HOME, 'nippo', strftime('%F.md')]->join('/')
  call mkdir(file->fnamemodify(':h'), 'p')
  execute 'drop' file
  setlocal filetype=markdown
endfunction
