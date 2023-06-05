" hook_add {{{
nmap <Plug>(leader)u <Plug>(ddu)
nmap <F1> <Plug>(ddu)h

nnoremap <silent> <Plug>(ddu)m <Cmd>Ddu mr<CR>
nnoremap <silent> <Plug>(ddu)h
\ <Cmd>Ddu help -name=help -ui-param-startFilter<CR>
nnoremap <silent> <Plug>(ddu)f
\ <Cmd>Ddu -ui=filer file -source-option-path=`expand('%:p:h')`<CR>
" }}}
" hook_source = {{{
call ddu#custom#load_config('$VIM_HOOKS/ddu.ts'->expand())
" }}}
