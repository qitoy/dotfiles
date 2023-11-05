" hook_add {{{
call ddu#custom#load_config('$VIM_HOOKS/ddu.ts'->expand())

nmap <Plug>(leader)u <Plug>(ddu)
nmap m <Plug>(ddu)

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
nnoremap <Plug>(ddu)d
\ <Cmd>Ddu lsp_diagnostic -ui-param-ff-ignoreEmpty<CR>
nnoremap <Plug>(leader)a
\ <Cmd>Ddu lsp_codeAction -ui-param-ff-ignoreEmpty<CR>
nnoremap <Plug>(ddu)p
\ <Cmd>Ddu dpp -ui-param-ff-startFilter -ui-param-ff-startAutoAction=v:false<CR>
" }}}
