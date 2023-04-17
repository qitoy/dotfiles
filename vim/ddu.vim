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
call ddu#custom#patch_global(#{
\ ui: 'ff',
\ sourceOptions: #{
\   _: #{
\     matchers: ['matcher_fzf'],
\   },
\   file: #{
\     columns: ['filename'],
\   },
\ },
\ sourceParams: #{
\   mr: #{
\     kind: 'mrw',
\   },
\ },
\ kindOptions: #{
\   file: #{
\     defaultAction: 'open',
\   },
\   help: #{
\     defaultAction: 'open',
\   },
\   action: #{
\     defaultAction: 'do',
\   },
\ },
\ actionOptions: #{
\   narrow: #{
\     quit: v:false,
\   },
\ },
\ uiParams: #{
\   ff: #{
\     split: has('nvim') ? "floating" : "horizontal",
\   },
\   filer: #{
\     split: has('nvim') ? "floating" : "horizontal",
\     sort: 'filename',
\     sortTreesFirst: v:true,
\   },
\ },
\})
" }}}
