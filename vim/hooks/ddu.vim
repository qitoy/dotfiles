" hook_add {{{
call ddu#custom#load_config('$VIM_HOOKS/ddu.ts'->expand())

nmap <Plug>(leader)u <Plug>(ddu)
nmap <F1> <Plug>(ddu)h

inoremap <C-x><C-e> <Cmd>call ddu#start(#{
\ sources: [
\   #{ name: 'emoji', options: #{ defaultAction: 'feedkeys' } },
\ ],
\ uiParams: #{
\   ff: #{
\     startFilter: v:true,
\     replaceCol: col('.'),
\     startAutoAction: v:false,
\   }
\ },
\})<CR>

nnoremap <Plug>(ddu)m <Cmd>Ddu mr<CR>
nnoremap <Plug>(ddu)b <Cmd>Ddu buffer<CR>
nnoremap <Plug>(ddu)h
\ <Cmd>Ddu help -name=help -ui-param-ff-startFilter<CR>
nnoremap <Plug>(ddu)f
\ <Cmd>Ddu -ui=filer file -source-option-file-path=`expand('%:p:h')`<CR>
nnoremap gd
\ <Cmd>Ddu lsp_definition -sync -ui-param-ff-ignoreEmpty
\ -ui-param-ff-immediateAction=open<CR>
nnoremap gD
\ <Cmd>Ddu lsp_references -sync -ui-param-ff-ignoreEmpty
\ -ui-param-ff-immediateAction=open<CR>
nnoremap <Plug>(leader)a
\ <Cmd>Ddu lsp_codeAction -ui-param-ff-ignoreEmpty<CR>

command! Dein call ddu#start(#{
\ sources: [#{ name: 'dein' }],
\ uiParams: #{ ff: #{
\   startAutoAction: v:false,
\   startFilter: v:true,
\ }},
\})
" }}}
