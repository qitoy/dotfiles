function! vimrc#make(...) abort
  update
  call term_start(['make'] + a:000, {
  \ 'term_rows': 10,
  \ 'cwd': expand('%:p:h'),
  \})
endfunction
