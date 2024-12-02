" _ {{{
setlocal matchpairs+=「:」,（:）
" }}}

" conf {{{
setlocal noexpandtab
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
setlocal wrap
" }}}
