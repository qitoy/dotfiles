command! -nargs=1 Memo
\ execute [strftime('%T: ') .. <q-args>]
\ ->writefile(s:ensure_memofile(), 'a')
command! MemoView execute 'edit' s:ensure_memofile()

function s:ensure_memofile() abort
  const file = [$XDG_DATA_HOME, 'memovim', strftime('%F.txt')]->join('/')
  call mkdir(file->fnamemodify(':h'), 'p')
  return file
endfunction
