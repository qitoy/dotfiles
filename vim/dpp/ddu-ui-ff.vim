" ddu-ff {{{
nnoremap <buffer> <CR>
\ <Cmd>call ddu#ui#do_action('itemAction')<CR>
nnoremap <buffer> i
\ <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
nnoremap <buffer> q
\ <Cmd>call ddu#ui#do_action('quit')<CR>
nnoremap <buffer> <Esc>
\ <Cmd>call ddu#ui#do_action('quit')<CR>
nnoremap <buffer> a
\ <Cmd>call ddu#ui#do_action('chooseAction')<CR>
nnoremap <buffer> <Space>
\ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
xnoremap <buffer> <Space>
\ :call ddu#ui#do_action('toggleSelectItem')<CR>
nnoremap <buffer> <C-a>
\ <Cmd>call ddu#ui#do_action('toggleAllItems')<CR>

" source help
if b:ddu_ui_name ==# 'help'
  nnoremap <buffer> t
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'tabopen' })<CR>
  nnoremap <buffer> v
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'vsplit' })<CR>
else
  nnoremap <buffer> t
  \ <Cmd> call ddu#ui#do_action('itemAction',
  \ #{ name: 'open', params: #{ command: 'tab drop' } })<CR>
  nnoremap <buffer> v
  \ <Cmd> call ddu#ui#do_action('itemAction',
  \ #{ name: 'open', params: #{ command: 'rightbelow vsplit' } })<CR>
  nnoremap <buffer><nowait> s
  \ <Cmd> call ddu#ui#do_action('itemAction',
  \ #{ name: 'open', params: #{ command: 'split' } })<CR>
endif

" source tab
if b:ddu_ui_name ==# 'tab'
  nnoremap <buffer><nowait> c
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'close' })<CR>
endif
" }}}
