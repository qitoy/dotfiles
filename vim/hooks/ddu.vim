" hook_add {{{
nmap <Plug>(leader)u <Plug>(ddu)
nmap <F1> <Plug>(ddu)h

nnoremap <Plug>(ddu)m <Cmd>Ddu mr<CR>
nnoremap <Plug>(ddu)h
\ <Cmd>Ddu help -name=help -ui-param-startFilter<CR>
nnoremap <Plug>(ddu)f
\ <Cmd>Ddu -ui=filer file -source-option-path=`expand('%:p:h')`<CR>
" }}}
" hook_source = {{{
call ddu#custom#load_config('$VIM_HOOKS/ddu.ts'->expand())
" }}}
