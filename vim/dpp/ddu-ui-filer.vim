" ddu-filer {{{
nnoremap <buffer><expr> <CR>
\ ddu#ui#get_item()->get('isTree', v:false) ?
\ "<Cmd>call ddu#ui#do_action('itemAction', #{ name: 'narrow' })<CR>" :
\ "<Cmd>call ddu#ui#do_action('itemAction')<CR>"
nnoremap <buffer><silent> a
\ <Cmd>call ddu#ui#do_action('chooseAction')<CR>
nnoremap <buffer><silent> i
\ <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
nnoremap <buffer> <Space>
\ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
xnoremap <buffer> <Space>
\ :call ddu#ui#do_action('toggleSelectItem')<CR>
nnoremap <buffer> h
\ <Cmd>call ddu#ui#do_action('itemAction',
\ #{ name: 'narrow', params: #{ path: ".." } })<CR>
nnoremap <buffer><expr> l
\ ddu#ui#get_item().isTree ?
\ "<Cmd>call ddu#ui#do_action('itemAction', #{name: 'narrow'})<CR>" : ""
nnoremap <buffer> q
\ <Cmd>call ddu#ui#do_action('quit')<CR>
nnoremap <buffer> <Esc>
\ <Cmd>call ddu#ui#do_action('quit')<CR>
nnoremap <buffer><nowait> d
\ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'newDirectory' })<CR>
nnoremap <buffer> N
\ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'newFile' })<CR>
nnoremap <buffer> t
\ <Cmd>call ddu#ui#do_action('itemAction',
\ #{ name: 'open', params: #{ command: 'tab drop' } })<CR>
nnoremap <buffer> v
\ <Cmd>call ddu#ui#do_action('itemAction',
\ #{ name: 'open', params: #{ command: 'rightbelow vsplit' } })<CR>
nnoremap <buffer><nowait> s
\ <Cmd>call ddu#ui#do_action('itemAction',
\ #{ name: 'open', params: #{ command: 'split' } })<CR>
nnoremap <buffer><nowait> z
\ <Cmd>call ddu#ui#do_action('expandItem', #{ mode: "toggle" })<CR>
" }}}
