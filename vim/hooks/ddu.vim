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
\     sorters: ['sorter_fzf'],
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
\     split: "horizontal",
\     previewSplit: "horizontal",
\     autoAction: #{
\       name: 'preview',
\       previewCmds: ['bat', '-n', '%s', '-r', '%b:%e', '--highlight-line', '%l'],
\     },
\   },
\   filer: #{
\     split: "no",
\     sort: 'filename',
\     sortTreesFirst: v:true,
\   },
\ },
\})
" }}}
