function! vimrc#make(...) abort
  update
  call term_start(['make'] + a:000, {
  \ 'term_rows': 10,
  \ 'cwd': expand('%:p:h'),
  \})
endfunction

function! vimrc#change_kana() abort
  call system("osascript -l JavaScript -e 'Application(\"System Events\").keyCode(104);'")
endfunction

function! vimrc#change_eisuu() abort
  call system("osascript -l JavaScript -e 'Application(\"System Events\").keyCode(102);'")
endfunction
