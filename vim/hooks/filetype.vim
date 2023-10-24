" hook_add {{{
" LaTeX
let g:tex_flavor = 'latex'
let g:tex_conceal = ''

" Vim
let g:vim_indent_cont = 0

" dein toml syntax
if !has('nvim')
  autocmd vimrc CursorHold */vim/*.toml call dein#toml#syntax()
endif

" Disable default plugins
let g:loaded_2html_plugin      = v:true
let g:loaded_logiPat           = v:true
let g:loaded_getscriptPlugin   = v:true
let g:loaded_gzip              = v:true
let g:loaded_gtags             = v:true
let g:loaded_gtags_cscope      = v:true
let g:loaded_man               = v:true
let g:loaded_matchit           = v:true
let g:loaded_matchparen        = v:true
let g:loaded_netrwFileHandlers = v:true
let g:loaded_netrwPlugin       = v:true
let g:loaded_netrwSettings     = v:true
let g:loaded_rrhelper          = v:true
let g:loaded_shada_plugin      = v:true
let g:loaded_spellfile_plugin  = v:true
let g:loaded_tarPlugin         = v:true
let g:loaded_tutor_mode_plugin = v:true
let g:loaded_vimballPlugin     = v:true
let g:loaded_zipPlugin         = v:true

autocmd vimrc BufNewFile,BufRead *.saty,*.satyh,*.satyg setfiletype satysfi
" }}}


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
