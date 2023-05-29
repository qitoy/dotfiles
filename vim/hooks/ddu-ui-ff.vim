" ddu-ff {{{
nnoremap <buffer><silent> <CR>
\ <Cmd>call ddu#ui#do_action('itemAction')<CR>
nnoremap <buffer><silent> i
\ <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
nnoremap <buffer><silent> q
\ <Cmd>call ddu#ui#do_action('quit')<CR>
nnoremap <buffer><silent> a
\ <Cmd>call ddu#ui#do_action('chooseAction')<CR>

if b:ddu_ui_name ==# 'help'
  nnoremap <buffer><silent> t
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'tabopen' })<CR>
  nnoremap <buffer><silent> v
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'vsplit' })<CR>
else
  nnoremap <buffer><silent> t
  \ <Cmd> call ddu#ui#do_action('itemAction',
  \ #{ name: 'open', params: #{ command: 'tab drop' } })<CR>
  nnoremap <buffer><silent> v
  \ <Cmd> call ddu#ui#do_action('itemAction',
  \ #{ name: 'open', params: #{ command: 'rightbelow vsplit' } })<CR>
  nnoremap <buffer><silent><nowait> s
  \ <Cmd> call ddu#ui#do_action('itemAction',
  \ #{ name: 'open', params: #{ command: 'split' } })<CR>
endif
" }}}
" ddu-ff-filter {{{
inoremap <buffer><silent> <CR>
\ <Esc><Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>
nnoremap <buffer><silent> <CR>
\ <Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>
nnoremap <buffer><silent> q
\ <Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>
inoremap <buffer><silent> <C-n>
\ <Cmd>call ddu#ui#do_action('cursorNext')<CR>
inoremap <buffer><silent> <C-p>
\ <Cmd>call ddu#ui#do_action('cursorPrevious')<CR>
inoremap <buffer><silent> <C-y>
\ <Cmd>call ddu#ui#do_action('itemAction')<CR>
" }}}
