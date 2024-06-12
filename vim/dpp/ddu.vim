" hook_add {{{
nmap <Plug>(leader)u <Plug>(ddu)
nmap m <Plug>(ddu)

nnoremap <Plug>(ddu)e <Cmd>call ddu#start(#{
\ sources: [
\   #{ name: 'emoji', options: #{ defaultAction: 'feedkeys' } },
\ ],
\ uiParams: #{
\   ff: #{
\     replaceCol: col('.'),
\     startAutoAction: v:false,
\   }
\ },
\})<CR>

nnoremap <Plug>(ddu)m <Cmd>Ddu mr<CR>
nnoremap <Plug>(ddu)b <Cmd>Ddu buffer<CR>

nnoremap <Plug>(ddu)h
\ <Cmd>call ddu#start(#{
\ sources: ['help'],
\ name: 'help',
\ input: 'Pattern:'->input(),
\})<CR>

nnoremap <Plug>(ddu)p
\ <Cmd>Ddu dpp -ui-param-ff-startFilter -ui-param-ff-startAutoAction=v:false<CR>
nnoremap <Plug>(ddu)f
\ <Cmd>Ddu -ui=filer file -source-option-file-path=`expand('%:p:h')`<CR>
nnoremap <Plug>(ddu)t
\ <Cmd>Ddu tab -name=tab<CR>
nnoremap <Plug>(ddu)c
\ <Cmd>Ddu cliphist<CR>

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

call timer_start(10, { _ -> ddu#load('ui', ['ff']) })
" }}}

" hook_source {{{
call ddu#custom#load_config('$VIM_DPP/ddu.ts'->expand())
" }}}

" hook_post_update {{{
call ddu#set_static_import_path()
" }}}
