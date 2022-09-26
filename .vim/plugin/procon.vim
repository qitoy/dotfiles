augroup procon
  autocmd!
  autocmd BufEnter * ProconDownload
augroup END

command! -nargs=? ProconDownload
\ call procon#download(<f-args>)

command! -nargs=+ ProconPrepare
\ call procon#prepare(<f-args>)

command! ProconBrowse
\ call procon#browse()

command! ProconTest
\ call procon#test()

command! -bang ProconSubmit
\ call procon#submit(<q-bang> ==# '!')

command! ProconHack
\ call procon#hack()
