" _ {{{
setlocal matchpairs+=「:」,（:）
" }}}

" conf {{{
setlocal noexpandtab
" }}}

" c_cpp_objcpp {{{
setlocal tabstop=4
setlocal shiftwidth=0
setlocal softtabstop=0
setlocal noexpandtab
setlocal colorcolumn=80
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
