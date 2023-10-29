" _ {{{
setlocal matchpairs+=「:」,（:）
" }}}

" conf {{{
setlocal noexpandtab
" }}}

" cpp {{{
nnoremap <buffer> <silent> <LocalLeader>cc
\ <Cmd>QuickRun procon/exec<CR>
nnoremap <buffer> <silent> <LocalLeader>cl
\ <Plug>(procon-init)
" }}}

" help {{{
setlocal iskeyword+=:,#,-,(,)
setlocal nofoldenable
setlocal tabstop=8
" }}}

" make {{{
setlocal noexpandtab
" }}}

" markdown {{{
setlocal wrap
nnoremap <buffer> K
\ <cmd>QuickRun -exec '/usr/bin/env ejdict %{expand("<cword>")}' -outputter popup<CR>
" }}}

" satysfi {{{
setlocal wrap
" }}}

" tex {{{
iunmap <buffer>]]
setlocal wrap
" }}}
