" hook_add {{{
nmap <Plug>(leader)u <Plug>(ddu)
nmap m <Plug>(ddu)

nnoremap <Plug>(ddu)m
\ <Cmd>Ddu file_old
\ `'.git'->finddir(';') != '' ? 'file_git' : ''`
\ mr -unique<CR>
nnoremap <Plug>(ddu)b <Cmd>Ddu buffer<CR>
nnoremap <Plug>(ddu)e
\ <Cmd>Ddu emoji -ui-param-ff-startAutoAction=v:false<CR>

nnoremap <Plug>(ddu)h
\ <Cmd>call ddu#start(#{
\ sources: ['help'],
\ name: 'help',
\ input: 'Pattern:'->input(),
\})<CR>

nnoremap <Plug>(ddu)p
\ <Cmd>Ddu dpp -name=dpp -ui-param-ff-startFilter -ui-param-ff-startAutoAction=v:false<CR>
nnoremap <Plug>(ddu)f
\ <Cmd>Ddu -ui=filer file -source-option-file-path=`'%:p:h'->expand()->fnameescape()`<CR>
nnoremap <Plug>(ddu)t
\ <Cmd>Ddu tab -name=tab<CR>
nnoremap <Plug>(ddu)c
\ <Cmd>Ddu clip<CR>

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
" }}}

" hook_source {{{
call ddu#custom#load_config('$VIM_DPP/ddu.ts'->expand())
" }}}
